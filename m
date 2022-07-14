Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9425752CF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 18:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8271511A10B;
	Thu, 14 Jul 2022 16:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C3A111A10B;
 Thu, 14 Jul 2022 16:31:35 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id x91so3138884ede.1;
 Thu, 14 Jul 2022 09:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yhoWI4qXoHsRxXejZ4bDxx8rPwc5PrEne0xLbfw7b3c=;
 b=TMtVpRdxuzY+GFOrJzgXJjS7PgzhBL4YjbaEAWduBAB5qc6UjWHULm5HpSJXOScbnh
 qWEGguzru0OxloGviNMBCEMELWtL87lhZPUrXd+lwmq5MeGAhuz8/wSDdWnagZVMSXO6
 Iwaz2MgUYZWYEk9HwPUn238XUQEyvW4/F89ZSvxYnsnQYfyRDpqB+PlRlQAGkT1Gdv/S
 7UGkeO2D281Yu7wnsy3YzxsgczEQJjmqgHVCwX+fKFpQGejBv1EsHLWb4EyJYtlmOQbW
 H6nYg2W1YS7Rf0gA3nIdJo6HQTUivxtXB2m4D73Sd4ofi6gJ6i/aJNKJz3lQyySfJioN
 fbKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yhoWI4qXoHsRxXejZ4bDxx8rPwc5PrEne0xLbfw7b3c=;
 b=MlME1zskpSYiQVqRyaYSDUpvlpxA2cbP19yJfIahZ44D0DYsDzqtcw2zht6XK6RVzG
 b3gsv/VhGU32+G7UBgqYgeySF6yXdUCz4ciYrG9EzpFefmpLFOnPyEmhV0gashOu8ulP
 BWaq+q9kjT5XqteW0CJJ4S2YeT/pO+wf/Z5pVobXRU4+lR8fK/MEdJG3cjHoOTLoMoEL
 jgQ1yAlTazhA91c3ZJGT/qXoAhrssfei1x0GkYwJMDr8RAzj1dLCUcf/S86qnhqFiw29
 ljjJBa7Hm9DDC4dbgH16rKnFf7NrLtATMGQeZJmAMKtUKxldUwX4n3gWwbbP65uGhJG4
 ZcMA==
X-Gm-Message-State: AJIora8LgGtS2NAZv36jInaw+SG+45Tq4sLwvxB3pildBfAyUiVz4Ekw
 4XzbOpHnUvCxM8MQ66jouy+u8NC47qPrrgQc/GPCgPsn
X-Google-Smtp-Source: AGRyM1vlBR6f4juYCV/yCZg3RjA87tp7VDETKIK9iYx5gzzUL4ZdyFIJbjjXw8MVnaPdQX+oNlbMl0PPVfnIXBNwT48=
X-Received: by 2002:a05:6402:2895:b0:43b:1e47:c132 with SMTP id
 eg21-20020a056402289500b0043b1e47c132mr7007574edb.425.1657816293374; Thu, 14
 Jul 2022 09:31:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220714103427.23255-1-colin.i.king@gmail.com>
In-Reply-To: <20220714103427.23255-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 14 Jul 2022 12:31:21 -0400
Message-ID: <CADnq5_PO79-dzPy0VVG2fuyQ0wX0GcWHbcvyyy_bUrF2JwQSOQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amd/display: Fix spelling mistake "supporing"
 -> "supporting"
To: Colin Ian King <colin.i.king@gmail.com>
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

On Thu, Jul 14, 2022 at 6:34 AM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a dml_print message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  .../gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> index 6101c962ab0a..fc4d7474c111 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn314/display_mode_vba_314.c
> @@ -2994,7 +2994,7 @@ static void DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerforman
>                         for (k = 0; k < v->NumberOfActivePlanes; ++k) {
>                                 if (v->ImmediateFlipSupportedForPipe[k] == false) {
>  #ifdef __DML_VBA_DEBUG__
> -                                       dml_print("DML::%s: Pipe %0d not supporing iflip\n", __func__, k);
> +                                       dml_print("DML::%s: Pipe %0d not supporting iflip\n", __func__, k);
>  #endif
>                                         v->ImmediateFlipSupported = false;
>                                 }
> --
> 2.35.3
>
