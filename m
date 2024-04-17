Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E938C8A82A1
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 13:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C4410F179;
	Wed, 17 Apr 2024 11:58:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cs0kGE4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E0A10EF0E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 11:58:50 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dcc7cdb3a98so5298171276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Apr 2024 04:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713355129; x=1713959929; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=XOPPymOpNWV4lEvf0/qp/BaWhSNyYN4sXc1brxkavt8=;
 b=cs0kGE4JUMw5JAyRugVNIzcBxnm4H7YTtdwmJBV+VfIH0Lt1gCn7f137WrjJyO4iRZ
 mjznvuiHKnE5J/5NF1VTAk1AClJchAKyq00wzasMHYaQLc8pZNrowGua7RDn61Ff/y5p
 uxqX5g8fhTrwvx7/k3/Twdbw7B6hWuD6RDsVEp9Sq7JL0JdjcAHnuZY1QblZAkYtDrLm
 tQ3TahG0VSFW4KtTkBZV9V7fqxQGoyHV5X4GuFFevEfyMllRrzZVxswmeF2DajV64ibi
 s4RPhRhCFD2hII6EaJ8QjTNAF+gSIotU463cRbGrHl/LCQxxtJRirB4k1P6Ww0KeehDB
 Livg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713355129; x=1713959929;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XOPPymOpNWV4lEvf0/qp/BaWhSNyYN4sXc1brxkavt8=;
 b=DZI6Qufzb+dH+Ow2h5P7tcIZPY88W8HXth2OIFge2q3dNC/D5Bzu9hfkHWM0hEL6Vi
 0WK/26Eo7hipEOoSdKeSXaoZ702WUhohlXKNijDwRlhn1hVm56S5TGBcpJr2kukIVzWa
 aMUXhRQwfoAixjKq2/pGXa7nPpiG5/lE+1+zw6ugLssxq8uWANlSguU9n3vcJDHLySoz
 YaWgVVeL3olLJa/HPt+NUgMJcm+J+4+FlBKtLkVmIFFtdQYsp5PwGonSQZiR9Ue9cE2n
 ieG9SOJzgRil0N6fb45O5JbG/2omPDS/KYtYB72cu7NyJ1B2iixR9AbJpd6BYngOKOuF
 skNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCURBtsThWeN4Z6Cp9AAkb5A+F20m+GnSJZBD1Z4S5x4C/p/TMm4XEX+nensRoVF2DITgmTPIxlkkoPlZOZ+CcpEvcw3PzI1I7P9UFFlwWkB
X-Gm-Message-State: AOJu0YxWx/mswQl1mC5AJ5JPGarnTzZNX/9qESa2jHWZta60pHdjfw8a
 dUdWYtpmqf4kq6OQYsg9e41u5JgRyUiTGSyNvJDCdtIAE3PTqLcmbynWfy+i7Y3Qh1bNqAxXjC2
 gpB7tU4PjQV00c1sNywy4q4G9oP9IB8cY1domrA==
X-Google-Smtp-Source: AGHT+IGWuoBVMJIXjsmFPRcV8rj/qKuosgGA9fD35ftEBu5XLin6FbbgQbGoS5rFLXogGwGfuH4+cF7K3SUTk2qEnlk=
X-Received: by 2002:a05:6902:1345:b0:dcd:aee6:fa9 with SMTP id
 g5-20020a056902134500b00dcdaee60fa9mr15751750ybu.53.1713355129449; Wed, 17
 Apr 2024 04:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-0-78ae3ee9a697@somainline.org>
 <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-3-78ae3ee9a697@somainline.org>
In-Reply-To: <20240417-drm-msm-initial-dualpipe-dsc-fixes-v1-3-78ae3ee9a697@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 17 Apr 2024 14:58:38 +0300
Message-ID: <CAA8EJpoOMUbhqX2hcfCmU9+qr313naYi1d-rsUOqRuwaRC=3kQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] drm/msm/dpu: Always flush the slave INTF on the CTL
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Archit Taneja <architt@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Vinod Koul <vkoul@kernel.org>, Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jordan Crouse <jordan@cosmicpenguin.net>, Rajesh Yadav <ryadav@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 ~postmarketos/upstreaming@lists.sr.ht, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>, 
 Jami Kettunen <jami.kettunen@somainline.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 17 Apr 2024 at 02:57, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> As we can clearly see in a downstream kernel [1], flushing the slave INTF
> is skipped /only if/ the PPSPLIT topology is active.
>
> However, when DPU was originally submitted to mainline PPSPLIT was no
> longer part of it (seems to have been ripped out before submission), but
> this clause was incorrectly ported from the original SDE driver.  Given
> that there is no support for PPSPLIT (currently), flushing the slave
> INTF should /never/ be skipped (as the `if (ppsplit && !master) goto
> skip;` clause downstream never becomes true).
>
> [1]: https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/display-kernel.lnx.5.4.r1-rel/msm/sde/sde_encoder_phys_cmd.c?ref_type=heads#L1131-1139
>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 3 ---
>  1 file changed, 3 deletions(-)


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
