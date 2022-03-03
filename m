Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9CB4CB895
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 09:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D277710ED52;
	Thu,  3 Mar 2022 08:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C65D810EA4B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 08:19:48 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id n11so3945349qtk.8
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 00:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eBbghWmyN77JF7RUpoIN9lkaA23tcjbHORN7ZoYwWzA=;
 b=O33UcScGamI/CbJS2qdYJFMnkoGyvajYHAEDnA1q32GaQGdYlOFF7E/Wu4I2A6awOB
 8kHS3FMUK2LE41rzxdVjPjRD9UKIjJgcB730BEVO9EFbgrwPgXVRpI2j0WITQtJrjn4v
 cVeafQ/DY+JzVcs8qekyK+4EZn/xF0kAVhJNY0eX56zgfPsIpB3vQ92roJgu8daAvomr
 fL6PV8jZKzTYn+t2bn9N/tWswi4bxc71DF6zMvRz50BOSDS/whVmIdG4MoA4nBKNmwEI
 ENNeJnXecQxETQlmR0yjeMH6vWpP18HnOa30Jt3D8T1DHzWE5IQIAuA4+FGcjHqlBSxf
 zAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eBbghWmyN77JF7RUpoIN9lkaA23tcjbHORN7ZoYwWzA=;
 b=lq72NN9p77PSNrqUaXH6V1Oiu9XllXZ55b3VnUmzSeGgG1CXf2Mkcc7JbdYtqnUVlW
 mWFWB7/HnQttmpJ/qF7A3Fl8CUdazKJfl+ocCsSJ67+B4kpoVse3yiFSz/1YHII3CD9g
 10xLE068eIPPybmOW4UnZVoKvKxhqnd8MXSy1FXRBuhUpDS78z0cI8QA/ICdTDSwGCI0
 ni/xN0Qg4KyYfVJxgaDKOQzc3kWj40H5Iqa010FM4jGhsD7TTGCd/qpE9LstUExT0Inx
 u2EvhoTXazN/gRSMikB08EEIsP8QZeweGDzMqUiPjU5/otbWJ74Ta0aveupBCDxkPsA0
 M6MA==
X-Gm-Message-State: AOAM532fGlYemEHtQoiWSED/6pT3HWdQ0w+OuVougub32g2go0G0JBg8
 lGMWKhleEyBK1x4GfcQ+JNorBXl1SoRpqcLyxQMXZQ==
X-Google-Smtp-Source: ABdhPJzwybpbRKv/JsGwbbxWqXiPUR4uibbx0YjX5VRLF4ZSmc8ArqQjtlAMg4s/pfikPz32DA/3T3dwuz1Doz+bPUQ=
X-Received: by 2002:ac8:5713:0:b0:2de:4e16:5b25 with SMTP id
 19-20020ac85713000000b002de4e165b25mr26214309qtw.682.1646295587875; Thu, 03
 Mar 2022 00:19:47 -0800 (PST)
MIME-Version: 1.0
References: <1646294904-4753-1-git-send-email-quic_vpolimer@quicinc.com>
In-Reply-To: <1646294904-4753-1-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 3 Mar 2022 11:19:36 +0300
Message-ID: <CAA8EJppbk+yCmVgRbUNBn+BO09xDZe93RXK_cUxbX9HZM9ZXmw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Update mdp clk to max supported value to support
 higher refresh rates
To: Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Mar 2022 at 11:08, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
>
> *** BLURB HERE ***

Description, dependencies, etc?

>
> Vinod Polimera (3):
>   arm64/dts/qcom/sc7280: remove assigned-clock-rate property for mdp clk
>   arm64/dts/qcom/sc7180: remove assigned-clock-rate property for mdp clk
>   arm64/dts/qcom/sdm845: remove assigned-clock-rate property for mdp clk

sm8250.dtsi is missing

>
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 9 ++-------
>  arch/arm64/boot/dts/qcom/sc7280.dtsi | 9 ++-------
>  arch/arm64/boot/dts/qcom/sdm845.dtsi | 9 ++-------
>  3 files changed, 6 insertions(+), 21 deletions(-)
>
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
