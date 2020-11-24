Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AECB22C29F1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 15:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA606E323;
	Tue, 24 Nov 2020 14:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A05B66E323
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 14:44:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id t4so9635751wrr.12
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 06:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ccAqOnBT61BH7TQSKWjf0ryD/AnQCwVg4p2m7YS/Org=;
 b=TMn8yQVG/ifR+n5GmEm++6pj6JcDuN2KHcZKznVXWo6/eetWrNMoRab3Z24++YMU3A
 Zl+0UGf3ILcbpyaA2Q4+UbxLubDTrtCQqUmLsDNgwoGO2n0UDHzou5+ut10Lj9HU5wCO
 mvJp54w9/eA2gGp4OAvmT9/FR3J8lDu6nTUO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ccAqOnBT61BH7TQSKWjf0ryD/AnQCwVg4p2m7YS/Org=;
 b=XjjP81MIpca+dTtc44Im63/Lo12ejRpjl6PAeojqmpb9ORMRSWfpyFhibrofa3rC7G
 4UKYmvnkCN1d/rPEIndQXBcpJAeafxMNU/Y984YJcAll6t/Cp7091Y/x+/Sp22NOGfRs
 9uPA1UCm5wtpbfVWeKiwv1U5deyuu8m6WuwaCL5NTCG0/Ue8XezJINAk/Arxlepxk1Y8
 CupUpPazllFbKCkrttyBLoSyikskMKI4MIeS6mTxlO2c6KfqaBdX77e6Oef50SsXI3Pg
 msgjHZ1Q9hvAefEfFKjp5WkkSzVjdb2GOBpe0w6eezJxrGKlnHXm4e2fuVhUMc9oWZza
 E9nA==
X-Gm-Message-State: AOAM531Vr8lE1Dp7Fd4D1AarzOPV5ebjYvnT+T0SuSD9yQu6E6jeZtH3
 APHecZXyqhoAlMJ7gIRwpSjxxg==
X-Google-Smtp-Source: ABdhPJwS/7z0ByJO7gxsW/q/yiy0y5ztFkHsZBrRFFxvjOyxLoef6nkQeu2B0paNRkY+adQw+0hgHA==
X-Received: by 2002:a5d:4004:: with SMTP id n4mr5562537wrp.230.1606229086335; 
 Tue, 24 Nov 2020 06:44:46 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u7sm5851409wmb.20.2020.11.24.06.44.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 06:44:45 -0800 (PST)
Date: Tue, 24 Nov 2020 15:44:43 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: christian.koenig@amd.com
Subject: Re: [PATCH v3 02/12] drm: Unamp the entire device address space on
 device unplug
Message-ID: <20201124144443.GQ401619@phenom.ffwll.local>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-3-git-send-email-andrey.grodzovsky@amd.com>
 <54329aa5-ef57-3209-13b7-abd02683f9fc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <54329aa5-ef57-3209-13b7-abd02683f9fc@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: daniel.vetter@ffwll.ch, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com, yuq825@gmail.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 21, 2020 at 03:16:15PM +0100, Christian K=F6nig wrote:
> Am 21.11.20 um 06:21 schrieb Andrey Grodzovsky:
> > Invalidate all BOs CPU mappings once device is removed.
> > =

> > v3: Move the code from TTM into drm_dev_unplug
> > =

> > Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> =

> Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

Was wondering for a moment whether this should be in drm_dev_unregister
instead, but then it's only one part of the coin really. So

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> =

> > ---
> >   drivers/gpu/drm/drm_drv.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 13068fd..d550fd5 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -479,6 +479,9 @@ void drm_dev_unplug(struct drm_device *dev)
> >   	synchronize_srcu(&drm_unplug_srcu);
> >   	drm_dev_unregister(dev);
> > +
> > +	/* Clear all CPU mappings pointing to this device */
> > +	unmap_mapping_range(dev->anon_inode->i_mapping, 0, 0, 1);
> >   }
> >   EXPORT_SYMBOL(drm_dev_unplug);
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
