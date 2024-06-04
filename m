Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2200C8FC02F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2024 01:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E71510E155;
	Tue,  4 Jun 2024 23:49:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DvbZ+5mq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13BE910E155
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 23:49:30 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2e6f33150bcso63943661fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jun 2024 16:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717544969; x=1718149769; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OYlsPq/Nl2a6jpBnYLpUuE7MhnCmlQ2CakctggIcvoA=;
 b=DvbZ+5mqvaoD/lP1qIUh1CpWDaw4fnThEVl8hN8exRnc50fdvFNk1Ck1mmKGQwq7w0
 7OAEejglLFbC8tH4VMMWWLzVA3T57v9GAic12Vt81wVDuDWT2VsiJ/KsjafR8OSa40C2
 nASMHBIzjg7WwFxX2jjJzVAASZfhSNsYAGe9MWT1efCIfPmat3ySZrwH1py1oyinZTjQ
 hXM9i234h9T28BQYRIU7u3Z+vqzrD1HOwKYG5ISMxQbngouMSjR0x7jwY/bIuwYJCr5x
 UXuazx/tJNYK/p01DctEWXbsrjmWjoaaHdWXD+aLDEPlA6boEuMAixSOORGXQFZyPyFr
 Pr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717544969; x=1718149769;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OYlsPq/Nl2a6jpBnYLpUuE7MhnCmlQ2CakctggIcvoA=;
 b=c1Kj98Z568y+8OfnlMCKf8PTNIZ+hNIgTf1wyd5hLOzTgGtQpFAMRS1LmAm+jcluOB
 oei9cG+sTF0V3MlA6t+6F+oKZ/ziC16StXgDVprNMfBdAPBQ+CoGtJAPBuZ1AjRHw/d4
 HBH6ExQvsMoRWsCPHrd/bhjgMloz7KXGVgb8Ji3zBC4OGLfspFlh0Olpo/uukFduyogi
 WOpr6oCWywGR8NhLNAOEsiHFu68OApn6JRXAQQea/zlydnngPb/B2DiwdcESnLnxqNRZ
 xnAVidSpDbrOU9D4oPwWiy0gQqEvxVgRKC2Jp15mkqVRYOo4oiYx36D9CSI4ax0Oil3F
 qcIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWdSZsAPTVcURFJQTgYYyvL8OHft6wXJYKL4PZuCqOJbF7AaCKXGYKWjl2iArWX0+vBL94HI6pkADqvuQB46mXp6hrrQ8Chc4nOzcIoyI8
X-Gm-Message-State: AOJu0YzG4NCca7RmEkoxrRHeoHCMF6dTmKQJQF42ZvsmfasBm2AyhYXz
 afiNTVstm9mrNBxRAv1kuUkuP+G0PniUBpaGEFxTLgEk0flw+L5UOfR9Gci84NM=
X-Google-Smtp-Source: AGHT+IEqt/1E9UYfq6hr7NwOOCvGfJFrmEaHjn1YhWsPZoauNt3zoMgMqQ+4sf+zBHTn4FHcfvCgIw==
X-Received: by 2002:a2e:bc08:0:b0:2e9:5011:f6b1 with SMTP id
 38308e7fff4ca-2eac7a73140mr3969551fa.42.1717544968775; 
 Tue, 04 Jun 2024 16:49:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ea91cc65cbsm16085851fa.73.2024.06.04.16.49.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jun 2024 16:49:28 -0700 (PDT)
Date: Wed, 5 Jun 2024 02:49:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mark Yao <markyao0591@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH 00/14] Add initial support for the Rockchip RK3588 HDMI
 TX Controller
Message-ID: <ymccadqprkxlvhv6ekyqr7utsgejxhqmxlki7nh23htgktlynl@7upjoc5whcy6>
References: <20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com>
 <a5jlj5hncv2p7lxk6pbgynkqfovlg3lzz2muzrbrkd73afiopu@n5tmd4zfyeik>
 <892b2070-2fd0-42b2-a8c2-811dc7382b0c@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <892b2070-2fd0-42b2-a8c2-811dc7382b0c@collabora.com>
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

On Tue, Jun 04, 2024 at 10:44:04PM +0300, Cristian Ciocaltea wrote:
> On 6/1/24 7:32 PM, Dmitry Baryshkov wrote:
> > On Sat, Jun 01, 2024 at 04:12:22PM +0300, Cristian Ciocaltea wrote:
> >> The RK3588 SoC family integrates a Quad-Pixel (QP) variant of the
> >> Synopsys DesignWare HDMI TX controller used in the previous SoCs.
> >>
> >> It is HDMI 2.1 compliant and supports the following features, among
> >> others:
> >>
> >> * Fixed Rate Link (FRL)
> >> * 4K@120Hz and 8K@60Hz video modes
> >> * Variable Refresh Rate (VRR) including Quick Media Switching (QMS)
> >> * Fast Vactive (FVA)
> >> * SCDC I2C DDC access
> >> * TMDS Scrambler enabling 2160p@60Hz with RGB/YCbCr4:4:4
> >> * YCbCr4:2:0 enabling 2160p@60Hz at lower HDMI link speeds
> >> * Multi-stream audio
> >> * Enhanced Audio Return Channel (EARC)
> > 
> > It would be really nice if you can take a look at using the HDMI
> > connector framework (landed few days ago) with adaptations for the
> > drm_bridge / drm_bridge_connector ([1]). Your comments for the
> > drm_bridge patches would be defeinitely appreciated.
> > 
> > [1] https://lore.kernel.org/dri-devel/20240531-bridge-hdmi-connector-v4-0-5110f7943622@linaro.org/
> 
> I will definitely check and try to use it, but I'd rather wait a bit
> until this gets stabilized and focus instead on the mandatory changes
> required to upstream this driver. That's mostly because my limited
> availability and expertise on the matter, while trying to unblock other
> work depending on this.

Ack.

-- 
With best wishes
Dmitry
