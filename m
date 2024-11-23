Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D02D9D6A9F
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 18:44:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6491110E138;
	Sat, 23 Nov 2024 17:44:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ntuZyoeT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A17B510E138
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 17:44:27 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-724f41d550cso326419b3a.2
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Nov 2024 09:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732383867; x=1732988667; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Taj+3YSfAKDsLQncrgYkDoFlJMoLmNKBtRtkmtpeCa8=;
 b=ntuZyoeTVmXdpReFMzktO1R53o8cOllBsDFPxGuK7RzSJJxlT3dTYRGxNwy4SBwSg8
 dvDDxApJsBu0qx2kUmdTTaMfShPs0AOsg9JOHOFmcBOnVKbWKOSdywp+ukJBEObyaJYy
 4/Vwb55u+Qa1EqFiBe0/dtJfDGZiiuqhw0p2iJUqT0Yuv6w68eQ98Tlrr4OhIT+AsdSm
 C49KiJ+252OKlISg/MffEysqBzKa5FmpMCPr/6kkil6WxueU3tSxxAmqP0bkO4STNEQO
 bAbPLxiQv4rqpWIMEc1NX8wVRVNwge96D3vgXtKzAvXy7sI7QyoEEcEy9g8KfKZ7YkCz
 n7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732383867; x=1732988667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Taj+3YSfAKDsLQncrgYkDoFlJMoLmNKBtRtkmtpeCa8=;
 b=Ax2zOwJhWU2BCsNPfTvUZgRncCD3Gho1BpFnzoh8aY+zQfxSZCTffHXhcqlpuuVFLw
 0MJUGDVI4Yf0ZMPrNmXgaNAXTHD+2m8ZhLa2a8OfoVqFFVQAcL8LHyOTEziG3wFbrT88
 8D6wnVN+ry3PkD/Okq/Vtl5Ao4jlp6PF3iaoh3LANIF6EQZIMGUtPgUD6+Q/zPI9iJsO
 rC4FO7D60FJpz0xjGyyxi8Z5L5NbZWtey9F6zmvCHs/T1Pdveel6rN6Rpd0rGCH5CmMm
 TnuEyJazDAjXpNIoxlbkqFpHAdrde9bKo5yJO2UifvLisU7AgQj3q0GPSmdycsJtcwai
 dVlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBjD3CcqsFwvFNYiJZrHw/HIZIQWlD+jgew1BVt/PkF6JcOjfeOwhApyF1cKAQEGrl0ITFTKJUk9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6EdJNi8tIx7OwG/EaMVjt8VytkidRPu5txWuvUM+j3Ru3zW46
 eltWaiQ+y2wFh0rEqeaOxpdzNp7a9qHwZKY6nQInVteC4jd54uUf
X-Gm-Gg: ASbGnctiPmW7yys7WMuho+NDM8en4KIJveiHnl7eYf3YoSfO5+8X8jW/zt0X8f/DghQ
 ty4uCH1CSrhvZK+jJRbJfh6zO4cEMsLikyRuXhT3pOlOeLAjQnbJpZ8iA1Fn7lZ+FUlabK5kuQa
 nMIcKfHdVHmBhxgDdFqdev9cIKQtoiywPKBVGWETUI+9+8AgJH0tJy4a4JEuwEqxCA3aZuR9qOe
 ZudI2DkIOmAqjc3K5DxiYv17FAfIJbmrj6zS+wPdqe7L+ZmQfJ29nMCw7bNrgdh+FPzEWZPOEQ=
X-Google-Smtp-Source: AGHT+IFEV5sx5M3llOMv5oeDGg6jrj5DSo4Cp/i06uwAuBbD/AfbChJ11DKh4isN2KMwLs0D/5WqjA==
X-Received: by 2002:a17:902:f54a:b0:20b:951f:6dff with SMTP id
 d9443c01a7336-2129f1aa923mr117259275ad.0.1732383866948; 
 Sat, 23 Nov 2024 09:44:26 -0800 (PST)
Received: from mighty.kangaroo-insen.ts.net ([45.64.12.174])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dba6aa3sm35213735ad.101.2024.11.23.09.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Nov 2024 09:44:24 -0800 (PST)
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
Subject: Re: Re: [PATCH v3 08/10] ARM: dts: ti: omap: samsung-espresso7: Add
 initial support for Galaxy Tab 2 7.0
Date: Sat, 23 Nov 2024 17:44:14 +0000
Message-ID: <20241123174414.721-1-bavishimithil@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241112120020.7f9e0680@akair>
References: <20241112120020.7f9e0680@akair>
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
> > +	touchscreen@48 {
> > +		compatible = "melfas,mms136";
> > +		reg = <0x48>;
> > +		interrupt-parent = <&gpio2>;
> > +		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
> > +		touchscreen-size-x = <1023>;
>
> Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml:
> horizontal resolution of touchscreen (maximum x coordinate reported + 1)
>
> So this touchscreen reports max 1022?
>
> > +		touchscreen-size-y = <599>;
>
> same question.

My apologies, it should be 1023+1 (1024) and 599+1(600) respectively.
Will fix it in the next revision.

https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-input.c#L145

Best Regards,
Mithil
