Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BC714AB0D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 21:15:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150976E9F0;
	Mon, 27 Jan 2020 20:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E346E9F0;
 Mon, 27 Jan 2020 20:15:37 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so13151191wrq.0;
 Mon, 27 Jan 2020 12:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=agHNCqMi2QnjkHYFDl9fzq4MYwJXHO3unwi3HdF8igA=;
 b=gmMfzbSlLI8I4dMWkE1xcW3fKrfjOA76rLQZmtKlKIY2pVegucYllK/T/qTuxjcCxe
 6WqR2yM8o5KMtlyIexeNoPLR1smpY3NaZiOWiRgTllZh/octMKu/pUouosJcxpBST/06
 TxFGjmZB8w12MmpUzmkunpeoTnl3gl5wU7GU7EqjjyXmj517dOtwWgvooRQ9z2G4V1Mp
 rxmvUbISmX0i+8Ahw5YQHh0fvaZxR/XXRTN8H2KL7IVYvirjnwAFWh6RogWJek3lQXL0
 6b/CUicdyOA7rVxspjR4fNrFYMWBjOk923KJffD/bbmW6LO9I9lKF7VRp6qkM8kf4mVA
 oD0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=agHNCqMi2QnjkHYFDl9fzq4MYwJXHO3unwi3HdF8igA=;
 b=s0rjVlcIaqh1u0IMzeUXkKmK91HZN2iZRxChiYDEflhTtDMX7j0SIst8ewlYGWxsQB
 VNd9U/+LGt+DKdyTfTQckhoCZAeFgKxuu/umsELi7H1PMDlBuhM1yNZbFVTBiPtPMeBd
 lytHZPxWMrV9HOjRuOBoxwdQEohc87Vc2h+YO3MSEjpJvDLdeKGlXEvN6/UN5TyTLqv4
 rUBHKbxR7wXJfvNjZLIaVWnHxhryuURSSF1JDrOVFiXMATiJ1iCnIrvtdO7HaYoVKwcO
 PkEUZo6j0C+/uOhVT/bBKMyUUN/+fMIRhM4FDaKl31jUFiuKLqgXe5KyaUZoxrmFcWnS
 SCmg==
X-Gm-Message-State: APjAAAWS7oet03rgZa2fRr5UCsYk1WHP2h1GqIeS8Ng3pXu1Ep0Xyw/l
 miKrUrrRFz9P+al+u0Hp5ZQknNP7pBihgZ8NBY8=
X-Google-Smtp-Source: APXvYqyhY0W5KNwrFS0LgQjqbO91CASwWkBDEMItwLG4El9WqtCluD5nWBgT4qRjEx7Olrk/EeKveMwsWoz5c7yF45o=
X-Received: by 2002:a5d:5091:: with SMTP id a17mr23523903wrt.362.1580156135555; 
 Mon, 27 Jan 2020 12:15:35 -0800 (PST)
MIME-Version: 1.0
References: <20200125202613.13448-1-colin.king@canonical.com>
In-Reply-To: <20200125202613.13448-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 27 Jan 2020 15:15:20 -0500
Message-ID: <CADnq5_Md7yW+QXhoLVT-HUvjap7YPYe4xp6gRAuBpt-9+EHVzw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/powerplay: fix spelling mistake "Attemp" ->
 "Attempt"
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sat, Jan 25, 2020 at 3:26 PM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are several spelling mistakes in PP_ASSERT_WITH_CODE messages.
> Fix these.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c | 12 ++++++------
>  drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c | 12 ++++++------
>  2 files changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
> index a3915bfcce81..275dbf65f1a0 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/vega12_smumgr.c
> @@ -128,20 +128,20 @@ int vega12_enable_smc_features(struct pp_hwmgr *hwmgr,
>         if (enable) {
>                 PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc_with_parameter(hwmgr,
>                                 PPSMC_MSG_EnableSmuFeaturesLow, smu_features_low) == 0,
> -                               "[EnableDisableSMCFeatures] Attemp to enable SMU features Low failed!",
> +                               "[EnableDisableSMCFeatures] Attempt to enable SMU features Low failed!",
>                                 return -EINVAL);
>                 PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc_with_parameter(hwmgr,
>                                 PPSMC_MSG_EnableSmuFeaturesHigh, smu_features_high) == 0,
> -                               "[EnableDisableSMCFeatures] Attemp to enable SMU features High failed!",
> +                               "[EnableDisableSMCFeatures] Attempt to enable SMU features High failed!",
>                                 return -EINVAL);
>         } else {
>                 PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc_with_parameter(hwmgr,
>                                 PPSMC_MSG_DisableSmuFeaturesLow, smu_features_low) == 0,
> -                               "[EnableDisableSMCFeatures] Attemp to disable SMU features Low failed!",
> +                               "[EnableDisableSMCFeatures] Attempt to disable SMU features Low failed!",
>                                 return -EINVAL);
>                 PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc_with_parameter(hwmgr,
>                                 PPSMC_MSG_DisableSmuFeaturesHigh, smu_features_high) == 0,
> -                               "[EnableDisableSMCFeatures] Attemp to disable SMU features High failed!",
> +                               "[EnableDisableSMCFeatures] Attempt to disable SMU features High failed!",
>                                 return -EINVAL);
>         }
>
> @@ -158,13 +158,13 @@ int vega12_get_enabled_smc_features(struct pp_hwmgr *hwmgr,
>
>         PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc(hwmgr,
>                         PPSMC_MSG_GetEnabledSmuFeaturesLow) == 0,
> -                       "[GetEnabledSMCFeatures] Attemp to get SMU features Low failed!",
> +                       "[GetEnabledSMCFeatures] Attempt to get SMU features Low failed!",
>                         return -EINVAL);
>         smc_features_low = smu9_get_argument(hwmgr);
>
>         PP_ASSERT_WITH_CODE(smu9_send_msg_to_smc(hwmgr,
>                         PPSMC_MSG_GetEnabledSmuFeaturesHigh) == 0,
> -                       "[GetEnabledSMCFeatures] Attemp to get SMU features High failed!",
> +                       "[GetEnabledSMCFeatures] Attempt to get SMU features High failed!",
>                         return -EINVAL);
>         smc_features_high = smu9_get_argument(hwmgr);
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
> index 0db57fb83d30..49e5ef3e3876 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/vega20_smumgr.c
> @@ -316,20 +316,20 @@ int vega20_enable_smc_features(struct pp_hwmgr *hwmgr,
>         if (enable) {
>                 PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc_with_parameter(hwmgr,
>                                 PPSMC_MSG_EnableSmuFeaturesLow, smu_features_low)) == 0,
> -                               "[EnableDisableSMCFeatures] Attemp to enable SMU features Low failed!",
> +                               "[EnableDisableSMCFeatures] Attempt to enable SMU features Low failed!",
>                                 return ret);
>                 PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc_with_parameter(hwmgr,
>                                 PPSMC_MSG_EnableSmuFeaturesHigh, smu_features_high)) == 0,
> -                               "[EnableDisableSMCFeatures] Attemp to enable SMU features High failed!",
> +                               "[EnableDisableSMCFeatures] Attempt to enable SMU features High failed!",
>                                 return ret);
>         } else {
>                 PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc_with_parameter(hwmgr,
>                                 PPSMC_MSG_DisableSmuFeaturesLow, smu_features_low)) == 0,
> -                               "[EnableDisableSMCFeatures] Attemp to disable SMU features Low failed!",
> +                               "[EnableDisableSMCFeatures] Attempt to disable SMU features Low failed!",
>                                 return ret);
>                 PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc_with_parameter(hwmgr,
>                                 PPSMC_MSG_DisableSmuFeaturesHigh, smu_features_high)) == 0,
> -                               "[EnableDisableSMCFeatures] Attemp to disable SMU features High failed!",
> +                               "[EnableDisableSMCFeatures] Attempt to disable SMU features High failed!",
>                                 return ret);
>         }
>
> @@ -347,12 +347,12 @@ int vega20_get_enabled_smc_features(struct pp_hwmgr *hwmgr,
>
>         PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc(hwmgr,
>                         PPSMC_MSG_GetEnabledSmuFeaturesLow)) == 0,
> -                       "[GetEnabledSMCFeatures] Attemp to get SMU features Low failed!",
> +                       "[GetEnabledSMCFeatures] Attempt to get SMU features Low failed!",
>                         return ret);
>         smc_features_low = vega20_get_argument(hwmgr);
>         PP_ASSERT_WITH_CODE((ret = vega20_send_msg_to_smc(hwmgr,
>                         PPSMC_MSG_GetEnabledSmuFeaturesHigh)) == 0,
> -                       "[GetEnabledSMCFeatures] Attemp to get SMU features High failed!",
> +                       "[GetEnabledSMCFeatures] Attempt to get SMU features High failed!",
>                         return ret);
>         smc_features_high = vega20_get_argument(hwmgr);
>
> --
> 2.24.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
