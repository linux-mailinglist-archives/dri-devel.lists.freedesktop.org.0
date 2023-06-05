Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC15722BE9
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 17:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41C8E10E2EF;
	Mon,  5 Jun 2023 15:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4301110E0F4
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 15:50:16 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-ba8374001abso5589249276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685980215; x=1688572215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Q/rwEbo5JSTdoMaDlmiLIrc5B4xTObKdifeh+A92pBE=;
 b=tehXU3POZZFMf6S0xCJwhCc8lbhQyW0kfHxtEmy/yPV8CjRAWwZjEKDl38RSm0vvuv
 65O+s/Qi0reXdb602murjsaUDQeMFhr9bxzJVpQXAuxtvRJ33LIjA2LobSVtUmphfc5t
 dpn6X14T8TMcAQ4vb0cZMAZgpfyPrSOsnmrb08XY3EwNupf2HPUUJAtqiGG8xqfBe0Vt
 lmcegKpDmonufWCF8lVOPj309+dKQXO9NYS+aN+N6Qi5GofT4jFT/qRmYvXgLhDNNIbL
 pOKvHRuplKHrDLKLMhCIBNv0MH/h3/Y51IxejjcNqOuUYLY3kzX/0NonGFHb5GuuYo/N
 Wj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685980215; x=1688572215;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Q/rwEbo5JSTdoMaDlmiLIrc5B4xTObKdifeh+A92pBE=;
 b=QI8wMMGCydDW6yUxCi+HuQTTmWUXfGI5wYMx9vL4fz6GlNDqCBOFRrw3EMMbiSM6Lm
 KMyk1D6YPm4YgNuHzNPkwICsRps9qNnv1plpYXmDOkN5nbzfOMYh3KY0+TgPERq5qAEj
 N/TJgfz1ZMri8PGODTCdU+aocGMNpPBh31Ktn4wU0A3AdDXS6+sXlSZbRExA8jyW0beO
 kzRs0x30NnQikyUAs0N92DP2Ea0zpKwJ7+8GOQc/krkHWxZ+gH7OeDILMv4ZvBfjwXGP
 6QQ2IvQWsUVWF5fxSDxlobRQKPUTk9gESSF8rTkjUDbz+3CTXZbFPejRHHI7gxn84jIh
 gnLA==
X-Gm-Message-State: AC+VfDyghYh6xBhjQvjIWBLCNR4Y2ruLH7Yl94C8vKCDyY7EYxbQC2i/
 iVFraJkxXjvR/qnUJg1rtypFjU3e1trps2sphavQew==
X-Google-Smtp-Source: ACHHUZ6MHDlIng6j4s3BtKAAZMCZm1zhShzwTWAQXnaSPZwJ4LxHLDzNz6uFTbf5FdnJFQjUWxB++bTBFfAD8DVON7Q=
X-Received: by 2002:a25:41cc:0:b0:ba8:1f85:46cd with SMTP id
 o195-20020a2541cc000000b00ba81f8546cdmr12844287yba.45.1685980215190; Mon, 05
 Jun 2023 08:50:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
 <0fbe5ddb-c3de-0724-fb69-a99e4980b26c@linaro.org>
 <20230605154338.GC21796@willie-the-truck>
In-Reply-To: <20230605154338.GC21796@willie-the-truck>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 5 Jun 2023 18:50:03 +0300
Message-ID: <CAA8EJpp3H9RWh_MRtEkuyWbKEsrCrSKR-40=t+fx0FS5SfjC1A@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] SM63(50|75) DPU support
To: Will Deacon <will@kernel.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 5 Jun 2023 at 18:43, Will Deacon <will@kernel.org> wrote:
>
> On Thu, Jun 01, 2023 at 03:16:52AM +0300, Dmitry Baryshkov wrote:
> > On 23/05/2023 10:46, Konrad Dybcio wrote:
> >
> > [skipped the changelog]
> >
> > > ---
> > > Konrad Dybcio (12):
> > >        dt-bindings: display/msm: dsi-controller-main: Add SM6350
> > >        dt-bindings: display/msm: dsi-controller-main: Add SM6375
> > >        dt-bindings: display/msm: sc7180-dpu: Describe SM6350 and SM6375
> > >        dt-bindings: display/msm: Add SM6350 MDSS
> > >        dt-bindings: display/msm: Add SM6375 MDSS
> > >        drm/msm/dpu: Add SM6350 support
> > >        drm/msm: mdss: Add SM6350 support
> > >        drm/msm/dpu: Add SM6375 support
> > >        drm/msm: mdss: Add SM6375 support
> > >        iommu/arm-smmu-qcom: Sort the compatible list alphabetically
> > >        iommu/arm-smmu-qcom: Add SM6375 DPU compatible
> > >        iommu/arm-smmu-qcom: Add SM6350 DPU compatible
> >
> > As we are now nearly ready to merge this series, Will, Robin, what should be
> > the merge strategy for these three patches? Would you take them through the
> > arm-smmu/iommu tree?
>
> I'm happy to take the three IOMMU changes, but the bulk of this series is
> replated to display and GPU so I don't think it makes sense for me to take
> those.

Could you please then ack merging them through the msm-next?


-- 
With best wishes
Dmitry
