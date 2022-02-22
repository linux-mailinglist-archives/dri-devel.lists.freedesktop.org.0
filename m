Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C344BFEA2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 17:32:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04F8710E74D;
	Tue, 22 Feb 2022 16:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D7C10E6E4;
 Tue, 22 Feb 2022 16:32:24 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id x193so15159009oix.0;
 Tue, 22 Feb 2022 08:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=aSdxbzUUBFyhsvNwdRhnX3Mec7pbpC71E8zAtuMoNSw=;
 b=FX0sGlOaHKUnWtxEV6HYKy2nafu8fuljFBoACNBVftni/Q58eaCkncHFWGp2OrD2C7
 SDoNGW9popiT9/vht4gT9Bxb0ur4WAPXseAppf5T46OFdmKkpfESNAT2bFZ+FzWYushi
 Cup7BrHE+eOWFUq/y8CwoD8aORSMiasZHczGydJhs4/qlq28l/+PL4RDeNpi5SdA1B1a
 miu/LbAaMWwhsdqEjVqbhMwrBCOrNaekbAFCk4vLbL4s+ZJPCOzs7oJY3kFtjqdxJcZW
 nLEUXyj5/0RGoBn154D9dFV2Q6lYXTDe1FTVOHRUAFFHjJGRrUVuMGLmBPzIPz3aTUlZ
 d34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=aSdxbzUUBFyhsvNwdRhnX3Mec7pbpC71E8zAtuMoNSw=;
 b=Wsuec3y/W+xM7ntpRRiPEqlVsdAYeNi+T8KEHEge/DjNyDoqWeXN5sk3crQc3X5lq6
 7SdwI2NDYhu7GtOyxHOcl4qyOv+cjjghaQW5Gp753FNAqBSQi9gPVYl5KEGQVki36VIl
 LvXka2s18hEnSXhNYFcJT4ngOouIcuDn3jrbRP0avIkJRP9fWb9bF9FsJ6SiBzNNob1r
 cCnAUdWrbKkx8S04E2cxT5ZZ0J5F5Uzejbx6KhWOVkxM1MPf1kWeA0uaBLR/uA1oDqIK
 aCrNR6+nHtBjig2lf5qtbPODdDpAojfHGTL3fjIbSNKSO1Mvv+CyAIoijtm/1MLRhBz4
 /yTw==
X-Gm-Message-State: AOAM532RG4qSgW7pvs9UdrCm2OJ7LqZWTdZbMwPGvgGntJYSf/xWScMR
 i6m2IxaGlZkEW8mgIod9aYiPlvACS5dcFGTrUsM=
X-Google-Smtp-Source: ABdhPJy6A7uqVEJVD4y7y1YfQGjjopexCYY0c40a6Xh4XUKujc3FuLvcm8mgvXFwCBo2/1BU/wrLj1y1uaQOcVZOi00=
X-Received: by 2002:aca:ab4c:0:b0:2d4:7c7d:606e with SMTP id
 u73-20020acaab4c000000b002d47c7d606emr2374308oie.132.1645547544141; Tue, 22
 Feb 2022 08:32:24 -0800 (PST)
MIME-Version: 1.0
References: <20220222131701.356117-1-maira.canal@usp.br>
 <20220222131701.356117-6-maira.canal@usp.br>
In-Reply-To: <20220222131701.356117-6-maira.canal@usp.br>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 22 Feb 2022 11:32:13 -0500
Message-ID: <CADnq5_MaeAaKemJyNyAkzsVrnUv9G4zqQrd4PbCj3vJaTpxVoA@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/amd/display: Remove unused
 dcn316_smu_set_voltage_via_phyclk function
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>
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
Cc: "Tuikov, Luben" <luben.tuikov@amd.com>, Tao Zhou <tao.zhou1@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>, "Joshi, Mukul" <mukul.joshi@amd.com>,
 "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mwen@igalia.com, "Chai, Thomas" <YiPeng.Chai@amd.com>,
 "Stanley.Yang" <Stanley.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Magali Lemes <magalilemes00@gmail.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Isabella Basso <isabbasso@riseup.net>,
 John Clements <john.clements@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Dennis Li <Dennis.Li@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Feb 22, 2022 at 8:18 AM Ma=C3=ADra Canal <maira.canal@usp.br> wrote=
:
>
> Remove dcn316_smu_set_voltage_via_phyclk function, which is not used in t=
he
> codebase.
>
> This was pointed by clang with the following warning:
>
> drivers/gpu/drm/amd/amdgpu/../display/dc/clk_mgr/dcn316/dcn316_smu.c:171:=
5:
> warning: no previous prototype for function
> 'dcn316_smu_set_voltage_via_phyclk' [-Wmissing-prototypes]
> int dcn316_smu_set_voltage_via_phyclk(struct clk_mgr_internal *clk_mgr, i=
nt
> requested_phyclk_khz)
>     ^
>
> Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> ---
>  .../amd/display/dc/clk_mgr/dcn316/dcn316_smu.c   | 16 ----------------
>  1 file changed, 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c b=
/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
> index b7f9e1b34c11..fd6497fd2dc5 100644
> --- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
> +++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn316/dcn316_smu.c
> @@ -168,22 +168,6 @@ int dcn316_smu_set_dispclk(struct clk_mgr_internal *=
clk_mgr, int requested_dispc
>         return actual_dispclk_set_mhz * 1000;
>  }
>
> -int dcn316_smu_set_voltage_via_phyclk(struct clk_mgr_internal *clk_mgr, =
int requested_phyclk_khz)
> -{
> -       int actual_phypclk_set_mhz =3D -1;
> -
> -       if (!clk_mgr->smu_present && requested_phyclk_khz)
> -               return requested_phyclk_khz;
> -
> -       /*  Unit of SMU msg parameter is Mhz */
> -       actual_phypclk_set_mhz =3D dcn316_smu_send_msg_with_param(
> -                       clk_mgr,
> -                       VBIOSSMC_MSG_SetPhyclkVoltageByFreq,
> -                       khz_to_mhz_ceil(requested_phyclk_khz));
> -
> -       return actual_phypclk_set_mhz * 1000;
> -}
> -
>  int dcn316_smu_set_hard_min_dcfclk(struct clk_mgr_internal *clk_mgr, int=
 requested_dcfclk_khz)
>  {
>         int actual_dcfclk_set_mhz =3D -1;
> --
> 2.35.1
>
