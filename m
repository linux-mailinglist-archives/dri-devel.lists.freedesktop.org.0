Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5039F361CC0
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 11:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A686EB4D;
	Fri, 16 Apr 2021 09:15:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99A66EB4E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 09:15:02 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id n10so2498187plc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 02:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xZ5QJbgcxsi5P774OAde+gyqdj3zeY4OT+RguQ4Yh8M=;
 b=aN2W8sVheIWGZcNAWtyWNlsBq7F/94yG45zz5d+cs5hpMT5/rmZvM52iuC7wugTGTe
 32NxhvKwVFzR3StSAVGoWnjzxVayT0FWkrcRHd8nQ9Oxf6PUmj5RMARWmJRfXf+tY3Fe
 7npCshA71UXd5xq1/d2hV5dxUMhxhWK+XC77naU9D+29dOniktLYfu5pjyKk9NuNT8+q
 9aCDOJVSATl5xWT/LmdtKYt99OU4G/Q032oqXc7CdFCZ0avEnJ4kxkF0jeuk3Dn+1tO6
 r8StwudXvFWPihol2//mRYLFaFrchKVxJZFJHdgk1Q3YrRRBjG9XwsoX5zSreXzxir2g
 jWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xZ5QJbgcxsi5P774OAde+gyqdj3zeY4OT+RguQ4Yh8M=;
 b=MU/fXDA6DdMvjZxtxTx5iDHoA20g8vpVzNiyqH29Zx9lNuN0wikfgi0bVSVfl16LVj
 magsN9pz4n8jWXShdBLR1+N+yZG6sygfnfTDxDzHc1kArheZ7WoVCZh0TlisgtRgjMWe
 U7Dv8X7rGyXnk1PEhhVFh55ckwAvRMiqH2gSh7dF8sSXzars5O6TpcwX62TrN3AuIKE3
 nK2YxpLVtvipRjFqE95opJXyW/YSP2nJc+PMZUmVGXKR5wqXSiEant6Fz1XEtV2zDr8p
 66Ud37EpfoxDRrtZbRc/vUvnBHJmW+ebrJbla29lGC9ErbrrlyuJISkbdsUjnfYmHBuv
 OZfQ==
X-Gm-Message-State: AOAM53105EP2bIFsxryWGdSQGEgFD6jlwDaXdO2GHpqmQfpsIZovjKZC
 EALy5BgDY2+0ctHEDRtsPtUQ1wyuiGzGwaaD48rrDw==
X-Google-Smtp-Source: ABdhPJwsng8nHmy0FYR9JGRD2atFcCX5gdaUhjcgL9PrN+cIjSiQQakDN3tUOWLHQXr620+cq5I/pFIdXZkB1m62JWs=
X-Received: by 2002:a17:902:e543:b029:eb:8684:e00b with SMTP id
 n3-20020a170902e543b02900eb8684e00bmr6091661plf.69.1618564502401; Fri, 16 Apr
 2021 02:15:02 -0700 (PDT)
MIME-Version: 1.0
References: <20210415183619.1431-1-rdunlap@infradead.org>
 <CAG3jFyvi-NyOdd8DdKu_QYz593YYvJzXm65DoCLubzHE+-5zNg@mail.gmail.com>
In-Reply-To: <CAG3jFyvi-NyOdd8DdKu_QYz593YYvJzXm65DoCLubzHE+-5zNg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 16 Apr 2021 11:14:51 +0200
Message-ID: <CAG3jFyukH=ijvn-=2E_tGJdpUHFZ0YXte7MQqncMhoM5Eg7hVQ@mail.gmail.com>
Subject: Re: [PATCH -next] drm: bridge: fix ANX7625 use of mipi_dsi_()
 functions
To: Randy Dunlap <rdunlap@infradead.org>
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
Cc: kernel test robot <lkp@intel.com>, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, stable@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Merged for 5.13 in drm-misc-next-fixes

On Fri, 16 Apr 2021 at 10:41, Robert Foss <robert.foss@linaro.org> wrote:
>
> Thanks Randy!
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
>
> On Thu, 15 Apr 2021 at 20:36, Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > The Analogix DRM ANX7625 bridge driver uses mips_dsi_() function
> > interfaces so it should select DRM_MIPI_DSI to prevent build errors.
> >
> >
> > ERROR: modpost: "mipi_dsi_attach" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
> > ERROR: modpost: "mipi_dsi_device_register_full" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
> > ERROR: modpost: "of_find_mipi_dsi_host_by_node" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
> > ERROR: modpost: "mipi_dsi_device_unregister" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
> > ERROR: modpost: "mipi_dsi_detach" [drivers/gpu/drm/bridge/analogix/anx7625.ko] undefined!
> >
> >
> > Fixes: 8bdfc5dae4e3 ("drm/bridge: anx7625: Add anx7625 MIPI DSI/DPI to DP")
> > Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > Reported-by: kernel test robot <lkp@intel.com>
> > Cc: Xin Ji <xji@analogixsemi.com>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: stable@vger.kernel.org
> > ---
> >  drivers/gpu/drm/bridge/analogix/Kconfig |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > --- linux-next-20210414.orig/drivers/gpu/drm/bridge/analogix/Kconfig
> > +++ linux-next-20210414/drivers/gpu/drm/bridge/analogix/Kconfig
> > @@ -30,6 +30,7 @@ config DRM_ANALOGIX_ANX7625
> >         tristate "Analogix Anx7625 MIPI to DP interface support"
> >         depends on DRM
> >         depends on OF
> > +       select DRM_MIPI_DSI
> >         help
> >           ANX7625 is an ultra-low power 4K mobile HD transmitter
> >           designed for portable devices. It converts MIPI/DPI to
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
