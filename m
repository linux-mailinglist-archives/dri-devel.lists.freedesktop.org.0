Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7895772C04
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:06:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B04DB10E316;
	Mon,  7 Aug 2023 17:06:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com
 [IPv6:2607:f8b0:4864:20::c32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380E210E319;
 Mon,  7 Aug 2023 17:05:59 +0000 (UTC)
Received: by mail-oo1-xc32.google.com with SMTP id
 006d021491bc7-56cb1e602e7so2910308eaf.1; 
 Mon, 07 Aug 2023 10:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691427958; x=1692032758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bbn3YRFHanofvHWO+jcCmLwBDagt8+vqY/B84h8as8k=;
 b=YnDZGWvNInlb1gECA6sEW2wGzcmqJjlpkxVx70DOIVYRxkiQ7x4Alv0CX5HpbLlzXa
 YOmTww0FYlm7gbIXuPqCQWs5aNJ6ELwQ4xNFRdl2SCnKMqUJcDCRLteWr+n2KmcaflIB
 YBPtItQDez+AFQ/aHNBx8QRkkGdAyss9/4co306Fe9i1PPXordqRNy3+sHfKbCcexEWg
 d8LaX5lhQ/kquX7uE6IxzfsWRGaklYucy9w8EnYYzO5r62LaQFAWx9ySQrMND8zBjguU
 yuarWYV9wnafp/5h7QBpoHRC5/nqcbX/mLIIDaBI2zWSDDDOPAq7g2bq14L974tyJ2pU
 1CxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691427958; x=1692032758;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bbn3YRFHanofvHWO+jcCmLwBDagt8+vqY/B84h8as8k=;
 b=ANfr+pExx9yaXXs2436BQBVkUp8nZURSAvwp7llfU1CYXdZVnsHVS4cKsRcnl3nruO
 UtOjnhhMVPHMIGMN5+xmW+fn+187R5ElMjBrcgvZr7KyjKKUx+NBdtJZd7cOT6hN/GaS
 fZJBzRBWn+puN+bMtKMAhIdaxTips0aD3270EDiwPixVDmwDiLp+iNXhC00l7eXHjkbz
 kmUlmYuICpgFjELp0MYSLYQ633TcCdY/Wmk2fcfsElXj+GKvtVJ7umkzEdKxGvdbBItC
 wrqKHcX1/DXVohWkPfFKzSsSuoDuoMRTniJrJe8XHtiZMscW8JEbRZH915t6he8S9hA0
 J/Nw==
X-Gm-Message-State: AOJu0YwVrrx20iEmYsZvFGc6BcTINPkQcTXa/cUKH+wbIAu+SDzUeMju
 e/SyMeoFftTAeuZyeyNALZyV1broavr6rcGgq3I=
X-Google-Smtp-Source: AGHT+IHFXB5CD8Mu6cDxwSyhTdt0CsqJNa2tDSIT2JIqrM0/yIbzRZq7+6WBDMPTTJWby2C/E0cwCZrrktpO0nCt2QY=
X-Received: by 2002:a4a:3018:0:b0:56c:7428:4a35 with SMTP id
 q24-20020a4a3018000000b0056c74284a35mr7764930oof.7.1691427958447; Mon, 07 Aug
 2023 10:05:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230802023109.9924-1-sunran001@208suo.com>
In-Reply-To: <20230802023109.9924-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:05:47 -0400
Message-ID: <CADnq5_NZSV-gvX9zOWLEifcBpj+fim5YCy2uW5yLsDnxcYiRTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Clean up errors in amdgpu_pm.c
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

On Tue, Aug 1, 2023 at 10:31=E2=80=AFPM Ran Sun <sunran001@208suo.com> wrot=
e:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: that open brace { should be on the previous line
> ERROR: space required before the open parenthesis '('
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/amdgpu_pm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/=
amdgpu_pm.c
> index 3922dd274f30..acaab3441030 100644
> --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> @@ -743,7 +743,7 @@ static ssize_t amdgpu_set_pp_od_clk_voltage(struct de=
vice *dev,
>                 type =3D PP_OD_EDIT_CCLK_VDDC_TABLE;
>         else if (*buf =3D=3D 'm')
>                 type =3D PP_OD_EDIT_MCLK_VDDC_TABLE;
> -       else if(*buf =3D=3D 'r')
> +       else if (*buf =3D=3D 'r')
>                 type =3D PP_OD_RESTORE_DEFAULT_TABLE;
>         else if (*buf =3D=3D 'c')
>                 type =3D PP_OD_COMMIT_DPM_TABLE;
> @@ -3532,7 +3532,8 @@ void amdgpu_pm_sysfs_fini(struct amdgpu_device *ade=
v)
>  #if defined(CONFIG_DEBUG_FS)
>
>  static void amdgpu_debugfs_prints_cpu_info(struct seq_file *m,
> -                                          struct amdgpu_device *adev) {
> +                                          struct amdgpu_device *adev)
> +{
>         uint16_t *p_val;
>         uint32_t size;
>         int i;
> --
> 2.17.1
>
