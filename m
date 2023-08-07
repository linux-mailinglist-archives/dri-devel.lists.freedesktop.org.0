Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B7772C7C
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:16:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3993510E33D;
	Mon,  7 Aug 2023 17:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884C410E342;
 Mon,  7 Aug 2023 17:15:50 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1bc479cc815so3724637fac.1; 
 Mon, 07 Aug 2023 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691428550; x=1692033350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4m3xuKNdJcZIePVdi/jofYqM8RdbxjSwEerdMBOOUK8=;
 b=SCCOePbPZnapZSA5B1Ros9GJtERXnzDGC0xiuzNykqYbvoP4bswsdxYEwz9Mvj7QIs
 D6Ob6OLoQ0fcmHdcSbXP+EQWUulW5emO1lAB0RXt1wCnAQFB/TZdCYHvsJg1IRZ6tlbU
 D0fW1IHN8vKYrDRjdSDGnMibrU1Aca6zv/QEq0IScIVz7HujGSINIvAkQ3bgekbnPyft
 YI08shKQm7OsBrfkIMna9La9tK8RG+PcflLVHHcnoNVIb46zwxBQRCeRe44aQkQ0C6aV
 0FhtLvOWGvz2AteQw24dMO11cukntHgRkQRymnIhzvRf/v8YXzx3eWAbf93A5fc9LZap
 1Hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691428550; x=1692033350;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4m3xuKNdJcZIePVdi/jofYqM8RdbxjSwEerdMBOOUK8=;
 b=Ds8F4eGbtlkX6WFVcqhP/tk+yAqwi0a6WWfwnAvFzyEM8YBY3FO3e8cOSlzgkysuD6
 eO0XFVvhrDdnMoTeEiRHGCnJK2MTjONfhxz5BNTJ6vUtbD+T9lrkrhTZmihvF1GgctsM
 /5XDsDI+RQXhhXR1SLO8oaY+CAWC2oIwbcgbPYcxM/nEt19IRdaTHVZ7Pqup9JcOQaM4
 RnraWRZ2Y1pXzlWZacP7ZCzvPattWPiJ7xQayRuaeXziNfsZq8FpRb0RPBcBv1p/Hqsi
 SgUYJWF4pghHnMRmh7thm3rEXConiiT0uVRlfGsVtxziY4erahJ8iWsm//mzvUXGgOc+
 7U5w==
X-Gm-Message-State: AOJu0Yzbcb/y+B68qqqcy01O44dxfSGmSkfCWsEttt4zOCv4oL36+666
 JtoS+/WtKvScYbTBk2XzUeUuCmjsljqpLs+Fnew=
X-Google-Smtp-Source: AGHT+IFtgkgUChmpyB8Apd1TuU9yc73Zlt+MN4s5triOEcUmrMommjPckPwTZuc3AHbgXbIjMhGv/KjtP9AYdXx8cNo=
X-Received: by 2002:a05:6871:5c6:b0:1be:c688:1c0 with SMTP id
 v6-20020a05687105c600b001bec68801c0mr12673762oan.47.1691428550102; Mon, 07
 Aug 2023 10:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230802062559.11421-1-sunran001@208suo.com>
In-Reply-To: <20230802062559.11421-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:15:38 -0400
Message-ID: <CADnq5_P=vzR3yka11aaLrfLobTFfn+-pvD1yR7F0ccRFN=Qk7g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Clean up errors in dce_clk_mgr.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Aug 2, 2023 at 2:26=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: spaces required around that '?' (ctx:VxE)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c b/drivers/g=
pu/drm/amd/display/dc/dce/dce_clk_mgr.c
> index 07359eb89efc..e7acd6eec1fd 100644
> --- a/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/dce/dce_clk_mgr.c
> @@ -640,7 +640,7 @@ static void dce11_pplib_apply_display_requirements(
>          * on power saving.
>          *
>          */
> -       pp_display_cfg->min_dcfclock_khz =3D (context->stream_count > 4)?
> +       pp_display_cfg->min_dcfclock_khz =3D (context->stream_count > 4) =
?
>                         pp_display_cfg->min_engine_clock_khz : 0;
>
>         pp_display_cfg->min_engine_clock_deep_sleep_khz
> --
> 2.17.1
>
