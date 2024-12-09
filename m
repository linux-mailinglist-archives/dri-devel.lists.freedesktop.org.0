Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4D49E99FF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 16:06:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22E310E039;
	Mon,  9 Dec 2024 15:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=thaumatec-com.20230601.gappssmtp.com header.i=@thaumatec-com.20230601.gappssmtp.com header.b="DOuOI9xb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A9DA10E039
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 15:06:23 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-434a2033562so42793065e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 07:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1733756781; x=1734361581;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fBemlKVePg1M8JMVZCDuH/Kc392eD263a2QapCaGV9U=;
 b=DOuOI9xbl7GXArBcIx+eM2MjsWIVrC91MC7Yo6oeWloMQlixKRB3Hs69vDqSVkaOho
 tzgLtLovTmaeYUjUQWzI5oh+sh6ByLwAUy7A4c2MJxMHfhg0b/tlwPoxikechc6XQuzd
 v+bfB75SF9i6KI7PYye7Tm/fi9563Dfsjl5TeA+yNKHUXERX4otDc0V6wtNp8vlaeDM1
 FOcboQMcahdq4AkTdVpiLmx1K0+TGAsPwWeyFzc7u9sm3nE8PaGwFJncm2sC5NlNsAS4
 89Ko59cAEm4ncvah8pfTS0lLkmjvfW+/HkMF0WY7dbO1bTWCIy9gaWmQUynBH3qOg/Pe
 r3UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733756781; x=1734361581;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fBemlKVePg1M8JMVZCDuH/Kc392eD263a2QapCaGV9U=;
 b=RsoeviHotwaSvs6oUy0riMUD3BgASdGXAwuvD3RKWNlvhHOFNw9u6ZbT2h8Tgb8ZAm
 j0PvPpdCxu7lhJRuOCkTfXkjiloR+7/xc9XiIkykfdJW096BBirUfYhkI6E6MAwzDckZ
 ukEv103cyx/6Th0+s0S2uDFjK64Vm5yhwYMlY+70FqdKSmnp4hu/QlpUDjgKPdtOKxy0
 y9r/nm7uRGGyUPKpQp71WIecu0duf+f41GWR/iau0QmeHHXOMOzVIMl41gubxGaAdBpZ
 +W8ys4r7guT9g/vEPD/3sz5Sz5nTmKU126jOtmc9nJiasRtgJoiWKXl2X8GXwHKetGdb
 2AhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/XvzqWqkAIURugE+ihCkoWawXX1K51fuJ6/za41KcTOKQ0FC9GbCg99GnbywrOxxvI+rHQzm5oUc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI+F1m5IYdU2f4JAylxGC1Mmngi6o7fxPI0eet/xlndUbqx/KX
 5s4yBE2ictuFr7pguYT4P8lcxz83LFVs+rqlyeUavMjseVHnLRWjaFBThaixOc4=
X-Gm-Gg: ASbGncsLlh0dA51s/laUj+G3Vlew5fz4ftBrA9njC0RZtvqDH5gqlCthJVhQIyGl8ZA
 BaM15Kik8sVWPIXj0x+RkJLP5G2zkCc3DdSyYIMLdCiVU5d0csludRmip8a5AIND3yRGGyqDkGb
 2bPwv4tXULLOEwAg/XmtjmR3LVwbpP1NWQFRHifzZ1JaUWjhQ248blHErLi07u7cckPg4cZVNI2
 Lryxg0lCDQ1uh3DabUBAEwYfHaKDo68kU+GW+22
X-Google-Smtp-Source: AGHT+IEaMojRUAQLLwed4/ER+OeZapLgzpX/2UyzkziLJwq8W59lZWRdfU3Peh7xaUCEk69zEFgm5A==
X-Received: by 2002:a05:600c:a09:b0:434:fb65:ebbb with SMTP id
 5b1f17b1804b1-434fb65ecb9mr25947035e9.17.1733756781170; 
 Mon, 09 Dec 2024 07:06:21 -0800 (PST)
Received: from fedora.. ([91.90.172.13]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d43809fdsm103296665e9.1.2024.12.09.07.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2024 07:06:20 -0800 (PST)
From: Daniel Semkowicz <dse@thaumatec.com>
To: heiko@sntech.de
Cc: Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, quentin.schulz@cherry.de, rfoss@kernel.org,
 robh@kernel.org, tzimmermann@suse.de
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
Date: Mon,  9 Dec 2024 16:06:08 +0100
Message-ID: <20241209150619.33998-1-dse@thaumatec.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241203165450.1501219-1-heiko@sntech.de>
References: <20241203165450.1501219-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hello Heiko,

On 03.12.24 21:54, Heiko Stuebner wrote:
> This series adds a bridge and glue driver for the DSI2 controller found
> in the rk3588 soc from Rockchip, that is based on a Synopsis IP block.
> 
> As the manual states:
> The Display Serial Interface 2 (DSI-2) is part of a group of communication
> protocols defined by the MIPI Alliance. The MIPI DSI-2 Host Controller is
> a digital core that implements all protocol functions defined in the
> MIPI DSI-2 Specification.
> 
> 
> While the driver structure is very similar to the previous DSI controller,
> the programming model of the core is quite different, with a completely
> new register set.
> 
> Another notable difference is that the phy interface is variable now too
> in its width and some other settings.
> 

I did more tests with different LVDS displays. I tested following
configurations with DSI/LVDS bridge:
- 1024x600@60.01
- 1024x768@60.02
- 1280x800@60.07
- 1366x768@60.06

All of them worked without issues, except 1366x768.
With this resolution, video is blurry, and offset incorrectly
to the left. There are also repeating errors on the console:

  rockchip-drm display-subsystem: [drm] *ERROR* POST_BUF_EMPTY irq err at vp3

In correct operation with other resolutions, there is no error.
I am not sure if this is a problem in your series or rather in VOP2
driver.

I tried to track down the problem, and it seems to be a generic issue
when horizontal line width is not divisible by 4.
Lowering line width to 1364px fixes the issue, but of course I have two
vertical lines of black pixels on the right.
I also made some tests with 720x1280 DSI display. Lowering horizontal
line to 718px shows the same problem. With 720px and 716px it works
correctly.

Kind regards
Daniel

