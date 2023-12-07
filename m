Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEB98092EB
	for <lists+dri-devel@lfdr.de>; Thu,  7 Dec 2023 22:03:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A1610E97C;
	Thu,  7 Dec 2023 21:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1CC10E0A3;
 Thu,  7 Dec 2023 21:02:58 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6d9d4193d94so858611a34.3; 
 Thu, 07 Dec 2023 13:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701982978; x=1702587778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5qXRZGXdBXSemm1qgUJNad1VBnNG3ZhMxzznoRoFWFw=;
 b=ZnvWdQxcfjZ4g3ZsKAf7s2JnmzE5nIwSAnePF99B6L6TeZlNkNdQkyIxwT6wtMuMjg
 8L1csVvYT+1++JB7u0mZiBykFufLIXRbWR0IxrM55hfTnqDpcqguUxOHLntsr0vYoCCD
 TICqKKNnkC5WmJn2cytxzBfho4FQLQhBr9J3JDyFxtc7W7nYqSvaSRcWlV1wXvmzCV1c
 U/4tCdvJsVYUWDK4ln/Zw+GB/N3VuTjW/KP5L93G2zu9HEb1P/SGFwRqEWcPJ4GIsK8A
 +ZFZzJNoT9Zq5vLnm2pIy61KMBp3XdpHq3mVy6RflvfBDSeSiDq5FmKHLQ3beZ4t/VaA
 hJ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701982978; x=1702587778;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5qXRZGXdBXSemm1qgUJNad1VBnNG3ZhMxzznoRoFWFw=;
 b=oRs60RJ5Io1bXbJpYs4AqURaSlbszWKi/RUdXXmV26MAGVbXA42ARbN0qt2l6oPHb3
 T87Sffar8AVi6hOTk0ErHzzItHxjDQ+WBPizTVU0H6EqRz0tQ5cZVB+aGqTZC9Se5A1x
 Vhh4oTQ86lkE3aBOxeTQlVULpT6bQrsqWCcXC9/suXUc24EfQw1Cqm7OTsPuvKzyKHGJ
 JsZ8VwGWl/C8HqyOqbB2nfCf96EsWnl3ir7DJX9gMGCNMMf6BmSVFX6LV3T1jUYaJO+Z
 8ZfLsWbWd+PvzyYUD4MjmWZGME7fwEQHJgJAiZTko3BAH0SSH9CUoFQeOXRQ2QqU3ULW
 1zww==
X-Gm-Message-State: AOJu0YyfkTiRdWz5fuNMLOcG081nfhd8erodPBZK57kvUpjk2pPMcqKl
 aG5jO/7epMDlvQTvwVIAMx7gl22rq0Ja5OQoUFg=
X-Google-Smtp-Source: AGHT+IFEzmWcYBTV00sk2s93Nrwk7f66goAtZQXFa6TwduRQuXjftgzU/1Fm91uq7zxSk5Hlblx4jX44EmOadZti7Ms=
X-Received: by 2002:a05:6870:818:b0:1f9:e965:191d with SMTP id
 fw24-20020a056870081800b001f9e965191dmr3678951oab.56.1701982978144; Thu, 07
 Dec 2023 13:02:58 -0800 (PST)
MIME-Version: 1.0
References: <20231207105454.3138964-1-colin.i.king@gmail.com>
In-Reply-To: <20231207105454.3138964-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 7 Dec 2023 16:02:47 -0500
Message-ID: <CADnq5_NnDgXqZ_qpKMiMf10a6Ls=c-CLC2KE1m-b2itLYT5DJg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake
 "SMC_MSG_AllowZstatesEntr" -> "SMC_MSG_AllowZstatesEntry"
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: Charlene Liu <charlene.liu@amd.com>, kernel-janitors@vger.kernel.org,
 Leo Li <sunpeng.li@amd.com>, Sung Joon Kim <sungkim@amd.com>,
 Xinhui.Pan@amd.com, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Dec 7, 2023 at 6:32=E2=80=AFAM Colin Ian King <colin.i.king@gmail.c=
om> wrote:
>
> There is a spelling mistake in a smu_print message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c b/d=
rivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
> index d6db9d7fced2..6d4a1ffab5ed 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_smu.c
> @@ -361,26 +361,26 @@ void dcn35_smu_set_zstate_support(struct clk_mgr_in=
ternal *clk_mgr, enum dcn_zst
>         case DCN_ZSTATE_SUPPORT_ALLOW:
>                 msg_id =3D VBIOSSMC_MSG_AllowZstatesEntry;
>                 param =3D (1 << 10) | (1 << 9) | (1 << 8);
> -               smu_print("%s: SMC_MSG_AllowZstatesEntr msg =3D ALLOW, pa=
ram =3D %d\n", __func__, param);
> +               smu_print("%s: SMC_MSG_AllowZstatesEntry msg =3D ALLOW, p=
aram =3D %d\n", __func__, param);
>                 break;
>
>         case DCN_ZSTATE_SUPPORT_DISALLOW:
>                 msg_id =3D VBIOSSMC_MSG_AllowZstatesEntry;
>                 param =3D 0;
> -               smu_print("%s: SMC_MSG_AllowZstatesEntr msg_id =3D DISALL=
OW, param =3D %d\n",  __func__, param);
> +               smu_print("%s: SMC_MSG_AllowZstatesEntry msg_id =3D DISAL=
LOW, param =3D %d\n",  __func__, param);
>                 break;
>
>
>         case DCN_ZSTATE_SUPPORT_ALLOW_Z10_ONLY:
>                 msg_id =3D VBIOSSMC_MSG_AllowZstatesEntry;
>                 param =3D (1 << 10);
> -               smu_print("%s: SMC_MSG_AllowZstatesEntr msg =3D ALLOW_Z10=
_ONLY, param =3D %d\n", __func__, param);
> +               smu_print("%s: SMC_MSG_AllowZstatesEntry msg =3D ALLOW_Z1=
0_ONLY, param =3D %d\n", __func__, param);
>                 break;
>
>         case DCN_ZSTATE_SUPPORT_ALLOW_Z8_Z10_ONLY:
>                 msg_id =3D VBIOSSMC_MSG_AllowZstatesEntry;
>                 param =3D (1 << 10) | (1 << 8);
> -               smu_print("%s: SMC_MSG_AllowZstatesEntr msg =3D ALLOW_Z8_=
Z10_ONLY, param =3D %d\n", __func__, param);
> +               smu_print("%s: SMC_MSG_AllowZstatesEntry msg =3D ALLOW_Z8=
_Z10_ONLY, param =3D %d\n", __func__, param);
>                 break;
>
>         case DCN_ZSTATE_SUPPORT_ALLOW_Z8_ONLY:
> --
> 2.39.2
>
