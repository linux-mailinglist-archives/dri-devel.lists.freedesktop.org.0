Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663D29F9A12
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 20:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C917010E3C1;
	Fri, 20 Dec 2024 19:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Obi71S56";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C7F10E3C1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 19:16:01 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-54020b0dcd2so3442364e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 11:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734722160; x=1735326960; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LVhGdRV7+tmpOWeS9zvGkR7uXA0VR0Po2tyiFNSf/dY=;
 b=Obi71S56DEZUVrKtKNIkKxHer6Mq8aODzLQvYSGyrfGKgLE3j2SAWP9RkooDJKH1k4
 iBXecgh5CxlcDlioTypEbyRkWNkmi8lh1m8U+Pj/WELbnxKy+892dag3WqufP6wK+v7Q
 LCIRZEW/h3ST7tYbW7ZoqYUIzw4jMMQw5ZTTIFq/v055Ik+sUOWThhF9fPG+OfV8tWQh
 XbLV5YYGNNtYklXk/EhnWZ0sofcvF5Kq3seBCLmiM45RAIC9AMbd9dUrMOcNpnvWSvOX
 cg7okwESlk3Y7qfHxYQxRee0lfFE6Wd5Mf5lPrrWrVmbQXPAoDgWr9nOUFf87aY1LQVN
 tYKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734722160; x=1735326960;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LVhGdRV7+tmpOWeS9zvGkR7uXA0VR0Po2tyiFNSf/dY=;
 b=dOrJL8r4mgfvGNsk/+4MfPVbkPUHv8kTMEa9VnldHCg9FpnVoD8yawuKHYtuPc/KM8
 XqViLHOSbBTBScAfDqf3+qbXkXwKaEFQ0K2z6yuHNTAcGgbik2tM8oF4AoY5riLzJOFq
 3biqI0FZLkTCiKhi3inS4b536fDDwsqHGb5NOKoPr8mW0BcN+bpXu7w39O1MGiAskXjl
 0dGG/pC0YdUyHOuFJ4UEduV52C29ZkSE5Fsi5u+jEyneGyQrmX78Gx49+iPleip4p0uH
 /rZYm09ncO182w438F37clkQIFMsia8aWc6oIpFKCYcqBaobmM7p6OyGGKhB3XLv/8pH
 txlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8g0bqW7qu01OYS5Y7+KZ7wMeSb6iS5nOPZRNI2WxspQmy45rQue4xcCM4gwsQU4U+LA5as6PgKQw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwH349EN6gV8Kba7JF36JtM2SNXlKLNtH4gVpkYFGZSVkmNh5ga
 gUT9SCcbNYDhMKY26iS5cieL+SEO1+FfwcrI225yiS5+SqJQOBDSWSMXXvaOFPU=
X-Gm-Gg: ASbGnct94G2SMR/O4gvdbNJ7g8m3JR+a5ZCRY9rJNK3pdXcIXst4KEx8jogDt8RjtB8
 JSswmPGJaRkOIOFJipAuYkfGb0PWo3BsgxzzIiUGjF8zfZsDbAfTGYUnWiSopL2uYE8wASExHZd
 81IDzLAL4hsEltzXDFybhWUHcM726fltncytOtRf+e+dPPHr1TQIwegkdG6XvinS3ta90TI8pws
 U6j2M4/GaDb4EbzWNjOXCYxxslNzbW7xd8aE75QKAAfqD7bX42LtnRbEeINhq7rlPM+ygiCBIvT
 altCfiX7sAhKMs4JXsNBW205gnEQvqq8hMXc
X-Google-Smtp-Source: AGHT+IEURyWKTn2FJTwcAgejvV5qcX/pZ5aDO4aMQy2EhYkLh3O2M6VjdFgjz7JOFFtdAxgONBeT/Q==
X-Received: by 2002:a05:6512:1242:b0:540:2122:faea with SMTP id
 2adb3069b0e04-542212ef59emr2889028e87.14.1734722159575; 
 Fri, 20 Dec 2024 11:15:59 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5422382fb31sm544143e87.235.2024.12.20.11.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 11:15:58 -0800 (PST)
Date: Fri, 20 Dec 2024 21:15:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Phong LE <ple@baylibre.com>, 
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
Message-ID: <2ut2qwy2geh7f2f75wq2ttlh4xbniwow24rtnzaikit7sd5smt@nrm5wiigrrha>
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
 <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
 <20241218-wild-red-manatee-bb2a34@houat>
 <CAPY8ntDdcOXuWVgx6+cbgX5ct_-MXcE7CWDKgGP57EX6bvBLaw@mail.gmail.com>
 <CAPY8ntAnJ1YDQee=pFSDY3+EXHj4_RZ-M1NMp2C3ZDdD5DsCKA@mail.gmail.com>
 <c7qyka3hsrggqevdwdlfcanzps3z63s4joryskijlbuztacmly@tadqjm2vkj24>
 <CAPY8ntDUaFnvkjkqES4AkrzZ2z659h3w5MFSd8vW04Eh-iJ1FA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntDUaFnvkjkqES4AkrzZ2z659h3w5MFSd8vW04Eh-iJ1FA@mail.gmail.com>
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

On Fri, Dec 20, 2024 at 03:00:47PM +0000, Dave Stevenson wrote:
> On Fri, 20 Dec 2024 at 00:45, Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, Dec 19, 2024 at 04:16:37PM +0000, Dave Stevenson wrote:
> > > On Wed, 18 Dec 2024 at 14:52, Dave Stevenson
> > > <dave.stevenson@raspberrypi.com> wrote:
> > > >
> > > > Hi Maxime & Dmitry
> > > >
> > > > On Wed, 18 Dec 2024 at 07:59, Maxime Ripard <mripard@kernel.org> wrote:
> > > > >
> > > > > On Wed, Dec 18, 2024 at 07:24:23AM +0200, Dmitry Baryshkov wrote:
> > > > > > On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
> > > > > > > On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > > > > > > > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > > > > > > > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > > > > > > > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > > > > > > > there was no simple way to get the drm_connector that stayed at the end
> > > > > > > > of the bridge chain. At the same point the drm_hdmi_connector functions
> > > > > > > > expected to get drm_connector instance.
> > > > > > > >
> > > > > > > > While looking for a way to solve the issue, I stumbled upon several
> > > > > > > > deficiencies in existing hdmi_codec_ops implementations. Only few of the
> > > > > > > > implementations were able to handle codec's 'plugged' callback. One
> > > > > > > > third of the drivers didn't implement the get_eld() callback.
> > > > > > > >
> > > > > > > > Most of the issues can be solved if drm_connector handles
> > > > > > > > hdmi-audio-codec on its own, delegating functionality to the actual
> > > > > > > > implementation, be it a driver that implements drm_connector or
> > > > > > > > drm_bridge.
> > > > > > > >
> > > > > > > > Implement such high-level framework, adding proper support for Audio
> > > > > > > > InfoFrame generation to the LT9611 driver.
> > > > > > > >
> > > > > > > > Several design decisions to be kept in mind:
> > > > > > > >
> > > > > > > > - drm_connector_hdmi_codec is kept as simple as possible. It implements
> > > > > > > >   generic functionality (ELD, hotplug, registration).
> > > > > > > >
> > > > > > > > - drm_hdmi_connector sets up HDMI codec device if the connector
> > > > > > > >   is setup correspondingly (either I2S or S/PDIF is marked as
> > > > > > > >   supported).
> > > > > > > >
> > > > > > > > - drm_bridge_connector provides a way to link HDMI audio codec
> > > > > > > >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> > > > > > > >   framework.
> > > > > > > >
> > > > > > > > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> > > > > > > >   bits. Only TDA889x driver sets them, while it's safe to assume that
> > > > > > > >   most of HDMI / DP devices do not support ARC / capture. I think the
> > > > > > > >   drivers should opt-in capture support rather than having to opt-out of
> > > > > > > >   it.
> > > > > > >
> > > > > > > Sorry if this isn't clear to me and I'm quite late to the party, but did
> > > > > > > you test this on vc4 with both a pi3 and pi4, or was it just compile
> > > > > > > tested?
> > > > > >
> > > > > > LT9611 is actually tested, VC4 is only compile-tested. Should I put an RFT tag?
> > > > >
> > > > > Yeah, we definitely need to test it on the pi3 (polling-based) and the
> > > > > pi4 (irq-based) at least.
> > > > >
> > > > > Dave, Maira, could you give it a try?
> > > >
> > > > I'm on it.
> > >
> > > Basic checks look OK.
> > > Pi3 and Pi4 tested, including 4k60 on Pi4 (enables scrambling). Audio
> > > works, and all the EDID parsing seems to be correct.
> > >
> > > Ideally I would like to do a couple more tests though as I had a
> > > couple of spontaneous reboots on Pi4 whilst hotplugging.
> > > Most likely it was just grounding issues, as I can't think of an
> > > obvious way for the kernel to be triggering an automatic reboot. They
> > > seemed to go away when I had enabled drm.debug=0x14, but more likely
> > > I'd connected the serial port and therefore provided another ground.
> > > Please don't hold the patches waiting on me though - I don't know when
> > > I'll have time to do them.
> >
> > Tested-by?
> 
> I'd held off hoping to get the extra testing done today, but that
> hasn't happened, and today is my last day before the Christmas break.
> So based on what I've done so far:
> 
> Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thank you!

> 
> > >
> > >
> > > Also unrelated to this patch set, I have noted I'm getting
> > > [   60.780897] WARNING: CPU: 3 PID: 501 at
> > > drivers/gpu/drm/vc4/vc4_hvs.c:743 __vc4_hvs_stop_channel+0x148/0x164
> > > [vc4]
> > > ...
> > > [   60.781192]  __vc4_hvs_stop_channel+0x148/0x164 [vc4] (P)
> > > [   60.781212]  __vc4_hvs_stop_channel+0x40/0x164 [vc4] (L)
> > > [   60.781230]  vc4_hvs_stop_channel+0x30/0x3c [vc4]
> > > [   60.781248]  vc4_crtc_disable+0x140/0x1e8 [vc4]
> > > [   60.781266]  vc4_crtc_atomic_disable+0x98/0xb8 [vc4]
> > > [   60.781284]  disable_outputs+0x22c/0x33c [drm_kms_helper]
> > > [   60.781326]  drm_atomic_helper_commit_modeset_disables+0x1c/0x4c
> > > [drm_kms_helper]
> > > [   60.781347]  vc4_atomic_commit_tail+0x10c/0x8e4 [vc4]
> > > [   60.781364]  commit_tail+0xa0/0x188 [drm_kms_helper]
> > > [   60.781385]  drm_atomic_helper_commit+0x16c/0x180 [drm_kms_helper]
> > > [   60.781406]  drm_atomic_commit+0x88/0xc4 [drm]
> > > [   60.781500]  drm_client_modeset_commit_atomic+0x204/0x264 [drm]
> > > [   60.781553]  drm_client_modeset_commit_locked+0x5c/0x198 [drm]
> > > [   60.781603]  drm_client_modeset_commit+0x30/0x58 [drm]
> > > [   60.781652]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0xe8
> > > [drm_kms_helper]
> > > [   60.781674]  drm_fb_helper_hotplug_event+0x108/0x12c [drm_kms_helper]
> > > [   60.781695]  drm_fbdev_client_hotplug+0x28/0xd4 [drm_client_lib]
> > > [   60.781700]  drm_client_dev_hotplug+0xc8/0x12c [drm]
> > > [   60.781750]  drm_connector_helper_hpd_irq_event+0x70/0xb0 [drm_kms_helper]
> > > [   60.781771]  vc4_hdmi_hpd_irq_thread+0x2c/0x3c [vc4]
> > > [   60.781790]  irq_thread_fn+0x2c/0xa8
> > > [   60.781799]  irq_thread+0x16c/0x2f4
> > > [   60.781805]  kthread+0x118/0x11c
> > > [   60.781813]  ret_from_fork+0x10/0x20
> > > On first plugging or unplugging a second monitor. I suspect that is
> > > spurious though and I'll look into it, but probably not this side of
> > > the Christmas break.
> > >
> > >   Dave
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
