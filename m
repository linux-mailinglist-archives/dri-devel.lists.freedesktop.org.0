Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8389183AAE5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 14:27:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D36F210E9C5;
	Wed, 24 Jan 2024 13:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B10610F73A;
 Wed, 24 Jan 2024 13:26:35 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3bd6581bc66so4050781b6e.1; 
 Wed, 24 Jan 2024 05:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706102734; x=1706707534; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Yu0JA5DFgFaU5CwNCOFmY77G5L3S5T+P8RtJ0zkQaJo=;
 b=gtYm2LzaaQhcnh0QETkfzc5kpz0ZgepTd+/8SsLh0PjCgGbEK/CqhzIAFdT1tGi+V9
 dSpLo9rWsvhj9h3HjPEsHDd/bcXxo0acl+oHrDadITB2BzBcdSFzRatvj3BH92yD/LGe
 MsqcDKaJMMflKWRLkbvP1JC28dFUH7cJkRBxW1rPfVU5R4P0oGXYBuqTaHuC/lfSPQtS
 ODGc0L6XvRKKtbOXr9P7MkVHO84aN3xEDvQO7JdQSrmPXj5d/P/J5b24qLqyksELuQU+
 x7XfC/knIm1oweMKismyCQ1132+PSUccg2uYZ5K14weuio0nm22YeJKc9Sh/SUIGeP2L
 GZfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706102734; x=1706707534;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yu0JA5DFgFaU5CwNCOFmY77G5L3S5T+P8RtJ0zkQaJo=;
 b=R5arnJKPLmudC7F++uP/tK2q8MC3FW574dQYcZ9pUGtgVw44I/cJUxKIwJBFHXCvm0
 awuHT5PgRB2xeW4qJnRFegdxw9uaq9+f/ie3emuKxkrvxNnxQP9p23hlBl6cK4fvXNS2
 dgG3xcJb58w6LptEHtDSgpYmxOt+UoQuJI76YPZXeSEL/5m4cP6rtiOnhmokSXp+k4iY
 Yj2Q4PjicTQeoibQ7qyCQt4UM5MsYmEL2Tr6vleJbGVNJ63CAyhz+u5tlSIAi3sb1a9K
 edRCoeNLVxyb7aZZN8znqDtKl2qLsF0QKcesVuvxm2w7dE+K8G9hEjlrnJAI1KZRdny2
 HvSg==
X-Gm-Message-State: AOJu0YxRRaY6sU9DkMcZen93EumVvjVjYXu2XIXqsMVYrqY68l9R1mCB
 4xPLFmVLy8O5XwdgwO6tCvUB0+fJry+vs8ll3V6YHPSzl/Z5lnisUJLxtQ2IuGRg6/7DPBbivzI
 TtDyIgAqRNTDKz1h6QhsmfncKWto=
X-Google-Smtp-Source: AGHT+IEW5PoeqcIOrC1/orXHLsWdUYhfJGnZD6id55p9vFC93T8lqRhoeEsyoAC6IGunPwnO9Pt1AivCT/dXiJQh+yg=
X-Received: by 2002:a05:6870:f208:b0:208:b33e:7 with SMTP id
 t8-20020a056870f20800b00208b33e0007mr3261589oao.19.1706102734254; Wed, 24 Jan
 2024 05:25:34 -0800 (PST)
MIME-Version: 1.0
References: <20240124-etnaviv-npu-v1-0-a5aaf64aec65@pengutronix.de>
In-Reply-To: <20240124-etnaviv-npu-v1-0-a5aaf64aec65@pengutronix.de>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 24 Jan 2024 14:25:23 +0100
Message-ID: <CAH9NwWdohzT=3asJVGWJECDKRxguXRRr40QsHJYecWibT75Agg@mail.gmail.com>
Subject: Re: [PATCH 0/2] drm/etnaviv: Disable SH_EU clock gating on the
 i.MX8MP NPU
To: Philipp Zabel <p.zabel@pengutronix.de>
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Russell King <linux+etnaviv@armlinux.org.uk>, David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mi., 24. Jan. 2024 um 10:22 Uhr schrieb Philipp Zabel
<p.zabel@pengutronix.de>:
>
> The vendor kernel sets a previously unknown clock gating bit in the
> VIVS_PM_MODULE_CONTROLS register to disable SH_EU clock gating.
>
> Import new headers from rnndb for the definition and set the bit
> for the VIPNano-Si+ NPU on i.MX8MP.
>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Thanks - series is
  Reviewed-by: Christian Gmeiner <cgmeiner@igalia.com>

> ---
> Philipp Zabel (2):
>       drm/etnaviv: Update hardware headers from rnndb
>       drm/etnaviv: Disable SH_EU clock gating on VIPNano-Si+
>
>  drivers/gpu/drm/etnaviv/cmdstream.xml.h |  52 ++++++++++++++--
>  drivers/gpu/drm/etnaviv/common.xml.h    |  12 ++--
>  drivers/gpu/drm/etnaviv/etnaviv_gpu.c   |   4 ++
>  drivers/gpu/drm/etnaviv/state.xml.h     | 101 +++++++++++++++++++++++++++-----
>  drivers/gpu/drm/etnaviv/state_blt.xml.h |  20 +++----
>  drivers/gpu/drm/etnaviv/state_hi.xml.h  |  28 +++++----
>  6 files changed, 174 insertions(+), 43 deletions(-)
> ---
> base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
> change-id: 20240124-etnaviv-npu-627f6881322c
>
> Best regards,
> --
> Philipp Zabel <p.zabel@pengutronix.de>
>


-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
