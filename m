Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D9E672F7B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 04:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A6510E6F4;
	Thu, 19 Jan 2023 03:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53E2210E22C;
 Thu, 19 Jan 2023 03:29:06 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id o66so713659oia.6;
 Wed, 18 Jan 2023 19:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2aM8iDrd+dulL6aZ193yV7HSVHkd3onqhyS0eiH7EX0=;
 b=K3bnMRBl9Y5G7sg8Q20fp9EUqQJEM9w2rAGCeEJ58/yVxvNV8lUnk2IDjoLVfPT+ys
 x64Y20nIFx1l5qAWb7zxuFNapkKW7Hxn2ELf1m4OONKh+ztXgIxaTRyeZztDWf9xkaHk
 0rHHhCaQ6AI6KmOHN1mV5sZVBwrUOA18PRAcI3g2hMs3ZnCooY9Mfgz65YsYKjpXw3JL
 u69FS4H4PNBqTvOo/RDAU26z3ufRx6ASdWfO5Pqxbwxk6YfI4uSGDt9qjTkG9M5tEL6r
 tFuq7q8U5jCf6PUs0/lotWNoaWWuHCnNe/JXMDdKB2vAfVVyLF65DZ4iZyibQLDvzeXc
 BlSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2aM8iDrd+dulL6aZ193yV7HSVHkd3onqhyS0eiH7EX0=;
 b=xUH6MB6Ez1ZOKi1TPQyaLVsk/CnU8OlqHOBPt0ARl4EtuPCLztwntIpbQVAyzaN9bM
 WdGJLp/WFG1XwfcBSkm6vCAEXSIq3VLbOoC5tjeR0q63CKcTDPlTPWmvO3KzbHrU9ixG
 InNq2HJf+X7JTLkLr/Co+CheBtAKq6tl65m3/KQfxPWHHF9Oic+tH8ITCaOcJMh8R3ab
 zQJlkVoftEMgr3+od2ziiaKWBlX/tj+X9tTolx+o8uRci3xege+QMqGO3Iv2UNKipDZ/
 pubbydFRmK/aBcIICa0C/YQnquMYh2ucvBhA3GVMiH+sNXoAQYMWrrT5bfBe6/9EP/GP
 CjIA==
X-Gm-Message-State: AFqh2kroLKC2fPGuw0YhZm6Bi8yBhoAw07RHBTdXLuTIu3AjswyXZoqK
 CWCX/QEJd6ThTEz1LOg8xTBTq/FgNrwbzLukwyw=
X-Google-Smtp-Source: AMrXdXuhtNH+PLsKPrU5l4hivxjoTe0rrDnG6rW/fskBNkyXJF2zC/DPYgTMixpy74dNpdLMr6ffM0kYKE6NWxm0UO0=
X-Received: by 2002:a05:6808:4387:b0:35b:d93f:cbc4 with SMTP id
 dz7-20020a056808438700b0035bd93fcbc4mr541759oib.96.1674098945563; Wed, 18 Jan
 2023 19:29:05 -0800 (PST)
MIME-Version: 1.0
References: <202301181539003991927@zte.com.cn>
In-Reply-To: <202301181539003991927@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Jan 2023 22:28:54 -0500
Message-ID: <CADnq5_Nb-UQheq7rV5x6taOjj+tQT4sGB_0unj3scWBO_EGDHA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove duplicate included header files
To: ye.xingchen@zte.com.cn
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
Cc: sunpeng.li@amd.com, wenjing.liu@amd.com, xinhui.pan@amd.com,
 rodrigo.siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, michael.strauss@amd.com,
 dri-devel@lists.freedesktop.org, george.shen@amd.com,
 alexander.deucher@amd.com, jun.lei@amd.com, christian.koenig@amd.com,
 jimmy.kizito@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jan 18, 2023 at 2:49 AM <ye.xingchen@zte.com.cn> wrote:
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> resource.h is included more than once.
>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index 1e60827911c6..6747e4b199de 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -47,7 +47,6 @@
>  #include "link/link_dp_training_auxless.h"
>  #include "link/link_dp_phy.h"
>  #include "link/link_dp_capability.h"
> -#include "resource.h"
>  #define DC_LOGGER \
>         link->ctx->logger
>
> --
> 2.25.1
