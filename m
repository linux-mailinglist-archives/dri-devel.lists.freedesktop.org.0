Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F3C95CD7D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 15:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C074910E80D;
	Fri, 23 Aug 2024 13:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IqO6LKFy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA54310E80C;
 Fri, 23 Aug 2024 13:13:53 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-7c2595f5c35so195653a12.1; 
 Fri, 23 Aug 2024 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724418833; x=1725023633; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KlMOJ/6A2fvxCoKdrNZuS0N59bJkqzjAMDDegTrgW44=;
 b=IqO6LKFyK0NGUnfsxa/XB0SBYbbLmGMYcp5DmJxhUG15djxte47Wsbp657yH5PMHfT
 L0hG8s+YTAIM7qPGBorrg1Qk6C992vqbLucSwDS8FUCOIu983bCfXt7Bnkk9bkXR3GeE
 G6iLy7UlryWoGkxPYce9fVprv4/hC0jbQ5iAzF8PCSLr6GDFFzmhVZ+CCNsSbGdkhd/U
 HvapiVGMbsNtHLAOiEmA6h1ZGWARpBXOCRjdUuaqBKbm3gOqjYiDzacaDQOavghlUj6x
 zb4VCkgTKoYsC5SPrU3YlQd8v9HsuUg2qgEjWdzm1ZUaBAVm9iTLPArN5+ctVLEJLYo0
 hELg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724418833; x=1725023633;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KlMOJ/6A2fvxCoKdrNZuS0N59bJkqzjAMDDegTrgW44=;
 b=EJrRy40yIUm5Y7VCAF+CIZoKcEpgaAtc2XclPiIXffJz12JkB7VpQWpKO2IZmA0ZwA
 JyUZ6v1GCPKJTtF4EXwSbVt51XhvRtXG1ItKxonRGdac5OqTZSq0VChgZlp/iO4gM0W4
 GccYS5XHuzhJliMVGetdlwnOccJJfVOrKH9fF4XeLWYsI81BI8ELi6fyaW4cdaZRpcTj
 y2PJBXFC3vDFcePSP8qLeLrjXp396PLyFeKyjLPid3C/U5WaLANfmBZ+lBkSR3EMOwqg
 A7ydOrDExRuHQItCYe38hxqUso7hzMsUTE+Wabfwm/dZNlAITsMZb9jnTL9er0UUS0CF
 UKaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyUrFFVp+oJrqvQ1aa8z+jjDYoTqwdJhr5yXje37zXtiywjnxwVH7kEiZcTxo/C3AvgGrtJDr+cCQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzk+/uhNd4wvP9CWIWUBqkNFkvDT1hL1iZGB4gfPIFPIaA+4VdT
 vBU7uVFg70sKOJgaE2BNX3lIWHGomT7ok/EnFPohYE6g/2B1e7XELGpvru2yUDEf2Qycv5VKI57
 W1s+64odofSjdc4E9EhoHfg7Az0s=
X-Google-Smtp-Source: AGHT+IE2E6tM+02fHIv6yuOthFIR6Cw3HvfR5uY1SlfEVgrtGQ/OWIzBdbvGdZxoGCf3ePjSXVzgqIDyF2eRv4NJs/I=
X-Received: by 2002:a17:90a:be08:b0:2c2:d11b:14dd with SMTP id
 98e67ed59e1d1-2d64672715dmr1275764a91.0.1724418832970; Fri, 23 Aug 2024
 06:13:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240820134600.1909370-1-alexander.deucher@amd.com>
In-Reply-To: <20240820134600.1909370-1-alexander.deucher@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 23 Aug 2024 09:13:41 -0400
Message-ID: <CADnq5_NsyR2eexPnsdx-RCWYef7SyuPed3r076+ZFhuBVxxPAw@mail.gmail.com>
Subject: Re: [PATCH] Revert "drm/ttm: increase ttm pre-fault value to PMD size"
To: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Zhu Lingshan <lingshan.zhu@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Ping?

On Tue, Aug 20, 2024 at 9:46=E2=80=AFAM Alex Deucher <alexander.deucher@amd=
.com> wrote:
>
> This reverts commit 0ddd2ae586d28e521d37393364d989ce118802e0.
>
> This patch causes sluggishness and stuttering in graphical
> apps.
>
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3564
> Link: https://www.spinics.net/lists/dri-devel/msg457005.html
> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> Cc: Zhu Lingshan <lingshan.zhu@amd.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> ---
>  include/drm/ttm/ttm_bo.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index ef0f52f56ebc..6ccf96c91f3a 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -39,11 +39,7 @@
>  #include "ttm_device.h"
>
>  /* Default number of pre-faulted pages in the TTM fault handler */
> -#if CONFIG_PGTABLE_LEVELS > 2
> -#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
> -#else
>  #define TTM_BO_VM_NUM_PREFAULT 16
> -#endif
>
>  struct iosys_map;
>
> --
> 2.46.0
>
