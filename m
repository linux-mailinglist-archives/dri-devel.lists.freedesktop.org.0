Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C07A49711
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 11:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2F810EC5A;
	Fri, 28 Feb 2025 10:22:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dQlsPG/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636E510EC61
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 10:22:32 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30b909f0629so8433641fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 02:22:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740738150; x=1741342950; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z5R1GwEARUIu4D0vBS31y0VlPu/BaWoEI502D8t7cc8=;
 b=dQlsPG/DxfKJoOGs0eNx4Vrh/AvyXcnYyEHqMy8bIJDc2NPkeTIKV1Xn510FR6Detr
 dp7SfFssJm5P4JsS2UVsIW1x+ADnkjsMUTO1evY2KXGq/TNxEFVByIE96zZEIcj9ZUU4
 vsuRASpRJo4kmNGxvy0PaZ8wMDl+jifvlf+KMU1j/HBr/R/NWVCNh9vyezfF84+9Rp3g
 qe8te/tZV12RncoEJl5mn63esdQ98o0hfYhok3tuvq6VKoYxRKOQwRyV/6CNm5CdpE4g
 BjkdIsdUoRVTuOTO41kBHgJ5Z0KC8PmG7woLdeHlD3WzXUSV/IyUk0Pxbl4J80LnV2p9
 0F1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740738150; x=1741342950;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z5R1GwEARUIu4D0vBS31y0VlPu/BaWoEI502D8t7cc8=;
 b=GDcUOLeTmKdlx1plp4kfQGNi48256EdYXA/4PE9qZaahKcYj4ekZRkJZeMJ5rdFVdP
 aFJe1DojVlvE1X8Z7fEZG9IIcPmEPWk+YR9PzjAy37GgDT80pjv52qW18XqWejSjlsCZ
 RPv22wUBDqj3kov1tz6lJAmpocEaEuVCJCbXZNIGZIdpRRpcLy5JYB44XNti+iTEXLOw
 +FsC5ccNdmPNyolwY75IGowp+0lN3yxalVrrVNXYNwLy/Bt/LmmUjZYP3LQz+cjYrrhZ
 Uh6glf9coUjGsRML4wIB7bp/679Ivjs6gSM2Xa2qLgN9z1sglQ6DPCwPpyOYU/VFPLor
 tZ4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2JCr4XTTFXlXS4tDLOxg7vtLzY3Tfllf1Ma0av7HsN307p++MkZW4pjcOz5l4fEj2zx9mRpQrXW0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxWwCGzscc9coYwRQxIEEJZJzLb476jE012TydZS8nmXqnitYRW
 zZFu/UT+BOnF2lzUy0GWe4XmqeEUAYVaMMgMCm/RtbnWwvfjKcEQle0t2hDk9kY=
X-Gm-Gg: ASbGncvx5l81URmLXe6UwM64uwNz/Wj3c2JWIKaRpJK2ucENH7pTNBSWg4UidXX7183
 f6uyyymjMs2jJAKc4h1tYNu+T5fjRNbWzrGK2G4SAJGI5BN+g4hrapScusNr4DkkZlMzlV+QQIR
 tHIJzxmw8ApWEHMvA6608sfIt5AhSIz8G2iL3MqV3g8M9hAkklQXLTrNnD5rFO3JZ1jpU5cEY7o
 jxG9pt+7wyWcjaQ/D2qMKdvQl+FoCW77JB2mwNgthns+7LchEbtkWnb4FfhzvXEp8HTMVG/QrRv
 NTyR7eyZDpRD86WM3IGQOaEZ9qAYorjEUWWzoepjxa8oyzKVAS+TZWpH9M/nRYh+fsExlNUOxw2
 tjFmHwg==
X-Google-Smtp-Source: AGHT+IEcFPCTorTFbzvj3XxGZ+gp0Pdf9edgu6c5mZ8c9NQpwr+CURuqlRmoz1kSiZZiiCQv03r7hA==
X-Received: by 2002:a05:6512:3b99:b0:545:c51:4a03 with SMTP id
 2adb3069b0e04-5494c125ad5mr998344e87.11.1740738150508; 
 Fri, 28 Feb 2025 02:22:30 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494e8399c4sm197441e87.213.2025.02.28.02.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 02:22:29 -0800 (PST)
Date: Fri, 28 Feb 2025 12:22:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] drm/connector: Fix spelling mistake "provded" ->
 "provided"
Message-ID: <57owgwkyiaxw7xckoug6tsrzk3g3z5yb74wp47av42rrvhxqby@tzr5aapdua4k>
References: <20250228085350.678446-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250228085350.678446-1-colin.i.king@gmail.com>
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

On Fri, Feb 28, 2025 at 08:53:50AM +0000, Colin Ian King wrote:
> There are spelling mistakes in drm_err messages. Fix them.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/drm_connector.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Fixes: c627087cb164 ("drm/connector: Use common colorspace_names array")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
