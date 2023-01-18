Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3408670FFA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 02:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA6910E61E;
	Wed, 18 Jan 2023 01:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E22710E61E
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jan 2023 01:28:26 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id v6so36679973ejg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Jan 2023 17:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=o8QyhSnzbFdvQ5FvcP2X1YXz8UVWrJ0qZl/VLhR8k68=;
 b=tJuJCTlME1+6oauOK4SU7qRrWBxXoClZTj+bEv/XGHdCWDNFmfF2CILtP+FS+gHRrn
 pE3+Cm718Mwh0TLDGx6s1pocRQG2/MEBFi4Dq69xd0uH0fB5FCRQfdnvxomfaDvf4lOI
 lUlGgatBgxyC0Pwc2l5+8GqAMiPRs+AD6BzqJamU4q4wNTY76o04AWshNdARyT2P70qY
 JzoG323sgz88Jr5yYTplGh+EhRA4ZO9rznDHErfsXHDGGBHfX/+zxR4rL01bjNU6bHR8
 yuHKki+HdciJ8a3ntBBC6Qb/6UxoWC0MIalK4RPTc0kykB0JBxGNVuxJQwSj72DsKlJF
 Ga2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o8QyhSnzbFdvQ5FvcP2X1YXz8UVWrJ0qZl/VLhR8k68=;
 b=n6W0lUd9si10ChCbv5g6ALCHx0ekEG/jLdu6NtIOwIRfm45BPsM8SietCYSa1oJzAV
 cVjJMX3yHBwxWQRUnz2AoHjpIpPfYrIGQTgmhFkgUBUyHgSv/pNiFrvjY/0m7ng2Rpxu
 urvaiFxg1EkJzxV8lFsdQ6Tgwq12gqlrXtITW7l172FYDYmpg2EoNm6OCzg7an0Yn+qa
 Fb/cWMezkSkweq2ClJUXQxUBe36cHfLoFJ4BN9eXanO3gToo+hi7Xr5yPFAqQu6qCXOW
 ZrMxONXprf5J01YdliSGOG/djPBTeugS192vb+oF7N9rMnSC4lr6y8eenEuuf+6k8g8v
 juEQ==
X-Gm-Message-State: AFqh2kpxgvfvc1x7GxrRKSqS3DybNnwlPPFcAN0HZYlMKon+lvKVi7qp
 lbiSLQdjiewKpAbNthOrC/6tyg==
X-Google-Smtp-Source: AMrXdXt95F0POe56gcMKmWh647lKMiS0QfbK44kq6hQKEpNhP5zhV1YME0/5F4Nz9KPGga+FxIS3MQ==
X-Received: by 2002:a17:906:6843:b0:86c:a3ed:1442 with SMTP id
 a3-20020a170906684300b0086ca3ed1442mr5296523ejs.4.1674005304769; 
 Tue, 17 Jan 2023 17:28:24 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 bn11-20020a170906c0cb00b0087132e779b3sm2835803ejb.224.2023.01.17.17.28.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Jan 2023 17:28:24 -0800 (PST)
Message-ID: <7f3a02a5-53d0-4374-6f9b-894b1140da06@linaro.org>
Date: Wed, 18 Jan 2023 03:28:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v6 2/2] drm/msm/dp: enhance dp controller isr
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1672193785-11003-1-git-send-email-quic_khsieh@quicinc.com>
 <1672193785-11003-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1672193785-11003-3-git-send-email-quic_khsieh@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-arm-msm@vger.kernel.org, quic_sbillaka@quicinc.com,
 freedreno@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/12/2022 04:16, Kuogee Hsieh wrote:
> dp_display_irq_handler() is the main isr handler with the helps
> of two sub isr, dp_aux_isr and dp_ctrl_isr, to service all DP
> interrupts on every irq triggered. Current all three isr does
> not return IRQ_HANDLED if there are any interrupts it had
> serviced. This patch fix this ambiguity by having all isr
> return IRQ_HANDLED if there are interrupts had been serviced
> or IRQ_NONE otherwise.
> 
> Changes in v5:
> -- move complete into dp_aux_native_handler()
> -- move complete into dp_aux_i2c_handler()
> -- restore null ctrl check at isr
> -- return IRQ_NODE directly
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Suggested-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_aux.c     | 95 ++++++++++++++++++++++++++-----------
>   drivers/gpu/drm/msm/dp/dp_aux.h     |  2 +-
>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 12 ++++-
>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>   drivers/gpu/drm/msm/dp/dp_display.c | 16 +++++--
>   5 files changed, 89 insertions(+), 38 deletions(-)
> 

Stephen, Dough, do we still want this patch in?

-- 
With best wishes
Dmitry

