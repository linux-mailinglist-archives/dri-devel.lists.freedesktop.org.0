Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AFC5B40F2
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 22:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E640310EE54;
	Fri,  9 Sep 2022 20:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA76C10EE4F;
 Fri,  9 Sep 2022 20:45:27 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-11eab59db71so6943552fac.11; 
 Fri, 09 Sep 2022 13:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=tOdRgYvMFlVvpQnahbCAQyXuE1jXNRZy6YTJYdfO8bM=;
 b=evoakfqiZyhcmJuEoRga7NxRItRPui2yzHJFAgO6t0gIs26+wvDsrsmxfHii3ADjhJ
 eu/BBpJRNtexNYvHhsFHMxVJt91BpNrHsRJV3v9BDjPII7ZgEteYwmxhYlI0nZ5uYCy5
 +s53CNK93XBwAGlqzL5oX+K8QrkVXNvvszxXoJQ4lEXY0B6PvRE7YtvlqUPLBi78XNva
 QjdryoLOTSjVV7EVda/9ok2xCqh5gm2JOrs07z050ycG2LL7s+xB6Z5mXuFU0w8aEbXO
 XudeVFtkSXXF2y7n9RuWglet2Vmaa9Sg/vSpDzJXQbgI+zVaGhqfSF0/XlaXefDROPoN
 dDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=tOdRgYvMFlVvpQnahbCAQyXuE1jXNRZy6YTJYdfO8bM=;
 b=sgE02JILLkzXzIWcPFNjplPB7tE+tj3nGEprm9TxVnHjdFV83L0jGKE59RS9qivFpz
 ec/80f2AphxF6mCotw8g7GZViogMrh8TdI07F845iAioSlR5GLySLHVJqYCgl1luVqKK
 bxb7ox2F+yGn9RoQf+Hrk+vZMKN1BFuFeC2cIvYD2m2GCSayrsmcnVmCtpDIu12oTwqr
 YcwtIkSBsiWRK9KMIcf70s1zpe2Bv+wIwux0kqf75+u0ptwoY6TsCScaIIko4hIsz/r4
 XmcR4EyGb3H0h2/LPLGNplQLNE8tqbTlSunDj+PDlqflSUX3+X6CGl4XHLIVMqV5NIRg
 mPcw==
X-Gm-Message-State: ACgBeo3v0masNFbvnem8tpGzNqbODn3oCWKA3gWBdbpaqiGHsJU+4TwA
 VX0odm/tEFfw9koi2fDC+zvPtP4qMA4VdkM446I=
X-Google-Smtp-Source: AA6agR4yYTNYn71J0gE6HKkRJgbKG9w/kkqFkg60ldADXtpcZU9V7FQ9hBdiCXoc9DXJOhTCF47K6xTBcZGB8mX/yPI=
X-Received: by 2002:a05:6870:738d:b0:125:1b5:420f with SMTP id
 z13-20020a056870738d00b0012501b5420fmr6007604oam.96.1662756327135; Fri, 09
 Sep 2022 13:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220902073148.319536-1-ye.xingchen@zte.com.cn>
In-Reply-To: <20220902073148.319536-1-ye.xingchen@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 9 Sep 2022 16:45:15 -0400
Message-ID: <CADnq5_PocuJB0s+mg8sMgRK7pdzVQR_N0hsajYMgihuZ3fMGFw@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/radeon/ci_dpm: Remove the unneeded result
 variable
To: cgel.zte@gmail.com
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
Cc: airlied@linux.ie, ye xingchen <ye.xingchen@zte.com.cn>,
 Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Fri, Sep 2, 2022 at 3:32 AM <cgel.zte@gmail.com> wrote:
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Return the value ci_load_smc_ucode() directly instead of storing it in
> another redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/radeon/ci_dpm.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/ci_dpm.c b/drivers/gpu/drm/radeon/ci_dpm.c
> index ac006bed4743..8ef25ab305ae 100644
> --- a/drivers/gpu/drm/radeon/ci_dpm.c
> +++ b/drivers/gpu/drm/radeon/ci_dpm.c
> @@ -2056,7 +2056,7 @@ static void ci_clear_vc(struct radeon_device *rdev)
>  static int ci_upload_firmware(struct radeon_device *rdev)
>  {
>         struct ci_power_info *pi = ci_get_pi(rdev);
> -       int i, ret;
> +       int i;
>
>         for (i = 0; i < rdev->usec_timeout; i++) {
>                 if (RREG32_SMC(RCU_UC_EVENTS) & BOOT_SEQ_DONE)
> @@ -2067,9 +2067,7 @@ static int ci_upload_firmware(struct radeon_device *rdev)
>         ci_stop_smc_clock(rdev);
>         ci_reset_smc(rdev);
>
> -       ret = ci_load_smc_ucode(rdev, pi->sram_end);
> -
> -       return ret;
> +       return ci_load_smc_ucode(rdev, pi->sram_end);
>
>  }
>
> --
> 2.25.1
