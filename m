Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 757AB4B94A8
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 00:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C256C10E63C;
	Wed, 16 Feb 2022 23:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA3710E63C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 23:45:30 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id q5so2842840oij.6
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 15:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=urbTff3ySXfX9ztkV2WSW1OMaQe9/9WZx066jydpeK4=;
 b=UzcSTBuyQpdljM0EhR7KpOMLMhNNmtZphfI7ahI46AEzDy5QHc3Q8LaLJJ88O2gr4o
 4PE3i+XfXarTxFLdZUUHSYQg7TIOsZQojW4+XKTcUGHm2J1o5agTYsm/IURoH0UmKm0v
 g228bJBGD5Y5aNyrqxIRE6jNVhnLBxnSzAEX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=urbTff3ySXfX9ztkV2WSW1OMaQe9/9WZx066jydpeK4=;
 b=61W2RaOIDmxrv1qMG4W9v7BAyywuTYAlfHhay48ZzLSLVou3fv0U4kuyWP9S7pksU7
 k+jwrIojeVmoAOVSu3loft4Z3J7KDbBNFv7C9TZa7scggr7ippYtHuErJgAHeYM14lmM
 bvb8/qeB+0TcRQyiFytCqSx2ILal6i9HCXh5UWIUmLpSQcWIsIC2Nw5h3XzO34GVL66q
 HlVzTf+eVmQYdawfXC9Z3gCv0w4EnH5xDYQ9VvdV2yASVwlozjCWCdlNkGQO7JwGt2X7
 wxAp+exgC9OpKiqjDGctsODVADrCe5MfXvoqijRSYVPv2WbAdWfo0qJI5XX0xDCr8ZKo
 YvYg==
X-Gm-Message-State: AOAM533AzZjrT7DI53EyGBGxrZlUIMFgF4ze0PDw78dp3REaDNpQPD6k
 6NbEizbP9CP8X0CF1gVFsJ6fclNnumgzXg6Vxyb48w==
X-Google-Smtp-Source: ABdhPJwC+FZjkkt2k3aFm5upT8ZPjK+9KsMueCF3faJbdaaR7O9txcNN340aCsdpy2KadNskAEcn2MGE3nVZyZRZ0i4=
X-Received: by 2002:aca:df44:0:b0:2ce:285f:cb99 with SMTP id
 w65-20020acadf44000000b002ce285fcb99mr1720720oig.40.1645055129570; Wed, 16
 Feb 2022 15:45:29 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Feb 2022 15:45:29 -0800
MIME-Version: 1.0
In-Reply-To: <1643828199-8564-3-git-send-email-quic_khsieh@quicinc.com>
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
 <1643828199-8564-3-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 16 Feb 2022 15:45:29 -0800
Message-ID: <CAE-0n50aJykz-PGiZQ1oxfpRHpFJK9Oo2rZ3VVX320Pcd5uM5A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/msm/dp: enhance debug info related to dp phy
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-02 10:56:38)
> DP phy should be initialized and exited symmetrically to avoid
> clock being stucked at either on or off error. Add debug info
> to cover all DP phy to identify clock issues easily.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
