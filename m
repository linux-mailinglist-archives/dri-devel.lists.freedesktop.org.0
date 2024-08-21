Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1941D95A5D5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 22:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 957E110E6BC;
	Wed, 21 Aug 2024 20:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HD5Obw46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573C410E658;
 Wed, 21 Aug 2024 20:28:30 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-20228008eebso82695ad.2; 
 Wed, 21 Aug 2024 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724272110; x=1724876910; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWXnhVui2nFYwSjIEsqfqovQFvySgCe73i8eTlEDVwA=;
 b=HD5Obw46omZn0Hj778dV4ih5+dQQ5EK64xk28+zXZ/1ZfRj1/uK6cPRZRk32hiFaIZ
 mLjQ4Q4gfOZDJh6ykVTElA4uon8XVUOoNVCUgr84ij56FW4ItUWvvLjYrOasM1XjKF+Q
 i2FLxxVy60q5NxY9jxDrPLAqoZoIgEvbXI4khIIesl6jetAmcsfj9rSJYwfOw2Ek9tzM
 XiJszzjQpBA+c8h2dlRPs8qar8zLFUNxcinMWEq+ABJZ6D9f8PCVPXWQqHsKxMb2KTHN
 D7ZWH88DDfol/g/BNiXe9nHQ5u7yF+3/+rz/EfC9o5nKr+c+JHhIKB83kx2PiTmJ1Jaf
 HAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724272110; x=1724876910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nWXnhVui2nFYwSjIEsqfqovQFvySgCe73i8eTlEDVwA=;
 b=Ucy4OPmflKSjEcnejnU+XP+AE4WxsSKguGPqITtCEx4Vc2/kPmNZV7fc0IIgur5Xuq
 7wMd/U0MPX4CFR+IxjNrrhdJFw05HTqet2qnJco1yjiBP79YEmVodumvKPKf/cM1KIDB
 YZQKcIh4j689PCNh/AX592U7ImOt2Ep8RNUzlmI79uuiTd+cR5a2p4D6513E0/GLHpxg
 as8Rw6UE2tbZ2/42UoSjdz4oUip3N2pgEzjUS8dGvw7Sd2+QD1kj76IC29045GuaJNnb
 RYqcMYeWacNBdDXWb3d6arlnb2t3/0zHUZj8JF65jJc10OPUf2+1voGOo+aJGudZFQ1/
 oCRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUElz0UrOSn4jA1/MN0alDnx/Nme70hS8HIHb2baL10we3zxrTg0DBQukz9Mk8mesr48bBWnrhJJgmt@lists.freedesktop.org,
 AJvYcCUXbIDHOOnEtyI8corNPlNx93BSJIltgN2XqrC0Kd6xRiXXbl0NtGKFV0NYxsc1iTpcP9jOp1I0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDlCw1kLeWLG7RmL7yzJ1dQteJPQ2CU5yTU8EcjEhMhiGhi76f
 TMPMWRZoYdNkm2EXvL+IVmFIs8ROjx4PN5uRZ1X8EBla0AzROEn9X+7EHFE6xmQKnUh9KR8bpA+
 u0IrtZMsPhVAIp25ijBdERxUjiq0=
X-Google-Smtp-Source: AGHT+IGsvJQ6KGu9ogn//vAedYuxvsyPBtabUKbWujAuMr2pmxWCTY6LOcw3VsB+KWrDf+stA7PKf7eIrh8+UXN42fE=
X-Received: by 2002:a17:902:f541:b0:1fc:7180:f4af with SMTP id
 d9443c01a7336-20367bf70femr22338685ad.1.1724272109477; Wed, 21 Aug 2024
 13:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240821064040.2292969-1-ruanjinjie@huawei.com>
 <20240821064040.2292969-6-ruanjinjie@huawei.com>
In-Reply-To: <20240821064040.2292969-6-ruanjinjie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 21 Aug 2024 16:28:18 -0400
Message-ID: <CADnq5_NfynxZHrAG8cAhmMmmdMT96kAEZCVB3Tw9jrwqS4rG7w@mail.gmail.com>
Subject: Re: [PATCH -next 5/5] drm/amd/display: Make dcn35_fpga_funcs static
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: chaitanya.dhere@amd.com, jun.lei@amd.com, harry.wentland@amd.com, 
 sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com, 
 daniel@ffwll.ch, alex.hung@amd.com, aurabindo.pillai@amd.com, 
 colin.i.king@gmail.com, dillon.varone@amd.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 21, 2024 at 2:33=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com>=
 wrote:
>
> The sparse tool complains as follows:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c:10=
71:22: warning:
>         symbol 'dcn35_fpga_funcs' was not declared. Should it be static?
>
> This symbol is not used outside of dcn35_clk_mgr.c, so marks it static.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c=
 b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
> index e2d906327e2e..818a9b0933a5 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn35/dcn35_clk_mgr.c
> @@ -1068,7 +1068,7 @@ static struct clk_mgr_funcs dcn35_funcs =3D {
>         .is_ips_supported =3D dcn35_is_ips_supported,
>  };
>
> -struct clk_mgr_funcs dcn35_fpga_funcs =3D {
> +static struct clk_mgr_funcs dcn35_fpga_funcs =3D {
>         .get_dp_ref_clk_frequency =3D dce12_get_dp_ref_freq_khz,
>         .update_clocks =3D dcn35_update_clocks_fpga,
>         .init_clocks =3D dcn35_init_clocks_fpga,

This structure is not used and could be removed.  Making it static
will create a warning.

Alex


> --
> 2.34.1
>
