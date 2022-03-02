Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6174C9A8D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 02:39:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D7B410E4AF;
	Wed,  2 Mar 2022 01:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C63C10E1CF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 01:39:18 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id ay7so452916oib.8
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 17:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=E6diWwTXyeBROW+UGxxDyRa540TTA/bBdes9qrLj4UM=;
 b=jClyHtOzmfwF+u9W6xgJR6B6yp3RH6kTbHE29G8BHKgUzCjDDSxB2nN0yjCN3FJpLp
 KIiE6M+zGmn8Eo2R3XENJVQyVXtU8wnePn/LZyhc0WdkbGAeyhi4RS+uSeaDjnc84n8A
 HihsyMdu+/mY7F3WGgT63ly95lVeSlendbVn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=E6diWwTXyeBROW+UGxxDyRa540TTA/bBdes9qrLj4UM=;
 b=sPG6YIdsSkCjxFouArX0LoF1qJkCw0PeTwWGNCvvVl4B7OPB5cKjfsIn/ThQRniP8W
 Hjbmb3Mnu4qKDH18Qn8Y9ViDAQGmEjFaYXATezh4puLJVym7en2ZH43/too7sF5ewgZs
 xgZkGc50yaVQ/lOzRjzdAZvbrgi834FtgIdjjgQHWpzmZj1TIJmkRlk0Hap0mlkwu4Lf
 GwuK97jhvmACVAgXo52WVb5oxLc+pY6KFSfXzIOO4inYCIVZn1RBt/f0f35HvezC6KBz
 cmw+bOhH97iS74gZ8K2dWnTq2hK8fTB6tYMeriaky3JDcKDFkXX9qqsoUMR0qcnICabW
 /Ckg==
X-Gm-Message-State: AOAM533D8d7KVAftsk01th9dgDGXEcr8mDe/K4FOYhm7TwqjYyCqgHlw
 ZxpLgvifQsG9yEY5ltt23vK4x8vSz9o2C2cPc+bpGw==
X-Google-Smtp-Source: ABdhPJyVc8mt/2E94etQO2CuebnJCzyKdSVFOgRL21bsaQOZk6+CbkyQqoi5RkRSPudHu38uY0wDaLUvCMtoeKLFGLU=
X-Received: by 2002:a05:6808:20a7:b0:2d4:d2f1:9edc with SMTP id
 s39-20020a05680820a700b002d4d2f19edcmr15559750oiw.64.1646185158007; Tue, 01
 Mar 2022 17:39:18 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:39:17 -0800
MIME-Version: 1.0
In-Reply-To: <20220302005210.2267725-3-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
 <20220302005210.2267725-3-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 1 Mar 2022 17:39:17 -0800
Message-ID: <CAE-0n533xbLE8WTO4YKb0rxa9BRqqdPN65MfNdrtEjXytWtCGA@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: qcom: sdm660: Drop flags for mdss irqs
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-01 16:52:08)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
