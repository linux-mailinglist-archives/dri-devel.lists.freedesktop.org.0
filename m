Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C486EA059
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 01:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF77110ED5C;
	Thu, 20 Apr 2023 23:58:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 029ED10ED60
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 23:58:23 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4ec8da7aaf8so1019270e87.2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 16:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682035102; x=1684627102;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7AK29Vqlmjj3QqMiRI2bsAKdpcELqF+rg3ndnHxq09Y=;
 b=FYZ/2dMxGYlduhZjTzDa90fPuGbrAZHU7W7leXYuArgvcLMh9r57wVo3PxIuUDB5/N
 MCLuTbcmoEazsNJMhWYIvXNw48VjO0EcWk2pqfyAVjBC92uMeCa38Wu6AcRDMhgXmi7W
 IXqnuyO5FH9CXCADxDPdWnttgNRg34/AFhfRrKHXqBLaF0qabFsuoJ5sP/JUXfxgaQkj
 LjTCANlCnLzeo2eLVcCBkB2rhvHfQcY+B98tej7wqOYZ3g2hYWrNk+63O132akiR7i9O
 H9uxNQrXlSBhhErYA2TzfUBA6VXbyrtU6QE/5ja+BKfZFlrH4Ikh19BBHSThA/uOsud1
 RiIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682035102; x=1684627102;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7AK29Vqlmjj3QqMiRI2bsAKdpcELqF+rg3ndnHxq09Y=;
 b=SW2uex3rLcZYIKgD+kkmkcHEu48kX5DvKpHNCFyx0n7GTIq3V8XWu+XufP33p85AxJ
 5TtFm52HjF9675jkXtScQj2Wr3cC0jvGLksXCf1mOrplde607SxDsYl335aDv7oF1FXt
 sWx8/ZhggTOqDD1Yknmoq7kNqZOOUVVAKbxpYvWlLoh1Yb44h6jE92gONA+Yvi9W8pDy
 6Au/Iq3cxGmumpPs1POo4oQ0UsJBbaqfNLk4h4MOoaVs3toxY6dV6L+jlT3vuc1G9dyd
 24CVXSF6gnPQgL7NmGPtA6bcPvxweo9eF1+1TscaY760VkWA849NdS7TlN5A/r6wHAR0
 kxyw==
X-Gm-Message-State: AAQBX9f9HBR4LNarUx1nkrHNZitRxkzR689wPBEwxcs0kCXbmk8oyNLs
 qmmvAXemuXJKNIKc634f7S0ZVw==
X-Google-Smtp-Source: AKy350YWf5KVt5uMobAN0BnSlS3GmR5H5Tp+nYzhcAsHZ7p988nsIWUE1rY6pnczQp8z17yHnk/90g==
X-Received: by 2002:ac2:48a8:0:b0:4dc:84dd:eb91 with SMTP id
 u8-20020ac248a8000000b004dc84ddeb91mr796914lfg.22.1682035102091; 
 Thu, 20 Apr 2023 16:58:22 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t1-20020ac25481000000b004e92c0ed7a0sm368682lfk.100.2023.04.20.16.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 16:58:21 -0700 (PDT)
Message-ID: <fe419932-3a1f-033d-eb85-dfc69c97d40d@linaro.org>
Date: Fri, 21 Apr 2023 02:58:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 2/5] drm/msm/dpu: separate DSC flush update out of
 interface
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1682033114-28483-3-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2023 02:25, Kuogee Hsieh wrote:
> Current DSC flush update is piggyback inside dpu_hw_ctl_intf_cfg_v1().
> This patch separate DSC flush away from dpu_hw_ctl_intf_cfg_v1() by
> adding dpu_hw_ctl_update_pending_flush_dsc_v1() to handle both per
> DSC engine and DSC flush bits at same time to make it consistent with
> the location of flush programming of other dpu sub blocks.
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 14 ++++++++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 22 ++++++++++++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  | 10 ++++++++++
>   3 files changed, 38 insertions(+), 8 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

