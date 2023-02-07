Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4F068D2DA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 10:33:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1033610E094;
	Tue,  7 Feb 2023 09:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8957F10E094;
 Tue,  7 Feb 2023 09:33:13 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id o20so21506773lfk.5;
 Tue, 07 Feb 2023 01:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eijivl1ANPuVp5wmE3ro4xbyX2qtwhdfnM7SSH99g5I=;
 b=D/TfzWaMuRK2xsZZgNFvf1p1iOGf14QXzjmz0v2nL/9nlHLXXpjsXHcPDkueiIDAZJ
 0+vkD6R8bG0/lplsUXBkelrQkC6u/3V5KNEz2cnLUclaBbitN1HnTpM3Ur5S7opoXOy1
 9LOaAjtymq5RqKuJMgTb3AxIsVf/vve/wCuTWl7d7POhcq3Zxo+D6dCt19Y8CsOzyoQD
 Zsht9upIZNNTcWjSQFpSBKBnkt6GDvYea4jh4Vjpr9/LE8vtwhLwGNL1NJeCiaaLBFqV
 edf6ojBNon553kibo29c/ReGXCq0sEVPoJIjiv4pxRteG0h3bH1R/pg4rQ6TI+12egjU
 FMZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eijivl1ANPuVp5wmE3ro4xbyX2qtwhdfnM7SSH99g5I=;
 b=PeHxTGzmUks5frMCAZtJRNeqvtVaBoguE+Y0s3ZWTKOyRO02ZN/iryAvw8DPWRccPs
 IdWY0DTK/loO1OOxKdfPYPOFyNuXlEDiCDqwuYI3ynE5D1gE9L3VTVVRos3S6Z4JBynd
 x7DGD7YtGA2oWO9y7DWjGjTWOoEtea0vL48douFfV85xFA00jNy2qEky+NFmHAPyAs3x
 eocoEz+fcISdxBMDDU3Vg+EM+iH+7eOS7IhkU+JlxWAmPophoamHcg9TlVTnnHVnWU1P
 8QaoJvj2JZIDwI/Bb9H/mSQ+zYa6XZ6Izmi9m2uucd+rjhXy34MsdA5VafKFInU5oBoR
 pkRw==
X-Gm-Message-State: AO0yUKVvJxtoOAGWRnK7LNnThuM/01bToRyKLJeoivuMG6f4nNJzoPQg
 MFU+HBL2sCbrUxgdZ4eGRMnsyZbvTNvWVU4RldX31bGd19jHfQ==
X-Google-Smtp-Source: AK7set9qpE8+mdek+WDFffvZ0XdSI6YCvNdGUTBJpdVd3NHkwpE+WxJ51WLjmzFgYDWKyM/j4Bi9PXw3X/69JYO2jq4=
X-Received: by 2002:ac2:562d:0:b0:4d5:7b89:7b67 with SMTP id
 b13-20020ac2562d000000b004d57b897b67mr310919lff.17.1675762391746; Tue, 07 Feb
 2023 01:33:11 -0800 (PST)
MIME-Version: 1.0
References: <20230203155309.1042297-1-ashutosh.dixit@intel.com>
In-Reply-To: <20230203155309.1042297-1-ashutosh.dixit@intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 7 Feb 2023 09:32:44 +0000
Message-ID: <CAM0jSHN421CatemTLzZMccGcjSQ_MJEA_vpqbCHgDrtuE_xC9w@mail.gmail.com>
Subject: Re: [PATCH] drm/i915/hwmon: Enable PL1 power limit
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 3 Feb 2023 at 15:54, Ashutosh Dixit <ashutosh.dixit@intel.com> wrote:
>
> Previous documentation suggested that PL1 power limit is always
> enabled. However we now find this not to be the case on some
> platforms (such as ATSM). Therefore enable PL1 power limit during hwmon
> initialization.

For some reason it looks like this change is impacting the atsm in CI:
https://intel-gfx-ci.01.org/tree/drm-tip/bat-atsm-1.html

>
> Bspec: 51864
>
> v2: Add Bspec reference (Gwan-gyeong)
> v3: Add Fixes tag
>
> Fixes: 99f55efb79114 ("drm/i915/hwmon: Power PL1 limit and TDP setting")
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_hwmon.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
> index 1225bc432f0d5..4683a5b96eff1 100644
> --- a/drivers/gpu/drm/i915/i915_hwmon.c
> +++ b/drivers/gpu/drm/i915/i915_hwmon.c
> @@ -687,6 +687,11 @@ hwm_get_preregistration_info(struct drm_i915_private *i915)
>                 for_each_gt(gt, i915, i)
>                         hwm_energy(&hwmon->ddat_gt[i], &energy);
>         }
> +
> +       /* Enable PL1 power limit */
> +       if (i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
> +               hwm_locked_with_pm_intel_uncore_rmw(ddat, hwmon->rg.pkg_rapl_limit,
> +                                                   PKG_PWR_LIM_1_EN, PKG_PWR_LIM_1_EN);
>  }
>
>  void i915_hwmon_register(struct drm_i915_private *i915)
> --
> 2.38.0
>
