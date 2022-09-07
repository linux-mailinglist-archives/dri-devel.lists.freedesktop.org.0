Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A305B0B83
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 19:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F7510E7FC;
	Wed,  7 Sep 2022 17:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F9D10E7FD
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 17:32:42 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id m3so4634648pjo.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Sep 2022 10:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date;
 bh=PV80BfdzomPMJURi087Oy7m2sToiidrH8fxfw0BanCk=;
 b=WRRE6viD0EvhH9JvdnKy35PydpK4R3QCY/miuWOrErAWVcPaRy85VWJR0c678t9Ppl
 UJeDRqiNHEAe2812nwuVeiQxxbaF2Vp+J9CHb6Zx4SjHwcf1XHtK2bgHI6p85n9jk/4M
 mUBSZhxssIJrPWHUlG1Ie0s75g9vyAhz1qJaelALcMhfxDhL3lBpvZqutwAWU5dDFqtJ
 GhFRKKtxKttbyFedwpl+YK4U/MIidIGNTwjcLrzRbUwpVh3XoI9aOyN0TBAulIfDKo6l
 L7oaMvC6JgAZrFIDLTZrQHKo/3X/J1GyN7JPh54MqIKzf2dcmXjAWc42qTGhixSwoh8Y
 u6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=PV80BfdzomPMJURi087Oy7m2sToiidrH8fxfw0BanCk=;
 b=mYYYxH5xgPrV871qXk4pdzl7GE1bp/lDP6k5s6IHAxJKYXt4V3vQnJRjAdPkElzw6i
 8bjQfP985JJ/5b/XEZnqFfAzzCVmiFilmmHv/iypwpPAlAV/L9eXKbjfGneV/L5zT1Zu
 mCDHJe6DVOUPAFO/LzYC4CAPVzYgUKCBtXuixV5g1viy9T5D/hw+IkAN6vCwbMP/UUeM
 yrUjq2ZZEfqgVaqg1WfVmVmylnqaw3uqZdB2lkfYWaBjrpji9xLFrbGec+RrpJpxUPoa
 vrUsYnZpEkdLJwPrNv0lXUiDLTFz1qI7wAxmxGTSzeMKqZREbR1w7Nwx6tui15aOjfzv
 TUHg==
X-Gm-Message-State: ACgBeo0C0SyBClRPs8rqJtAJU9mIlugooXIcraeyFs1Y8dSnBcUb+uk6
 CIyPlRSckvFvAkoxB2PI26om
X-Google-Smtp-Source: AA6agR4UATw/VzqQynEchHeCQ6k+uSoa//y5hg8/e35Ta7K7Nfw3Mu88+Tq3J1V+IwbNulUfgaL6Mw==
X-Received: by 2002:a17:902:e811:b0:176:a865:8b31 with SMTP id
 u17-20020a170902e81100b00176a8658b31mr4905982plg.54.1662571961768; 
 Wed, 07 Sep 2022 10:32:41 -0700 (PDT)
Received: from thinkpad ([117.217.178.248]) by smtp.gmail.com with ESMTPSA id
 o7-20020a656a47000000b004308422060csm10562677pgu.69.2022.09.07.10.32.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 10:32:40 -0700 (PDT)
Date: Wed, 7 Sep 2022 23:02:34 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [RFC PATCH 0/3] drm/msm/dp: several fixes for the IRQ handling
Message-ID: <20220907173234.GA539582@thinkpad>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Johan Hovold <johan@kernel.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 12:15:24PM +0300, Dmitry Baryshkov wrote:
> Johan Hovold has reported that returning a probe deferral from the
> msm_dp_modeset_init() can cause issues because the IRQ is not freed
> properly. This (compile-tested only) series tries to fix the issue by
> moving devm_request_irq() to the probe callback.
> 

This series fixes the probe deferral issue on Lenovo Thinkpad X13s. But I
didn't look close enough to verify if all other resource deallocation are just
fine.

Thanks for the quick series, Dmitry!

Regards,
Mani

> Dmitry Baryshkov (3):
>   drm/msm/dp: fold disable_irq into devm_request_irq
>   drm/msm/dp: switch to using platform_get_irq()
>   drm/msm/dp: move dp_request_irq() call to dp_display_probe()
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> -- 
> 2.35.1
> 

-- 
மணிவண்ணன் சதாசிவம்
