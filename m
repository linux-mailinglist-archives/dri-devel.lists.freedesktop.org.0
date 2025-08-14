Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE13B261A4
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:58:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE48C10E2B9;
	Thu, 14 Aug 2025 09:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.b="IqgK6gjJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB74910E2B9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:58:05 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 98e67ed59e1d1-32326e66dbaso556148a91.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 02:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar.org; s=google; t=1755165485; x=1755770285;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OV7DVTyFPhUCuQuYofau3QDCmeiUSER83ivGh+XhTb8=;
 b=IqgK6gjJUyqyZeARgUkdODRtdjuPcPlxldA269N0EwaZQqyuPabuMqqf3WY6hVxdWQ
 EdnAeytP66VEVwb3T71wef3Slkyd3n0eb+U+zgrsk+P0N1q1+SylIRV6krax/c+jp/w+
 86B/LYHI9m0j894de93Ilhv0qw/3P8lvLbFhdb517tsRo2+CWTUjQPDrmvsx8TyJt/GP
 ZSdXToRdbENQQ0hCYkP4lxIqK2TOSeYa7Vq3V/7BV4rcXCXS5cQrmkKB1WcQbXFh8uT5
 SM3IXniYj6qriFngdlSt8BzavS9OMykxV4+XaFNigbAmmFOyVOlNVIsmnhiuwDMfdlMr
 ntug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755165485; x=1755770285;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OV7DVTyFPhUCuQuYofau3QDCmeiUSER83ivGh+XhTb8=;
 b=vnQXFD1DkqP1Ju6TMSiyCKPCdYpH25xszUfJ2xfP12tDHnFc9p1gYSFMaRMCHI0qjm
 sEbEONRoRb5YXs8NEK240tv4aL/QHn6iYH3uASRnOrQtgDQfSBochx77vg5M9yEcIUn4
 qNFImGIpKAuniNNZLGcg8YTb8RHZt6GyVeU/6stC9FAalFdcAJDsLdVy2g8gQSXHtGTA
 j+oLB39GG6dEVIT6upFQrfyIgD78YDGljRVTX2YT4Ev7vSlSDCzWB5Z3e2WDwKAxb3N0
 vw8N3laaAbDbKb1pKQUZjIcpLTsaR/Kmm4Sri1dqO/PvlK2v3ffJ97QYtoE0f/SZmnjH
 VF5w==
X-Gm-Message-State: AOJu0YxOvK5WFngs1J92nZIJXCUNcWYrimEkqN2cy1raHxFWjrlXNh4Q
 vPTIB3LY8xyjuGC55DuSpUxhDOpFMzc1r7+e5r6jnS8skHuGjdTJnWDO1N9wnmxYVbcK8iaq39s
 DUcjmjM2rnjSDxlJBL5qqLYtTpv3+P28mYKuKwSZWXQ==
X-Gm-Gg: ASbGncsRYfMT4tl8ljtn62BxT4C+FmCfNO+bt+gch0VDpBQIKc1zqRVGeZ6x2N8Evh/
 ORwRhi1KIgCUQOyQIhvN4yjZHuicQRy5ZIIKYSzvT2HLq//zQNiMAbkHfeux/C3ZaMl7Bxz19r1
 MxRtQECUSvlnw0P7PIwLhT0UGFKCiOM8PH12Tjixj3JWM+dOUdWSaykXctPaPxeHH/ixSA4lUJ8
 qYsusWcDlC5qvGgFyrZI6ZAcbYS0/MKvGW06FTSho5OMFN9otqJ
X-Google-Smtp-Source: AGHT+IETKzyYC4gK5t3T4Um5FyBie2JDSo9bC6y7Hbj3sXj+nFH3RLXfiBK/vl0KIyNyXOaQzWQ/47PgbCZpkXTjgas=
X-Received: by 2002:a17:90b:5783:b0:31f:1744:e7fd with SMTP id
 98e67ed59e1d1-32327aa63b2mr3107238a91.31.1755165485293; Thu, 14 Aug 2025
 02:58:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250813170542.331206-1-robert.mader@collabora.com>
 <20250813170542.331206-3-robert.mader@collabora.com>
In-Reply-To: <20250813170542.331206-3-robert.mader@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 14 Aug 2025 10:57:53 +0100
X-Gm-Features: Ac12FXz9uUiqN_Q5nVeEpB3WfsXKzW9kGF_PJ1N9G50cKHUx-xYOV6dIVWWh_RM
Message-ID: <CAPj87rP4_0Py3Ko1=MtwXm7o3T1Javj-h8Qv9Bov_9er3URgBg@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] drm/vkms: Add RGB to YUV conversion matrices
To: Robert Mader <robert.mader@collabora.com>
Cc: dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Daniel Stone <daniels@collabora.com>, Melissa Wen <melissa.srw@gmail.com>, 
 Maira Canal <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, Simona Vetter <simona.vetter@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
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

Hi Rob,

On Wed, 13 Aug 2025 at 18:06, Robert Mader <robert.mader@collabora.com> wrote:
> +       switch (format) {
> +       case DRM_FORMAT_YVU420:
> +       case DRM_FORMAT_YVU422:
> +       case DRM_FORMAT_YVU444:
> +       case DRM_FORMAT_NV21:
> +       case DRM_FORMAT_NV61:
> +       case DRM_FORMAT_NV42:

I wonder if this could use a drm_format_info field for chroma order,
instead of open-coding a list here?

Cheers,
Daniel
