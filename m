Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B4E5881E1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 20:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5798210FA1E;
	Tue,  2 Aug 2022 18:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31F993766;
 Tue,  2 Aug 2022 18:32:24 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id z132so11329145iof.0;
 Tue, 02 Aug 2022 11:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=jhq8ckgM3wThDcZldY9YmghfnMoP9xPtuQZ8KnzumAo=;
 b=VdRx0EOsVrd6Ybzj1Gs9qS7AxPtnD2QK2IFIf9RolrI/Ygx7n3CCPKpPU3zj+wbTT1
 ETLSmXQFke1UC+3v1WU2TyO3kRU0MD0Rdp0SGOvF3myFXUQ6wFHZKpIyw8xahimWkVON
 jk2wd4Nn434JzCuBcEdlIZySLE0BhWD9fadVz0ZqJ1obVJiJDZr5hMhXw24O2VEI8klm
 FZk8AO2kd42gWSy82KfZcBwGzBDMF+jqTz9kWkkYy4ue1OxZt0UsLBe6WJKHt6BVeLU2
 F6WSNBYCEa/kocJxgUbP0v5Frv/SqfhloM8ge/5o3X4nWAl+uGoYAKvubrM7r92YIIw5
 lt4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=jhq8ckgM3wThDcZldY9YmghfnMoP9xPtuQZ8KnzumAo=;
 b=o9jRDzOuhQ0Z1DyGip4S9LNzeR5YDlKVnNWs+nQwJnMkmlxUds1OktDzgeAl3b4VmI
 KsYkp/50gKKTyO+AgzV5+gOUnZprLe+CRaK41zxNd6kgQyCgCxFlFjzVOAsc0/4K0zWg
 kCXcwGjNYujHhjDo170UPTQ4YGgILSPYySZtQ2t3aQ4aTekTjHYWQYqzc6ZybIT0jnOB
 sw2LnTpjVCnJkW9TxOoWZHG8pUVwI91VLPNOPPK0LBlJ2amHoo5XvAXbao2aZRX4qU6y
 WhMT5eitH+Ersb2GItMM34KRyappazC2Mefn9x+zverGjBQ3tTk9/aUEesvarUcmGujv
 h4RA==
X-Gm-Message-State: ACgBeo06S5XIBMQcaFf3lwLC/XWe6468M90Z9ObuTyZYkLMom9h4GxNE
 HU+HFyqpRqQKRvM/O4TVXDrzc6KIFDY+EODkldU=
X-Google-Smtp-Source: AA6agR4zB01AwMUmm2uoczyPEG/voRCuVs5QOx8SXiSosbJh2mT+l0ai6vNdX9v3/FVkFqgzoqRCCul6am0CDk+QETo=
X-Received: by 2002:a05:6638:25d0:b0:342:72f5:a080 with SMTP id
 u16-20020a05663825d000b0034272f5a080mr4809472jat.51.1659465144024; Tue, 02
 Aug 2022 11:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <1659172664-10345-1-git-send-email-quic_akhilpo@quicinc.com>
 <34ae275e-8d4c-3735-c08c-4769caf2909c@linaro.org>
In-Reply-To: <34ae275e-8d4c-3735-c08c-4769caf2909c@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 2 Aug 2022 11:32:50 -0700
Message-ID: <CAF6AEGv_cgPtaFpxSPCzWXeBcJvqE2fGucriRvMAJMbQ7ULndQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] clk/qcom: Support gdsc collapse polling using 'reset'
 inteface
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 2, 2022 at 12:02 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 30/07/2022 12:17, Akhil P Oommen wrote:
> >
> > Some clients like adreno gpu driver would like to ensure that its gdsc
> > is collapsed at hardware during a gpu reset sequence. This is because it
> > has a votable gdsc which could be ON due to a vote from another subsystem
> > like tz, hyp etc or due to an internal hardware signal.
>
> If this is votable, do we have any guarantee that the gdsc will collapse
> at all? How can we proceed if it did not collapse?

Other potential votes should be transient.  But I guess we eventually
need to timeout and give up.  At which point we are no worse off than
before.

But hmm, we aren't using RBBM_SW_RESET_CMD for sw reset like we have
on previous generations?  That does seem a bit odd.  Looks like kgsl
does use it.

BR,
-R

> > To allow
> > this, gpucc driver can expose an interface to the client driver using
> > reset framework. Using this the client driver can trigger a polling within
> > the gdsc driver.
>
> Trigger the polling made me think initially that we will actually
> trigger something in the HW. Instead the client uses reset framework to
> poll for the gdsc to be reset.
>
> >
> > This series is rebased on top of linus's master branch.
> >
> > Related discussion: https://patchwork.freedesktop.org/patch/493144/
> >
> >
> > Akhil P Oommen (5):
> >    dt-bindings: clk: qcom: Support gpu cx gdsc reset
> >    clk: qcom: Allow custom reset ops
> >    clk: qcom: gpucc-sc7280: Add cx collapse reset support
> >    clk: qcom: gdsc: Add a reset op to poll gdsc collapse
> >    arm64: dts: qcom: sc7280: Add Reset support for gpu
> >
> >   arch/arm64/boot/dts/qcom/sc7280.dtsi          |  3 +++
> >   drivers/clk/qcom/gdsc.c                       | 23 +++++++++++++++++++----
> >   drivers/clk/qcom/gdsc.h                       |  7 +++++++
> >   drivers/clk/qcom/gpucc-sc7280.c               |  6 ++++++
> >   drivers/clk/qcom/reset.c                      |  6 ++++++
> >   drivers/clk/qcom/reset.h                      |  2 ++
> >   include/dt-bindings/clock/qcom,gpucc-sc7280.h |  3 +++
> >   7 files changed, 46 insertions(+), 4 deletions(-)
> >
>
>
> --
> With best wishes
> Dmitry
