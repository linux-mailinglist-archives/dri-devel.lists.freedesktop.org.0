Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EB0439EC2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 20:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5D9C6E0F3;
	Mon, 25 Oct 2021 18:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8583F6E0F3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 18:55:15 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id y10so12684498qkp.9
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 11:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HDteQAJp2aIROEGGp0KcnNgAZwd/BE0UnUAaYmDuyDM=;
 b=ltHB326iGW0+5JSm9vx48aVLM+zcn0/RuG2SV+o9FQTIEPZ7/yAzNSh8CKXBDfCBTl
 xqGKUWMDNSUovREO+v8gmoi3CxVajwIst6ajszLY53pXLfIsHAfjyTgjmfxSUmPUm2PY
 V09wsOCc/Q0pIkPdOwZUCMY/fjJeheci/TUYFe9cEajsfLQV5tpME93uxLYh/NUdx5rl
 2Dnq7nMCTxhMfhbvN0qK2xBS0JlNfdCGsQRd3gNSz0jL0GQF9YFWbfaOX7/4kr/uWmW9
 5s6q9GP7eRhEjec6ld6S/UsCUgobZyq/qdQaw7QycVa+uUnDmwQbfsz091E/G+B4OuLT
 zadg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=HDteQAJp2aIROEGGp0KcnNgAZwd/BE0UnUAaYmDuyDM=;
 b=V67JqONflTEV9UV4l66smrhn9B82v7RXen3/T61f62WQJL4kLn4QSLwLFdRxMJDRS4
 7EVOy3HVBzct7FmjnkM68pzPCgzOVqPBnUaiimQmD2CG8ir2nsc+Drd3bcKLUvew3EHy
 9IiATvOid6Cmo0sKAooJGJ7MxaUSxg7PQ8xycXxKglY3mJu91hGekdoipQlSwLn4XXjf
 gy44LtSURQGqmASU0dTF4Yoxex7qbJ2iSZeYFu0sN76e4JWukCDDjfFe0tHsRDj86SSa
 W9ajWHTUKCgNRC6Ay90EAkAV3uKJzIc8yI4QWyz6BHvy6RWzVJM5JiVeT/4HFcXHMxSb
 /foQ==
X-Gm-Message-State: AOAM533Ts273WlJ/oQAE1TN8Tk6ckafyTo4pIcR2r3NZ52cwE8riZIGj
 w6uppVQDjwXTlTLdwIVGCPU=
X-Google-Smtp-Source: ABdhPJylh95SolmSbWZAYOGsLMsebWtcBCa5XKF2BX1/CRE/aPmZCyqTcJ9cM8a1LJ/VMljKaSLb3w==
X-Received: by 2002:ae9:ea19:: with SMTP id f25mr14864525qkg.341.1635188114579; 
 Mon, 25 Oct 2021 11:55:14 -0700 (PDT)
Received: from ubuntu-mate-laptop.localnet ([67.8.38.84])
 by smtp.gmail.com with ESMTPSA id c6sm8998904qkg.85.2021.10.25.11.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 11:55:14 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: robert.foss@linaro.org, a.hajda@samsung.com, narmstrong@baylibre.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 jagan@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: bridge: fix unmet dependency on DRM_KMS_HELPER for
 DRM_PANEL_BRIDGE
Date: Mon, 25 Oct 2021 14:51:47 -0400
Message-ID: <2172694.EMfidFSxsr@ubuntu-mate-laptop>
In-Reply-To: <YXbtt2M+I41qH2ME@pendragon.ideasonboard.com>
References: <20211025174202.32396-1-julianbraha@gmail.com>
 <YXbtt2M+I41qH2ME@pendragon.ideasonboard.com>
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

On Monday, October 25, 2021 1:47:35 PM EDT you wrote:
> Hi Julian,
> 
> Thank you for the patch.
> 
> On Mon, Oct 25, 2021 at 01:42:02PM -0400, Julian Braha wrote:
> > When DRM_CHIPONE_ICN6211 is selected, and DRM_KMS_HELPER is not selected,
> > Kbuild gives the following warning:
> > 
> > WARNING: unmet direct dependencies detected for DRM_PANEL_BRIDGE
> >   Depends on [n]: HAS_IOMEM [=y] && DRM_BRIDGE [=y] && DRM_KMS_HELPER [=n]
> >   Selected by [y]:
> >   - DRM_CHIPONE_ICN6211 [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=y]
> > 
> > This is because DRM_CHIPONE_ICN6211 selects DRM_PANEL_BRIDGE
> > without depending on or selecting DRM_KMS_HELPER,
> > despite DRM_PANEL_BRIDGE depending on DRM_KMS_HELPER.
> > 
> > This unmet dependency bug was detected by Kismet,
> > a static analysis tool for Kconfig.
> > Please advise if this is not the appropriate solution.
> 
> Shouldn't DRM_PANEL_BRIDGE select DRM_KMS_HELPER instead of depending on
> it ?
> 
> > Fixes: ce517f18944e ("drm: bridge: Add Chipone ICN6211 MIPI-DSI to RGB bridge")
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > Signed-off-by: Julian Braha <julianbraha@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index 431b6e12a81f..a630cb8fd1c8 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -30,6 +30,7 @@ config DRM_CDNS_DSI
> >  config DRM_CHIPONE_ICN6211
> >  	tristate "Chipone ICN6211 MIPI-DSI/RGB Converter bridge"
> >  	depends on OF
> > +  select DRM_KMS_HELPER
> >  	select DRM_MIPI_DSI
> >  	select DRM_PANEL_BRIDGE
> >  	help
> 
> 

Hi Laurent,

Either a "select" or a "depends" will resolve this issue, but
most similar devices in this Kconfig file select DRM_KMS_HELPER.
Is there something different about DRM_CHIPONE_ICN6211 that I have missed?

- Julian Braha



