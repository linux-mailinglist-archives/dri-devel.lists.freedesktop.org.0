Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD69A23AC7
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 09:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C300E10E1BB;
	Fri, 31 Jan 2025 08:40:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kTsxTtZw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C0B310E1BB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 08:40:49 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3862ca8e0bbso1425944f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 00:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738312847; x=1738917647; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TW/Jk6AHRJuQHT82twXaYQqc4zjBEepsqdONtoOlsw4=;
 b=kTsxTtZwq7o3Baie6YoAi9NdlyCYjcRiUeITkc/s2BA3EiwHU6o7HU/6FBjbHCoihE
 m47hL6zooFwdO6fsFOiZgWBd45k1Rtc6jII5CYBpY8DgkUeJBv6WdiShNWB8+l9KmEML
 ijTFCtpvEI5FgzjWQw0LV1gzAd3xzELlSMOABmxOVL92tljmPWVoZGR0dWy4JL1D3a8K
 m1+r1m73y9DRoBmKO13SGvWUXzZLBcPV7cphBmeFp1Lx2q3qzPGEG1QU3NsNMAg/cuE7
 tgMvyUYWDhZrHj8HafiXseRr/PVZSDG0XkWiVTw3nc4ZxdCity3lAQfdguU/Z1pAMBBV
 M6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738312847; x=1738917647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TW/Jk6AHRJuQHT82twXaYQqc4zjBEepsqdONtoOlsw4=;
 b=pAogYxAGFWvQaBCZq9ZQZwhUKX1aWVJwsvd2nhCwm+0PUtdQWuDxnsc5tjOyyrUjpe
 E5PrygBODGQ4ScaxqFEjCyclVlRGZzuDy2C6tmaOB4io8V5q+6qxoQJnsA1tBkc2unGw
 GfnuKdohogesMXJtm1h9CZeEUbHsR6s20uX/PRCPmlDXW9237GDnl/KQvgzmYvv2WGTQ
 ZH/N73iWd7GcUF9tQw53qmUzkLLCJUgwq9+DzWrHtq66yrP6anSvvEoTzLiq7MHZg1JX
 zxOOIlQ/G9/hC4oaIoQ3bE+mXAFlFoj+BBssBU0y+Gzxzcykc8ddzntGtaeS/XgdGrav
 /CTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWf1v6JzVp7pzBFXBdYZ5dXOUj/6IEsu7KEekcK/dfTbARjNHD0p3lHtBZnC1cEON8E0H5hfReqtSg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX8ThXssrX7xePu7JTSmL3W2NI9vKThewFclMDAAsmiVvX2wks
 M4N2LMLpuKE4smGoGZHXOKyRohHMQ7xTiiFzhkwUMqYUayb0uaMb
X-Gm-Gg: ASbGnctQt9UEUBkz6eCs1whp1rJ+KHUMA1+Yh7wrevPcqVOBzbJgfMYtTwQrcgqvqP2
 YPflG9CY7rdgwDRx5eTW/O1eWzdfU3GeQXz3u9UD88sooyziTrxQ/wibwPp8Bxb18YI5NSHgUAV
 DQ6g4GkdTcXcQHy+LE+yiPbzwJiuqIGspsWHingu+L4SYtKoP5T2Fyot/w31a245pHi3oc3Ob7l
 sv/sZCoeZE/+15RPFZqLL5fRbQvRSuYGb6bEWYS9xYgdeK8nZ33NBVx8BxKhBrkN8bKIOklLHrM
 oEThhPx1WS4FnFGf
X-Google-Smtp-Source: AGHT+IGLZ7dclEPxy7l0oMnBB+13a8iscVbSdcuAWf67ZXDM9KAY5KRxxtRghjO34bfzpqVLfXp54A==
X-Received: by 2002:a5d:6d88:0:b0:38a:418e:1179 with SMTP id
 ffacd0b85a97d-38c519380afmr10198224f8f.2.1738312847155; 
 Fri, 31 Jan 2025 00:40:47 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c102ac9sm3990757f8f.29.2025.01.31.00.40.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 00:40:46 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org, nicolejadeyee@google.com,
 pekka.paalanen@haloniitty.fi, rdunlap@infradead.org,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com, simona.vetter@ffwll.ch,
 simona@ffwll.ch, thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: [PATCH v16 3/7] drm/vkms: Drop YUV formats TODO
Date: Fri, 31 Jan 2025 09:40:45 +0100
Message-ID: <20250131084045.2874-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121-yuv-v16-3-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-3-a61f95a99432@bootlin.com>
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

Hi Louis,

Thanks a lot for the patches.

I'm not well versed in YUV color formats, so I did my best reading the kernel
documentation before reviewing this series... But I'll most likely ask some
basic/dump questions.

> From: Arthur Grillo <arthurgrillo@riseup.net>
> 
> VKMS has support for YUV formats now. Remove the task from the TODO
> list.
> 
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/gpu/vkms.rst | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index ba04ac7c2167a9d484c54c69a09a2fb8f2d9c0aa..13b866c3617cd44043406252d3caa912c931772f 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -122,8 +122,7 @@ There's lots of plane features we could add support for:
>  
>  - Scaling.
>  
> -- Additional buffer formats, especially YUV formats for video like NV12.
> -  Low/high bpp RGB formats would also be interesting.
> +- Additional buffer formats. Low/high bpp RGB formats would be interesting.

I see that you implemented support for 6 DRM_FORMAT_NV* formats, but
DRM_FORMAT_NV15, DRM_FORMAT_NV20 and DRM_FORMAT_NV30 are not implemented.

The same applies to DRM_FORMAT_Y210 or DRM_FORMAT_YUV410 among others.

Could it be useful to implement all of them in the future? If so, should we add
it to the ToDo list?
It might be a great task to get started in kernel development, as there are
already similar examples and tests.

>  
>  - Async updates (currently only possible on cursor plane using the legacy
>    cursor api).
> 
