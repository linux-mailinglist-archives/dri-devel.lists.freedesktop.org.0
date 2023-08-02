Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772AB76C9F0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 11:56:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61D6210E534;
	Wed,  2 Aug 2023 09:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C46E10E531
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 09:55:52 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fe1489ced6so10948739e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Aug 2023 02:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690970150; x=1691574950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g3f9a0bqaXmmtqQwbJx6feRw+OxMSPGWZtZpS80ibCA=;
 b=TsJKcJ4yS+4vQ3C3KyyOdARzfk2j7dx8adqXZ7Vodft741sJJC8JXHqCFds86wXwej
 qESohiG6KA+3asWplAABmzuMmvTuko03NiF3hzUyb5GB2+eosnAl7+FAu9ZxBElkF/ux
 Oud3ZV8nuudqi6Bd9CtI7cgEi8AZfsc9/QaOD2Kz7RFeoQKNoU1bsFSdPCfBf/miIasS
 2UnUx+DLvRociKdqbZISdIElvZDz1+EBwOhXAudcLqsyz2x9w95peJGgNsfrBjZfNMA+
 twpZJhWribksSbomuAZgWLi67yCoMsn+vhHKSrm3wuMb1ESfqpWy+KkximQRMQXFGyf0
 qc/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690970150; x=1691574950;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g3f9a0bqaXmmtqQwbJx6feRw+OxMSPGWZtZpS80ibCA=;
 b=luuNzj5hCflLx/p3hxbyMNuAm1AQx7silpnn35IKGXA4dUs9lEIsu+ZnL5f80onzFg
 MPGUsPgDkxxjXawZrbAePy9mcASG2EbtkidgnJHwXWXlf0bF7mRX2aJKrejDpQ7LH22u
 48o1syurlKPn3z+vgrqJNso4X/IAq2zkDXT9MxcpJ9FoqqBe0aimMnuDsyJOdngg4zpD
 meNcgzF/q4NTH9mVzOVz+qwGkPaWEK/x7YuiWd+Srzv4quwKDWtkjN2pVPQxvFHL6CM9
 pfTPvtwY5LndHHVtI40KN2R7z+cMzTW1Icu+zHk62/O/yikE6UsTmY3owc1LhFLhQ5gb
 ++GA==
X-Gm-Message-State: ABy/qLbcFTHMK3DPZFrXhfhxoXOMgrCpnw6Mv6XD70N9NDkg9w9ezzMw
 Ejv0tRI9bh+VGmdbptWUA0+HzA==
X-Google-Smtp-Source: APBJJlH8PxyhUTN1mgA7mgCOhBeQJg4KAK+rtWR5LQCJoz3DfP5YUZqpJdz9DuxfNw42F/LERt4eUA==
X-Received: by 2002:ac2:5319:0:b0:4fb:7c40:9f97 with SMTP id
 c25-20020ac25319000000b004fb7c409f97mr3788949lfh.27.1690970150547; 
 Wed, 02 Aug 2023 02:55:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac24891000000b004fe1960dd7csm2779762lfc.132.2023.08.02.02.55.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Aug 2023 02:55:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run,
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch,
 quic_jesszhan@quicinc.com, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ruan Jinjie <ruanjinjie@huawei.com>
Subject: Re: [PATCH -next] drm/msm: Remove redundant DRM_DEV_ERROR()
Date: Wed,  2 Aug 2023 12:55:46 +0300
Message-Id: <169096995980.4183272.6381311756168703819.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727112407.2916029-1-ruanjinjie@huawei.com>
References: <20230727112407.2916029-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Thu, 27 Jul 2023 11:24:07 +0000, Ruan Jinjie wrote:
> There is no need to call the DRM_DEV_ERROR() function directly to print
> a custom message when handling an error from platform_get_irq() function
> as it is going to display an appropriate error message
> in case of a failure.
> 
> 

Applied, thanks!

[1/1] drm/msm: Remove redundant DRM_DEV_ERROR()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f09f5459bd85

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
