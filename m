Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16E896F48C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 14:47:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCB6610EA38;
	Fri,  6 Sep 2024 12:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cTlKPe42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D3AD10EA38
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2024 12:47:00 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2f50966c478so22453351fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2024 05:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725626818; x=1726231618; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tCDROLtzQl9/e9E1lQx5QL5Q8ysDiREUAFeTrp/CYIE=;
 b=cTlKPe42ZyDIooMRDc8DrHUdiMIf7Oawnp7x7ofKZcrdCv7U7DLcagX5qg7wKECS8m
 VjiOSBwPYTKN98Hz72vl4jyPkFc0lBBWfGJJI1QQJwa2po9DGLJrSFDEtDJRLd6nbcyR
 Cqadv2U2HR1eVQdpuIwvfJsciTyxAYGDx5Y6WoIVrKAFtea7/MFSFAQMY/ICCgjUfxZP
 DDPeEqU1k/o6KINXrY4HhhnnWfgWzemcuRlO2MskAEtvX06DHUkAP9HjBYfnp6anxErJ
 Lg8B0PdKpP2PtXNI25XIHJ2e88fAwPTts6nJJ/q0LKTCLVssgdZWpK2ngfeHYNpAnfP5
 Cr+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725626818; x=1726231618;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tCDROLtzQl9/e9E1lQx5QL5Q8ysDiREUAFeTrp/CYIE=;
 b=DLTb1GxRHvYBnQvjZgWDPl8BH53miAVENJZJAylk5VHQIkcvsDE8rG7I/UpSMWNaQI
 76HAtZVukysQ3N7rCh36I+UHa4Yc4ZculqRPke21qLvUIFb/XOV4/2qd9jvLMUMUrlLq
 3yN36Ay+8MjJESKCaMPz0Z4VxfnzM/ssE4s7cl2zbBab9nOm/Gu5FHMjE8ESTTvXrDYS
 mz9rhtnKt3pM5Mr1IYFZNDOaCnMkT30C8O36HPrl+/7JhpZUX2GrPlb/UlKaReF9iVBB
 d1DL7Jw8TLOFvVHNdFQ520Na6+/9W9vi5bKT+/XNr51fnYY/mQbMHu4mg4sZCom+zDpF
 KpoA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV7iim5QdPXU0HWlhHD+UlU+zi6uEy0u+EEzi4/Lt/WFAUgn65nrBCCANoNW8te725b3rxjcS/bZOI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywbguxn62Bur3twXVmH/vxbLHzMStr2VuXpnqmw1x9rEMPDe2Cx
 nsvRsHGvLI2TEzTAnYS5EkgbAggAumG+Hp+HZsJ3GqIMr9L2c3z70ReuII2rQuo=
X-Google-Smtp-Source: AGHT+IHdP6sVKOBLWAcV7i0DQrC/I56I/bOZ1oLFyOUUNnoZRvRmqzwYIqtPFBQ78Alx6bgpM5C6ZQ==
X-Received: by 2002:a2e:6102:0:b0:2f6:2b51:ee3e with SMTP id
 38308e7fff4ca-2f751f82e6fmr15284681fa.41.1725626817484; 
 Fri, 06 Sep 2024 05:46:57 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2f614f38760sm29752311fa.60.2024.09.06.05.46.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2024 05:46:57 -0700 (PDT)
Date: Fri, 6 Sep 2024 15:46:55 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/imx: Add missing DRM_BRIDGE_CONNECTOR dependency
Message-ID: <cijdgivv2h57vwwpi7m5inl3atc2yryu4orrgxce52tguxiodp@aargw4zfdadg>
References: <20240906063857.2223442-1-alexander.stein@ew.tq-group.com>
 <CAA8EJpoz7jtjN-Dxq-6SHNiZCz2xsFFf5j4HOoFiLAq=OnHn6Q@mail.gmail.com>
 <c4e1da1d2f005e22f74eb2461382fd4666dedd4f.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c4e1da1d2f005e22f74eb2461382fd4666dedd4f.camel@pengutronix.de>
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

On Fri, Sep 06, 2024 at 01:46:43PM GMT, Philipp Zabel wrote:
> On Fr, 2024-09-06 at 14:35 +0300, Dmitry Baryshkov wrote:
> > On Fri, 6 Sept 2024 at 09:39, Alexander Stein
> > <alexander.stein@ew.tq-group.com> wrote:
> > > 
> > > When drm/bridge-connector was moved to DRM_DISPLAY_HELPER not all
> > > users were updated. Add missing Kconfig selections.
> > > 
> > > Fixes: 9da7ec9b19d8 ("drm/bridge-connector: move to DRM_DISPLAY_HELPER module")
> > > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > ---
> > >  drivers/gpu/drm/imx/ipuv3/Kconfig | 2 ++
> > >  1 file changed, 2 insertions(+)
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > I'll update it to drm-misc-next if nobody objects within a few hours
> 
> drm-misc-fixes? drm-misc-next doesn't contain 9da7ec9b19d8 yet.

Heh. And on drm-misc-fixes the IPUv3 doesn't use drm_bridge_connector.
So the issue is only present if both branches are merged.

-- 
With best wishes
Dmitry
