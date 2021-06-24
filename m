Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBE13B2F44
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 14:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFFB6EB71;
	Thu, 24 Jun 2021 12:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 937296EB71
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 12:41:46 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 l21-20020a05600c1d15b02901e7513b02dbso766862wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 05:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=K0FWJ+0x3R3W+pjLx/FMJl06KHuPFiKuxB/jcjxPEmQ=;
 b=QUp6A1RRhc600Vxy/ohB5hlCnetX/icCLWRuM1PGpcodrohrNHwNtOpGJtGg+cL8pm
 5BXkLN6+13AZzcnOMUEyR/87hbd6BsoX5d4VJNno+MyybVtu/MN48VW6sYC4gjFccavZ
 xLCC6ts89srPrNebwKLKOfOtZys1fWmEdRfGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=K0FWJ+0x3R3W+pjLx/FMJl06KHuPFiKuxB/jcjxPEmQ=;
 b=ka8rl2M6FdHDcRZsWSS2iexaevFAwzMnT2p49ZYoguqc0bvhyUDsYb0ytN0m952qaV
 ah0GiWJ33NcOGHUzbIP5v3jFbaIT7IdA+d2TZTmpZjwFaj/k0oTBeWgEeP/8JLdC/p07
 HmBb9mNdT4Wr3NbNEQoTyxs8HJ6dB8unhBOtdBRNWJnkHNB6m3fqg0x7P+Iskktrx39L
 c0qa00QVLXTfunyV7CfNTvND48pjIipJVqCgkNMDsLRyKT20c3YVzjzhKQOU8uyb6LlZ
 PFpm1uusPlfJFTvB2QKjQKtLmV0KImyFMarOxdA4cWiQkBh+/vEHuslgCDTzW+LAc1Kc
 3CsQ==
X-Gm-Message-State: AOAM533W0bMDjIooLOTjCLMHh1M1TiJjRO/UPxS8kc3eNCV2fHaciSDU
 QmlcmDW0HE5i5a+oJr3MiaGK2Q==
X-Google-Smtp-Source: ABdhPJz3ZYDGD/AcPjt+J8DyVfLAxeTmB97amNvq8TaU29PJLweD+cFRsaRyf+cQ1BaeVFU/+zKwmw==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr4109751wmk.97.1624538505261; 
 Thu, 24 Jun 2021 05:41:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r4sm3212591wre.84.2021.06.24.05.41.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 05:41:43 -0700 (PDT)
Date: Thu, 24 Jun 2021 14:41:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 14/15] drm/gem: Tiny kernel clarification for
 drm_gem_fence_array_add
Message-ID: <YNR9hSMVmzYmotF0@phenom.ffwll.local>
References: <20210622165511.3169559-1-daniel.vetter@ffwll.ch>
 <20210622165511.3169559-15-daniel.vetter@ffwll.ch>
 <4ed8f1d3-eb9c-74d6-d93f-ee28971af7f6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4ed8f1d3-eb9c-74d6-d93f-ee28971af7f6@amd.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 23, 2021 at 10:42:50AM +0200, Christian König wrote:
> Am 22.06.21 um 18:55 schrieb Daniel Vetter:
> > Spotted while trying to convert panfrost to these.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >   drivers/gpu/drm/drm_gem.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> > index ba2e64ed8b47..68deb1de8235 100644
> > --- a/drivers/gpu/drm/drm_gem.c
> > +++ b/drivers/gpu/drm/drm_gem.c
> > @@ -1302,6 +1302,9 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
> >    * @fence_array: array of dma_fence * for the job to block on.
> >    * @fence: the dma_fence to add to the list of dependencies.
> >    *
> > + * This functions consumes the reference for @fence both on success and error
> > + * cases.
> > + *
> 
> Oh, the later is a bit ugly I think. But good to know.
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Merged to drm-misc-next, thanks for taking a look. Can you perhaps take a
look at the drm/armada patch too, then I think I have reviews/acks for all
of them?

Thanks, Daniel

> 
> >    * Returns:
> >    * 0 on success, or an error on failing to expand the array.
> >    */
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
