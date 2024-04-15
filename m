Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 563AC8A4F6F
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4266A11252E;
	Mon, 15 Apr 2024 12:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FAR6m4RF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F820112532
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:47:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4155819f710so21238935e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185255; x=1713790055; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3t4xYvc7hHt8pbqXgosG7LpZfvaanvwAGHZrjcMgUgM=;
 b=FAR6m4RFMPvPWzQBjQdIYuYRJqM3aiKDSZhMwx3Xw2bh+/Ycf6/l3GbC9Uxt9kDEEQ
 WU+RQgBJxae+wasgJDxe2h+/usbQzeKgbtTpjL12VT5RwoBO/ebwAfWmMmrjxZtcFc7F
 ELLNuq7phv/57MbZhZCCjAdLxrxprL/5Tn6FaDogDIQz4Lpbon6Hf/9rfp4p6/CDv56V
 pFQLJpvBbh9fKfE9shpH74/mxWpRiPHb0+gBmtlPaxI6ymifmXRxoOH2rlJo02keq8BT
 sP5b4jZQBQ10n+y9CDB7ptmql4/GmP3GycslelgC/Rd00pfJecqqqK4N1mS2z0WBQqDZ
 u/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185255; x=1713790055;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3t4xYvc7hHt8pbqXgosG7LpZfvaanvwAGHZrjcMgUgM=;
 b=U/RyEYXOBJeKZCNjHpMhN8ir0xV/niyt2SYlihyZv4nE0wRE2WnHkBxkRZ9cCXrj9g
 hz2TL1sB6S8sdSpAiCyGeshNAJza64yzySk55G9DcpppP0q4B6YvZZkPlmBV6udsJLXQ
 ShtDCoh1TIHsAIx5Pn5F438YcnHTIXy3CgsFr+7oCZEtoV9EF9kiffHYquDNoh7fTCxg
 DHnzVP9nWCJ1KrypIzCw8DOg6hVrfoQdyicuKVdPgs1ZE+Tbbu1zurd0DcO8mLwz1LQc
 wIDMFNy/pDKC6zEeLMrv2nmazfblEw7apZFEl2bbV1jRxdMM1jb8dxAB7o2PHA8yfpm7
 NXDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnLsqBU1ZrQZXHEvlHovwS6NAEAD0JcUM2x1UAhi0HZeBvx+jXYBuarz1fRMMIVZv6U3wFS958RWGos7KFHfcpkLgPxKfeE00h6dyaYHHb
X-Gm-Message-State: AOJu0Yxu2r09WnL8shf6M/l0jBk3HM+v6kXxSK55Asc3VNDv9UVp0Mn5
 6Z6wUkMSIwQjee/TovJ39sE0OpU7ezADN+l8QnBzjqqL+DTFolWCzCFNjy1dmx8=
X-Google-Smtp-Source: AGHT+IFkh12z6YoZcRxE26DaCtpPtJRpH8bNSc6xGkmU2C8eUzmYQG+zsWzJQF76MdI0E3ybiY+H/A==
X-Received: by 2002:a05:600c:4e8b:b0:416:3f85:d49 with SMTP id
 f11-20020a05600c4e8b00b004163f850d49mr7937971wmq.18.1713185255476; 
 Mon, 15 Apr 2024 05:47:35 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c3b8c00b004165315d885sm19315874wms.11.2024.04.15.05.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:47:35 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:47:33 +0100
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
Subject: Re: [PATCH 02/18] backlight: ams369fg06: Constify lcd_ops
Message-ID: <20240415124733.GB222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-2-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-2-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:00PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
