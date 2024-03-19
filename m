Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227A4880083
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 16:25:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC27A10F016;
	Tue, 19 Mar 2024 15:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xg3harGS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F20F10F016
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 15:25:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-41412411622so15568125e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710861916; x=1711466716; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=j/tOewZO+xITdwu8fyyevSlxd4rQDWIvMngL14Mt4g4=;
 b=xg3harGSZd70687EIgrTSQjI3ct1LnGQRcShQl2E7m1/nVTthmwutPikUTvpUNUEoZ
 YmEKKnmzH6zDm3ECINXG/Ntqosm84/VBNqKRVOQOejHDLEZpSvA8BYBaM6OfIV0sa/1B
 TakHUgH/Lwdy2JGo3ZAn15W5eXbsWiEMfv6URm4s4pUVmp2wleNvCBBJddU2b19yJdhO
 i61eZXa5IHmLsjs6zgBWvKmvCB7WEWHRyYQmbTI+ofGELlytox5WJM86YN1zu42nmMnL
 2F0+lVJl/libgk3e7B6v/dMDuCFml/oQbchkWuUoalhdmtq2yYFCBpcpuiIukDGnct7R
 zwqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710861916; x=1711466716;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j/tOewZO+xITdwu8fyyevSlxd4rQDWIvMngL14Mt4g4=;
 b=cZbB0h6+K8SYiSNfzWEZNIvR+A7f4M+2YFlv+PspWUwz4s4Pf71IjCZQPFMs3VQ4s3
 qDmUp4S6rGEqqo/DS2hS3stHApci1KnR130BgdtulXxRJnKQqEKTKMDaK/UVgR+Y3Dhh
 5Au9pk0nbd7n7c7+k6K4UqLwxK+sizNsO+jrqPuUIaFLY8HHpk1biiQLxsTbVS3cwP2H
 0UzqUVF3ox9prSXwuKw3KSA8K+oSV86sIaHh0MmRb12I/MNTbtGUIC1Zdjnek1ni9sc7
 8k/iNKSlK3gPtcM92wPxJct9674iqsqU8hofrVF9L8EkylmkcB3pdXg7bU1tmKdm7X/z
 rrTg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsCNPwA0rQvJDWS71VuPDMNTj91i+kXE7hOb4vExbyv1GjTSe1ccesUBXpOKBkmFTU50/AYPi1vi6GmSPiewP629D8ZKsMzQIkWBzob76U
X-Gm-Message-State: AOJu0YzmgDNzkZjoXNG4tY4hWhoFhjfeN1ef7yriPpCGT77/teG64TrN
 KTSwuBEVgK1znXN5vYewlkOwxx/hSrOuuSVqmEsHsuyZymFpUDe0G+5qJOLtXcw=
X-Google-Smtp-Source: AGHT+IGuxUp4tJ3tduUZ1jDdJJOXB/6Dyq+c61cZG82qzzk9ozWfJDBWCF1r7b5Ii/MqZJEtyixx8Q==
X-Received: by 2002:a05:600c:4689:b0:413:f4b5:dcec with SMTP id
 p9-20020a05600c468900b00413f4b5dcecmr10850776wmo.40.1710861916490; 
 Tue, 19 Mar 2024 08:25:16 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 k4-20020adfe3c4000000b0033e48db23bdsm12595322wrm.100.2024.03.19.08.25.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 08:25:15 -0700 (PDT)
Date: Tue, 19 Mar 2024 15:25:13 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, jingoohan1@gmail.com, deller@gmx.de, andy@kernel.org,
 geert@linux-m68k.org, dan.carpenter@linaro.org, sam@ravnborg.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 3/6] backlight: omap1: Replace FB_BLANK_ states with
 simple on/off
Message-ID: <20240319152513.GA9963@aspen.lan>
References: <20240319093915.31778-1-tzimmermann@suse.de>
 <20240319093915.31778-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240319093915.31778-4-tzimmermann@suse.de>
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

On Tue, Mar 19, 2024 at 10:37:22AM +0100, Thomas Zimmermann wrote:
> The backlight is on for fb_blank eq FB_BLANK_UNBLANK, or off for
> any other value in fb_blank. But the field fb_blank in struct
> backlight_properties is deprecated and should not be used any
> longer.
>
> Replace the test for fb_blank in omap's backlight code with a
> simple boolean parameter and push the test into the update_status
> helper. Instead of reading fb_blank directly, decode the backlight
> device's status with backlight_is_blank().
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
