Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72FE9F5E45
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 06:24:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1D910E17D;
	Wed, 18 Dec 2024 05:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Qbf0D8Vw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EC310E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 05:24:31 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-e460717039fso3327610276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 21:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734499470; x=1735104270; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cXb0T9nLgGFZosqj/ZFHPS5FS6w/en1hvTkOmnMKx9o=;
 b=Qbf0D8VwsA2dBRyJHo2GpdX6Z8KsRxnUpjvr7MdTRYzzzsGqlqXWynAl+YNWNJh6er
 NbRLeqqeDiAcrT5w0w7uus6DmTezTylZwHzPu+adYuUvjoBg4M+jFHqQ0otilv62F8Lo
 5yInsW900uks2yxgGpuei7E4jplV/Wfzs511b5LRewuhaz5rI6k2z+55vTIzHTDqn1q0
 uNVq7KrJ0P5HUnjAMxgW+6zIhVCCDkut1uyXk+SmtoCBOcK8xaw9yyncqUk9jGawg1XF
 fx3Xd7D65UtkmGEUudwpX9lEw21oPKtQu9JtYh6LaM5yZ6vfqGQMZnRi7kx0iNRwwUdR
 e0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734499470; x=1735104270;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cXb0T9nLgGFZosqj/ZFHPS5FS6w/en1hvTkOmnMKx9o=;
 b=JcGeDGqG9XJnQQfUIfN4qKwKE6kaug5JUXA+bGJ8PFkblSOwyjh906mFoK/NpdZ3Rv
 QBsS2iFlKaW3pc4vTrzXK8VakS/D320e3cK8a/EbFJ8igY0lr+mUXO94uwz6DyqPvKJ6
 SmGGQP8MIuCC7V4YyLbRTQ6FXSvUt1aDNK1lY47Lu5MHKwr8/CFHCx0sp2UGjdDUHPCJ
 YWHpRftpNoCQIfaljr1YxqmCDdjysEVj6jlqiV742S2s9KjW0J97TVsBvYl6JrNrZmD1
 jOUgarvoQ/RE6GGTa5P9Bnt3hrK0aNGzw76ueNaAWuGCCrqC8Ez+VPOA5soG/rOK78l9
 v5ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBVUHG5PINtJfNUxpNy1jQnaHSA1SvuKTV95CTgFiDo/jl8jZpqLvUj7rh2vnBS9E7V5jUylWF+Ng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/1cjcjRc2j0b8kxMaO0bp/8/Iabma8V1cRBehoaswxIjK4/dk
 +W19sA+CDE5RfF31rfafJ0jT4C9PoSZ0c0chxphUdNFy3QpigrI0Jrz9PkRymoKN7mavil0JevI
 TBLwModKHXa/QYZPDx/+qGEOp8t+DSK0AVNYmCQ==
X-Gm-Gg: ASbGnctHHP0DJ5WYCEBmjhsAyvL98wAWkOMvyK2JUMHwI1jLrpLTRq2fuRcgWtpLYDA
 kIRtdSlvkXYGLlTy7ctndCp7UeT9QjBDduVRj/cGIzG9uVupE7aWerOhA9kFL60hJmdvNxg==
X-Google-Smtp-Source: AGHT+IE3kqRdPneJyqqtRpFDLs6soyy+Bdc+Cywd1EGV0t4/4nnntxQS7NjaTVS7xOtVNpAQwVKUJPYkOMozlg43ysk=
X-Received: by 2002:a05:6902:70f:b0:e49:5f2d:e729 with SMTP id
 3f1490d57ef6-e53620cdcf8mr1205674276.4.1734499470459; Tue, 17 Dec 2024
 21:24:30 -0800 (PST)
MIME-Version: 1.0
References: <20241217-drm-bridge-hdmi-connector-v7-0-cb9df2b6a515@linaro.org>
 <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
In-Reply-To: <20241217-vivacious-chameleon-of-swiftness-f1edc4@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Dec 2024 07:24:23 +0200
Message-ID: <CAA8EJprjCyWBNkRrc4W24uCwPtf_kxZLqNeNP8EJffbutYQ21w@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] drm: add DRM HDMI Codec framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
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

On Tue, 17 Dec 2024 at 19:21, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Tue, Dec 17, 2024 at 02:40:22AM +0200, Dmitry Baryshkov wrote:
> > While porting lt9611 DSI-to-HDMI bridge driver to use HDMI Connector
> > framework, I stumbled upon an issue while handling the Audio InfoFrames.
> > The HDMI codec callbacks weren't receiving the drm_atomic_state, so
> > there was no simple way to get the drm_connector that stayed at the end
> > of the bridge chain. At the same point the drm_hdmi_connector functions
> > expected to get drm_connector instance.
> >
> > While looking for a way to solve the issue, I stumbled upon several
> > deficiencies in existing hdmi_codec_ops implementations. Only few of the
> > implementations were able to handle codec's 'plugged' callback. One
> > third of the drivers didn't implement the get_eld() callback.
> >
> > Most of the issues can be solved if drm_connector handles
> > hdmi-audio-codec on its own, delegating functionality to the actual
> > implementation, be it a driver that implements drm_connector or
> > drm_bridge.
> >
> > Implement such high-level framework, adding proper support for Audio
> > InfoFrame generation to the LT9611 driver.
> >
> > Several design decisions to be kept in mind:
> >
> > - drm_connector_hdmi_codec is kept as simple as possible. It implements
> >   generic functionality (ELD, hotplug, registration).
> >
> > - drm_hdmi_connector sets up HDMI codec device if the connector
> >   is setup correspondingly (either I2S or S/PDIF is marked as
> >   supported).
> >
> > - drm_bridge_connector provides a way to link HDMI audio codec
> >   funcionality in the drm_bridge with the drm_connector_hdmi_codec
> >   framework.
> >
> > - It might be worth reverting the no_i2s_capture / no_spdif_capture
> >   bits. Only TDA889x driver sets them, while it's safe to assume that
> >   most of HDMI / DP devices do not support ARC / capture. I think the
> >   drivers should opt-in capture support rather than having to opt-out of
> >   it.
>
> Sorry if this isn't clear to me and I'm quite late to the party, but did
> you test this on vc4 with both a pi3 and pi4, or was it just compile
> tested?

LT9611 is actually tested, VC4 is only compile-tested. Should I put an RFT tag?


-- 
With best wishes
Dmitry
