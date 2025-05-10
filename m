Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD972AB23DD
	for <lists+dri-devel@lfdr.de>; Sat, 10 May 2025 14:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E91C210E010;
	Sat, 10 May 2025 12:46:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nWzDKLdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777DB10E010
 for <dri-devel@lists.freedesktop.org>; Sat, 10 May 2025 12:46:14 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-7423fadbe77so1493596b3a.3
 for <dri-devel@lists.freedesktop.org>; Sat, 10 May 2025 05:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746881174; x=1747485974; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kJptZbL6QovkSOzJ8PBjROmwqQurdv9mRyfz6ZZ9R8w=;
 b=nWzDKLdE4x2GJBWAvYaLbatZXYnnp6r1RQ9/sbiSC12kM5rAGlKoj3Jd8RITzVUTeh
 ZW6PqzdgCyV/QIzKxXCRnbLSYMwjuUFfwf4pAwgiN3Sg6Ybrp7MzUgX76rsCQFXaD8oT
 Vy2cfSxxRNsaVtKLh6Qxv9sLp0OHLVLZGBzIadM4UCsUAlyWlp3ogZKk1ocLTpcLFDx3
 eBOZUzePn1t4ZdnDPNC9DvhPg9nBkOd00e9vjon4l8VIE8giETBt+/jMsvEU1z3IsJYQ
 9tYkf690cHgNtS06VPTSay59HYb3W9O9TCbDG+exkJaMaAYEkZ/FcyN/U6Yj3qhlYGYY
 m+ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746881174; x=1747485974;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kJptZbL6QovkSOzJ8PBjROmwqQurdv9mRyfz6ZZ9R8w=;
 b=WmSZXU6lc0Rh0NoSPQFL6AgYxFh8CLkt7ecM9nznclih2I5ovoySgE1z27Ux4JUNYd
 GKGf8W3dQAGlVZmv+Rbl4nLX2U5GJBpn71mnXdikLoJOgawOVaVp+D6iECu4Hc0FLU6/
 Y+Ij/yAZOvwyAkOTIwtF+V2tKBoOc10p5mqcaKL8H+MFgQcvuQe5seCmZMvprGBiyVYJ
 EP+SLFntgX3lSZzhs4cpk6GvztPbe+QSVxIMbvNg5seY4x1p8eq1M3DpYyaiVmd7vT7G
 KwHkOhqRHVoukPibGxPosjlUCZi9ZpVYBd4C7ipxo3ARZLvOvN/NTp2bJLjmSmEosnuc
 Q4Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvFkj0rx91R5eJWCcWyRyA8EiDNB1rntDC8s3A279qaxDHZ2GB1GKFx4idRTvQ/6BObkbdrlYNIMg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzOpHw9Q/E4ivCB5seS34HHjz16LPNlJ9Z//NDrooEveT/hhyK5
 I5g/+wJ5LZOztMNlcZCVkMIOPz3A47VALCkyAUCssrUxVEZua4Si
X-Gm-Gg: ASbGnctvQCqLzBBZxm0hMgAOyMSQvN3KHXIi9Xpi7Yci1z7Hg40QHsCWPIqFEhPk5z1
 D7roJcO/Uxm+E95hYqG0UzaETRatoll0yx3U+jkl//nT3Sw8MzXFKzs/f9wDLroBtEvFC9PoXoC
 b5ePix0ZPi1JdkBSIFgsQPTy7RBG//gyP555a+/vMaM3hhxrqutCDWBCIXXh+HAGD//iTXlHA4I
 27ibHW6Nca5IRBEfYIIX+rCLH3Gnj27UabIB9VMlb7anllz2yZ+WxdILeaMcLT3Ce+gfdTOIg2g
 QeHL3jaI3CiPWcAEZ84VaUc8QrCEOMPw4ic1UU5YZn2Wh9Yi1gcvDDKnpvTfAIX5M4ek
X-Google-Smtp-Source: AGHT+IFm4BPC2O9iYWCdhvY6ixnruWUPssuzfVNGiLcK0VFlExUGd4bt5+WKSNxgP/7DNAkHJktdBA==
X-Received: by 2002:a05:6a00:139d:b0:740:9d6f:a73b with SMTP id
 d2e1a72fcca58-7423c04220fmr9215898b3a.17.1746881173804; 
 Sat, 10 May 2025 05:46:13 -0700 (PDT)
Received: from vaxr-BM6660-BM6360 ([2001:288:7001:2703:bea7:51b5:8c2a:f16a])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74237a1088csm3130373b3a.113.2025.05.10.05.46.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 May 2025 05:46:13 -0700 (PDT)
Date: Sat, 10 May 2025 20:46:08 +0800
From: I Hsin Cheng <richard120310@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, christophe.jaillet@wanadoo.fr,
 skhan@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/meson: Use 1000ULL when operating with mode->clock
Message-ID: <aB9KkD5-zzdnWQRb@vaxr-BM6660-BM6360>
References: <20250505184338.678540-1-richard120310@gmail.com>
 <174681696108.3272668.11983752901167871124.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174681696108.3272668.11983752901167871124.b4-ty@linaro.org>
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

On Fri, May 09, 2025 at 08:56:01PM +0200, Neil Armstrong wrote:
> Hi,
> 
> On Tue, 06 May 2025 02:43:38 +0800, I Hsin Cheng wrote:
> > Coverity scan reported the usage of "mode->clock * 1000" may lead to
> > integer overflow. Use "1000ULL" instead of "1000"
> > when utilizing it to avoid potential integer overflow issue.
> > 
> > 
> 
> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-fixes)
> 
> [1/1] drm/meson: Use 1000ULL when operating with mode->clock
>       https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/eb0851e14432f3b87c77b704c835ac376deda03a
> 
> -- 
> Neil
>

Hi Neil, Hi Martin,

Thanks for your kindness for adding the tag for me, I'll make sure to
add Fixes tag in future when I send patches.

Big thanks!

Best regards,
I Hsin Cheng.
