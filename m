Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1D9846DE0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 11:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1067710E162;
	Fri,  2 Feb 2024 10:29:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ntlRpGkW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA8210E162
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Feb 2024 10:29:01 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-5113ab4ef05so52300e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Feb 2024 02:29:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706869739; x=1707474539; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hfTBL9aDECTY+ZjU8pGAAtn2SIcowOf+C1vhc3Y984M=;
 b=ntlRpGkW3r2EFmubVR/U4xRTuLAt8HTqHmtYA0PCHgrbiK/e/sBD2eaNl+XZiG02ai
 hO3sN+iNFZUM7LPmMLncY9EyVHQVY58WvirNEXVBXbWgZUw3jWniTwwX7n0oJWhF7lOk
 /OnhhhzCSIlDMjR/ftcQqdMFUa8tiH4ZNOsIlV7SUe38Ry1pvO9ANi1AS8lJoJqGEXI4
 zk+ataD3pQ3sttd52EPOIlnNeXBPD34qQpqlFRonB5cNZ9DqUzIYxev/2MumXgPqWaRS
 oRxznItoqQHDM7socJJOUUsTnmJ3J3H5T6UpUQ+8VFiXD0/ZEKUR8CE4mqw6S5fKLpB+
 8rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706869739; x=1707474539;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hfTBL9aDECTY+ZjU8pGAAtn2SIcowOf+C1vhc3Y984M=;
 b=YJaVSVa2tPo1ox6YRG+F8+25MBjzAZHo1NgePHkq/XfDlI64Nfby14Z88OeGn3R/Qy
 7h73GESHQX+I2vHgRbvwCfW77ZYwme+BktyHIQiOgQazVWKrhEkToM9SJy8hSwEDpAoT
 YUafmUXgUNhZSlFd537Z1hRsdaW84OoN8+crUkI04rwdavUuvCvMPlev4DHCM003hwfS
 P1ukz84JKh57S3DdLqZRHBKC2htqFQXibti7O5vdwFYlOHFNTdIPgaE+xKbLQD2PYIok
 YjDc0yfjJdzBbjXykN3ewzt8MjgL3YHeuYbkAwpfoGZvGkAiqc8KaHmuHEhr9+UiD2O9
 ZunQ==
X-Gm-Message-State: AOJu0YwyJlVQOOId6In1b0unTL+cu3Qd7Gprhwsr4ufPuD3HEcxLMiuY
 EnnsP/LjeoyttbDLLkJwGBzIlv378Wl7HWdxKlBgQcPGqXZ1piTHKaGWKFwhFwE=
X-Google-Smtp-Source: AGHT+IEBsmADrZtTDuAXy91jZj5Ipy9Q00moOwM0OK42zDksQ9zXaQvSN6W2TFULGA37a76clD5gEA==
X-Received: by 2002:a19:f702:0:b0:511:19b1:95b6 with SMTP id
 z2-20020a19f702000000b0051119b195b6mr3184454lfe.63.1706869739372; 
 Fri, 02 Feb 2024 02:28:59 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCWL2xY+EdYZof303ODkqaHz/8jXKXGb/Tt/J3CM9reDHXICB6snDxVlDDNw8QXdd0Vceq/cgmSOIYqOwyhKO60vFa6h+WZVWzEFiNQDAgbRwFkxasbdAcWkEVYkrM2Vb/GBCHXvVfjiRUb9O19ROcxGbQbXe5ijmbUBQE73b8Hd5puAX8UL+6X/M8n2JnVHgu9FmMZzF2g/ihXzmEnBZDVpNyj1p7HHrzkhtNg/QAJS342/7lPVUV2nfEQQLuub7Q==
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c4f5500b0040ebf340759sm2202718wmq.21.2024.02.02.02.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Feb 2024 02:28:58 -0800 (PST)
Date: Fri, 2 Feb 2024 10:28:57 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Flavio Suligoi <f.suligoi@asem.it>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v2 2/3] backlight: mp3309c: use dev_err_probe() instead
 of dev_err()
Message-ID: <20240202102857.GC373571@aspen.lan>
References: <20240201151537.367218-1-andriy.shevchenko@linux.intel.com>
 <20240201151537.367218-3-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240201151537.367218-3-andriy.shevchenko@linux.intel.com>
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

On Thu, Feb 01, 2024 at 05:14:14PM +0200, Andy Shevchenko wrote:
> Replace dev_err() with dev_err_probe().
>
> This helps in simplifing code and standardizing the error output.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
