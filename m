Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDA15B231F
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 18:07:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B0C310EB49;
	Thu,  8 Sep 2022 16:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [IPv6:2607:f8b0:4864:20::1132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E924110EB4B
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 16:07:33 +0000 (UTC)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-3452214cec6so128469827b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=JJv51cMEwPKHeGHtyDWtDlnrabxmd1GuWDEXM9pG4rU=;
 b=TcrxrJCtL6pyn3nnmMSCsZMPhcs5m3fyi2iV7TKoaOShZwoPJQYgjIx1KBYqXESOP0
 bNBni7sHtK8MyEgvjgrpp9gur+gQLZj+Q80cmIREIB/RY5abPTO5tOnxFz9MXRG2zAar
 117pLJeiY50esGdC1pApVgf1nKk0IeyoJawvZDOf+oLvJ5A3IdPLmHWZdai1sW8jlrMb
 xwzeasSr/jc0rmPNyLp5Ak2o/AWa7XoT5FdGPt4i8iaKYZyk2vwijRjgAAhGmtRjhhJg
 Ga9S67aUzkZzbjdoTAAvgPD6bPdvsVs0DJbIvQEU9UZrrTy4JUidRk74VH05GppL80F+
 SGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=JJv51cMEwPKHeGHtyDWtDlnrabxmd1GuWDEXM9pG4rU=;
 b=Ij3gHzi4YnBnl5/N7dUw3JttCulLSVLJhx4FVn9qXpefAnts0czoN1Qv1XjvwLNv2V
 hqPk225Fl/mmo4lvx4lsyb6GQ8B9dXKsgnOSIpSyjyug4xDOxNniuV+7EwbQl7XygqE4
 gfZpNjz955A8SYdQhRlHNkuOoIvXLtKWCtekgK7Z6KIp8tBf/zoSNcjnwml3/tuzdQXR
 Isfy2OB/g4TCQ183RHr5Fi0G57/mkdcCqreMH2FbXc5Q1Q88DsYgvlXr9tLnskDvF7B8
 pBT8oM9FDQ5a/5XUSBxSvx71SWm1k2wM9vUyJ3iCfz17h2hHqRBBrR6fXW+eesjz7vbt
 JOjQ==
X-Gm-Message-State: ACgBeo06XRSuQXaV/bjvVNomOxaoTYmXh4qVsBBj9YPxoTES/Nd1gXmT
 0x2+6FOQDeTXVrUurhP6ynLM5oizvad6zz86xNnGsw==
X-Google-Smtp-Source: AA6agR4zjZ5M4DR5iRReMpuVoqJUCuQUa9QEuRg73CcLPLa7gZkhLwEqcDY/mIHWG91nOJscsrrtch3EhKjLReFSL5I=
X-Received: by 2002:a0d:ffc5:0:b0:341:6cc1:c589 with SMTP id
 p188-20020a0dffc5000000b003416cc1c589mr8431078ywf.418.1662653252731; Thu, 08
 Sep 2022 09:07:32 -0700 (PDT)
MIME-Version: 1.0
References: <1662651516-30283-1-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1662651516-30283-1-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 8 Sep 2022 19:07:21 +0300
Message-ID: <CAA8EJpr_cBTyugJx1qZCEEgsdNvxHmZ7TPZiqRu_kb=NNNVLKw@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/dp: cleared DP_DOWNSPREAD_CTRL register before
 start link training
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 8 Sept 2022 at 18:38, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> DOWNSPREAD_CTRL (0x107) shall be cleared to 0 upon power-on reset or an
> upstream device disconnect. This patch will enforce this rule by always
> cleared DOWNSPREAD_CTRL register to 0 before start link training. At rare
> case that DP MSA timing parameters may be mis-interpreted by the sink
> which causes audio sampling rate be calculated wrongly and cause audio
> did not work at sink if DOWNSPREAD_CTRL register is not cleared to 0.
> This patch also make sure bring sink out of D3 power-down mode into D0
> (normal operation mode) successfully by retrying 3 times.

Split into three separate patches please.


-- 
With best wishes
Dmitry
