Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62436B393C3
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 08:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A986B10E11C;
	Thu, 28 Aug 2025 06:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="l3Uuobcp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBB1310E11C
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 06:27:04 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-afe9358fe77so2279066b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 23:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756362423; x=1756967223; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rw1P48Rw9airUIZAlX8WPmdMSK7aVKwW+bhgC+9irms=;
 b=l3UuobcpnaRq69jypvK5LiCE14KOVl5POqyCjQ93zw3FCTCNr9EAozFm8L0CH5x11B
 03m0IMCse1j8g2IbIAWpZi2lNqWWqJSQi6gyTqcUDogeUZ3v05qSRotZH7rP4itNvovx
 odCrA/WQmSOt7USYhxDZiCLoqwpl0K1XUdSeaUL2fjtFHTIIKIJ7ljJRaP7rHrisGbN3
 HrMlmoOl6Rq2BYcwxk5qbFI9IDH8Kx9+G3y1qH2lquKVE8OWwFycqOEBfZFq34Ji2ajU
 IHmmNWjJrd0+i0iXA1IOHag8Eo1js5ElMksly9d/aHV8m0qAp2qed7no0oPId4S+M8O/
 4iPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756362423; x=1756967223;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rw1P48Rw9airUIZAlX8WPmdMSK7aVKwW+bhgC+9irms=;
 b=YeyK44JJr+dUtLMJeLKHWnKekJF9waMgP/VpxWPJWdHeu2oG9FC9WdJhadWnGWPXaL
 +sZGbMLs00wpqJPpCtf8SMYpBiYkoEOBzTImWr6PTIr2ALUrb8icZo/lAPOL+gve+z9u
 PWQ09XMkx05n5/qgqYQrCj9navXb1WQcZ0oBZtIuY0Qb6QphKlRUqj6EtxpHH2f5soVQ
 AFN+dknjahInMjlZk4G1E+9cOx3M3Ny7yXsUD68prlDUxBqvPvNJuj/TkR4Jlu5xZQ9g
 Rxn9xXYaAQgJd188L/90d9lTRYyeX68mqLkFuJEc3StDU8ffdnaOXzRpRZynoQyxU8ls
 178Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV4mu+IBNr+BpnDCpepp3jD8B/8RTLuJjCdMAST7eHawoHhojFep5DT62zSqxub9e1BXhOs+uM4lMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybb/7aioVrnkFtxGJaF1fX2loRE9AtdLwyuYCOdxYTwXV2IudC
 lkkZtHhk65yhQACA3mkjIjk8YPWNhrn5TOMbSkcgm4xhT9i5vWszMCpeFFwoF64nZxhpFOZeW2a
 cGr6OhBwrQNhugmS/QGIVPWSTMLyj6ko=
X-Gm-Gg: ASbGncvmS8bytdm2vpVyFXYVjrMRu22Hvf+RvSO9jRYnMkXXUclVERch7kPZXbaBGDn
 mVaC2h2ErcCQ8sNfy1evoMpxB7CHpG1EeE6EVCilYOMPfkWCxT0JSRoFUN1hX6NzA2lfnFU/rff
 mMqH5WuX2ZoAnBPLe1t/x0TisLfeISpKqBkW4jeFppxWCajmgevBjdR5LsQFFmaHR0CV63DyAij
 s5a8F6jPDyKTOai
X-Google-Smtp-Source: AGHT+IHllcdWIIyE/tgfPoEMaupjgVRkzKVjdIUnd/uLbIt7Xuq/3mz/DvL95F4OMvojqNdXHzV5gHpDUDZi1keN1KE=
X-Received: by 2002:a17:907:7f8e:b0:af9:5a60:3319 with SMTP id
 a640c23a62f3a-afe2902ee2bmr2188427166b.19.1756362422867; Wed, 27 Aug 2025
 23:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250825150948.2998-1-chunkuang.hu@kernel.org>
In-Reply-To: <20250825150948.2998-1-chunkuang.hu@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 28 Aug 2025 16:26:50 +1000
X-Gm-Features: Ac12FXzArv6j2S3_biYutaI-lCZofq_ZLCSqVSZm8jbnf5oqhY51MlmSIypDoP0
Message-ID: <CAPM=9txPBARP_60P1M=9SF6HzPWkaj2gDN=J0wCAO2PvjwUWug@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm fixes - 20250825
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, Jason-JH Lin <jason-jh.lin@mediatek.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Ma Ke <make24@iscas.ac.cn>
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

> Louis-Alexis Eyraud (2):
>       drm/mediatek: dsi: Fix DSI host and panel bridge pre-enable order
>       drm/mediatek: mtk_hdmi: Fix inverted parameters in some regmap_update_bits calls

Hey,

^^^ this patch is missing a S-o-b line from the committer, please fix.

Thanks,
Dave.

>
> Ma Ke (1):
>       drm/mediatek: Fix device/node reference count leaks in mtk_drm_get_all_drm_priv
>
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 21 ++++++++++++++-------
>  drivers/gpu/drm/mediatek/mtk_dsi.c     |  6 ++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi.c    |  8 ++++----
>  drivers/gpu/drm/mediatek/mtk_plane.c   |  3 ++-
>  4 files changed, 26 insertions(+), 12 deletions(-)
