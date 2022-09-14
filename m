Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1B75B89A9
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 16:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78EE610E91F;
	Wed, 14 Sep 2022 14:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6FCA10E91F;
 Wed, 14 Sep 2022 14:00:16 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1278a61bd57so41162478fac.7; 
 Wed, 14 Sep 2022 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=Nhf4NUE5pNrO2iPn+duWxF+/BKciVlA3AuEHtMu2CkM=;
 b=aLjXaqxm731w8pTsLIJqD/I2r3nY06kTldoBkhB+GTNaSahVvmr04XDUCNS2awKrsP
 0sOo3DaKjjQXVYof4nLSJeFVwkH+VfffbTEjdfVu/wXmzrV9ILvlkVVe1s0QZC1QYHoT
 rPA4VzvgvpygZ9DEZiyMu7kayNhTLP9MI4j1Wv95mqAxL7OxrgJa0zaBrM+dbHIG0UCc
 dvsNAqvrRL8z++KlsXFsStXKaon9pqNvXrerCldvBwpOUKRXKKiore6NH93N6bRQHYiX
 dpqqPZwiI7zZs0dJ6/NGm7q5XJrHuqyiYsbNc/CHDsIP0XhnBA6xbEWLVF57nwToWoHV
 Nvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Nhf4NUE5pNrO2iPn+duWxF+/BKciVlA3AuEHtMu2CkM=;
 b=RTgDKvccxUkr6WvB7iF1G9M5a0jziIxA/nk1CpGdFXGEJuCEwhZU4ddExYg5ufn4o4
 8YvkTBm5Qzgi8hewe+dJmONb5UfzLFvwzIyGIOiGcVEoZDznabAEOh3e5rQknTdUW9UA
 GfoERLs5cdEtDMctdCJazXNsw3mdnxYAfGFQyXVYTWGBWYgx0a9F+v4P6BMkI5FzXwpx
 yufQTd802LMDGfCKzcAkW/Ga9AJ1YWffhK1g1rCdA3IjagRiqprc9kMMKNNUgFJegQSZ
 dBd0OnRzdpE+3hXUHyRC3kJ1nDvu0fHLp44E5x4dScwJ6+rMPLzlhSYLeBL0VthSeyur
 s2PQ==
X-Gm-Message-State: ACgBeo0XF+BjTcXLFZlclLyear8vQtz5fmdeUjrlpd9dRcBZBDkk+ark
 vjSXjA58tgfQAghNAwapwhGcX667RY4lS1zisfK1SpDo
X-Google-Smtp-Source: AA6agR4+0HrSlOBJVxUZRMY+wQKkAqM7Lq8kfvW+Hf/8efKDYKhqKL0TNMJEugeMxOFKaXEotpqoHFiDtk0gYbgOf+U=
X-Received: by 2002:a05:6870:1783:b0:12a:f442:504d with SMTP id
 r3-20020a056870178300b0012af442504dmr2643357oae.46.1663164016167; Wed, 14 Sep
 2022 07:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220914052742.116297-1-jiapeng.chong@linux.alibaba.com>
 <20220914052742.116297-8-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220914052742.116297-8-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 14 Sep 2022 10:00:04 -0400
Message-ID: <CADnq5_NmWKF+7UQov2oQ2JH5UW0Pzjw0bCUzhZWZQ=xH2mu17g@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/amd/display: make optc32_phantom_crtc_post_enable, 
 optc32_setup_manual_trigger and optc32_set_drr static
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: airlied@linux.ie, Xinhui.Pan@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

Alex

On Wed, Sep 14, 2022 at 1:29 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> These three functions are not used outside the function
> dcn32_optc.c, so the modification is defined as static.
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_optc.c:159:6: warnin=
g: no previous prototype for function 'optc32_phantom_crtc_post_enable'.
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_optc.c:218:6: warnin=
g: no previous prototype for =E2=80=98optc32_set_drr=E2=80=99.
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn32/dcn32_optc.c:193:6: warnin=
g: no previous prototype for =E2=80=98optc32_setup_manual_trigger=E2=80=99.
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D2140
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c b/drivers/=
gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
> index 1fad7b48bd5b..ec3989d37086 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_optc.c
> @@ -156,7 +156,7 @@ static bool optc32_disable_crtc(struct timing_generat=
or *optc)
>         return true;
>  }
>
> -void optc32_phantom_crtc_post_enable(struct timing_generator *optc)
> +static void optc32_phantom_crtc_post_enable(struct timing_generator *opt=
c)
>  {
>         struct optc *optc1 =3D DCN10TG_FROM_TG(optc);
>
> @@ -190,7 +190,7 @@ static void optc32_set_odm_bypass(struct timing_gener=
ator *optc,
>         optc1->opp_count =3D 1;
>  }
>
> -void optc32_setup_manual_trigger(struct timing_generator *optc)
> +static void optc32_setup_manual_trigger(struct timing_generator *optc)
>  {
>         struct optc *optc1 =3D DCN10TG_FROM_TG(optc);
>         struct dc *dc =3D optc->ctx->dc;
> @@ -215,7 +215,7 @@ void optc32_setup_manual_trigger(struct timing_genera=
tor *optc)
>         }
>  }
>
> -void optc32_set_drr(
> +static void optc32_set_drr(
>         struct timing_generator *optc,
>         const struct drr_params *params)
>  {
> --
> 2.20.1.7.g153144c
>
