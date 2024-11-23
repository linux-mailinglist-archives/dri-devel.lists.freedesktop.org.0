Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2198C9D6AA6
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 18:53:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C70C910E1BE;
	Sat, 23 Nov 2024 17:53:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UslhQb+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2725710E1BE
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 17:53:11 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-724f74d6457so431049b3a.0
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 09:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732384390; x=1732989190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MChWc41P4OMqWVju6vAFErZ1LM1yUreLUBjhHItchBk=;
 b=UslhQb+QRSm6+Y8tGI1fToTdLfWgFHmAxiKkK+m4CPJQHdLIazBtIVEuNSXRvmy31O
 kURD22yELjDpCbpl4UJoOKmw7tsEullBhhBpg383GOUboxG+XOZwl0FCZ7yO2HA3c/+T
 wtk8iGYE26OYh4KJByE/Vz/5LKKt56hCi5w2GX50VWZaiWvUhMMhM5GOXhfyRYyflDVU
 UuCrh84dIvuvLP1yuTCAKo04rcwP3n9FsHQN/sSc3ygSQdyDilw6QPV6T9Iwu3jw77tt
 ZSSs2vX4+olj8QofhBNHc/FF0AnN+JzjfGhehuyix9NpuDOLzgE5r7FQ0u/Jip8fzplH
 kfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732384390; x=1732989190;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MChWc41P4OMqWVju6vAFErZ1LM1yUreLUBjhHItchBk=;
 b=Z0SauPoqTwjXOhu4GeelIKwRJ1qTBnTjANWOZucngelu/CistNDfx77ISGMevTEDX1
 5l9S+cg15NN0tlFZHCtGP25Mc8LhrQSeinBtYxrKDgUwOjjTtrI5mvvuaxlCKhPo3bqr
 +iIrMohdQ/c/pEJEDyFNwaTDg6Te8m8Hj5I3qkffwCGEIlVeoq0HfiitWTYS/yYj0t19
 iUYRDiNMyvHJkxdOxUUuWkqo0j7BmjNs6CN6CM1TmFq456Zgr17RTJpawkiPsyX07zPi
 yvQcgXvWIzNAzVxlklAf231VM4dtSficpCV3F5DbD2a1tD+iHDfUwUevXY8kMDjqHoOH
 SiCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5EWrjHWJ4HxWNR6NLqBwMZ12d5TZz6F7TvVER6a3mkurUhZ+XCGnFMZG4xWBX/wXdkZxqBkyFJB0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyS4o7/ZfdmPnzYsHWHfeVsuxwItnQ9rgK9rohdP3AKkGO53SxI
 YnmzXgBpzNJOCk8BlxhVxoUpbklr2H0W+elfkl2dwmm9oRYJofq0mguiJvjar6g=
X-Gm-Gg: ASbGncvZVVHZm5qAG6OnfU3Ezw4KmQjXdVmnibkw/B5U+38HAwOC5IW8qgR+e81VCqd
 PTaKv9/y1+OeBfvy4meqSnD+cKV98ujeYFv5M/YFhHtJrqeKqT+BxUIV4+EFk3Oitls2BxjHn8u
 ssjn9PjyCyzgNbWLDo+MeQE+F67sT5j9KgBVKF8SzglhypZABl3S1+JlPCJTovqrDlUhauotdos
 QRPxUVbUssF3P9UbPPuPxLdwa45QVlHW+IwUxd4jiAaq6uXkKHxqYmbw0CpTWvbC4WQ+oOHKBU=
X-Google-Smtp-Source: AGHT+IGDVRgdju70YKS9dKHuXvmqMGTwpB+LfLzrIv8QlUq+0rniiuKlMntRfxmT7VPHsEtMjf7NKw==
X-Received: by 2002:a17:902:f68d:b0:20c:ce9c:bbd8 with SMTP id
 d9443c01a7336-2129f55d212mr79559515ad.25.1732384390542; 
 Sat, 23 Nov 2024 09:53:10 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.174])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dba5920sm35420045ad.107.2024.11.23.09.53.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 09:53:09 -0800 (PST)
From: Mithil Bavishi <bavishimithil@gmail.com>
To: andreas@kemnade.info
Cc: Laurent.pinchart@ideasonboard.com, aaro.koskinen@iki.fi, airlied@gmail.com,
 bavishimithil@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 quic_jesszhan@quicinc.com, rfoss@kernel.org, robh@kernel.org,
 rogerq@kernel.org, simona@ffwll.ch, thierry.reding@gmail.com,
 tony@atomide.com, tzimmermann@suse.de
Subject: Re: [PATCH v3 10/10] ARM: dts: ti: omap: samsung-espresso10: Add
 initial support for Galaxy Tab 2 10.1
Date: Sat, 23 Nov 2024 17:52:58 +0000
Message-ID: <20241123175259.775-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112114818.1eb238e9@akair>
References: <20241112114818.1eb238e9@akair>
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

> > +&i2c3 {
> > +	touchscreen: synaptics-rmi4-i2c@20 {
>
> touchscreen@20
Fixed, generic node names right!

> > +		avdd-supply = <&reg_touch_ldo_en>;
> not known in schema
I cannot seem to find the "vio-supply" shown in the bindings. There is
only mention of avdd-supply and vdd-supply. I am not sure if avdd and
vio are equivalent, hence the confusion.
What should be the solution here?

> Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml:
> horizontal resolution of touchscreen (maximum x coordinate reported + 1)

> So this touchscreen reports max 1278?

Fixed it as well, 1280 and 800 respectively.
https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-input.c#L264

> And these things belong below rm4-f11 according to
> Documentation/devicetree/bindings/input/syna,rmi4.yaml

I did not quite understand what you mean by this. I checked the bindings 
and a few examples, there is nothing "below" rmi4-f11.

Best Regards,
Mithil
