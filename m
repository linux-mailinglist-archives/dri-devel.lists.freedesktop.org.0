Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48202760184
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F94D10E377;
	Mon, 24 Jul 2023 21:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D636D10E376;
 Mon, 24 Jul 2023 21:48:59 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-1a1fa977667so3732999fac.1; 
 Mon, 24 Jul 2023 14:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690235339; x=1690840139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YVY78p9bK1Bp6OYFjZ0D65jc+/ozxlt9gkf3mIG8qJ8=;
 b=AKnH7nIE0azuBGdLAsUV6B+JFdb4MLuYJ0UlSAS2gs1T9+kYthwsHiwxJr+Fbf0fTy
 pSDELav/FGFKtsAJE63ztr+eJlck4VA76wgASUTMlngySxvZN6QfqPvN/BzkfQLyt583
 BqQR/XnRPy4f6moz1TTvPEbG2pkZZfa6JN6nOmieVJ25bl3cFHlPzSIchW/yq8QYSZfe
 vMBbMvvSVm+fj0nkDCpJ0RUWMrrhrJMS+FdLG/gu9LL/3jU1pPCj2ufRk2++lzbrv0kJ
 /BEAkCIybgWQ4XUf4lfPzlOo6h9QMzFoaeXq1N3tn+p4Pnzh6przonv4AR+KpNXt9Pa9
 wNBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690235339; x=1690840139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YVY78p9bK1Bp6OYFjZ0D65jc+/ozxlt9gkf3mIG8qJ8=;
 b=Z4qRaqssUvSYaSrs8i5t6y2M5hE5t69La6BCJhFLC+NeVOuury4dnQvGWXoN3eqcPq
 a5tvD8XioGcMi0BBh2kTmYymJWME6XpNcC6yj8M+yGiW2uLWmfm3W7xpwQIMJ7T0aCFp
 VhnQt54fvTDD3DIGxwZSM0zWY98K9LZKGm2OTBRcktOm+3pAbysNzi8l24dVISjwGzh/
 NE/BYfH0sdIBhO0Pvx50wCPTkInm3GHKoXBiAxrtXxw+7/w97IMOhDaDdkOn5q9pnhol
 fo0+yV9x3Y1NRFMcEbqs9y/K4mM+JVukOF1uqqwQutaWGUzmHiJQo7h/jcAWiKqEbrk/
 lIAQ==
X-Gm-Message-State: ABy/qLY189Aq/hvLd5WxLadH6mrXGNxP1akdj+gOqi2AYb4QMgXbqqkU
 979WRUv5PrWxd6rtiNoUYKn5r0kIZ1g54Lay+rg=
X-Google-Smtp-Source: APBJJlGgr3DhZc0jXmHDid6h9Mxlb9XBB2RmEVIUhyDqVZljQi4ueZYRt1nuTrOWo4YPqZWKDcG8zypeh8Bs/PT39Rk=
X-Received: by 2002:a05:6870:b491:b0:1bb:91de:7f92 with SMTP id
 y17-20020a056870b49100b001bb91de7f92mr720387oap.23.1690235339063; Mon, 24 Jul
 2023 14:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230724073153.9003-1-xujianghui@cdjrlc.com>
 <71605c0ae02fcfd1d044aa9e52088543@208suo.com>
In-Reply-To: <71605c0ae02fcfd1d044aa9e52088543@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:48:48 -0400
Message-ID: <CADnq5_O=iGXp7+6GFGieroFxng9-h3L_sQ=BWp0Lhv8ZFA0QYQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in arcturus_ppt.c
To: sunran001@208suo.com
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

Applied.  thanks!

On Mon, Jul 24, 2023 at 3:32=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: spaces required around that '=3D' (ctx:VxW)
> ERROR: spaces required around that '>=3D' (ctx:WxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> index 3bb18396d2f9..c49f770c97b3 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/arcturus_ppt.c
> @@ -598,7 +598,7 @@ static int arcturus_get_smu_metrics_data(struct
> smu_context *smu,
>                                          MetricsMember_t member,
>                                          uint32_t *value)
>   {
> -       struct smu_table_context *smu_table=3D &smu->smu_table;
> +       struct smu_table_context *smu_table =3D &smu->smu_table;
>         SmuMetrics_t *metrics =3D (SmuMetrics_t *)smu_table->metrics_tabl=
e;
>         int ret =3D 0;
>
> @@ -1482,7 +1482,7 @@ static int arcturus_set_power_profile_mode(struct
> smu_context *smu,
>                 return ret;
>
>         if ((profile_mode =3D=3D PP_SMC_POWER_PROFILE_CUSTOM) &&
> -            (smu_version >=3D0x360d00)) {
> +            (smu_version >=3D 0x360d00)) {
>                 ret =3D smu_cmn_update_table(smu,
>                                        SMU_TABLE_ACTIVITY_MONITOR_COEFF,
>                                        WORKLOAD_PPLIB_CUSTOM_BIT,
