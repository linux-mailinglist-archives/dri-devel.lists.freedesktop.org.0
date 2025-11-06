Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EC7C3D85F
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 22:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2411110E6D5;
	Thu,  6 Nov 2025 21:47:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g7O+223H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CAC310E6D5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 21:47:04 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-28d18e933a9so74355ad.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Nov 2025 13:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762465624; x=1763070424; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uWPFs84U37BlV4HR4UfJZaWnurNpPXzSHUa9OWSU1Mk=;
 b=g7O+223Hh0w9Q4sO2QWPgvjs+BGq1eEWuVK1yeQg5AtupmuEYVGYeL5CSqoD8E7rBZ
 mZEfxzOvPAhEO5oqCpgHiy/orHTaQ9pW1cF6GKAvJeT48pvfAP6fI1G5/Dkoqbxz0clc
 jFQ04ppF/xkZpGfgfh829YgF0RW/kpEQF1QXNlkq3685PQY2s25lu6/q/5DNuSFnYbwo
 tJ3OwVwfJ1Uuup+/P9qr53FwDf/wKm1forMXcJH8v1GNpe5JsilPKgyFJzoxjj9HSG8o
 56suGVKVEhbplRZVUebPx9wp6UlzAtRpfrlwBzskoGCrPXeQvYrHs1X9BWyUsvT7t+U1
 h1zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762465624; x=1763070424;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uWPFs84U37BlV4HR4UfJZaWnurNpPXzSHUa9OWSU1Mk=;
 b=n1Tk8Vt49TtT3hPgQsg19lmk3fqYAx0ghXsZl88upcXXCZjwILjsvu2oJEfIWKcDL1
 Q9Ptslcy8GZLpaiWuzglI7SJi5roqwYIQSTGJy8ZSyaSeus5HrG2QS5HzeQ96qE5Kkmo
 6nxnT4AzMl43eX82Xf0+refkLBUivHIp4Nnhc369Cv67k82kbDvknJsbz1krK5iLrRkd
 lqPMzwVsVvRTtN6+sOGsb0TCOvDf2VM8fbSJAPdUdV7RNsw419N8HGYi0esd1h8KI2VD
 HTGJbXfe5OqS5cx326IvqXG6lURRYy2XoL0GAggYB8s9CUEPb4IkPR3h3M6g8hH9MmXe
 TK6Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUO/MOFcYfcwizPoABPPgQ1Y8pe+PIi6q9wz/Z1wlP6EaaEOwRh4VXPD4q5e0erb2sx4eCKzf8zWRI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvlegPTLhV5hT5KjjZQ5XTubmbwfnDjhNq16mATunARoi9awUg
 MLZqy/wybBLQ0XhlMXdI+NnaLd0k0uETV/dlbwL6bH7G597HAzd1tZlMC1tV7I+wZkqY/4RCAUb
 zuy7DwdlVhWRcpzjmNZzYDBkU/1slLQE=
X-Gm-Gg: ASbGncvo7Tj5KefHAYbj8SEedZOJnyjM6i/le4Q3iecsaUKVeq2wISDlfoKcnzcN0kD
 5zLpz8q6SZNWvgK6MYPRu2gZD8eQqLpxzONwGC5iR7+yVHlXodXKwtY7k/zTu3FXidstGRzDL8q
 gf80045bPWtKxOLNwBeGuEDFkuZS1jVrZUZRgUsuwy/Ww15Z9VdEr7SBwvaLxpxztxQWKY3TD70
 cSLGbezGL99+jO3Tb5PtYMWhopistw6b2nSfnChmNnW0nDI8HKjTRxeVdg7
X-Google-Smtp-Source: AGHT+IGwLxGeQwObIqsiRu60FgdR14mXv74V9sIBJquRbETpjgO/u71xJ576vnpk0XVXFQIkzHnAysyK3vaO7ZiVXAg=
X-Received: by 2002:a17:902:e552:b0:295:2cab:dbc2 with SMTP id
 d9443c01a7336-297c045708bmr8072615ad.6.1762465624074; Thu, 06 Nov 2025
 13:47:04 -0800 (PST)
MIME-Version: 1.0
References: <20251106014747.46768-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20251106014747.46768-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 6 Nov 2025 16:46:51 -0500
X-Gm-Features: AWmQ_bnzUjJ6HcFWpYUZnTLKwOZeb_N2f4pDuMRdliAyH8rVEieFGHJCx9d4LU4
Message-ID: <CADnq5_N5bZ20A4gwfKevVgzTrTRw=pGPmXEB+1wTMNMqfOHy2Q@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu/userqueue: Remove duplicate
 amdgpu_reset.h header
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com, 
 simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Abaci Robot <abaci@linux.alibaba.com>
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

Applied.  Thanks!

On Thu, Nov 6, 2025 at 3:56=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> ./drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c: amdgpu_reset.h is included m=
ore than once.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D26930
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_userq.c
> index 836a14ef0052..9a969175900e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
> @@ -32,7 +32,6 @@
>  #include "amdgpu_vm.h"
>  #include "amdgpu_userq.h"
>  #include "amdgpu_hmm.h"
> -#include "amdgpu_reset.h"
>  #include "amdgpu_userq_fence.h"
>
>  u32 amdgpu_userq_get_supported_ip_mask(struct amdgpu_device *adev)
> --
> 2.43.5
>
