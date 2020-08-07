Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732A423F339
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 21:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CB286E1B7;
	Fri,  7 Aug 2020 19:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336156E1B7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 19:55:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id f18so9329443wmc.0
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 12:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Ix2qw4KMKBkfddshBQcTO2tx4uzprljB2Q0WseE88fM=;
 b=Oa3uBHjg6EKU2fikKyuCSAXIwHtg3vL/yagVdbkoAiLNGAyBo6OgZeJUQ7Shfrncag
 4Kvr3tDx90M90Cy215/ag5Fca4O/tfgFy6vxwc6jRK+YTvvym0ZXe+PLkw4f219vleZ8
 T1Rl7so16SKM/9vJAA12A/xJW1LpqaVXPB/WYvsYuuuTEk/DXbFvpx5l3qVVAJwmy8nz
 kPtwrY2HK4zjXBAdLRsjDaesDiD6QEX9wVA53Z2la0gn2H0XVt5d0MFZLw8FCN4pl4bN
 xVaGrSjsZqLcYmuOt/gZLc89QKEM+rVxT4p1y3OtGjtQCAbvEDoDoOkV5M5C8TWaiXPs
 78hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Ix2qw4KMKBkfddshBQcTO2tx4uzprljB2Q0WseE88fM=;
 b=khB6wWaSkbm5gY6rXc8e0knlcFVvm+zBx8MNLmSQt7HgAT0rHRNMf39NY5VyypUh5W
 2S31LBzj6MELpZFqa1djPnnN2AKcY05l2KCGQg5iynVMywdAmLwDnex5mNrhz2qO1iwU
 Xu1diRUNwsW/xtQYCPwXRiu3ALuLA0c9mr0U0q2siCMjUCrk6RgxM64rgGTcqnwLbc/R
 imBPmisnFLHQR9wbRSqYqtbGxxeoh/91DXI4ydLyjTGVYB0zLWGU2NO8X2MAbWLSUDuy
 wHg2XClVgmfFCziAqpyI6Jz/z8UGvw0EjZIyyF3rXd66vpNQmxXiNgmoXwt9ckblYzzl
 Pclg==
X-Gm-Message-State: AOAM532pXMVWYaiSYzvUnjH3DqD1edETSdthYr1VzpdccmFRISsDLHqR
 Frll+DxbBWb3AwQiH6OJMulQmlcS2AIsV8llcYk=
X-Google-Smtp-Source: ABdhPJx1kpMkopZ+VgfGEspj4z7gDRtyZm0gdOk+SWeUt/FIF4csvHE4YnQnG8WK83l/tiWkdI/pDtp1zuYUkVNT/GM=
X-Received: by 2002:a7b:cb17:: with SMTP id u23mr14518181wmj.79.1596830109669; 
 Fri, 07 Aug 2020 12:55:09 -0700 (PDT)
MIME-Version: 1.0
References: <0d9e084d-0bb1-6dbe-f8c5-22d4fdb9c989@gmail.com>
In-Reply-To: <0d9e084d-0bb1-6dbe-f8c5-22d4fdb9c989@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Aug 2020 15:54:58 -0400
Message-ID: <CADnq5_PwkNCdFwSY0kJrzRC3G4OxLUwL4zSKUXsLP-K3Fvnc-Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] AMDGPU: Fix bug where DPM is not enabled after
 hibernate and resume
To: Sandeep Raghuraman <sandy.8925@gmail.com>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Aug 6, 2020 at 1:22 PM Sandeep Raghuraman <sandy.8925@gmail.com> wrote:
>
> This fixes the bug I reported here: https://bugzilla.kernel.org/show_bug.cgi?id=208839
>
> Reproducing bug report here:
> After hibernating and resuming, DPM is not enabled. This remains the case even if you test hibernate using the steps here: https://www.kernel.org/doc/html/latest/power/basic-pm-debugging.html
>
> I debugged the problem, and figured out that in the file hardwaremanager.c, in the function, phm_enable_dynamic_state_management(), the check 'if (!hwmgr->pp_one_vf && smum_is_dpm_running(hwmgr) && !amdgpu_passthrough(adev) && adev->in_suspend)' returns true for the hibernate case, and false for the suspend case.
>
> This means that for the hibernate case, the AMDGPU driver doesn't enable DPM (even though it should) and simply returns from that function. In the suspend case, it goes ahead and enables DPM, even though it doesn't need to.
>
> I debugged further, and found out that in the case of suspend, for the CIK/Hawaii GPUs, smum_is_dpm_running(hwmgr) returns false, while in the case of hibernate, smum_is_dpm_running(hwmgr) returns true.
>
> For CIK, the ci_is_dpm_running() function calls the ci_is_smc_ram_running() function, which is ultimately used to determine if DPM is currently enabled or not, and this seems to provide the wrong answer.
>
> I've changed the ci_is_dpm_running() function to instead use the same method that some other AMD GPU chips do (e.g Fiji), which seems to read the voltage controller. I've tested on my R9 390 and it seems to work correctly for both suspend and hibernate use cases, and has been stable so far.
>
> Signed-off-by: Sandeep Raghuraman <sandy.8925@gmail.com>
>
> ---
>  drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> index 56923a96b450..056b3ad1565f 100644
> --- a/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/smumgr/ci_smumgr.c
> @@ -2725,7 +2725,10 @@ static int ci_initialize_mc_reg_table(struct pp_hwmgr *hwmgr)
>
>  static bool ci_is_dpm_running(struct pp_hwmgr *hwmgr)
>  {
> -       return ci_is_smc_ram_running(hwmgr);
> +       return (1 == PHM_READ_INDIRECT_FIELD(hwmgr->device,
> +                                            CGS_IND_REG__SMC, FEATURE_STATUS,
> +                                     VOLTAGE_CONTROLLER_ON))
> +                       ? true : false;
>  }
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
