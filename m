Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA9696C0B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 18:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D22E110E0E8;
	Tue, 14 Feb 2023 17:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EEE10E0E8;
 Tue, 14 Feb 2023 17:52:26 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-15f97c478a8so19967167fac.13; 
 Tue, 14 Feb 2023 09:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lZFjwpM0e+6lphD3ifPyOD3cNXqpmoovJNHI+n1Xcag=;
 b=IUin4/yl9JK+fO5s4S7dikIiKaYHQgwkUSoWG4gxj23f5i614llpJYiax4LzVMr597
 hzC4JvN9aJRNYADwOrO7xRPxrkSnfTS4vkxOo3pynVVNB/qaLC5O734kYmGcbVJZ9Tnp
 I9Ngbi1WGh1o4auSTxANyM5ozjT4Tsag6uKHvt6faGdrV3Fmb/cPKwbGVDATi6X9ZoLN
 oVpml/ev1Wx1cvoIcuytkMdGo/PuH/rnr8SeYEHs2Np+utK1XQUIK3M/B6cGNcpNdzz1
 hUB9AOFdAkmVQ4+G5v58CTXKF1ZOG91p7m9bVJ2UqKyqNZCY60B0ZrgEag5AufOJyLjv
 zztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lZFjwpM0e+6lphD3ifPyOD3cNXqpmoovJNHI+n1Xcag=;
 b=6oojFNnPeU7rwx2S4F5q0sZEsjpMckhwM3raJfryiIiyu5MKcdGGUQwCNb6zz9UGRx
 +PSqWl0rgeBtZ8xcHmIrP5Mi52uIe8a/qVj646KCbrLYqjk2Lhm5kjc/Z8/9mA4IKLly
 xt/yAN5YIJPCVW86o78iIUn8JwWhfdb5AzsIDEoWQCPFxn5fp7TzMcwkr4O8eKiv0XOn
 On/9oKUwI4/qhp9RD0dg0vczGvL2E3suJ9oMqrz0k0cagiBvGniiZrflgSN1/jUUveW7
 BbfCWDsOW0jssuhMHUaNCkQsFJbxytSwttTenTUAd5++8EEgD7S9GqbDUNzFiaLIxQBA
 DC2w==
X-Gm-Message-State: AO0yUKVXMBRHDiwlXtzJv3bw1md72Nq2vYDQiMoGISkPn0mv1BfG4I6S
 BskkTAIY7VeoGnEn2R/yMHpYDJg3X39G4j110rg=
X-Google-Smtp-Source: AK7set/yA1zPYntimvTqWjyV98uT3P65oOTDDJQ+a9UGaVnnxnpBVc25FjELUlApto8x1Grb2V+T+bTHjpL8xluHkrQ=
X-Received: by 2002:a05:6870:c154:b0:16e:2d40:daf5 with SMTP id
 g20-20020a056870c15400b0016e2d40daf5mr44581oad.96.1676397145768; Tue, 14 Feb
 2023 09:52:25 -0800 (PST)
MIME-Version: 1.0
References: <20230213204923.111948-1-arthurgrillo@riseup.net>
 <20230213204923.111948-10-arthurgrillo@riseup.net>
In-Reply-To: <20230213204923.111948-10-arthurgrillo@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 14 Feb 2023 12:52:13 -0500
Message-ID: <CADnq5_PKzwGfNOj94Hc6CnaPbtkVnHfP0eY28fz8=EacTxPEYg@mail.gmail.com>
Subject: Re: [PATCH 09/10] drm/amd/display: Make variables declaration inside
 ifdef guard
To: Arthur Grillo <arthurgrillo@riseup.net>
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Feb 13, 2023 at 3:50 PM Arthur Grillo <arthurgrillo@riseup.net> wrote:
>
> Make variables declaration inside ifdef guard, as they are only used
> inside the same ifdef guard. This remove some of the
> -Wunused-but-set-variable warning.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  .../gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c    | 4 ++++
>  .../gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c  | 4 ++++
>  2 files changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> index ec351c8418cb..27f488405335 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> @@ -878,7 +878,9 @@ static bool CalculatePrefetchSchedule(
>         double DSTTotalPixelsAfterScaler;
>         double LineTime;
>         double dst_y_prefetch_equ;
> +#ifdef __DML_VBA_DEBUG__
>         double Tsw_oto;
> +#endif
>         double prefetch_bw_oto;
>         double prefetch_bw_pr;
>         double Tvm_oto;
> @@ -1060,7 +1062,9 @@ static bool CalculatePrefetchSchedule(
>
>         min_Lsw = dml_max(1, dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) / max_vratio_pre);
>         Lsw_oto = dml_ceil(4 * dml_max(prefetch_sw_bytes / prefetch_bw_oto / LineTime, min_Lsw), 1) / 4;
> +#ifdef __DML_VBA_DEBUG__
>         Tsw_oto = Lsw_oto * LineTime;
> +#endif
>
>
>  #ifdef __DML_VBA_DEBUG__
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> index 950669f2c10d..0fd3889c2061 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> @@ -900,7 +900,9 @@ static bool CalculatePrefetchSchedule(
>         double DSTTotalPixelsAfterScaler;
>         double LineTime;
>         double dst_y_prefetch_equ;
> +#ifdef __DML_VBA_DEBUG__
>         double Tsw_oto;
> +#endif
>         double prefetch_bw_oto;
>         double prefetch_bw_pr;
>         double Tvm_oto;
> @@ -1082,7 +1084,9 @@ static bool CalculatePrefetchSchedule(
>
>         min_Lsw = dml_max(1, dml_max(PrefetchSourceLinesY, PrefetchSourceLinesC) / max_vratio_pre);
>         Lsw_oto = dml_ceil(4 * dml_max(prefetch_sw_bytes / prefetch_bw_oto / LineTime, min_Lsw), 1) / 4;
> +#ifdef __DML_VBA_DEBUG__
>         Tsw_oto = Lsw_oto * LineTime;
> +#endif
>
>
>  #ifdef __DML_VBA_DEBUG__
> --
> 2.39.1
>
