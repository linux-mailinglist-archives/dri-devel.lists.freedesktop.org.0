Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0F887E7CE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Mar 2024 11:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 986CF88C3D;
	Mon, 18 Mar 2024 10:57:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q1wjndMA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DBF10F136
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 10:57:16 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-41411421113so4701515e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Mar 2024 03:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710759435; x=1711364235; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DMEQFRnKe/GtgVhTR33NYEWIYjxVZMpk768Ijuz317k=;
 b=q1wjndMARxvPzkLsKpK/0OTLOv2tLzqZm3Ua7FJQdDyyXCYG6AFu2rB5UZOkHXWys8
 4h/tR5FK3FlwbhOnQThiuMDyIVL8cWHpGvNye6Do7mvYhF0ymyqYa/HXxEmBVTTdMhdZ
 nQs+lUQAIeWnVjExwLP0ZOljeacer4cF6ZThkpFZho8kxTgfeszQD4mba+e9XPsHEi6W
 XqwSjAznvfP347119NlqQx8FAbjNfov0FkNpEfy4D0nIQBF2y8kPT5UTuAUSzkRSaVPf
 kSV2wdMv+MAWRXTG21ScPI1+08vbShHkBLQ0vKaT5F5M+qAIGcw88HL92ztOSxb0eaA3
 tt8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710759435; x=1711364235;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DMEQFRnKe/GtgVhTR33NYEWIYjxVZMpk768Ijuz317k=;
 b=UxFJB0D+yrCIrlRpiKmGo6jdoq57hplN5PdeX1W9RdOFth1DvgYDylftY7udboqilt
 lUtPDnjWqORzBeuL5DOIjZz2yI82jATjouG1mQlx8pSKLNMoDE+c7eA4fAQcJoG8Gni2
 RFyYAGN25HpVmVcm42XMrrlwqRsPSX0uLyYAHQd6eKA/qTJrEZyUs3EsfK6975xbChuR
 Z2X1mDo3qcPHmw8+2hBxMDpur/F8zlCDhDkXS5uohZ4N+Vws5r9w6BGFHqnWI9JZnhD5
 jKXHDmaKoAR89p5N1jlh1/QZBx0YzvPHjzFXf/ZpI3aE0pQlflwGrd+SYVH5yxfrS5O5
 HALw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXxuLqGd6oQTQ0yvItIe6MOqPT+XPJkFMbSUF99u84IvRLImDc+rqqeONlktcOVIc8dDS6tHgKUIJFj1KL0M3zMYPL0tVOFl9KIN9rShvV
X-Gm-Message-State: AOJu0Yxsy1uXn9eqn9Phnohsfk87GwfjrJd5+d258MuP3VNzsWjYFnrK
 0BGc6IRN7haQL2ipgs54mC0RYQL4hjwrra26F4RjUzdzF9lFQgcTP0XSx/ME41s=
X-Google-Smtp-Source: AGHT+IE29K2FxY2E1zd26b5u2He0AYwIVzgw2XE3wy4Qxd0kaljZ223UA0Jwz59ql9qOjp9el6rE8Q==
X-Received: by 2002:a5d:4e11:0:b0:33e:7404:be91 with SMTP id
 p17-20020a5d4e11000000b0033e7404be91mr7884838wrt.43.1710759434720; 
 Mon, 18 Mar 2024 03:57:14 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 bn23-20020a056000061700b0033ec812ee0esm6824449wrb.71.2024.03.18.03.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 03:57:13 -0700 (PDT)
Date: Mon, 18 Mar 2024 10:57:11 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Flavio Suligoi <f.suligoi@asem.it>, Lee Jones <lee@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] backlight: mp3309c: fix signedness bug in
 mp3309c_parse_fwnode()
Message-ID: <20240318105711.GA16260@aspen.lan>
References: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <74347f67-360d-4513-8939-595e3c4764fa@moroto.mountain>
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

On Sat, Mar 16, 2024 at 12:45:27PM +0300, Dan Carpenter wrote:
> The "num_levels" variable is used to store error codes from
> device_property_count_u32() so it needs to be signed.  This doesn't
> cause an issue at runtime because devm_kcalloc() won't allocate negative
> sizes.  However, it's still worth fixing.
>
> Fixes: b54c828bdba9 ("backlight: mp3309c: Make use of device properties")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
