Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C3840D8F4
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7776D6ED16;
	Thu, 16 Sep 2021 11:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936CC6ED0E;
 Thu, 16 Sep 2021 11:42:43 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id i25so17395135lfg.6;
 Thu, 16 Sep 2021 04:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PUQk7iybu5WtIm/qZMASrmynw7Z5a2vpy/m8p2+iZe8=;
 b=MDg7v6ox6x0o3dfn7tgSllIApU6+EXugjT5h/sHE1X8f3CJ9vYDfcGnDMLhjlMEzzn
 NlYB0ZabvKyD3RBCK1cS4R1nvvh9S7HtvgYtXH88QdwIZBei7fIiT1sNb+A7dfFlSFmq
 xCRCRz5dkiR1j64YTuhzS3mPVgfRODdqwxX46cu/bNCjGXo0QuaultoU15K+lJUGnWz2
 z9UBHuILkhBIC9HW7FPfkqPQ3mOBGUUpZZZZ/xgCQP9RQHwbfvKnx1Y+VBPieN6jzVvc
 2kE2ra+vvY7GY33loXSss7lZYiG+0k/Qm1gKs66R+F7mp22AZ//RBYTjeJLT+sxZJIFf
 vzig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PUQk7iybu5WtIm/qZMASrmynw7Z5a2vpy/m8p2+iZe8=;
 b=TsVGbFRTpbtHHlBhosMmt7HFC/s3sxRgeYDuc4fFs8m5uzsIFC7WpLMOOJTiqIDxLM
 fIbJhR7iK4hhCr2uwa5yJvuE7DcXTVu686IK1IeArg6U/M5leOBJBLOKpHLLRt326JHM
 CbM/zzEjQdOWxIgxcywWFEx3Pzl0fjl3SIHfPoRQipsMyYIxKOG9VcLw0ZIpaL7lvPZN
 mESZJ80Tjrn+nGDS0mu3JlSiT5Vfjtopj5TnRrOVBs/8ARnYy3+okbCHvzn+jr2ZQS09
 dC2hs0tKBZ9MX+mMzq4p7zluUy/WnJ+sk63NWW04Rvb/JIsZCpnwKmgyNdPJLy/YFYoN
 vGMw==
X-Gm-Message-State: AOAM530oOuFrTwM/tMQQR78bkWRVHYTbe312vGgJSk91SBnHRn8d0kA5
 Ts89cBBLVhPgkX4vpbVKIWAIjj2QXr958uVn68k=
X-Google-Smtp-Source: ABdhPJza6hu/ncrOpwL7Lf2mvCRXBLaEbrjvI29b1pcjk3aPpiyh9OcqUow6EQtX7q/hL3NBu594dbpJIuOD+B8W4P4=
X-Received: by 2002:ac2:5d49:: with SMTP id w9mr3665501lfd.450.1631792561854; 
 Thu, 16 Sep 2021 04:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210914174831.2044420-1-festevam@gmail.com>
 <96038e06b1141ad3348611a25544356e@codeaurora.org>
In-Reply-To: <96038e06b1141ad3348611a25544356e@codeaurora.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 16 Sep 2021 08:42:30 -0300
Message-ID: <CAOMZO5BzU3_x7nb8sEF_NDeDOxYM0bQLEpbRzv39jayX=fudYg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Do not run snapshot on non-DPU
 devices
To: abhinavk@codeaurora.org
Cc: Rob Clark <robdclark@gmail.com>,
 DRI mailing list <dri-devel@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, stable <stable@vger.kernel.org>
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

Hi Abhinav,

On Wed, Sep 15, 2021 at 11:22 PM <abhinavk@codeaurora.org> wrote:

> Are you not using DPU or are you not using mdp4/mdp5 as well? Even if
> you are using any of mdps, kms should
> not be NULL. Hence wanted to check the test case.

I am running i.MX53, which is an NXP SoC, not Qualcomm's.

It does not use DPU, nor MDP4/5 and kms is NULL in this case.

Some debug prints to confirm:

--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -557,18 +557,22 @@ static int msm_drm_init(struct device *dev,
const struct drm_driver *drv)
        case KMS_MDP4:
                kms = mdp4_kms_init(ddev);
                priv->kms = kms;
+               pr_err("******** KMS_MDP4\n");
                break;
        case KMS_MDP5:
                kms = mdp5_kms_init(ddev);
+               pr_err("******** KMS_MDP5\n");
                break;
        case KMS_DPU:
                kms = dpu_kms_init(ddev);
+               pr_err("******** KMS_DPU\n");
                priv->kms = kms;
                break;
        default:
                /* valid only for the dummy headless case, where of_node=NULL */
                WARN_ON(dev->of_node);
                kms = NULL;
+               pr_err("******** KMS is NULL\n");
                break;
        }

# dmesg | grep KMS
[    3.153215] ******** KMS is NULL
