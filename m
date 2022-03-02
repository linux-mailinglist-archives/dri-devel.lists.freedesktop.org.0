Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B844C99D3
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 01:24:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89CDC10E1D1;
	Wed,  2 Mar 2022 00:24:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44B0310E1D1
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 00:24:53 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id b13so13218qkj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 16:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zf2ULn0elai1DQP6DK4nPbrJ4hgulzfjwpA+B07Mye4=;
 b=Vaxfzhe5jRSu7pBxU/9C864q1lnnA2SgZ58NAG4fQYy7kuZfQIsa339XAguSx8eRza
 DrNpLkLts46hPPsCfr/Ag9tcOvBLRdLVA1+aCUDNZVAk+3GxowkInx2wERDpBw+8MNeD
 Uk711xHciJjdZrnOlFSve9+CRRkv2ybLhofRXbqfgajOvSpCtSyi1p6D8+cdBkzdGYaZ
 K6e4KnLqF5bdOC0OloeF2kgtS9AEoM1t2rQSQnfdmcmlWyJRb9qtcuDhTGqVsz2ZW1KL
 9t+rFhEDWsbE56oGhG59Ys6J8ZhiVrXAgCH/DR/5vXEU67SU6aJojTWJZozIlm6QlMI9
 PjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zf2ULn0elai1DQP6DK4nPbrJ4hgulzfjwpA+B07Mye4=;
 b=Qhd7WAYlfdujmj7q1Hc9cta3IKauhSXeX5gnc6UWRuiwdUn1Aym9KFTQLjeVT/JB7e
 tbosh5BvdgsSEo+D+iT8fkaZkeoXDhQlQZ2C2UykVJyytq9IZ5R5iKTA6vvnK98Jk9vs
 huubjiCkDHuca/c26ukSP5rbaDdQcKUxKucsRbSFvDbr/I2K7oCpCxAKIpbA+VPlGdhF
 d21nby798zbCwoFscZ/fqfCoZGcCHEQ+AFnwYCjUq4ZMPKfQZbCDY2kVn7J6qY8q3gfd
 ZBI6tej1jmiaUjfv3ygOW887GKIE7JBK1ugub2sYsDBO5YOamlEV+MzGAFwjofg3T6ow
 dAAQ==
X-Gm-Message-State: AOAM5331WKTK0vFy79a7Qsl5vEnABPTDSI+b4h2jjjk9AnTj2079jMvQ
 4JaP3o48+wsMo/cpjuJntXtSg6rPkgRAVcD19xO4xA==
X-Google-Smtp-Source: ABdhPJy7pua4Isz2AeTn/110l78HrRyd3wHGQp0SFekEFMbjXORFyFMGDeo8frJ3QUcf28v/6BObspZkZXX39859Y4M=
X-Received: by 2002:a05:620a:4307:b0:507:d5b1:f65e with SMTP id
 u7-20020a05620a430700b00507d5b1f65emr15137243qko.363.1646180692367; Tue, 01
 Mar 2022 16:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220302001410.2264039-1-dmitry.baryshkov@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 2 Mar 2022 03:24:41 +0300
Message-ID: <CAA8EJpr9e2-wz0Hmm7joqOMmAL9asiv4_od+WhS=3Pzs2C9fGQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] dt-bindings: display/msm: add missing brace in
 dpu-qcm2290.yaml
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Mar 2022 at 03:14, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Add missing brace in dpu-qcm2290.yaml. While we are at it, also fix
> indentation for another brace, so it matches the corresponding line.
>
> Reported-by: Rob Herring <robh@kernel.org>
> Cc: Loic Poulain <loic.poulain@linaro.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Also
Fixes: 164f69d9d45a ("dt-bindings: msm: disp: add yaml schemas for
QCM2290 DPU bindings")

> ---
> Didn't include freedreno@ in the first email, so resending.
> ---


-- 
With best wishes
Dmitry
