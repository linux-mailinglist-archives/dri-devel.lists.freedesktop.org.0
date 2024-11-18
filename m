Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1809D11A0
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 14:17:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5076810E4DC;
	Mon, 18 Nov 2024 13:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WIcCP9E5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766BF10E4DC
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 13:17:37 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-539e8607c2aso4311837e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 05:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731935855; x=1732540655; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=QEQ0UnPHgL8X1IzKLkITrqLzsus1TunLlu+R1N5lrJc=;
 b=WIcCP9E5yB4BhQneZ6ay16LOBRQ1t5RfEyuX9y4RAbRJ4TDwrZoK0Qw/u48eWAbSKQ
 2I971De8G99/8QX8dBDGXou0lK9X0x0GmoQF+NLMRVWKCuolwga7WsAeeCheBYm6vKHv
 6sTBMuTH6KszIqAgsE54G0WU1Wu9+KV+wDNxUX6rMHjsTygph4fCpERbhP7ItmGAo70a
 3M3mGeuSBy17ZL3SK/jPLlFZJCNul3vA05jsPRFrY9baEtZoaVjqMXkqKeQlh7ercMAh
 wjl7+VuWfcOil3JzoEf6lVE/nRcCqKqNqt9lyOFKeMs/7IoU1Z8TqrwWmzrAe1mkvy8p
 +E1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731935855; x=1732540655;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QEQ0UnPHgL8X1IzKLkITrqLzsus1TunLlu+R1N5lrJc=;
 b=SYXA0tjo1Nla3VYrNUgZgitqlMSX7El6LX5gEYHHrWgYNvZg71epo5qifl6XTl/5Dt
 JJVUv/YQX/UXI5IReEr7Lq9hclNzB9QDOEioDTqNz1GN/aHt5K2rZwZhw/HQKqy5anyZ
 QfKnz4/mzlnmgQk/a4kf9zXCi9FpyUT06yFHeLy5GGFZolAkaOUKQHqwby3Jx5+GUef9
 GEbfcC5o7uX2BX9b2Qy6cG69NGjaJttdwgR6lxlqxFHt6tuEKmgN3Ih+gMu62WNbON2/
 DJdL6kr9zmCx8mZnVMLQbqz0Bpmny3otlPKKGvTYL2DHDiJzdzQ8Ednbw2Y9Q9KIUdrT
 p5zg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4L+/GCgfe/YUS1FGzC267ia1bmyc0nNwrjsKTZHf+g3CB6JlnVQI7xLVR2M+ZH0CPKmC7Issq8O0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZLmGbZzlUlrBKZ/KJEeqCHQd+yFdpJYdZhdPDJ3A1ftlz/3WB
 Mj6KlQcLyWj4BkX2oPR+P+x0CBEAd/APtpRkpXFzs008P9c+NQ8NPayJSLvTin0=
X-Google-Smtp-Source: AGHT+IGdzRCE2acExYOAR/Q1TPJs2CyZISyIMx5j4q3L/H9VxSQ26s/Ffm8H90fecvqfEbJsuGZxrw==
X-Received: by 2002:a05:6512:3e07:b0:536:55a9:caf0 with SMTP id
 2adb3069b0e04-53dab25f7c9mr4511337e87.0.1731935855301; 
 Mon, 18 Nov 2024 05:17:35 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53da64f8cafsm1591434e87.54.2024.11.18.05.17.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 05:17:33 -0800 (PST)
Date: Mon, 18 Nov 2024 15:17:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@redhat.com>, Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, 
 Ian Ray <ian.ray@ge.com>, Martyn Welch <martyn.welch@collabora.co.uk>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, 
 Chia-I Wu <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, virtualization@lists.linux.dev, 
 spice-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/5] drm/encoder_slave: make mode_valid accept const
 struct drm_display_mode
Message-ID: <4prwsjl7nhg4u4tgyqdmgt6am5ryewslosmbezkfmyxgh2oket@zglhp7zqhfwe>
References: <20241115-drm-connector-mode-valid-const-v1-0-b1b523156f71@linaro.org>
 <20241115-drm-connector-mode-valid-const-v1-1-b1b523156f71@linaro.org>
 <20241117205426.GE12409@pendragon.ideasonboard.com>
 <CAA8EJpr=4AQVRKbtR2MaCQfguGW0a=3ay-ttew-mFR4f086Uyg@mail.gmail.com>
 <20241117233250.GK12409@pendragon.ideasonboard.com>
 <CAA8EJpq6Gkp4W=rGbpY6ASPgoDt=64HTFDk4_OZsTmbSUxhhGw@mail.gmail.com>
 <87plms51w4.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87plms51w4.fsf@intel.com>
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

On Mon, Nov 18, 2024 at 11:26:03AM +0200, Jani Nikula wrote:
> On Mon, 18 Nov 2024, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Mon, 18 Nov 2024 at 01:33, Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> >>
> >> On Mon, Nov 18, 2024 at 01:22:12AM +0200, Dmitry Baryshkov wrote:
> >> > On Sun, 17 Nov 2024 at 22:54, Laurent Pinchart wrote:
> >> > > On Fri, Nov 15, 2024 at 11:09:26PM +0200, Dmitry Baryshkov wrote:
> >> > > > The mode_valid() callbacks of drm_encoder, drm_crtc and drm_bridge
> >> > > > accept const struct drm_display_mode argument. Change the mode_valid
> >> > > > callback of drm_encoder_slave to also accept const argument.
> >> > > >
> >> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> > >
> >> > > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> >> > >
> >> > > On a side note, there's only two I2C slave encoder drivers left... I
> >> > > wonder if we could so something about them. The ch7006 and sil164
> >> > > drivers seem to be used by nouveau only, could they be moved to
> >> > > drivers/gpu/drm/nouveau/ ? We would move the whole drm_encoder_slave
> >> > > implementation there too, and leave it to die (or get taken out of limbo
> >> > > and fixed) with dispnv04.
> >> >
> >> > Or it might be better to switch to drm_bridge. Currently we also have
> >> > sil164 (sub)drivers in ast and i915 drivers. I don't know if there is
> >> > any common code to share or not. If there is some, it might be nice to
> >> > use common framework.
> >>
> >> That would require porting nouveau and i915 to drm_bridge. As much as
> >> I'd love to see that happening, I won't hold my breath.
> >
> > Me neither. Probably moving those two and drm_encoder_slave to nouveau
> > is really the best course for now.
> 
> Granted, the dvo part of i915 is ugly, but it's also only relevant for
> the oldest hardware i915 supports. Like 20 years old. Not sure there's
> much return on investment in big refactoring, more risk that it breaks
> without nobody noticing. Just let it be in i915?

Agreed


-- 
With best wishes
Dmitry
