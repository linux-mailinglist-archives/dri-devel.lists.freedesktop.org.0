Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3382E9087C5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 11:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B9510ECBF;
	Fri, 14 Jun 2024 09:43:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gGVvJgJw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D25610ECBF
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718358218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=heLqAA0wM0fUQP0fORNtFU8D7JlMKELEoNr8KN8Qrew=;
 b=gGVvJgJwgwaROQ20GjOhMUOqn4zMJ1GRoDQxUL4poIrGC0FY5Bfm12ccgMz7YFua+aB7Cg
 AO2kmEByoH9Ck6rfQ1pYT9j7fYhn53YZxF+nAsOc94KNyrC6/xrh2Otbarc6E62U13RiHT
 Bo4e7BiZ22Pff+9/2xwA+UlgjVbovp0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-141-K4SfhUvmO1SPB0UWRSXMkg-1; Fri, 14 Jun 2024 05:43:37 -0400
X-MC-Unique: K4SfhUvmO1SPB0UWRSXMkg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-421179fd82bso13392185e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 02:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358216; x=1718963016;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=heLqAA0wM0fUQP0fORNtFU8D7JlMKELEoNr8KN8Qrew=;
 b=UAQCeUNyhbHKwAJWYyV/69wUk/n8kxW/8aOOgMwBGPj1LniDomdpXuhDee7ykXdCyd
 ZqKJn5kJ+TtJ9tQqbitF28QilC1mPu5k3KeLxEQ/RVRTeIaoZxDXX3Xl/gTlky1ceYBw
 eB9cRdRTtrxd3pLMlEpH3NoXeUJXhqJ/xf7UckvSUusmgwiSwjGi2AUvbbmtPcCznB33
 Rq13XCLogbDvWixN9X9E8ttEVeybbPBxT2ipni5CQR19wwAURdsiw1D/Fn0cb87UVDMB
 KG0IoaazYeh8OxytxmzLyhN9rccuPIypGZ+o4qj5wk5Vr3+yYpDHJaEXBM/0xXi7QS0I
 d2Sw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOba/eDHCfvm4OD/ppdfovSTXej8U55P6Spr4/AYX/JnqEApghnCaZKg2sc4FOR9nmB1vT72jTHiBqNrtXfKb5+f0/7wW9Lss0fG2hKUSq
X-Gm-Message-State: AOJu0YyzxowWnv1d8kXgTXxIG/KpRZXN2bgPs8VdifElyzjZgpb/Bw5E
 o9kd3XzW+GHSw0cgwFTj6j8RTS6UxA+3UkCAlJ3UgLprPZfFJRvsAtJWr8uS9a2gi3YWCB1TF+l
 H1n8zc4sEwjB2bSqx+cBkTsU4ih44+OvHHSKS6r6T13X70mgFtA1l6qXeJT8krTUk3w==
X-Received: by 2002:a05:600c:2d8c:b0:422:140:f440 with SMTP id
 5b1f17b1804b1-4230484adc9mr20830925e9.36.1718358216374; 
 Fri, 14 Jun 2024 02:43:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwO+zXvhvhQvCW6i8bz09aVGJhUN0WDNG7f/kXUgSm5uCrWT8iKWcNV6XAPWyK1hW7VzDmzA==
X-Received: by 2002:a05:600c:2d8c:b0:422:140:f440 with SMTP id
 5b1f17b1804b1-4230484adc9mr20830745e9.36.1718358216023; 
 Fri, 14 Jun 2024 02:43:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422870e9145sm90904925e9.22.2024.06.14.02.43.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 02:43:35 -0700 (PDT)
Message-ID: <a45f0b8d-1220-4dc5-9d23-7ec5a1349087@redhat.com>
Date: Fri, 14 Jun 2024 11:43:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] drm/panic: Spelling s/formater/formatter/
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <5a11f8caf8759aaa22d421034d3047368e9d5f33.1718305355.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <5a11f8caf8759aaa22d421034d3047368e9d5f33.1718305355.git.geert+renesas@glider.be>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> Fix a misspelling of "formatter".

It's probably because the same word has only one t in my native language.
Thanks for the fix.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Fixes: 54034bebb22fd4be ("drm/panic: Add a kmsg panic screen")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - New.
> ---
>   drivers/gpu/drm/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index a9972ce05d7e6fe4..e3c51009d9b476b3 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -138,7 +138,7 @@ config DRM_PANIC_DEBUG
>   	  If in doubt, say "N".
>   
>   config DRM_PANIC_SCREEN
> -	string "Panic screen formater"
> +	string "Panic screen formatter"
>   	default "user"
>   	depends on DRM_PANIC
>   	help

