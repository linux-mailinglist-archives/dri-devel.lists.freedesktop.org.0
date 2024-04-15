Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD538A4FD1
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E46AA11254A;
	Mon, 15 Apr 2024 12:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ycrst7Xx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E398F112546
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:55:06 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4187d5f08c2so1670735e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 05:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185705; x=1713790505; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+bjzkMqcIFpcw2i9w83bp473RPBZ0vObyEaxzWVYmiQ=;
 b=ycrst7XxeKW00Qzs/Ft0vW+ByT3EzOPwx13opYi9C5aLhdCDOP2u9qGbxlkGyDGyXG
 VoPhbEst9oTnkCw/lrjKageMXb5mcB0GDYOsQytzvaopLvk4kcA2Kmw17+UpL+f0gikF
 kPEvHDDTqXPZ/bcplCjiuNNTPJ/DCcI7V2avH4z+MoTd6qtuX7YexIFfZOkBFcbrPcLN
 u7/s+DTQUB/utqGMu0wBKyKBcGrUWbAelvZJBMo/XwaeiG576TukO1gZFoEh2Tj5ip1O
 gIzXxp0AS+KyrI5GPHvNc0+32IM7VgNOBGuf1Fm4f+9yW8nnoreWmE2LXQeyUI3Q19Mp
 ytTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185705; x=1713790505;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+bjzkMqcIFpcw2i9w83bp473RPBZ0vObyEaxzWVYmiQ=;
 b=W4tMB5fLR/vevjWv8wwjvmx5ApT11Bt2g44ln9Mm1+5cdZoqUkjbDgyrg5njRTN/Yy
 Id5ebBVcsOo5RPYJp4QUtS3UlnFOXQPGnNENt7G6iOBXaAb7gHzghGe442xmBXDSWwCI
 kVKyG+GaUy7ebCSeGBqoHxI6yI6jjyhcFgj6nMEw5kURrD6DgSEV19/DAwX1Rj/31Vwm
 UelG+cO/G3DTy98RJReuXGm0xjrbXfjZCs/y8f3vbaXw/iVlAGf+1gP9fYE5JZKxfb39
 YExgleZ81q6cz0Wtq6vF4D3WTKd67H9KZGeTjdd8C0edkx8zRr2moPAf6KfaRx3rwdGJ
 KSwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV157BEVI9dC4EzU6BbK25FflLgRctjaJEDVe8VCMKGXvKLUdeUSewG/2ez2BV7VhGYkDN/ggpVx0rZIqYi/IHH4LRmT9FLaUO1xhwOx8dv
X-Gm-Message-State: AOJu0YxvbhIKsD+YP4YpFHSWoi5iglIuAUMMZr9HM53TR9dIhE6OPnlE
 s0joUdmUzxCN4iNWwMAlrhH28Tje7sG+ULxIW1B5AII4ZKxzM8YBWwRfQdrWdEc=
X-Google-Smtp-Source: AGHT+IGHxu6Q4avREKIopyDMuH0F/FlZ8s8HVBOhkgD8sUoGIYcp5Z+UXW61HEvkoXH2alvv3fo09w==
X-Received: by 2002:a05:600c:19c8:b0:414:d95:cc47 with SMTP id
 u8-20020a05600c19c800b004140d95cc47mr9336810wmq.30.1713185705260; 
 Mon, 15 Apr 2024 05:55:05 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c1d1700b004163ee3922csm19404762wms.38.2024.04.15.05.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 05:55:04 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:55:03 +0100
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
Subject: Re: [PATCH 13/18] backlight: platform_lcd: Constify lcd_ops
Message-ID: <20240415125503.GM222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-13-9b37fcbf546a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-13-9b37fcbf546a@kernel.org>
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

On Sun, Apr 14, 2024 at 06:36:11PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
