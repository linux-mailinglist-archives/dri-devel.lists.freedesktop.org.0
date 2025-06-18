Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C90ADF0A5
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 17:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7100910E87B;
	Wed, 18 Jun 2025 15:04:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="COX0nkCI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40BE10E87B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 15:04:39 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-748d982e97cso1571640b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 08:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750259079; x=1750863879; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7Hs2SUNklx2rXkCy6cYLf3Of+XZFsviDoNS0r49LYlo=;
 b=COX0nkCIT7mcK2r/Yb9DaBRAcR5DnqlaiBOwr0jbxbato/CQMSWLDURKZmcMmktev8
 iU69ItCLFzwKf3saYAxe+WRNJKGU4m6ZYSyA1p+0KSo09X3KjenhkQS/utD/zwl2DtaF
 bUAGAlDqV0WuofhLp0AKQ/nA9s5I3GKAvg+7kpa5NFWsV5Y4Jmd/hf5WJ2SisOBn7BVk
 9q2EZxnabrfuAbk28H5RiqoWFOkek4HUYWqEVuzfsa95/KeA2yVh8xmE2t0hfyHieI9/
 4eSRZ61lW0n1S0i0y59ryher94SxAyqIeNDCgIebX7VTHor13d9t4HJYIBqu3KmRMx8Z
 n9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750259079; x=1750863879;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Hs2SUNklx2rXkCy6cYLf3Of+XZFsviDoNS0r49LYlo=;
 b=fY32eQ8AvfzSn00o/F11aiGjxv60yBZJCZZ4SMFq33ZKS10WxDVjaphN4PrsAEk2uf
 9dcMEFg0V9v4hBSbikBvpEMQdmLXSzd/pw9u2MgFE262NfwZySCCgi7YErYJKCbRPvjX
 OzpdBss7A0ZmESuxEVwJaTuGN5oqSvxpQjxStDqQhcd1l5BU5rPzI9zhZ9L5CKzRoLBM
 a52GighQC6kwBrO41tGhY7Xv1Cz8lz4YYXeKVLP1Ay7L7L/WKNxZCrkwnNhwmhZoQ5pH
 VpJSunqSPrIDDemYrZjQW4x+onK0kGvBo8TXJKU5h/Ze9daN1Pthf5AkJjYFvsjhSgSE
 Cb/Q==
X-Gm-Message-State: AOJu0YwkbQ5vqUNr8CIanfONrHN4CXVW8qCAHO3ApR5LRZJTOFDyWnOg
 XKwLADS6uH/xl0dELFL7iB0R7h+gPHCOFupwZuFWRpDijJsjvhMOxIbS
X-Gm-Gg: ASbGncsOA1+Y2fi+X/Kmvh+RgtsdL/13KhZk02Xfl1UrvpK0nLMZBHSWXlWKvSMgaXw
 6ROZ7WTxTN/Mi0qJX25MJvxQTnWrKfqULnhaZ0NcoCX5MrJK10cTmw5bPGMcj9H7idx1Pj4QZG1
 JJ/33wElf4BMig6akzNzHGuh5pE2zF0RAUGNht0pfzxkY6ZN+uhgovppDckdeOVPu2bhR835qwm
 tYIr6MG/TuXx791MQ2YKFetm6Eo4+snLO3xuW4cNsVb1JRoKINdi1V1nxsleyGDjhdmZxL9zW8X
 mconnVE/IbzqWf68ERasgxOUPUZVhs9P/TqlrPti5/mcAJdQfGq1xLKsLDz+reEBF9ZRow==
X-Google-Smtp-Source: AGHT+IFbMcB+hSk5+yrphcoXGyxnzipWWHvp4gGJiBPM0m0zxo02a1BcE06EDvrBKZqeUdozbvm2Tw==
X-Received: by 2002:a05:6a00:1790:b0:736:3d7c:236c with SMTP id
 d2e1a72fcca58-7489d062437mr23210895b3a.14.1750259079025; 
 Wed, 18 Jun 2025 08:04:39 -0700 (PDT)
Received: from [192.168.0.123] ([59.188.211.160])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7488ffecd1esm11106156b3a.25.2025.06.18.08.04.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 08:04:38 -0700 (PDT)
Message-ID: <f5c7dcda-d67d-4da7-9b84-a9d5a760f452@gmail.com>
Date: Wed, 18 Jun 2025 23:04:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/12] backlight: ktd2801: Include
 <linux/mod_devicetable.h>
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
 <20250618122436.379013-11-tzimmermann@suse.de>
Content-Language: en-MW
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20250618122436.379013-11-tzimmermann@suse.de>
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
>  drivers/video/backlight/ktd2801-backlight.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/ktd2801-backlight.c b/drivers/video/backlight/ktd2801-backlight.c
> index 0489b0615ceb..17eac1b3bce4 100644
> --- a/drivers/video/backlight/ktd2801-backlight.c
> +++ b/drivers/video/backlight/ktd2801-backlight.c
> @@ -6,6 +6,7 @@
>  #include <linux/backlight.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/leds-expresswire.h>
> +#include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
>  #include <linux/property.h>
>  

Reviewed-by: Nick Chan <towinchenmi@gmail.com>

