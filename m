Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8005D43AA5C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 04:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CA846E20F;
	Tue, 26 Oct 2021 02:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32996E20F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 02:36:34 +0000 (UTC)
Received: by mail-qk1-x72a.google.com with SMTP id d205so13845192qke.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 19:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0WMeSWB8rpl9OD9K4iGbTmC/396k4C7y2b8GYI2C4Ok=;
 b=gLoP/eE1oj2bVGRPfSFWrxiiJwjbRxfkKGR6/Mn+2qyyGAFHGSQ41QpeNWkOeU7vwQ
 Ehi7bPaR1Omp4VHrIjn3gxNqHOjAqsvFDW2JIowqspwVMLppqzaOMFX7J252ghpSaeru
 fznOG1OUIeks61lGkVrj2mHudP7bzj7TRNoVf+5hRHcOYj5BQcn+paqAEYOGyG4cCUbA
 Fx5LKNJVheJ8j5XsL4J+9YtVkILLs3KwJro54TSSqgbsqCo9Sm8765820N6IlIg5Kuaq
 C6Dxjil9Drtjqur5cvD6OtQf9/WTdOQEfhx4o5xxmXyvS29wOY6zHuuRGwSs219zZFJZ
 Is7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0WMeSWB8rpl9OD9K4iGbTmC/396k4C7y2b8GYI2C4Ok=;
 b=xBp/KLxcCqFHDXwBPYwpYvohhrOlHVmj9KNX7u7g39SNIbRc8ujBcUkDN5l8Js2WKs
 IYsqaXmHk76IvvFkO1rNAI7NcttVWwwJGQ0PhjTBanq7rPAX6b7+9snLdhe/CkwteEWz
 8soxA6FJ6ZleZU9qcjoR/1dYh/f1KNkPU5qv3/6Ns/SfQ0sk5ma9h6MJ5NY2ttFKjqZw
 p0F/J08XGJ6a2DxCKGnzx+oTNmCG6N+PA4fSyQ/6CYI2gjgOe1HV0wWx87Ul1pBL3yEt
 0uHavSBQRW/BS/I+8XLwT083/WR2FjsLkK21+6tcLtI0oPFOcXr7JZvAYY5fG1N4hiXD
 Lu9Q==
X-Gm-Message-State: AOAM5329bCmztQbbM+0AWu1hxuKDaw9+7wAaDL8L3e2h9yhxLItfPPqf
 YRc4hjIKVmUG64+7fEL/V0s=
X-Google-Smtp-Source: ABdhPJxAIRACc/l4LXZdfvM4XQCLAip164dixWDF2yMu9E/ExcUQ3WTAYXOYh1HtrQ9P/eGymml0Zg==
X-Received: by 2002:a05:620a:298d:: with SMTP id
 r13mr16214942qkp.428.1635215793595; 
 Mon, 25 Oct 2021 19:36:33 -0700 (PDT)
Received: from ubuntu-mate-laptop.localnet ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id t22sm4487568qtw.21.2021.10.25.19.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 19:36:33 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: robert.foss@linaro.org, a.hajda@samsung.com, narmstrong@baylibre.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jagan@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: bridge: fix unmet dependency on DRM_KMS_HELPER for
 DRM_PANEL_BRIDGE
Date: Mon, 25 Oct 2021 22:36:32 -0400
Message-ID: <4188280.18OdhQZZCD@ubuntu-mate-laptop>
In-Reply-To: <YXcrRDNylQ896ypx@pendragon.ideasonboard.com>
References: <20211025174202.32396-1-julianbraha@gmail.com>
 <2172694.EMfidFSxsr@ubuntu-mate-laptop>
 <YXcrRDNylQ896ypx@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Monday, October 25, 2021 6:10:12 PM EDT you wrote:
> Hi Julian,
> 
> On Mon, Oct 25, 2021 at 02:51:47PM -0400, Julian Braha wrote:
> > On Monday, October 25, 2021 1:47:35 PM EDT you wrote:
> > > On Mon, Oct 25, 2021 at 01:42:02PM -0400, Julian Braha wrote:
> > > > When DRM_CHIPONE_ICN6211 is selected, and DRM_KMS_HELPER is not selected,
> > > > Kbuild gives the following warning:
> > > > 
> > > > WARNING: unmet direct dependencies detected for DRM_PANEL_BRIDGE
> > > >   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && DRM_KMS_HELPER [=n]
> > > >   Selected by [y]:
> > > >   - DRM_CHIPONE_ICN6211 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y]
> > > > 
> > > > This is because DRM_CHIPONE_ICN6211 selects DRM_PANEL_BRIDGE
> > > > without depending on or selecting DRM_KMS_HELPER,
> > > > despite DRM_PANEL_BRIDGE depending on DRM_KMS_HELPER.
> > > > 
> > > > This unmet dependency bug was detected by Kismet,
> > > > a static analysis tool for Kconfig.
> > > > Please advise if this is not the appropriate solution.
> > > 
> > > Shouldn't DRM_PANEL_BRIDGE select DRM_KMS_HELPER instead of depending on
> > > it ?
> > > 
> > > > Fixes: ce517f18944e ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge")
> > > > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > > > Signed-off-by: Julian Braha <julianbraha@gmail.com>
> > > > ---
> > > >  drivers/gpu/drm/bridge/Kconfig | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > > > index 431b6e12a81f..a630cb8fd1c8 100644
> > > > --- a/drivers/gpu/drm/bridge/Kconfig
> > > > +++ b/drivers/gpu/drm/bridge/Kconfig
> > > > @@ -30,6 +30,7 @@ config DRM_CDNS_DSI
> > > >  config DRM_CHIPONE_ICN6211
> > > >  	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
> > > >  	depends on OF
> > > > +  select DRM_KMS_HELPER
> > > >  	select DRM_MIPI_DSI
> > > >  	select DRM_PANEL_BRIDGE
> > > >  	help
> > 
> > Hi Laurent,
> > 
> > Either a "select" or a "depends" will resolve this issue,
> 
> Mixing "select" and "depends" usually lead to be results. DRM_KMS_HELPER
> is a symbol that is mostly selected (I think there are a handful of
> occurrences of "depends", which should probably be fixed).
> 
> > but most similar devices in this Kconfig file select DRM_KMS_HELPER.
> > Is there something different about DRM_CHIPONE_ICN6211 that I have missed?
> 
> There isn't anything fundamentally different, but because DRM_KMS_HELPER
> is meant to be selected and not depended on, I think we should fix that
> for DRM_PANEL_BRIDGE, and it will fix the issue with
> DRM_CHIPONE_ICN6211. The dependency on the KMS helpers come from
> drm_panel_bridge.c, not from chipone-icn6211.c as far as I can tell, so
> it would also be more correct.
> 
> 

Hi Laurent,

I appreciate your feedback! I will make your suggested change,
and resubmit.

- Julian Braha



