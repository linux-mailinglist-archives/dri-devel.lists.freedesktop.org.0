Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6748A4F67
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:46:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB4411252D;
	Mon, 15 Apr 2024 12:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ky/29aSE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1E211252D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:46:53 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-417f5268b12so27066955e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185212; x=1713790012; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=jbZUbhG0ov/FwjYBTgroRKws49tP3YZqZ1e9nA++yqQ=;
 b=Ky/29aSE2SPnuqQMhada8NVhp7KOqjL3gHhafeQ2zkRue+zuuWWEPGiXHU1PDQIwo5
 j9Ybsv+Z/De7bwMGOwbEmMH5T6FZUgRFdb5Kkp+Q3yXN5EzposhE2t7XxPjA1gumnwQj
 lAo/IQxConD2ErPNdg7Dc4+DFjvtEGMxzpY8NifOTmbwierdAv1Kaw+dlYywrxqbAvl6
 ZpnIPPCoJpz1tLHZWhuaUiKyyA/Ef31OnIDZi6p+9C/s4RHQeVjGzfADp72oeLtfRdS1
 nwEPorNe1xiHAcsJ6sDcrbEVjUzo0HCRcfWaTUIILoC3FV/uyNYoSRl0YtPNDUevGNw1
 cB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185212; x=1713790012;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbZUbhG0ov/FwjYBTgroRKws49tP3YZqZ1e9nA++yqQ=;
 b=A+UG3Qdfr6MfC25GGrotqCPCklNUnVuVFzvQDu7+KZkF0pljW6HWu6zwAtCa7LrHRI
 wzxq94BoTXKgLnfY6MkSL9sNwYCCA7vyH6VJRzaI7lu06FeWhZ23Rh18lsL5V7b1xKob
 abItiXmV9mo2r52WXtwcDMbEXC5hgy5GgmST3+X0dLM/f/Vi1/TnV8UCjwHRzMKcG72B
 qtiVJHFgN0fpMDe1blJ9locgs4GSaHGFaep95ThU+47pfORqKCzT6eRNhr8Ya6Jm5S7K
 T8TlHWIjf0lQzdTvMQCJWSwCzaioZ8EbPyzjqpGkVMw1FZb9hpgN2VDFDX30Drczkyx3
 cOww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXaLuuLyg/wSaG+cViO1U3chAOcwXVKg2xoNwGP3wMtzRQGd1KuzGQu6fK6yLPUkVKjRN0SpkhEWYS4cW4ntyc/k0pT4p6OQA0UzjGTsodH
X-Gm-Message-State: AOJu0YwisXsIdmf3aGll4rFvFCG++kT0CAGg1x/t1pSmA/UrNZUEPVxE
 5XMhIGgXalAPyjrnlF7sQBrjF6VvJf+PolQ2ktfoEoDkPj/SKunkWOJDVQeV/4Y=
X-Google-Smtp-Source: AGHT+IGhmqnCG1TcWkxS+Zn15K31a+Oo01IPIQuW6ofPPWCyjZuMzPolU6GYhaxMv6ytY7keceZXhg==
X-Received: by 2002:a05:600c:1e21:b0:418:6cda:e95e with SMTP id
 ay33-20020a05600c1e2100b004186cdae95emr1418529wmb.8.1713185212321; 
 Mon, 15 Apr 2024 05:46:52 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 w16-20020a05600c475000b00417e36953a0sm14818200wmo.20.2024.04.15.05.46.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:46:51 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:46:49 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>,
 Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>,
 Alexander Shiyan <shc_work@mail.ru>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org
Subject: Re: [PATCH 01/18] backlight: Constify lcd_ops
Message-ID: <20240415124649.GA222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-1-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-1-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:35:59PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' passed in lcd_device_register() is not modified by core
> backlight code, so it can be made const for code safety.  This allows
> drivers to also define the structure as const.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
