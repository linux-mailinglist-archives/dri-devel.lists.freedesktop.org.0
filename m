Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A4F383AF7
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 19:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8E46EA00;
	Mon, 17 May 2021 17:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C9C06E9FF;
 Mon, 17 May 2021 17:16:07 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so6182949otp.11; 
 Mon, 17 May 2021 10:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1xBDaVEbXGRu9l052Wzwx34wSV2NVJtrXnPmwUuBm64=;
 b=XySfAYGTZ6DPQW0mCUYcdwG2BOfs4TTQzxXT7geirkcLqoNso8TymlO0DSxQ4EUra1
 evUNyjAjtQUR9YCCUaHUFShQpNAJuYQfOa1tfMO3HwMafowImonDBqEaxyp/wInH2qsp
 8ppNl3XUt1jqumyB3gCRIRwgonKojBIzBLdq7jdfiLFZi+VWVyZN7ijkA85ndt8iK+/H
 UKOicrMy/po61xxK7gmiacDC48JagET7k653aqzZ2ZQRtlreqB+TwLJGlA65LuyGfFrL
 UvKReqvupNRQZ9VsxPRCMY/Vk1QkrUP/TDVOtgM7RWu06YCNNwCYyBboQ0ahNymOyneT
 69cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1xBDaVEbXGRu9l052Wzwx34wSV2NVJtrXnPmwUuBm64=;
 b=nDkRz71YkGoHCjhyshZVs2t3t6GNabspjOTEGMwr4In3C8OiHKaPprFzq+V6YbB5l4
 Q/sT7/CYYm1K4Rlq/TTHzUQBtwC9sp5D4o8cH8Nj/6Eyz4KxsIiuiP20TPydiH4Nz1QW
 Wa0/0WYAXJ5ZD3ht2510MkgnDyzfSiH2qHqxxxxkXWgKOReOlmqMx8f4ysQhHmQ7kYZG
 CoTXJmSIMeWbXEosjaZzCwq+2tZfmv46UXarq5k69pxtIFFrDndAwjj9I0wTXy+oJTKl
 04zaLj3Odqej9KGIoxsvGo3vrspJQT8mp/S+aIvzXGvqHeuNYIIq6DpjkvjkNVc9th2n
 C6Dw==
X-Gm-Message-State: AOAM530DgzVWtQPQgIaz2kjHqxPOJcvQPoqQHlLHizcwcTRyOoI0iXXh
 sOpP5VCcoqfZKHCGZA8qZVUust7fyvMPpJYxnno=
X-Google-Smtp-Source: ABdhPJyNkLmTwrVqlUZyWSMcpDD9a5UrsmvHIT/nk2h2CKZYzPsfx42ok1JoA9q3mzE6yfWvGXXd7jiPsNYb3o6AmkM=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr481703otl.311.1621271766808;
 Mon, 17 May 2021 10:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <e5f8613b96fe43bd8ab2ac304a2c9fb57a87a2ca.camel@perches.com>
In-Reply-To: <e5f8613b96fe43bd8ab2ac304a2c9fb57a87a2ca.camel@perches.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 17 May 2021 13:15:55 -0400
Message-ID: <CADnq5_M98GPrHk6cdbieBtFDQYaauHzj1gm-OXn0bYTRjtgzAw@mail.gmail.com>
Subject: Re: [trivial PATCH] drm/amd/display: Fix typo of format termination
 newline
To: Joe Perches <joe@perches.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 15, 2021 at 1:01 PM Joe Perches <joe@perches.com> wrote:
>
> /n should be \n
>
> Signed-off-by: Joe Perches <joe@perches.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c   | 2 +-
>  drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
> index 45f96221a094..b38fee783277 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_resource.c
> @@ -1724,7 +1724,7 @@ static bool init_soc_bounding_box(struct dc *dc,
>         DC_LOGGER_INIT(dc->ctx->logger);
>
>         if (!is_soc_bounding_box_valid(dc)) {
> -               DC_LOG_ERROR("%s: not valid soc bounding box/n", __func__);
> +               DC_LOG_ERROR("%s: not valid soc bounding box\n", __func__);
>                 return false;
>         }
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
> index 5b54b7fc5105..3bf66c994dd5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
> @@ -1497,7 +1497,7 @@ static bool init_soc_bounding_box(struct dc *dc,
>         DC_LOGGER_INIT(dc->ctx->logger);
>
>         if (!is_soc_bounding_box_valid(dc)) {
> -               DC_LOG_ERROR("%s: not valid soc bounding box/n", __func__);
> +               DC_LOG_ERROR("%s: not valid soc bounding box\n", __func__);
>                 return false;
>         }
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
> index fc2dea243d1b..84c61128423e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn302/dcn302_resource.c
> @@ -1093,7 +1093,7 @@ static bool init_soc_bounding_box(struct dc *dc,  struct resource_pool *pool)
>         DC_LOGGER_INIT(dc->ctx->logger);
>
>         if (!is_soc_bounding_box_valid(dc)) {
> -               DC_LOG_ERROR("%s: not valid soc bounding box/n", __func__);
> +               DC_LOG_ERROR("%s: not valid soc bounding box\n", __func__);
>                 return false;
>         }
>
>
