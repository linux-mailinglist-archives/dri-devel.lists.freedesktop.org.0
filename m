Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C42923C22
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 13:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A52F10E5C2;
	Tue,  2 Jul 2024 11:11:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ugjSAqNv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22BA10E5C0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 11:11:57 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-2ee7a1ad286so1242941fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719918715; x=1720523515; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=39Mp1fX4bfFSYhWZekjIyzAibpFreRyoWMi71O4QMSk=;
 b=ugjSAqNv7gF460cY0Fw+boYQIu7ye0nuslcBYIONL+19RUuPCPHZ+/3eic+aUxw/7M
 b5b+MgAjFJfo3sRN0HxsAVnNcC3ckhu6qxO6Syj8I/stOkJPQyGkBI/0WBbd313AvmBg
 DnEgf0EkfX4e85fmMa0HN595N27KDGz8sk2zG3ZcCLFIahtdIuMXdNNIvlpeOzkjCzBN
 1pn4kABwAH9mhRQLNqVCrqXXO8vK/J14GCrC+zImk41wOlPb6Vlh6mzdvC38fl3PHflh
 xg+OIPBN0BBuekEvI9j6fdsS8WF6uwuWhmpG0pBadpysvzavMhd/pn2VbFgK5OKnMEx7
 jJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719918715; x=1720523515;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=39Mp1fX4bfFSYhWZekjIyzAibpFreRyoWMi71O4QMSk=;
 b=GFJvup12HtJdpU9ZQXDziMOiaRtl32PGU0yNayvEC3yvF0upGajuMUNmgndAtocsAn
 YDrRhQEuFsvs+GMnfpLsiToewb2bDYQL2883Mv3J0kUGf99SnK16By+aKMhUCKVFcEbP
 BuDHubETDecK98aMvGEMbaiqQO0+ChfQe3UkQIn5kqivhHN9tVNrFMz4rOzly3vnHZHU
 GiLC3PCz9yM2i3tg12Q+2uuYqYSHTmgk+36JSDOZwylx9opfKu7s3xjG+p5auSEVkVLo
 b0j0qvr2AgB9uCSkIUO9OYFkEX69G2q8ckVHGMn0b1pccypIpkXpnA0P5uscjmU08DEx
 VIIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXiK6AbJhQY6y/4tWag7zr6Qq31Z26yf7GcC67f8FjJEqqQhCe+tWx85pyfo4ufgsoU2ypaVWa00uUAxaX7O9Xp1yXP9/Dvg1CAkihh9EQ
X-Gm-Message-State: AOJu0YwwKJC6dmoFlU3Clt8dm4DUAes5Zfhet/gpBghxJmWdctEZwrU7
 At9wEf5wKbZ4qXxfsxgp8mfnCB5iE94EvpbCWOHHSWCaS5RL1hUkHCm45jREaLw=
X-Google-Smtp-Source: AGHT+IG//o7HCzqnXn/QKLpL1+zg6aywFOERJd4RlmKy4pR4tJypdj3qSvh2LbaUUXC+dc9z8yeoOQ==
X-Received: by 2002:a05:6512:2386:b0:52c:dacf:e5ac with SMTP id
 2adb3069b0e04-52e827091b6mr5799901e87.54.1719918715385; 
 Tue, 02 Jul 2024 04:11:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52e7ab3b1dbsm1761242e87.253.2024.07.02.04.11.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:11:55 -0700 (PDT)
Date: Tue, 2 Jul 2024 14:11:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] drm/managed: Simplify if condition
Message-ID: <pre5tmzcfv4zwrbuksiacsm56qhmn76wa6xyni7piwivokogp7@nbo5zsnxwsut>
References: <20240701195607.228852-1-thorsten.blum@toblux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701195607.228852-1-thorsten.blum@toblux.com>
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

On Mon, Jul 01, 2024 at 09:56:08PM GMT, Thorsten Blum wrote:
> The if condition !A || A && B can be simplified to !A || B.
> 
> Fixes the following Coccinelle/coccicheck warning reported by
> excluded_middle.cocci:
> 
> 	WARNING !A || A && B is equivalent to !A || B
> 
> Compile-tested only.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  drivers/gpu/drm/drm_managed.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
