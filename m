Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD36B772D00
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 19:31:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8929410E368;
	Mon,  7 Aug 2023 17:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6765010E36A;
 Mon,  7 Aug 2023 17:30:45 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-1bbaa549c82so3745750fac.0; 
 Mon, 07 Aug 2023 10:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691429444; x=1692034244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8eZYdmrjAP5EddhK/TydIBrWHOpUy2tMR3k7Eu28CYk=;
 b=sIp4cWE5E3ZUVbnRwYtZBltpvrR15qc7USeqwZdtG5tHnasnq6srmO6P4PErTH0OaE
 CiaD2iA8XvY23Oxy98c24QfUDH0pluFraH4/EZfCcXkjx72qY2NJVrmvIIE5T6reFAgk
 L2A+7LEt2DlQczPtC5L7EdTa7MLXcnt5xoj//Wzan7wYwZk7SFVhdoxGUKaRTM3WdK5G
 9GbYdRWDQHMtXvQy0K5DDILh4ldmfbPQnlU4z+QH0fMstmdSZfDu0zVUONOWQWxE/HGS
 NMNZHEiepso6Ld90bkyc3W1P6OSsEx3ICbSxAJdXmZpOLHz3qX7kMvX84spRdwO8JES5
 GaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691429444; x=1692034244;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8eZYdmrjAP5EddhK/TydIBrWHOpUy2tMR3k7Eu28CYk=;
 b=YHdvDaFvfrkX6OmTyXGH7QTfRViukC9FkuQfoDMxwt+3OxAUi2Mz8VJE+t4tH9y6qQ
 HeRASpsGr81stz6pPu/4U8GgvnmFL4WAORFuc6MLpnoz2xnohuYAae2BxZJMvg4zBuuP
 uem03Eqapm2IhWPPq1bRxIv071PasQ3Emc3dj56cOJsvWe9YfM0LZEvvNUj7LXvRA962
 y05G6M2aXXJjEbWK7hBax4tcc4HLCNVk+WuWp0xvmzCmY1bbZSvcZsGfc8ay8a7mAvdp
 f48RGa0oS8V8Rj9Qebv2eTAqtPIaDyIk852AZM/0cUQtzXoKz7AgUSPfKtOfFTgw1rX+
 YKKg==
X-Gm-Message-State: AOJu0YzpeyxRMcSlC5j6gX5wWkTT0+xWjYAMGDwxJ7hNS6F32gx/rwPy
 ft9ccyOraMgdQcfcLVUh3k5XIE3HPrjYS9o0NKQ=
X-Google-Smtp-Source: AGHT+IGDHPNaPPiohwJKBgOo50isGGbZwLzfB6fU3qc7nO5Hd1NEo8h/7Goesn/N9+Q6Gw0yE1WYUMWdJFcSp0+ZRJA=
X-Received: by 2002:a05:6870:d252:b0:1bf:5e6c:ce72 with SMTP id
 h18-20020a056870d25200b001bf5e6cce72mr13336767oac.53.1691429444578; Mon, 07
 Aug 2023 10:30:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230802073542.13515-1-sunran001@208suo.com>
In-Reply-To: <20230802073542.13515-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 13:30:33 -0400
Message-ID: <CADnq5_MjuJVSYdTU+irpko9AkNerY-YaaaDDc94QAEVTUPGkuQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Clean up errors in mxgpu_vi.c
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

On Wed, Aug 2, 2023 at 3:35=E2=80=AFAM Ran Sun <sunran001@208suo.com> wrote=
:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: spaces required around that '-=3D' (ctx:WxV)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c b/drivers/gpu/drm/amd/=
amdgpu/mxgpu_vi.c
> index 288c414babdf..59f53c743362 100644
> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
> @@ -334,7 +334,7 @@ static void xgpu_vi_mailbox_send_ack(struct amdgpu_de=
vice *adev)
>                         break;
>                 }
>                 mdelay(1);
> -               timeout -=3D1;
> +               timeout -=3D 1;
>
>                 reg =3D RREG32_NO_KIQ(mmMAILBOX_CONTROL);
>         }
> --
> 2.17.1
>
