Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53414C9A89
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 02:39:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBBC10E1B8;
	Wed,  2 Mar 2022 01:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A64FA10E1BC
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 01:39:08 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 s203-20020a4a3bd4000000b003191c2dcbe8so300130oos.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 17:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=fqt2epDNXcKQewfFdxGKfvnn/9tl7eVXMmiDlO3ZPK8=;
 b=fOCi9Mgnwlbw6J5alBDE2zd/lnwvO3wz23t11dliBc/FjSZZB3F4vqnGSw27uhq9tw
 NjaktY1TxO6e/8ISJ7bF/EWiZ87r/9z6xUY3mq17ssTT9GlFT+7xP0cuHVNahEdnwWng
 nGrTY28QLVoXSYCngqgpnNGk4uHiTPlwrz9TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=fqt2epDNXcKQewfFdxGKfvnn/9tl7eVXMmiDlO3ZPK8=;
 b=VIrdzs/6vh1Sy8vJ5YwF3cwgZfZXFcyMM6DW21YjR1u0rd3Cwy9RRIkyG64meuTlZY
 6qrtLrGj/oaUIJKz2sL9BoIxF+QugpQOzikg6F5fz6wbI9mSp9xW9NROF7WE3oFuAH9q
 aC9HE0057aauMoRC6t6ke+nn6waUSnHf/cf3xtNsFxFVUGrsXYXje4JmGPaMx3sDo/D/
 g9tQWtffjKX6HgQb70bGjsxr4H7DrKXVCTl2XaF/O6nQAt8ubXy2UOEDgGUs5SGtX6bK
 o2rnAB/dzgVR8Paby663Cu7QMiSDYxZTa5SLUURFGCB5ItqmlBPbsDAl5R8xCU1G3LtI
 m9ow==
X-Gm-Message-State: AOAM531qryArZUJLitXu63HMu+Tq4+rjFaW9s0Y95ZM0BHCCZ4jqlfPF
 Wu0+15bcegYt/mXnl9TByv+Lp6Bbjzxpet8eX1XK/A==
X-Google-Smtp-Source: ABdhPJwIYeV9qvIuuF+oMC8rqQlRHkPEiEqdWv89wTOUckhcNCXV08k84Gj0mee+7iuOh0/gleLfanoMttTHMITMtUo=
X-Received: by 2002:a05:6870:42c9:b0:d6:cd4b:1e2c with SMTP id
 z9-20020a05687042c900b000d6cd4b1e2cmr5968203oah.64.1646185147656; Tue, 01 Mar
 2022 17:39:07 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:39:07 -0800
MIME-Version: 1.0
In-Reply-To: <20220302005210.2267725-2-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
 <20220302005210.2267725-2-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 1 Mar 2022 17:39:07 -0800
Message-ID: <CAE-0n51dR5i3X7kLbvsLrpvwY+vCS3tDGcEXHF+e2kD_cgxyJg@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: sdm630: Drop flags for mdss irqs
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

Quoting Dmitry Baryshkov (2022-03-01 16:52:07)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
