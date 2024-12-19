Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D219F7F34
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 17:17:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF4910ED3B;
	Thu, 19 Dec 2024 16:17:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="cAPpRcLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F6010ED3B
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 16:16:58 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-6ef60e500d7so7946307b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734625018; x=1735229818;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1ZmzjNgd3FzWWFXoKed7UNpdcC9ExA3iDz2Moa5OROY=;
 b=cAPpRcLK2GDdED7cpS4DrShYbNou76hC5AprYYz9CE2dYaV5U4FskS/6ksIyIb7bMk
 5co1UxXByJ3eSSZZyt2Xe6pGn88XZs1uyc8Oiuro0ttNN9dIa55aUEpytBvpwUiaRJLS
 puIgPAMe0i85joquDB/aWBH6LPZhNUU1w+QYKoEZ2KvWoTe+4uve3oGaEVYfP8fBEGJh
 rfhqlZefH14J8rZmuzrBpkoakOu+QsiFEssDMXCJgEa7fRoSiCKspzUtEdlZAooQ/VMA
 PtxrpF9sDSNzlwDvC5Mjo2yufy3zzpoCdERNVY5FWr9boS8ySHh1Jzd1A2eHoPUk58E+
 ZWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734625018; x=1735229818;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1ZmzjNgd3FzWWFXoKed7UNpdcC9ExA3iDz2Moa5OROY=;
 b=o4DXKXhoT3j4uRQ/GH4O67wkn3HbcFRtDO6c+Ho2L3V3OLnLNu+W0od3E9nY8dp4Gf
 Uj5SaGDHE7uu/zZvG12fY68GgiNCz5zP3zuOL/qgJ3UVMmgvOh7tg6dVQRXw9TEOwBBj
 1e65q1AbJS1lDBhrq7LPujndr4VZnU0ar/6gRBUJ30nVC16kWyjhF/2oUKOpTLUesU87
 IBt8qfXtLLcA3mWuiIDW6ASDSwmgZ0Cd/cFhA3WrkMBmuk9XtmoYpFSdr9LxOwxl/BHu
 saQXIEx55c7tbFvjApC0ucIS3EiR2fh1cxfDvbqp4L0cPi3e7D8LDD8YR3iJe1aN/7mx
 i78Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUD15b2y4HFwUxYpIB2dS5lK+p2kFZHfTNQjY2GIbjQhFg/GJU+8wzGARnQXbsUIMXf5DPunqwh5OU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxR0RX+33U9y4oB6XfAFZoulzrMbgrzcP0/Ggh54bSn04CYxC9/
 TLVXHyZYFL2+s3ognQ5ACxmedhafUS5mQwRouopDK51S3yHetfJ6QaLCdcHajp3OB5NrZ+kTXVD
 9TyMBXIEXkOmZMOdOTeBjRM610dYcwYHl2C0Ttw==
X-Gm-Gg: ASbGncvb34gH2EnpOix3k9d+nN3FhL0lQBrpJopA+kimNHXA/4ZjdxyHIX9hjEWMrUH
 F6VQBqswSinJEpeF1pieyyQOQmE9xHraglloVLA==
X-Google-Smtp-Source: AGHT+IECkheCLvfI42XUCb3c+ehUjJfGKo2yL4elekXmeYHMSMkezHohmTNLU2nT00zZk2MNPaGa7Nbdr9wYj8x5cGM=
X-Received: by 2002:a05:690c:7489:b0:6ef:94b3:72f6 with SMTP id
 00721157ae682-6f3d26c386amr59410227b3.42.1734625016409; Thu, 19 Dec 2024
 08:16:56 -0800 (PST)
MIME-Version: 1.0
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
 <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
 <20241218-wild-red-manatee-bb2a34@houat>
 <CAPY8ntDdcOXuWVgx6+cbgX5ct_-MXcE7CWDKgGP57EX6bvBLaw@mail.gmail.com>
In-Reply-To: <CAPY8ntDdcOXuWVgx6+cbgX5ct_-MXcE7CWDKgGP57EX6bvBLaw@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 19 Dec 2024 16:16:37 +0000
Message-ID: <CAPY8ntAnJ1YDQee=pFSDY3+EXHj4_RZ-M1NMp2C3ZDdD5DsCKA@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Russell King <linux@armlinux.org.uk>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 18 Dec 2024 at 14:52, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> Hi Maxime & Dmitry
>
> On Wed, 18 Dec 2024 at 07:59, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Wed, Dec 18, 2024 at 07:24:23AM +0200, Dmitry Baryshkov wrote:
> > > On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
> > > > On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > > > > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > > > > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > > > > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > > > > there was no simple way to get the drm_connector that stayed at the end
> > > > > of the bridge chain. At the same point the drm_hdmi_connector functions
> > > > > expected to get drm_connector instance.
> > > > >
> > > > > While looking for a way to solve the issue, I stumbled upon several
> > > > > deficiencies in existing hdmi_codec_ops implementations. Only few of the
> > > > > implementations were able to handle codec's 'plugged' callback. One
> > > > > third of the drivers didn't implement the get_eld() callback.
> > > > >
> > > > > Most of the issues can be solved if drm_connector handles
> > > > > hdmi-audio-codec on its own, delegating functionality to the actual
> > > > > implementation, be it a driver that implements drm_connector or
> > > > > drm_bridge.
> > > > >
> > > > > Implement such high-level framework, adding proper support for Audio
> > > > > InfoFrame generation to the LT9611 driver.
> > > > >
> > > > > Several design decisions to be kept in mind:
> > > > >
> > > > > - drm_connector_hdmi_codec is kept as simple as possible. It implements
> > > > >   generic functionality (ELD, hotplug, registration).
> > > > >
> > > > > - drm_hdmi_connector sets up HDMI codec device if the connector
> > > > >   is setup correspondingly (either I2S or S/PDIF is marked as
> > > > >   supported).
> > > > >
> > > > > - drm_bridge_connector provides a way to link HDMI audio codec
> > > > >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> > > > >   framework.
> > > > >
> > > > > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> > > > >   bits. Only TDA889x driver sets them, while it's safe to assume that
> > > > >   most of HDMI / DP devices do not support ARC / capture. I think the
> > > > >   drivers should opt-in capture support rather than having to opt-out of
> > > > >   it.
> > > >
> > > > Sorry if this isn't clear to me and I'm quite late to the party, but did
> > > > you test this on vc4 with both a pi3 and pi4, or was it just compile
> > > > tested?
> > >
> > > LT9611 is actually tested, VC4 is only compile-tested. Should I put an RFT tag?
> >
> > Yeah, we definitely need to test it on the pi3 (polling-based) and the
> > pi4 (irq-based) at least.
> >
> > Dave, Maira, could you give it a try?
>
> I'm on it.

Basic checks look OK.
Pi3 and Pi4 tested, including 4k60 on Pi4 (enables scrambling). Audio
works, and all the EDID parsing seems to be correct.

Ideally I would like to do a couple more tests though as I had a
couple of spontaneous reboots on Pi4 whilst hotplugging.
Most likely it was just grounding issues, as I can't think of an
obvious way for the kernel to be triggering an automatic reboot. They
seemed to go away when I had enabled drm.debug=0x14, but more likely
I'd connected the serial port and therefore provided another ground.
Please don't hold the patches waiting on me though - I don't know when
I'll have time to do them.


Also unrelated to this patch set, I have noted I'm getting
[   60.780897] WARNING: CPU: 3 PID: 501 at
drivers/gpu/drm/vc4/vc4_hvs.c:743 __vc4_hvs_stop_channel+0x148/0x164
[vc4]
...
[   60.781192]  __vc4_hvs_stop_channel+0x148/0x164 [vc4] (P)
[   60.781212]  __vc4_hvs_stop_channel+0x40/0x164 [vc4] (L)
[   60.781230]  vc4_hvs_stop_channel+0x30/0x3c [vc4]
[   60.781248]  vc4_crtc_disable+0x140/0x1e8 [vc4]
[   60.781266]  vc4_crtc_atomic_disable+0x98/0xb8 [vc4]
[   60.781284]  disable_outputs+0x22c/0x33c [drm_kms_helper]
[   60.781326]  drm_atomic_helper_commit_modeset_disables+0x1c/0x4c
[drm_kms_helper]
[   60.781347]  vc4_atomic_commit_tail+0x10c/0x8e4 [vc4]
[   60.781364]  commit_tail+0xa0/0x188 [drm_kms_helper]
[   60.781385]  drm_atomic_helper_commit+0x16c/0x180 [drm_kms_helper]
[   60.781406]  drm_atomic_commit+0x88/0xc4 [drm]
[   60.781500]  drm_client_modeset_commit_atomic+0x204/0x264 [drm]
[   60.781553]  drm_client_modeset_commit_locked+0x5c/0x198 [drm]
[   60.781603]  drm_client_modeset_commit+0x30/0x58 [drm]
[   60.781652]  __drm_fb_helper_restore_fbdev_mode_unlocked+0xb4/0xe8
[drm_kms_helper]
[   60.781674]  drm_fb_helper_hotplug_event+0x108/0x12c [drm_kms_helper]
[   60.781695]  drm_fbdev_client_hotplug+0x28/0xd4 [drm_client_lib]
[   60.781700]  drm_client_dev_hotplug+0xc8/0x12c [drm]
[   60.781750]  drm_connector_helper_hpd_irq_event+0x70/0xb0 [drm_kms_helper]
[   60.781771]  vc4_hdmi_hpd_irq_thread+0x2c/0x3c [vc4]
[   60.781790]  irq_thread_fn+0x2c/0xa8
[   60.781799]  irq_thread+0x16c/0x2f4
[   60.781805]  kthread+0x118/0x11c
[   60.781813]  ret_from_fork+0x10/0x20
On first plugging or unplugging a second monitor. I suspect that is
spurious though and I'll look into it, but probably not this side of
the Christmas break.

  Dave
