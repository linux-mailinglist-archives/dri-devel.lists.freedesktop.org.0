Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5639E687C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 09:12:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D35110E5F7;
	Fri,  6 Dec 2024 08:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ObVvavqA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA4310E2C8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 09:11:21 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-3001490ba93so7542511fa.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Dec 2024 01:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1733389879; x=1733994679; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=g70770pHl/BwAdcq7mSKVqhSUdxEsRQhDHwPhr+/2R0=;
 b=ObVvavqApzag2Mawv7sELJyh2fiQvE7e+MrnLP4k8AwbmbvAopTzfk1MU6xzi843f7
 /hfvcwyULrcBRBqd6Dz5paiHLiaMACRoDrsn1v5EbBtPYqgbzWbRPJVyxYBLhQVIzB9O
 0rkuHlzIEKbr8yV5kmtA1V7OQWU14ewLks9/Me3rCmSv15bLTCrPp0XlpbZVhAHAsrS+
 muEiTYYWiD/1LVLuRZgCIsCboUK5ZDSsZ5hGYLQprfdeGdU7yfCHUp/RH368mnyWbRdY
 1ouKUJWs/D/XvsbT0lHXmTb8N660+lgdgOyS0Wd2sflcHyEsPydTIzygHLYPc75141MT
 Bwtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733389879; x=1733994679;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g70770pHl/BwAdcq7mSKVqhSUdxEsRQhDHwPhr+/2R0=;
 b=lBBNHTBc5UbqL+Kom8/wlmTnUF5ClLLH9hMFexWaeCG+sjTc3bS3z4mehH4JMTr4na
 l+NjQmq1qCw+9euEq6w2+t2SAqSCJSqRPm9xgKaqNLQffGA3tBzTcZF+YR3d+TBxYjvP
 BgmImxTQZC1DbhoFYkgDklCTHcu2K0vSlk0LBvygt+vzFal2drp89G3IvcQmfAhlEs7A
 q2lo1qM3CcSPhVPf0N/kUu5XQ1UM1wK2UdciNOaLa8tQlYVhiDQ6oAc6SyERGCaTju/m
 zSW+RRORc2ceo9LDBAFRuozW65Z19t/ILciEUIhy+udXTYGheHRpUDmRQ6alkmCcbs3S
 oorg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqXy014mNbzYUg9x3/wHts/0Tr9KC6rIwUUzFcepY5joyheEEHAizGIP/Hq2ik/9+lsEnqdN0cSwQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCYBx4xRG0ck0aGNXNlb/I3gI322pnk5ouXYa083fGqOsHnklY
 j0LSx7ihUJoArPwz+Bxy5XOAKUGG0a8YhQ0jXg79UR77rc1kkZl+
X-Gm-Gg: ASbGnctv9uJyVDyqUcRoB1Y0V+8BECBu00BwKfJJRF9hFwsSW79wKYxMoKt49WfRCuh
 oL+vK9CynFOuS6KI4acng0UMzU+6GZKwbtu1wp0W2XWUEGh94Z7g9z9jRB6jxURo7oXsB/2rCL4
 n3nsrAtKycUohQUPqKwZp0EAYdjVVtFezicg8Tj3hr/E9PoZ+E3fqtld3u6rP4FOHGHWFictXld
 5qTzBnDEofREEl38TQsxtBE9Rto72ChxfJxEQx757r8oir1ThGU7w==
X-Google-Smtp-Source: AGHT+IFZ6+YRR3jm0gV75fejVmMXL5MRbl//2N9aoRFrmHGjZdJU9MYPNc36DsVVHcoZY+7LCJrMXw==
X-Received: by 2002:a2e:8e84:0:b0:300:18fc:8e55 with SMTP id
 38308e7fff4ca-30018fc906cmr21853361fa.2.1733389879024; 
 Thu, 05 Dec 2024 01:11:19 -0800 (PST)
Received: from [192.168.0.107] ([91.90.219.38])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30020da1182sm1586511fa.35.2024.12.05.01.11.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Dec 2024 01:11:18 -0800 (PST)
Message-ID: <6c8e60a1-820b-4818-ad68-9b042533f4f9@gmail.com>
Date: Thu, 5 Dec 2024 14:06:27 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Dmitry Yashin <dmt.yashin@gmail.com>
Subject: Re: [PATCH v3 0/3] drm/rockchip: Add driver for the new DSI2
 controller
To: Heiko Stuebner <heiko@sntech.de>
Cc: andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Dmitry Yashin <dmt.yashin@gmail.com>
References: <20241203165450.1501219-1-heiko@sntech.de>
Content-Language: en-US
In-Reply-To: <20241203165450.1501219-1-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 06 Dec 2024 08:12:04 +0000
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

Thanks for the series. I was able to get output on my Radxa's Rock 5B
(dsi1) + Radxa's 10FHD Display setup. Works smoothly with multiple DE's,
rotation and display on/off.

Tested-by: Dmitry Yashin <dmt.yashin@gmail.com>

-- 
Thanks,
Dmitry

