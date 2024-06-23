Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCED913E66
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 23:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B33E10E317;
	Sun, 23 Jun 2024 21:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="CL5lyF2m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B25410E317
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 21:07:58 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2eaa89464a3so43293131fa.3
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 14:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719176877; x=1719781677; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=Bn3XVAl2b/VVj7+ANpPXLYR04bLlOpvbJszDOHEIUlk=;
 b=CL5lyF2mC0Xc22vWeVS7FV7pMIxrgq1BKZupKVb+O7/lQQxs94aygKgdPN9UPgUet8
 FUaK+eHmPjK4BIeBLs7y+6agaoZhdmZzX12BAOssd5BvBc+Vy+nhCcE/sCtpqE1K53gL
 9sdvHFrKo+p+6JlH3m/KE6z3HYfUHkt2vU6Q49/3PYGIHsoVO2br3dQhknNcQiGeeVSo
 dfr0o6f8mAYIgMjmU4h5RE9A7zdZ2Bn7XvFBJFwbDPuXWoRcumxVnW7Mk0NUR07NGIwI
 KqZQ2PsAF6DqMH1lZbcFulIFRpBgD/qJKESiU85UQcRybOMzr319uN9Fc9vuC9QrW97x
 OEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719176877; x=1719781677;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Bn3XVAl2b/VVj7+ANpPXLYR04bLlOpvbJszDOHEIUlk=;
 b=qxtBbPetcS2yYb6sS7xzlDmmnoIBQetDyIyqHVyhUrBGqkHKuBI6MmFhb/sOOuIgPR
 +yV2TD+2kqwuvvsOiHUWOs0Y5Kvx+hz4mYv0l6cdc/y5cM4kwEze17G5Z6xyMTU6iuUM
 2pPoWTO0Jh9u7qJTvU+Im0dXUPL0vDIeywdWNdK38MMEclmyJENACANEHb3OAQH7M65P
 8cFlGKsWSOGw2QfNn/r5eQ3f37k59wb18pP+Taj2TSKYChbOG0dCuv16v3XpTerA/hrq
 6//in0RB9aiavPXRdtBAAczXZx5XwJHhk4kgSuY8vVeb4roHTSA66HDorAE3zDPMg5Jn
 Oo2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrKu69dam9L1Vwr3THS852RQ8qKpYneCnhx3haolJTEayXE4LeTTt06mKziydCj4D6BnDheS2truEMwLsF61sEGvrYo2grMr2ZoGDOmzK3
X-Gm-Message-State: AOJu0YxFc5J/ADOHZdJD+orp5h0E9QR1glafzlRlsa4z5LlZ/NjF6C3h
 NkGEXZdccBsLd+XqBWcB8NNRq/2VfIWg03GHwxiWDj2lTtXXRcF1vjnKPk60CAQ=
X-Google-Smtp-Source: AGHT+IE/+Cm6kTTws7yRC5u/oOPZAuYzqObXzz8cbQUZVy042qI2SPItKJruChfcYCXw+MKeWMonTQ==
X-Received: by 2002:a2e:97d8:0:b0:2eb:ef78:29c8 with SMTP id
 38308e7fff4ca-2ec5797a37fmr21548801fa.14.1719176876831; 
 Sun, 23 Jun 2024 14:07:56 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4d76f791sm8277271fa.118.2024.06.23.14.07.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Jun 2024 14:07:56 -0700 (PDT)
Date: Mon, 24 Jun 2024 00:07:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Keith Zhao <keith.zhao@starfivetech.com>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, 
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, 
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, 
 "hjc@rock-chips.com" <hjc@rock-chips.com>, "heiko@sntech.de" <heiko@sntech.de>,
 "andy.yan@rock-chips.com" <andy.yan@rock-chips.com>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, 
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Jack Zhu <jack.zhu@starfivetech.com>, 
 Shengyang Chen <shengyang.chen@starfivetech.com>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4 08/10] drm/vs: add vs drm master driver
Message-ID: <uymjzpwsvlaoenftrc6y2colqpvtoniubuoncyslfychynom4i@3qvmcudgfrql>
References: <20240521105817.3301-1-keith.zhao@starfivetech.com>
 <20240521105817.3301-9-keith.zhao@starfivetech.com>
 <mbkrlg67jtggoqwecu6emymw3hgqoyf5pe55ho2fthq6pgnds2@ml7mbssrdr2x>
 <NTZPR01MB1050CAD9457771A58217A58CEECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <NTZPR01MB1050CAD9457771A58217A58CEECB2@NTZPR01MB1050.CHNPR01.prod.partner.outlook.cn>
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

On Sun, Jun 23, 2024 at 07:16:57AM GMT, Keith Zhao wrote:
> > On Tue, May 21, 2024 at 06:58:15PM +0800, keith wrote:
> > > Add vs DRM master driver for JH7110 SoC ADD DMA GEM driver
> > >
> > > Signed-off-by: keith <keith.zhao@starfivetech.com>
> > > ---
> > >  drivers/gpu/drm/verisilicon/Makefile |   3 +-
> > >  drivers/gpu/drm/verisilicon/vs_drv.c | 718
> > > +++++++++++++++++++++++++++
> > >  2 files changed, 720 insertions(+), 1 deletion(-)  create mode 100644
> > > drivers/gpu/drm/verisilicon/vs_drv.c
> > >

> > BIT(DRM_COLOR_YCBCR_BT2020),
> > > +		.zpos			= 0,
> > 
> > How are these zpos related to the zpos from drm_plane_state?
> Zpos was added to drm_plane_state by calling drm_plane_create_zpos_property funs,
> 
> vs_plane_primary_create 
> ------> drm_plane_create_zpos_property(......vs_plane_primary_info-> zpos )

Yes. But why do you need zpos here? Especially if it's set to 0.

> > 
> > > +
> > > +	drm_dev->mode_config.min_width = min_width;
> > > +	drm_dev->mode_config.min_height = min_heigth;
> > > +	drm_dev->mode_config.max_width = max_width;
> > > +	drm_dev->mode_config.max_height = max_height;
> > 
> > I thought that I saw mode_config.min/max being initialized.
> Yes the mode_config.min/max has been initialized，
> This place is doing an update according to detail info.

Then please drop previous initialisation. While looking at the code it's
impossible to understand which one is correct.


> > > +
> > > +static struct component_match *vs_add_external_components(struct
> > > +device *dev) {
> > > +	struct component_match *match = NULL;
> > > +	int i;
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(drm_sub_drivers); ++i) {
> > > +		struct platform_driver *drv = drm_sub_drivers[i];
> > > +		struct device *p = NULL, *d;
> > > +
> > > +		while ((d = platform_find_device_by_driver(p, &drv->driver))) {
> > > +			put_device(p);
> > > +
> > > +			drm_of_component_match_add(dev, &match,
> > component_compare_of,
> > > +						   d->of_node);
> > > +			p = d;
> > > +		}
> > > +		put_device(p);
> > 
> > What about just going through the graph connections instead and adding them?
> 
> The purpose of using components is to create encoder and connector to the drm subsystem by calling component_bind_all
> 
> graph connection needs to be based on whether there is a bridge at present. 
> If the bridge has been added, it can be obtained through drm_of_get_bridge 
> Create a connector based on the obtained bridge and then attach the connector to the encoder.
> Then do drm_dev_register.
> 
> I don't know if my understanding is consistent with yours. Please help confirm it.
> Thanks

Your code is looping over the subdrivers, locating devices and then
adding them as components. Can you instead use device nodes which are
connected to your master via the OF graph? If I understand examples in
your DT bindings correctly, this approach should work.

> > > +static void __exit vs_drm_fini(void)
> > > +{
> > > +	platform_driver_unregister(&vs_drm_platform_driver);
> > > +	platform_unregister_drivers(drm_sub_drivers,
> > > +ARRAY_SIZE(drm_sub_drivers)); }
> > > +
> > > +late_initcall_sync(vs_drm_init);
> > 
> > Why _sync?
> 
> late_initcall_sync will make it success ,when do devm_drm_of_get_bridge.
> Also it can use the " EPROBE_DEFER " to avoid it,

Why do you need this? It's perfectly fine to have DRM devices probe
assynchronously.

> > 
> > > +module_exit(vs_drm_fini);
> > > +
> > > +MODULE_DESCRIPTION("VeriSilicon DRM Driver");
> > MODULE_LICENSE("GPL");
> > > --
> > > 2.27.0
> > >

-- 
With best wishes
Dmitry
