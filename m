Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581BAADF0B7
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 17:08:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C55E10E023;
	Wed, 18 Jun 2025 15:08:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="frGNmGy3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E994A10E023
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 15:08:27 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-311da0bef4aso7719266a91.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750259307; x=1750864107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NlXLcdl0xMjJ43b63DNA4aQ9Nj5CoTCVpP0YbONQKfs=;
 b=frGNmGy33ufU+mU/9+ieqGYISJSxKmoqaNcRNhfCpRrUqJxGoejTXivhmcfQiefFCv
 uSrlHZXqO2Q0I2kgQ+e0o3Ppl1e6K3hPE40TBqh1172NnhDwB5nOv7JD03mRuLBvMTtP
 rz0BIWSaJq42kmWxWZMG+TyS5e0veDQjN7m7P/ddUHcC+BuE2kF/UJ3cmVyKnu03KQG9
 f2QaZaZttsfjSGq8qy6fLhXP3rvR0lsTbG5JQaiNjemAi0eOy3Nanh7/7pSIzRufpsiI
 qF3Kbr5KP8XPVV5Jw61xowe7uc1mNe5VGOuoZsVnwidUXYobBVi+kYOkIvGSvYvAC++K
 ZVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750259307; x=1750864107;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NlXLcdl0xMjJ43b63DNA4aQ9Nj5CoTCVpP0YbONQKfs=;
 b=nykj/xQFH78QUTVxFaQ3ozT2BHgTUNmQXqnTTmBunsTyHJ1rzgdqSJvKSA4n0Yi+Rz
 eKe0YdhY5cer1gZlhVBbr2dwo0FQa7DTFuYZovyEwVdeBVaeBtH2Jec3mzPmKJrV32CS
 S+aGTrznObRUyKkGLTdVnlBDXhJuk0JDka09VlQuR6oDVfbRHBjDI9JyAznBKF1F2vn2
 79IiwYJccx8mTWd/zxsFjae5zfJmqqEfm/9JTkbPEE8/JtHNRqnZ2Tod9g79ZCTQp3sb
 nJwsrrSJwBt7nQ1co47vuTOqcXJt5LrAmX5u/QIjYryMEky/byOVGiBJtTW3+N8mRJCM
 Id3A==
X-Gm-Message-State: AOJu0YyMa9fqMBFdLMLOpL9E3AmizUe0vkBNBZmsn+0eZJ2y5Mi0DoDj
 fwKJC/Dhtyuh9DPma6MlceW4sQuKirZMrC0o+mdo1g2JtX8KbPiBUd3y
X-Gm-Gg: ASbGncso/UgLeI947tLaBocslLAtXW79DG08UsN+xqN29eFC1A99a8hujpn/TpBgxAb
 G2K0v3OqKoA8zN8ZcQptUAA/M13XWud1p93Hj8ZiMG1hC/WrXc7QBNk+K6cuWoXqvEy1WsJYVH0
 ilrD6tsGUNkEPcq4NOYgdzzJIzsmLejhUE9akYlYVyHjydmJ0u+sE3BwNVgi/I8gqApCGarzPJM
 +9iqkaUyFi4KwB3PBWWjARB4gHZcSe5Eh5jDvVcjOAYvxCzfVjzgE5l3/BNnd7f3tf5lzsYCXP+
 B5YQ/bSWy7OynmzMxAeGYtG/nzYVRrmuVx6GIENQZu+ljLbW8iARbMDcN9qK+NVqzqlUzA==
X-Google-Smtp-Source: AGHT+IGMfD1en+jAPfFZnyKfP/6fLNvoxSDJknXoysVlOSdS/kFg5+qkb2avdYMr18aUztSudZuFfA==
X-Received: by 2002:a17:90b:528d:b0:314:2a2e:9da9 with SMTP id
 98e67ed59e1d1-3142a2e9e1cmr8449811a91.25.1750259307379; 
 Wed, 18 Jun 2025 08:08:27 -0700 (PDT)
Received: from [192.168.0.123] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3158a22418dsm16968a91.9.2025.06.18.08.08.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 08:08:27 -0700 (PDT)
Message-ID: <c7ff4ca4-da9c-4b86-893b-1ffd9fb0fb4f@gmail.com>
Date: Wed, 18 Jun 2025 23:08:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] backlight: apple_dwi_bl: Include
 <linux/mod_devicetable.h>
Content-Language: en-MW
To: Thomas Zimmermann <tzimmermann@suse.de>, lee@kernel.org,
 danielt@kernel.org, jingoohan1@gmail.com, neil.armstrong@linaro.org,
 jessica.zhang@oss.qualcomm.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org, alyssa@rosenzweig.io,
 neal@gompa.dev, deller@gmx.de, support.opensource@diasemi.com,
 duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-fbdev@vger.kernel.org
References: <20250618122436.379013-1-tzimmermann@suse.de>
 <20250618122436.379013-8-tzimmermann@suse.de>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250618122436.379013-8-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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



On 18/6/2025 20:16, Thomas Zimmermann wrote:
> Include <linux/mod_devicetable.h> to declare struct of_device_id.
> Avoids dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/video/backlight/apple_dwi_bl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/apple_dwi_bl.c b/drivers/video/backlight/apple_dwi_bl.c
> index 93bd744972d6..ed8bf13d3f51 100644
> --- a/drivers/video/backlight/apple_dwi_bl.c
> +++ b/drivers/video/backlight/apple_dwi_bl.c
> @@ -9,6 +9,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  

Reviewed-by: Nick Chan <towinchenmi@gmail.com>
