Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FFB1F2093
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 22:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FC589D4F;
	Mon,  8 Jun 2020 20:16:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE0F89D4F;
 Mon,  8 Jun 2020 20:16:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x14so18864757wrp.2;
 Mon, 08 Jun 2020 13:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Uk3yl1D/RpkBqrAcsQCxgo9zOQry2M3RLC+d4sbwjc=;
 b=KaUV47mtAjCf/bz0YZHKdm++WkOzlNNqKOTlrQl5HMnHCY4tg4SpP9NUUalsTQSIPX
 SbtkTrdwAOQPFfCntH8S42NPOWYQlS+joCK6Cqd5jltJP+L/BTLeXSqjHffJXJY7uw3z
 2n3pO+LVOi3m5d0dG0c0QZ7+H3gzRF9K7nWjTgy9CO4xPwyCdbMmChzGlEeCqrSHnxJm
 fr9udMEvUnGGUq+l+rSOJnhEq7ThCvD7JykrAZg7fYBK9DGaNheE9GgZTdSdEnQm2QoG
 +MiH+IgkcWX8jkW+g16y+d0G2iNcpiv6zpYMG6WNcfvHkiCZViIs5F3SM1AUANx6RNZV
 kAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Uk3yl1D/RpkBqrAcsQCxgo9zOQry2M3RLC+d4sbwjc=;
 b=hyVhzvouqV/nwdh6fBBO/4cOiCHDFSgjhbS0wAYcf735TX+hB4g5QLTKt2RVTYklfR
 TVZyXtt3Fkg3UlAJoHkmCL1JA3bKysYFc2vdJSL/CCOyVjOcFjoSIn5PfmovALeMqkNe
 IINZc0Q0ZF9pbNjAbLa9Y78lpcuQh/HkPRjrQva7OmaoI5n+VO5SVuvjrsdEpG2KisL9
 uvDfLardNcE67Nnbrzl4Hq5SMgoPbR0QdqZLGxO7IB4+ZpltQkjmSbZxn2rLQz8wPtR0
 ZF7ZRJstXx2WUp4NLAgl0ZD7IbPI637FIYiIND+2vQInSvEs0tRXebCi9L9Cdkd2Jf6z
 Fzmw==
X-Gm-Message-State: AOAM533JsW6VuEhJfwUBVAsWplu2QeadyjHwWtOcFOLrZEMU2Q8VHR9A
 AUG0mZjSejsxqW/8cJ/rC7a/T7Pw6lZENcKZZTo=
X-Google-Smtp-Source: ABdhPJx9dJpsk3rcGGUxOzw0jvEvBmj8RgagpHeQThpZRVMrnNVNvHPnxS+rDhvphLPshA4vOZFQRgrWilTTcYy9cq8=
X-Received: by 2002:a5d:6789:: with SMTP id v9mr566434wru.124.1591647417434;
 Mon, 08 Jun 2020 13:16:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200608141657.GB1912173@mwanda>
In-Reply-To: <20200608141657.GB1912173@mwanda>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Jun 2020 16:16:46 -0400
Message-ID: <CADnq5_Mg2kJOmD40VyVNqbKnKU89QaNRLJ7dbre_pLDX2NuXog@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix indenting in
 dcn30_set_output_transfer_func()
To: Dan Carpenter <dan.carpenter@oracle.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 8, 2020 at 10:17 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> These lines are a part of the if statement and they are supposed to
> be indented one more tab.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> index ab20320ebc994..37c310dbb3665 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> @@ -203,9 +203,9 @@ bool dcn30_set_output_transfer_func(struct dc *dc,
>                                         stream->out_transfer_func,
>                                         &mpc->blender_params, false))
>                                 params = &mpc->blender_params;
> -                /* there are no ROM LUTs in OUTGAM */
> -               if (stream->out_transfer_func->type == TF_TYPE_PREDEFINED)
> -                       BREAK_TO_DEBUGGER();
> +                        /* there are no ROM LUTs in OUTGAM */
> +                       if (stream->out_transfer_func->type == TF_TYPE_PREDEFINED)
> +                               BREAK_TO_DEBUGGER();
>                 }
>         }
>
> --
> 2.26.2
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
