Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B19B38A4F83
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:49:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C045A112531;
	Mon, 15 Apr 2024 12:49:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ig2T5AJJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B65C112531
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:49:15 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-41879819915so2703335e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185353; x=1713790153; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UimYHbIWNJzstbVfXQ3wDGyO5qJZelnD1Pr7R7RINlo=;
 b=Ig2T5AJJ2MClyl3/WnRJTBLHHHBf4zMcW9Dbi4RiazmHKbUOoL0E1eB1qrEZ51n6MR
 5AixEfxKoopP48gDsF+miPGy3GOlUggjuKlngXae3LnpJ9zAOr18JnuRvSfuk1AtZrHw
 Ee+D/0nJAQ1B/9vrIwQeMwmMN/fM5XrxxKtdnsovrw+hNiNY+58wQ7QJlndJfHlfyUA0
 P+hSuLQlB6xM3p2zhZCWW+49sFccK/z9i442xB5yWapkiO5Gti9UQDr3xH10d+0f/7lD
 T2YjVHqgPu8PnYWcFWR0K62fXSkIUXq6yvXflcwsXY6Cr0SdhKVd3QZggVWeaJM9UXEK
 1kUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185353; x=1713790153;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UimYHbIWNJzstbVfXQ3wDGyO5qJZelnD1Pr7R7RINlo=;
 b=X5GCjv2Qjq8fK07rpyGZyCyB2Odx4x51dpYuWoz6AZ7DxhEkHWWaismZGWmiaUaB69
 VqjYp8dIrvh2jFX0gp1kNrRaYW8At5pgyv8hNsm/smEHDgmbAaULaKZrx0OQFEMdD5tu
 WHe1e2i/KqT3iNwIwtDngp1BLhCqTZnRCnyOE8h/Caqlwce6b676J6CQH6n99niKoUEP
 HoPmdwyAuXMldt7/gIw/PBbAtkxjG+YSGFhxYSDim9jhBCX902tHhEdCEx+EEd1Ag5by
 a7VxleWkb2mJ7Vm+1iWW7JEHt26lZTdKtZ3PaBcWXw9+U8xITAI0wp7CjAUDAw5ybrfz
 cm5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL3qDtX7gdNZSoOvcuac7/cpYAiD/PPdcGvhuP8sKVZLjjDYJrnTrMFIaMLWtCD+Ov/A1G/rR4jA3Whas0NqQ9Ctg+U2UhbrvEvuNrEkQw
X-Gm-Message-State: AOJu0YyB3LOYi63kFyEqoFXxXQJK8cbc4GmGkx9IAYDCs7c8OE2dfO5N
 R0SlfWNWx2DixGG0PIph4aCWWH6VQ20DgQqPFlfOQNtEfxLmdIQfHZNoeu03UIw=
X-Google-Smtp-Source: AGHT+IGio3O7mWx35mEvR609b07A+RZnNzN0tC57IoZigX+R2Bsw1mIXox4a962UuZkyigWVe02A1Q==
X-Received: by 2002:a05:600c:358d:b0:417:4ff3:391a with SMTP id
 p13-20020a05600c358d00b004174ff3391amr7933682wmq.31.1713185353445; 
 Mon, 15 Apr 2024 05:49:13 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 d4-20020adfc084000000b00343c1cd5aedsm12044366wrf.52.2024.04.15.05.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:49:13 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:49:11 +0100
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
Subject: Re: [PATCH 04/18] backlight: hx8357: Constify lcd_ops
Message-ID: <20240415124911.GD222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-4-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-4-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:02PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
