Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3A67760199
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 23:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23AB110E383;
	Mon, 24 Jul 2023 21:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C41210E35D;
 Mon, 24 Jul 2023 21:55:30 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-5658573b1faso2793672eaf.1; 
 Mon, 24 Jul 2023 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690235729; x=1690840529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X8guhtErTn6aNVQ1Iyi8hYudi3GFlQwENuhyidPmzNs=;
 b=riH8prdIh4N80P2QMC/I8TGBRunp3tp7X2cT4CaOUuIe87vDpBwZFpcd6B75rCzyJ6
 Y3fmrU0fnf0ovYMpXolI3muN61KF5fA9cunEp+k3uj/QgT9AjNDbstjLR4oxzT0ik5v9
 b1liVJFoOCGPRwkaxdG1BgyLYyMDlNmIL9v+ThvBOFHFOv2ndNlGc8xTu7wrhqiRI9hu
 odtRR/UW4YlMw3wW1V/Y4GpEaJFKDk5nPJ+gq4hXqh8qRBqORwHZ/8oPtivM4G4cRFZ3
 U6vGsM1FjsGQO/lQtxQkL0JesoRy7p3NyQxchL2R7PKAz5wIOgyOjLoLmnn+1dcXImW8
 ywWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690235729; x=1690840529;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X8guhtErTn6aNVQ1Iyi8hYudi3GFlQwENuhyidPmzNs=;
 b=GyQllQS0CtMS75BgSwdFg2K+OUwsv+zD7s/u+CggojZBq/rglL0WIM51PIOZQdpQjY
 R3jF3/MJgbOOSZlyn0Qglo2un2hrCkp8HOt6jobSgI5mHEy6ojOnf3nA3akmwhPTHuI/
 BzwrQ5h6EWC3zMuby6bX8KyX92W9usbfIA7Pkzbwab+nFFSBjXOIEBif3y0uw7fvk4Us
 HcJcXAqfI/wMj/HnCHJeofjZe7KMLqMdNkaspORsYOPo/44I6KxBS9lDNZvKB+4odSsk
 7KSV1E85t5/0vkAsyV64TIDl0uUwJh5pj84oF2luOZ7G/1su1LrH7HTqE6Sr0stNF2FR
 wtTQ==
X-Gm-Message-State: ABy/qLYq38IVfqIzRYPTtNZ1GyArQgGNEIcI3B3YFigPrR59GbxvlqES
 /5occT2X9123INFe9GdABrgt8Nr7DDYXfwR4G44=
X-Google-Smtp-Source: APBJJlGpvGvYHofhn296p0VQ4ekG8ECA+40wh6sjcsrKBSQ8a77kj0PDgEyovPB3KuscQIqDW7M85yrHYLg5IbNv+lY=
X-Received: by 2002:a4a:344a:0:b0:566:efc9:1464 with SMTP id
 n10-20020a4a344a000000b00566efc91464mr9031534oof.0.1690235729572; Mon, 24 Jul
 2023 14:55:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230724071121.8710-1-xujianghui@cdjrlc.com>
 <be6d6605aa504964eba3476910f7140a@208suo.com>
 <a026386d6759911afbb1446a9145bdec@208suo.com>
In-Reply-To: <a026386d6759911afbb1446a9145bdec@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 24 Jul 2023 17:55:18 -0400
Message-ID: <CADnq5_M0pcefVivAG+sVCfkyu2y2Mjb0bXs2O19KFZtBsB5aGw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: open brace '{' following function definitions
 go on the next line
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

Applied.  Thanks!

On Mon, Jul 24, 2023 at 4:44=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> ERROR: open brace '{' following function definitions go on the next line
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c
> b/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c
> index c788aa7a99a9..5e408a195860 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu12/smu_v12_0.c
> @@ -205,7 +205,8 @@ int smu_v12_0_set_default_dpm_tables(struct
> smu_context *smu)
>         return smu_cmn_update_table(smu, SMU_TABLE_DPMCLOCKS, 0,
> smu_table->clocks_table, false);
>   }
>
> -int smu_v12_0_mode2_reset(struct smu_context *smu){
> +int smu_v12_0_mode2_reset(struct smu_context *smu)
> +{
>         return smu_cmn_send_smc_msg_with_param(smu,
> SMU_MSG_GfxDeviceDriverReset, SMU_RESET_MODE_2, NULL);
>   }
