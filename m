Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26786155BD2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 17:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51E96EAFF;
	Fri,  7 Feb 2020 16:32:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243466EAFE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 16:32:03 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m10so3521655wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 08:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=W07peGRSyneP+Jc5OMGDHyPXwj07l+1UxvUtVZ5QEBY=;
 b=izEvmh70uQ1tbUB1hQNUzc8tH/SbZ+wXFGUy+RXccYg2Mb+1ECPj9XdOayLonEA8qn
 +ueTB1Pk0RonRj9rcHt7Lt9fiZA61JcBnbsvYyEallfcrIEaqMKCTnrwtlhDFSZN714n
 bgWcL1AdqTWYUzR2HWxE9S/dMHuI/ejlYuNdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=W07peGRSyneP+Jc5OMGDHyPXwj07l+1UxvUtVZ5QEBY=;
 b=fpZYEoZfbyc+lQjCqKsAeocFGt+J6b/tF+1zmBNMFc0IOldK9q1LcnBL1uI2vj1aYJ
 ag0Yu0BrLnuO+TA96T7R6ic/S3kr0S4olDaNaCMMOxUvMK32Po9ZTjNFL9NmyYlcZewl
 V29vLq3Y1+rkst9clCMXKxbHKdBljj0wcveoR7NdUlCqeAgplyys7LGiwDw9xj4JLN6x
 DmmqHN72MAPF0hwpOvoG2JFWXDGgT6OCQhyOznV1Ilz59GV5ArDiWqi1WZDoqfhNY8h/
 byxL2Dqfr59fAKmWeY1aZ2taet4IUPzlypaJwdMKhhH4+FdiuiSRByHHmK2AS2ZCZ9L0
 J1BA==
X-Gm-Message-State: APjAAAW01O2VYb5IBkDf6nr8/RYy2ezcnQET0mLkULehZ19CfLjKwGmz
 CRoFUQitE/qanP4cwmP35b7UTQ==
X-Google-Smtp-Source: APXvYqz2O+F63lWEy4DQnvghi8mR3ptDOibCq67yZa3m8D2Inx44lC+mQfyMr9X14xw4pnT44a/iZA==
X-Received: by 2002:a1c:7dd4:: with SMTP id y203mr5277285wmc.67.1581093121773; 
 Fri, 07 Feb 2020 08:32:01 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y6sm3982661wrl.17.2020.02.07.08.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 08:32:00 -0800 (PST)
Date: Fri, 7 Feb 2020 17:31:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [Intel-gfx] [PATCH v2 4/6] drm/imx: Remove the bogus
 possible_clones setup
Message-ID: <20200207163159.GL43062@phenom.ffwll.local>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
 <20200207135950.6655-5-ville.syrjala@linux.intel.com>
 <02b04868-6f7b-f1cf-9cc7-fd1466b21761@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02b04868-6f7b-f1cf-9cc7-fd1466b21761@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 07, 2020 at 03:20:44PM +0100, Thomas Zimmermann wrote:
> Hi
> =

> Am 07.02.20 um 14:59 schrieb Ville Syrjala:
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > =

> > It's not at all clear what cloning options this driver supports.
> > So let's just clear possible_clones instead of setting it to some
> > bogus value.
> > =

> > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > ---
> >  drivers/gpu/drm/imx/imx-drm-core.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > =

> > diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/i=
mx-drm-core.c
> > index da87c70e413b..a0a709dfba34 100644
> > --- a/drivers/gpu/drm/imx/imx-drm-core.c
> > +++ b/drivers/gpu/drm/imx/imx-drm-core.c
> > @@ -140,7 +140,7 @@ int imx_drm_encoder_parse_of(struct drm_device *drm,
> >  	encoder->possible_crtcs =3D crtc_mask;
> >  =

> >  	/* FIXME: this is the mask of outputs which can clone this output. */
> > -	encoder->possible_clones =3D ~0;
> > +	encoder->possible_clones =3D 0;
> =

> Maybe remove the comment as well. It's pointless.

Maybe change it to "FIXME: cloning support not clear, disable it all for
now". With that

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> =

> Best regards
> Thomas
> =

> >  =

> >  	return 0;
> >  }
> > =

> =

> -- =

> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=FCrnberg, Germany
> (HRB 36809, AG N=FCrnberg)
> Gesch=E4ftsf=FChrer: Felix Imend=F6rffer
> =





> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
