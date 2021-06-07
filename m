Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201A639E531
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BC526E96C;
	Mon,  7 Jun 2021 17:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FB446E961;
 Mon,  7 Jun 2021 17:20:32 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 5-20020a9d01050000b02903c700c45721so16398233otu.6; 
 Mon, 07 Jun 2021 10:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wIsZEzKuedmNrkE8sWmADzsVq5Ce7bsvNlcNsZxTnRY=;
 b=g13yFXluOkzEJmOZQmZQEQXcaP5WqUhlO0+vdTKZ+lHxSMjjYXxAPEbAfNwkDboqTH
 qb1kOYOjC10Rb2yEMyYhFHgRGH5aqUBpJqrCgamlEp/drI181Kw1NC0eP/fbQaUGqgjf
 lhQ8uJNbtt3vMqD3kalgHbYJAztqVaWdAjhcwZHYRliQfsbFSc0aS426zQ9y/5lo9Z1a
 cHbJ/l3t/8ToWpcggpaX0kcdYI3JX8mUD09TUlFI4VsveMbMVQtazwsktniMjcPPIjXy
 mpaTh0FgX2P8TbVNDNi7o4rKHl2X3RFUUSKXmkWi3FtgMaVF018evvpg0idGYoIzmrcn
 nXAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wIsZEzKuedmNrkE8sWmADzsVq5Ce7bsvNlcNsZxTnRY=;
 b=KxMQosWhF0mSWzpu6z0s0ngwlfscr+WtGFtrp2WcWW5Ft/t7iZi3WwVrxjwS4ND82+
 QvWXvD1k/jHmPXoczDgwvRBgNod+cnC0wodqJJ697+rfjx72xMMlxHPaAcZTH3OM8ifp
 nTxOhkYURyKDNrWnZsneloZTg3TtrG43sYehSjdT0V14vzFBXS+1R26FfqQkJEQr+NlW
 gUoE4kQpGJf25n60Le0Bn+zhzMoXIxNbGYRQPPyVZnIBK6MmVCXxC+Zl+7lThO60N1dF
 yZTaQZ0oqfYLHNBDg9Qh7fpxcQArXrBgvvinfmPcEQOMahdr+rCho2CRMGuiYfEVR/LH
 arpQ==
X-Gm-Message-State: AOAM530YX81eDPyZRBKypxVjIYggzFPzAeaLqgXslEqc7LXnFeM9wchM
 mFmx7HUOORsq5boSeJBKIULULdkhBimO6vUeZdh7huWt
X-Google-Smtp-Source: ABdhPJyEPIh1daP/HlBQeYnqMwlKB+lCnze26NeJPRgO+gQi876Ow+pkdIucW4umZTuqTIDRv1izuUb+vrRu7TofTFU=
X-Received: by 2002:a9d:6548:: with SMTP id q8mr14588598otl.311.1623086431533; 
 Mon, 07 Jun 2021 10:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210607115615.83162-1-colin.king@canonical.com>
In-Reply-To: <20210607115615.83162-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Jun 2021 13:20:20 -0400
Message-ID: <CADnq5_N=++KR_YjOO2DURYfe4Hp3b5=eDVh4Gp7xpcfPXFF8_w@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix two spelling mistakes, clean
 wide lines
To: Colin King <colin.king@canonical.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Jun 7, 2021 at 7:58 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are two spelling mistakes in dml_print messages, fix these and
> clear up checkpatch warning on overly wide line length.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  .../drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> index c725160a095b..d655655baaba 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_mode_vba_31.c
> @@ -1494,10 +1494,11 @@ static bool CalculatePrefetchSchedule(
>                 dml_print(
>                                 "DML:  Tsw: %fus = time to fetch enough pixel data and cursor data to feed the scalers init position and detile\n",
>                                 (double) LinesToRequestPrefetchPixelData * LineTime);
> -               dml_print("DML: To: %fus - time for propogation from scaler to optc\n", (*DSTYAfterScaler + ((double) (*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime);
> +               dml_print("DML: To: %fus - time for propagation from scaler to optc\n",
> +                         (*DSTYAfterScaler + ((double) (*DSTXAfterScaler) /
> +                         (double) myPipe->HTotal)) * LineTime);
>                 dml_print("DML: Tvstartup - TSetup - Tcalc - Twait - Tpre - To > 0\n");
> -               dml_print(
> -                               "DML: Tslack(pre): %fus - time left over in schedule\n",
> +               dml_print("DML: Tslack(pre): %fus - time left over in schedule\n",
>                                 VStartup * LineTime - TimeForFetchingMetaPTE - 2 * TimeForFetchingRowInVBlank
>                                                 - (*DSTYAfterScaler + ((double) (*DSTXAfterScaler) / (double) myPipe->HTotal)) * LineTime - TWait - TCalc - *TSetup);
>                 dml_print("DML: row_bytes = dpte_row_bytes (per_pipe) = PixelPTEBytesPerRow = : %d\n", PixelPTEBytesPerRow);
> @@ -3023,7 +3024,8 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>                         for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>                                 if (v->ImmediateFlipSupportedForPipe[k] == false) {
>  #ifdef __DML_VBA_DEBUG__
> -                                       dml_print("DML::%s: Pipe %0d not supporing iflip\n", __func__, k);
> +                                       dml_print("DML::%s: Pipe %0d not supporting iflip\n",
> +                                                 __func__, k);
>  #endif
>                                         v->ImmediateFlipSupported = false;
>                                 }
> --
> 2.31.1
>
