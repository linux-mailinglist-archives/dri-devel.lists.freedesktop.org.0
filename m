Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A695937E9B
	for <lists+dri-devel@lfdr.de>; Sat, 20 Jul 2024 03:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31A0E10E096;
	Sat, 20 Jul 2024 01:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=schmorgal.com header.i=@schmorgal.com header.b="XHlmPQ5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B397310E096
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Jul 2024 01:26:58 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1fc47aef524so2091445ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 18:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=schmorgal.com; s=google; t=1721438818; x=1722043618;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4GzLIXO35BQTCnZZGDwUqR39tYKQ+yVfockj6qxcfuM=;
 b=XHlmPQ5YPcG8bUaR0uj2l0Y5ICNFfiz/Ldab4+NWnLw9QL8L1Rib8zY5VKYrOVdyeZ
 NFvro4VoAgXVP9ZTUC6W5twwxfzRYSU4R5smw0KPSah39K3GH7KtedgxFultSJKAPfRN
 Jyok2GCnF6ZahLG3KlrU6zixbv3UcBVBplJV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721438818; x=1722043618;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4GzLIXO35BQTCnZZGDwUqR39tYKQ+yVfockj6qxcfuM=;
 b=JJErnuC+2g8RzPQmXBjxPinH6/juxIgKCFBQS+11aRxZ38OCgEgDVOBXVuDNX93tdZ
 by9L3KYRqcm9P3Uo7o9rXJ5ZURz3p3ZNtJsOPs8ayptvwpc+j91atwd66mJsIMuUbICR
 B2t9bKmJ05Z+p94JuIhRjqjMW1Y5xKJ4QbEyBVjoYRhAuwPX5eGR8kGiNYGz9RHlXD7H
 xGWlomRwI14Jz65oNNjYM9rrv1c6C3ufBSkqbVJFt8NwQ4oYI4A9P2UIEKPjiNaro7yK
 xTYgcM3Jiv7HCRANuWSbbE+JcfTBFW3PtzyseOI3cELIueoEhoSA1BbfIcFG/YgOjVzw
 Ti3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx9eVLA0KK6Porg+1mwLo9RiL86K0duE/hAAjy3PCbz3yvZk0haimVqq69+cbr3xD8bKpo1oegd1GxZRCRQg+c0RMcaN/fftOY0iPVPKB4
X-Gm-Message-State: AOJu0Yyh5VXIMSzKjCEkR0baYMznGKwQidFeBDKxEq7Pzw40clUdynqj
 prr+ebgM9+ZdHnrboHPrP/41IVaNK8tZ8OQmtVSoYr0PmQ9e1DwpqAzpGrWVAtE=
X-Google-Smtp-Source: AGHT+IEhfL93J1awWv1H14EGM5nRteSyufig+TlubLPD1Y6yOSfyvGBGueNdGYVaK4P9IXCVRuAPZg==
X-Received: by 2002:a17:903:1c1:b0:1fb:6fcc:bc6a with SMTP id
 d9443c01a7336-1fd745736e6mr10512235ad.2.1721438817995; 
 Fri, 19 Jul 2024 18:26:57 -0700 (PDT)
Received: from [192.168.1.33] ([50.120.71.169])
 by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-1fd6f259fe9sm11202105ad.27.2024.07.19.18.26.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jul 2024 18:26:57 -0700 (PDT)
Message-ID: <cfb9bf65-c3af-4b2d-80c3-5ea7dbc19877@schmorgal.com>
Date: Fri, 19 Jul 2024 18:26:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Fix overlay when using Screen Targets
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com, maaz.mombasawala@broadcom.com
References: <20240719163627.20888-1-ian.forbes@broadcom.com>
Content-Language: en-US
From: Doug Brown <doug@schmorgal.com>
In-Reply-To: <20240719163627.20888-1-ian.forbes@broadcom.com>
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

On 7/19/2024 9:36 AM, Ian Forbes wrote:
> This code was never updated to support Screen Targets.
> Fixes a bug where Xv playback displays a green screen instead of actual
> video contents when 3D acceleration is disabled in the guest.
> 
> Fixes: c8261a961ece ("vmwgfx: Major KMS refactoring / cleanup in preparation of screen targets")
> Reported-by: Doug Brown <doug@schmorgal.com>
> Closes: https://lore.kernel.org/all/bd9cb3c7-90e8-435d-bc28-0e38fee58977@schmorgal.com
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> index c45b4724e4141..e20f64b67b266 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> @@ -92,7 +92,7 @@ static int vmw_overlay_send_put(struct vmw_private *dev_priv,
>  {
>  	struct vmw_escape_video_flush *flush;
>  	size_t fifo_size;
> -	bool have_so = (dev_priv->active_display_unit == vmw_du_screen_object);
> +	bool have_so = (dev_priv->active_display_unit != vmw_du_legacy);
>  	int i, num_items;
>  	SVGAGuestPtr ptr;
>  

Thank you Ian, this patch fixes the issue that I observed.

Tested-by: Doug Brown <doug@schmorgal.com>
