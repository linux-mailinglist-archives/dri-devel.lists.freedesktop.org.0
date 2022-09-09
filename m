Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB625B4139
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 23:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC1810EE75;
	Fri,  9 Sep 2022 21:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0350610EE70;
 Fri,  9 Sep 2022 21:03:39 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 l5-20020a05683004a500b0063707ff8244so1831289otd.12; 
 Fri, 09 Sep 2022 14:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=Uoykyxij3BRm1w5cdSKbAr+cIMg9xvL7iGqxWJmeYek=;
 b=HD5+ddLacg39N7Vajzea2yIM1/+0ldtqLs90PkGSdQv+4kFvY3XKozrjGBvRysfabb
 Wmz80kO4jUSBo+7YqO8TVJEHTHZx3/O4XKH+aQE8NcWa+FbCoyLPI77nbPcofjr4bT1m
 s8O6gfLDm4lbpTnXbkOVcHzqVlwxeybBDYzhUb1yZIeXsFMcHSM3+wz/y8JqyPgpZLje
 9M6Ya/dAIO2CDrLhoMomJ/eG2nsKAuXgnqZz8I5GkqBDSxrs4+ap4Bj4hDDswbrEiKtH
 eUls1+M5Ac9UjDP89BrLHec8mOXGiIWTDP1j/gLROyHpSbJb0R0xXppPEzHg0eKjI/4h
 61Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Uoykyxij3BRm1w5cdSKbAr+cIMg9xvL7iGqxWJmeYek=;
 b=2nkwdyCWjp+Fdbs2Uc4gfeEglyHWKSmc/gEaHW0xcy0SSpzzxFo/MWiqN2ICFb6Hnf
 Tq21d5b6anblfaw/ubOrT6RN1P9x0jrPCDSyht+qi/cVd+5gQwOG5CHZPnAc6qxc4yIu
 dCJ5/O5mwo9cfkfPRGcN8UvRCn6pX2oqTZ5aii9qkFCskekXcM4ty3YcCqlx2gOfNGlX
 aGYIoTgoLqdvHxJQX/Zp84FAz2y9SPbLc1/eQ76IxFS6rR9sxo7AA+hWjEl5Qlj252CY
 xwD3IWUwutQyuSes1TlCx1ISZTaeB3uxtmhJvn1CpPPHLAM43jv6KZaAmTo+H0u8QS9o
 kvnw==
X-Gm-Message-State: ACgBeo2xk5BaEntyHjzH9y8lz9aMfX1QKElgAqT6W+pq4ZVZiGd69psS
 YQDA7hDDHT8pm/B+8r2tfhjW3/0Cei6bUrzJ6zE=
X-Google-Smtp-Source: AA6agR6TZ9fogjLGaU3AxZnOhtRZz+/6i3v9xw3ySQTdHb/U1ZUrlqcM/Z1KxrY61qFXkOO3Nv5aZ4HxqRJ26zzNjP4=
X-Received: by 2002:a9d:12ce:0:b0:654:9bf:94ee with SMTP id
 g72-20020a9d12ce000000b0065409bf94eemr3424986otg.123.1662757419121; Fri, 09
 Sep 2022 14:03:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220908085022.1263639-1-jfalempe@redhat.com>
In-Reply-To: <20220908085022.1263639-1-jfalempe@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 17:03:28 -0400
Message-ID: <CADnq5_P8VRw80TC5Tw6C7vYvgM5+-DP1=Uoz_TesBZ19OpD1=w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Remove var declaration in
 dcn32_full_validate_bw_helper()
To: Jocelyn Falempe <jfalempe@redhat.com>
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
Cc: alexander.deucher@amd.com, Ethan.Wellenreiter@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Already fixed a few days ago.  Thanks for the patch.

Alex

On Thu, Sep 8, 2022 at 4:51 AM Jocelyn Falempe <jfalempe@redhat.com> wrote:
>
> The variable i is already declared as uint32_t in the same function.
>
> This fixes the following error, when compiling this code on older kernel:
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c: In function 'dcn32_full_validate_bw_helper':
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:1018:3: error: 'for' loop initial declarations are only allowed in C99 or C11 mode
>    for (int i = 0; i < dc->res_pool->pipe_count; i++) {
>    ^~~
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:1018:3: note: use option -std=c99, -std=gnu99, -std=c11 or -std=gnu11 to compile your code
> drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/dcn32_fpu.c:982:11: error: unused variable 'i' [-Werror=unused-variable]
>   uint32_t i = 0;
>
> Fixes: f5b9c1ffabce ("drm/amd/display: Re-initialize viewport after pipe merge")
>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
> index 8e4c9d0887ce..56f02b1ea808 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn32/dcn32_fpu.c
> @@ -1015,7 +1015,7 @@ static void dcn32_full_validate_bw_helper(struct dc *dc,
>
>                 dcn32_merge_pipes_for_subvp(dc, context);
>                 // to re-initialize viewport after the pipe merge
> -               for (int i = 0; i < dc->res_pool->pipe_count; i++) {
> +               for (i = 0; i < dc->res_pool->pipe_count; i++) {
>                         struct pipe_ctx *pipe_ctx = &context->res_ctx.pipe_ctx[i];
>
>                         if (!pipe_ctx->plane_state || !pipe_ctx->stream)
> --
> 2.37.3
>
