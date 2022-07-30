Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E620585962
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 11:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F7F10F2B7;
	Sat, 30 Jul 2022 09:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A181010F2B7
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 09:15:22 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id va17so12270233ejb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 02:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rwWtE2tS+sQfxC0TkYkw+6LysHn8HM6so6RxZNUEwWQ=;
 b=cUuJZ0nzayLtd8sD1yqDO+l52EhIAyWq6fLaHZagbbZVJKKCUYyqC0sLoFqK5i10zC
 OiQN+JhbXIBEd+ifQUUou0Xm4CHUyrEtDHAFIfsJ/thybpafFsKAGPc+zRW8drWcD/2y
 MbcptzAARs9f2bw9vbEiLNPGkXipLLlozKnC8B+j1/A0VCwDPynRlCFADJymcs/nZQMq
 0r+PNxvDlrSlp8SkpMFbTyC2zaG1kGz6VKlhT0BnkbvQfXkLmm9augDHwmRVcE0vsk27
 xIUv8XBlV3TzjiCAoD1ucUi3DHMqMiTxaxbG+/0huI6IfOY2cXOfRUJCzDSSbZHbPWt6
 B20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rwWtE2tS+sQfxC0TkYkw+6LysHn8HM6so6RxZNUEwWQ=;
 b=pfYDidDyAvInNIme2L3xIIubGQhrjc9RmtfWnjwIowW/vkMxdVUKojay3om8hwIw+M
 ZiAvnPfqUQlbsRYjvZsMTJzSc2ekio1Eyjp97sAkgh6qc7eojHWkAdKIh7buBNwOPdsu
 cju4EkIkIx0aKf/npBhLlfWYVtJrdBAB8U6ZsweAVTqcspyrtjHTpG914tfd29dpdZt0
 hOZVfpHUlmLfl0DK6uwonRhIARBXr73RxQr6sYbV2b/rBCH1AorT9OtPO1/H0azT1kOq
 2r2IyWTCEtvIi3iKpyS85Dfk+bi9g2gYpWE1j0L8HL6t60XH3QXpVI5SWcipWB7SqByS
 56pg==
X-Gm-Message-State: AJIora9seN2NM92Q+1sE7itagzbr2yJrOmz7Q4zYVTMFUb9Kv9EXfAQa
 5lIaXDn5KWhkyXhgnzg6erQ=
X-Google-Smtp-Source: AGRyM1uUUQf/u0gQ0J3VcW2S6C2L6ixaRhj3FiMEXuT1uyjb9VsBFnqW3+WGYV9mlP57pVmny/vcAA==
X-Received: by 2002:a17:907:7638:b0:72d:f11b:5ebb with SMTP id
 jy24-20020a170907763800b0072df11b5ebbmr5799655ejc.647.1659172521175; 
 Sat, 30 Jul 2022 02:15:21 -0700 (PDT)
Received: from jernej-laptop.localnet (194-152-27-124.dynamic.telemach.net.
 [194.152.27.124]) by smtp.gmail.com with ESMTPSA id
 g5-20020a056402114500b0043cf0d56a61sm3623915edw.8.2022.07.30.02.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 02:15:20 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jerome Brunet <jbrunet@baylibre.com>, Samuel Holland <samuel@sholland.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Daniel Vetter <daniel@ffwll.ch>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Noralf =?ISO-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Kevin Hilman <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v1 30/35] drm/sun4i: tv: Rename error label
Date: Sat, 30 Jul 2022 11:15:19 +0200
Message-ID: <2245985.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20220728-rpi-analog-tv-properties-v1-30-3d53ae722097@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-30-3d53ae722097@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Phil Elwell <phil@raspberrypi.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne petek, 29. julij 2022 ob 18:35:13 CEST je Maxime Ripard napisal(a):
> The other error labels in sun4i_tv_bind() are named after the task they
> perform (err_disable_clk to call clk_disable_unprepare for example).
> 
> However, the err_cleanup_connector is named after the calling site
> (drm_connector_init failing) and will actually cleanup the encoder. Let's
> rename it to err_cleanup_encoder to be consistent.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> 
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tv.c
> b/drivers/gpu/drm/sun4i/sun4i_tv.c index 6d7e1d51569a..ad6a3739bfa9 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tv.c
> @@ -580,7 +580,7 @@ static int sun4i_tv_bind(struct device *dev, struct
> device *master, if (ret) {
>  		dev_err(dev,
>  			"Couldn't initialise the Composite 
connector\n");
> -		goto err_cleanup_connector;
> +		goto err_cleanup_encoder;
>  	}
>  	tv->connector.interlace_allowed = true;
> 
> @@ -588,7 +588,7 @@ static int sun4i_tv_bind(struct device *dev, struct
> device *master,
> 
>  	return 0;
> 
> -err_cleanup_connector:
> +err_cleanup_encoder:
>  	drm_encoder_cleanup(&tv->encoder);
>  err_disable_clk:
>  	clk_disable_unprepare(tv->clk);




