Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E1593A9D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 22:25:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DEA12A805;
	Mon, 15 Aug 2022 20:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1DED451C;
 Mon, 15 Aug 2022 20:24:59 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id u9so9740578oiv.12;
 Mon, 15 Aug 2022 13:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Iaz7AcirQxUjaBaXlqqwMByf11MJTYJZTTx2nziLJrU=;
 b=GANC6SH7gnRnASPtk8HrW3GJYDMrDFWVmEZjCrF0o3KO01qNfsbAyBI/CLjd/eQGAn
 wVtS0Y3TnKOSjab+RweFDsQtQfWyBY4W3863RyyqUJjax9OFtHqalOwcYX7GOrmLrR++
 OhDOEh5tIPM5FT9WMJeXuGTGa9UZxx1268oO/PmpZm61YqASPBTIwyuophcpuMV7PXCh
 uc4mPKFZ+jUUzvZDHqr3YuxCyJzUTr8Fwj1vp1h5f7EuYWDDLJcjtNGFQYjEkffZS1hC
 0x+5JXLQuzvv8hxWgPDm3LFYc6GQ0d8ej8qAhj38lnVVS4arIlZmkiLo94N4iWVJJjVJ
 i8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Iaz7AcirQxUjaBaXlqqwMByf11MJTYJZTTx2nziLJrU=;
 b=wr2AkJaiVe5rM60zrh5AbCnwriBrpKjyOLU6ZjfLtye9CPyuevVFIiy9PD/cYyOCyn
 5WFTVqVCa9J33sY19/KF1HOFA+om/jNo6Dn1rY88PWQAaV/b47lbPDQvXvdce/XpyoVB
 rlC1nIPjBKziF8wSxUeHhuamsNP7aWLSPrUw5oDqMCjDUbJ/nnbxq/J9LmU6msZle3aT
 dCTEtDHo8m+s8p6lqtZ1SppbO13ejudmkr7wJCVw4J/UKLf3CdQ/9QucZzI3POSDSknX
 qQSVmsNqVyRxUCouzoUP55i0ZRH+hvnmZ/ynIHR2O47xgktn1FupqAeAwf8AIa3fWko8
 hVew==
X-Gm-Message-State: ACgBeo3KgsZ4YpcHSkRSERxKf7ZBHQIynv9tOdhDO8K3ZZSvAIrjdR8Z
 7XVwPmzzMaj3npzwdv8otkM0bh3oO3+Bv0y4oUorLPii
X-Google-Smtp-Source: AA6agR4Xhdv76wJlEpNmhHUY8VZF2hGM/7jzf45aUTBjSOvIZm/OGOZzgTP88hGcKocn7pTa2BE3BlldzaPsgkX6avg=
X-Received: by 2002:a05:6808:1491:b0:343:7543:1a37 with SMTP id
 e17-20020a056808149100b0034375431a37mr6710537oiw.106.1660595099196; Mon, 15
 Aug 2022 13:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220813151046.4041-1-tangmin@cdjrlc.com>
In-Reply-To: <20220813151046.4041-1-tangmin@cdjrlc.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 Aug 2022 16:24:47 -0400
Message-ID: <CADnq5_NgBcygMf2xwEWX6pvmk3yegCLjRF+NBTv=+ObamX8=vQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix comment typo
To: min tang <tangmin@cdjrlc.com>
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
Cc: Charlene.Liu@amd.com, airlied@linux.ie, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 isabbasso@riseup.net, Jun.Lei@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sat, Aug 13, 2022 at 11:13 AM min tang <tangmin@cdjrlc.com> wrote:
>
> The double `aligned' is duplicated in line 1070, remove one.
>
> Signed-off-by: min tang <tangmin@cdjrlc.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
> index b1671b00ce40..0844b3eeb291 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_optc.c
> @@ -1066,7 +1066,7 @@ static void optc1_set_test_pattern(
>                                 src_color[index] >> (src_bpc - dst_bpc);
>                 /* CRTC_TEST_PATTERN_DATA has 16 bits,
>                  * lowest 6 are hardwired to ZERO
> -                * color bits should be left aligned aligned to MSB
> +                * color bits should be left aligned to MSB
>                  * XXXXXXXXXX000000 for 10 bit,
>                  * XXXXXXXX00000000 for 8 bit and XXXXXX0000000000 for 6
>                  */
> --
> 2.17.1
>
