Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5021218327C
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 15:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB2926EACD;
	Thu, 12 Mar 2020 14:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E36126E201;
 Thu, 12 Mar 2020 14:10:26 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m9so7631886wro.12;
 Thu, 12 Mar 2020 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z9pN5bnfB9UOGPPBmOZ+T30a1QO55ydc2k3sYdmcW5U=;
 b=NR1rKwJFKCpKBdFOSixakBU1LfBZYgL1ja4b92wMexZSj1lE2q5+MuAeq7wwehzMnY
 8mQ1YXCriAfreO0PYg4YDJRnD4rf6rmCHuRhQRand0tnPQ3ETIZJFxRxp6CODcG0oSiV
 alZbg1MInEptTSH0CgCpu2Czb3ME7Whpi2P6m05YH+tZh6HYIz8/vfrBn2bNrCfI4Tz1
 qolgY8dyw1MuANUII0CPwrPGFuQtZ4ozioq4TyDoKqUSOt3V4dxlI+2CCxBMZlKq20aI
 CDWJ0wNZeKSQPLYv42knyfiAoIOLLJrE/glxMsXynLHRF/ge7KbuHQ9D/+jgYxGK9q4S
 lL5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z9pN5bnfB9UOGPPBmOZ+T30a1QO55ydc2k3sYdmcW5U=;
 b=gT03Z4e06Cdr4h0GoB9WLQYpwYQ653AOe9+6kYCxCB7u0K/PlSG2GvZuE4HAzN9u4z
 FsKK92X6iXvLyeEzWFhLV1EovGTH+HuXIF6epdeBoNgUicLnEW+Hm6eAZOpSIIB/YZU3
 V/8XF67GpEAUKM5H3zFO2sa5t+4Z6xAb9WXh0d6QHC5wZO94vMWPgkKPKW9gQ1r78USy
 Xfp2MQ8+fmkWhmJJgF2poB3aNjlcZ1w4iBMIb4WURzBxn360e3sxg8eGQRZPiLQEluUw
 2vXCaz4EmYRdHaaPNelHyaU+lhFcwZS9atOyjCs+5/bm1DRJfYhujNdJ62BH6MeQdIIl
 ly1w==
X-Gm-Message-State: ANhLgQ1omv/HFGEgzTs3Fr1da45qh1VknSF9B+3GVpnYEs0fM/pSFLbZ
 kZcAeIxF2GDfa2xsBQREdZuvCEYuhsz8kmHtXeCjvQ==
X-Google-Smtp-Source: ADFU+vvHHg5y26BwqZU/LzLm11ufz4kziAJw4cWQh+hWSa1c3vndABADeU8cnh7o+ogAxkbeq1ZNsRjRSjTYi1qMhII=
X-Received: by 2002:adf:f74b:: with SMTP id z11mr11781048wrp.124.1584022225518; 
 Thu, 12 Mar 2020 07:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583896344.git.joe@perches.com>
 <4ee79adcba4e5ea80b3ef6271caeef6df4bf8ca7.1583896349.git.joe@perches.com>
In-Reply-To: <4ee79adcba4e5ea80b3ef6271caeef6df4bf8ca7.1583896349.git.joe@perches.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 12 Mar 2020 10:10:14 -0400
Message-ID: <CADnq5_NA+9VhVUGxPcJ8swu=qqPpPA+3-HK9fy5jAg5ko8TfwA@mail.gmail.com>
Subject: Re: [PATCH -next 024/491] AMD DISPLAY CORE: Use fallthrough;
To: Joe Perches <joe@perches.com>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  thanks! (link fixed locally).

Alex

On Wed, Mar 11, 2020 at 1:07 AM Joe Perches <joe@perches.com> wrote:
>
> Convert the various uses of fallthrough comments to fallthrough;
>
> Done via script
> Link: https://lore.kernel.org/lkml/b56602fcf79f849e733e7b521bb0e17895d390fa.1582230379.git.joe.com/
>
> Signed-off-by: Joe Perches <joe@perches.com>
> ---
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 4 ++--
>  drivers/gpu/drm/amd/display/dc/dce/dce_aux.c       | 2 +-
>  drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> index 2f1c958..37fa7b 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> @@ -267,7 +267,7 @@ static struct atom_display_object_path_v2 *get_bios_object(
>                                         && id.enum_id == obj_id.enum_id)
>                                 return &bp->object_info_tbl.v1_4->display_path[i];
>                 }
> -               /* fall through */
> +               fallthrough;
>         case OBJECT_TYPE_CONNECTOR:
>         case OBJECT_TYPE_GENERIC:
>                 /* Both Generic and Connector Object ID
> @@ -280,7 +280,7 @@ static struct atom_display_object_path_v2 *get_bios_object(
>                                         && id.enum_id == obj_id.enum_id)
>                                 return &bp->object_info_tbl.v1_4->display_path[i];
>                 }
> -               /* fall through */
> +               fallthrough;
>         default:
>                 return NULL;
>         }
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> index 68c4049..743042 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_aux.c
> @@ -645,7 +645,7 @@ bool dce_aux_transfer_with_retries(struct ddc_service *ddc,
>                         case AUX_TRANSACTION_REPLY_AUX_DEFER:
>                         case AUX_TRANSACTION_REPLY_I2C_OVER_AUX_DEFER:
>                                 retry_on_defer = true;
> -                               /* fall through */
> +                               fallthrough;
>                         case AUX_TRANSACTION_REPLY_I2C_OVER_AUX_NACK:
>                                 if (++aux_defer_retries >= AUX_MAX_DEFER_RETRIES) {
>                                         goto fail;
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
> index 8aa937f..51481e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_mem_input.c
> @@ -479,7 +479,7 @@ static void program_grph_pixel_format(
>         case SURFACE_PIXEL_FORMAT_GRPH_ABGR16161616F:
>                 sign = 1;
>                 floating = 1;
> -               /* fall through */
> +               fallthrough;
>         case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616F: /* shouldn't this get float too? */
>         case SURFACE_PIXEL_FORMAT_GRPH_ARGB16161616:
>                 grph_depth = 3;
> --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
