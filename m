Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4420E5793FF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 09:19:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2428310E6DA;
	Tue, 19 Jul 2022 07:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A52610E6BE
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 07:19:49 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-10bd4812c29so29880788fac.11
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 00:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=sbnnlm1/PjMSPmudPPg+00uf3vfTognMn8oMjSHYKvA=;
 b=YvreDaoClCfLMVh0kuegRr5Tb20TtMuxjFsoBfeQ/aKfhGhBmftcSgjY4V2Eg+zSgl
 FfyMhei9a9x1UwCOdq2HcUOaccXm4XzQ0NnNDXOcLgmYZL+zL3GQAn7DDfRiicse28f1
 RN5kaIQCf4Z4fi199iVfV3TpzhhwXflVj8guQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=sbnnlm1/PjMSPmudPPg+00uf3vfTognMn8oMjSHYKvA=;
 b=ROjt1nxxx+MpA0zW+y1CktCHHhGftd6qFGL+X9hhjQAcQ9gvH5LjBrBDYw0yPWIynz
 xMM2olTRjjOEmTjFlfDEhqcyktNt5Go48yCfogZFAMExlTlSUtgXWNJfMyw7qaUEuwT3
 EUjavj+UZuVUSkJdotfbMb7R783MyxiC/IYkj9OQjo1EZF+Pa6MRh2Ef5x5mcuH42eow
 sA4CzVh6tFUAKwOxstvMHfPsBDvTRrRGecW8jEWS2kMdY0UdNTubuvrLDw2TIUc5PfkJ
 gmCRspq3TiFkrOJHX5gtXI1GDYuMw3HMlUSEga4T1kMLmQkN+naK806UiFLcq0KCZDmX
 guWg==
X-Gm-Message-State: AJIora/VX7aLxhX2M0GsrxR00yEajoon0FIP+WtZeGrnbbpCFVIu5NX1
 g1sep06rz+vBGfhoutxpK7eT5gIUI42nHRnXBu4PbQ==
X-Google-Smtp-Source: AGRyM1tdmvnEmkKpCicr8GGagWVe2Y/bXDhFisbQ7fpg4AqrDBUi60mDeIFUloIr9xJ8nhMLsB/zEqXvdphhfCcaqo4=
X-Received: by 2002:aca:db56:0:b0:33a:3dd5:86ed with SMTP id
 s83-20020acadb56000000b0033a3dd586edmr11336531oig.0.1658215188633; Tue, 19
 Jul 2022 00:19:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 19 Jul 2022 03:19:48 -0400
MIME-Version: 1.0
In-Reply-To: <0c050434-27ca-1099-d93d-8ad6ace3396e@quicinc.com>
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
 <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
 <c022538d-c616-8f1a-e1c2-c11b5f0de670@quicinc.com>
 <e4dcdd8d-18a9-8da3-7ac3-6cc792139f70@quicinc.com>
 <CAE-0n52TG3hsytN5nRU7W=S6PffSj8yQDmuicN0-qxoW-jxiZQ@mail.gmail.com>
 <0c050434-27ca-1099-d93d-8ad6ace3396e@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 19 Jul 2022 03:19:48 -0400
Message-ID: <CAE-0n53J=dADDTrydVuNZzw38dW_-+Baf8cfn0Q6DSVX_6cLNg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 5/7] arm64: dts: qcom: sc7280: Update gpu
 register list
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Doug Anderson <dianders@chromium.org>, 
 Taniya Das <quic_tdas@quicinc.com>, quic_rjendra@quicinc.com
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
Cc: devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 freedreno <freedreno@lists.freedesktop.org>,
 Matthias Kaehlcke <mka@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Akhil P Oommen (2022-07-18 23:37:16)
> On 7/19/2022 11:19 AM, Stephen Boyd wrote:
> > Quoting Akhil P Oommen (2022-07-18 21:07:05)
> >> On 7/14/2022 11:10 AM, Akhil P Oommen wrote:
> >>> IIUC, qcom gdsc driver doesn't ensure hardware is collapsed since they
> >>> are vote-able switches. Ideally, we should ensure that the hw has
> >>> collapsed for gpu recovery because there could be transient votes from
> >>> other subsystems like hypervisor using their vote register.
> >>>
> >>> I am not sure how complex the plumbing to gpucc driver would be to allow
> >>> gpu driver to check hw status. OTOH, with this patch, gpu driver does a
> >>> read operation on a gpucc register which is in always-on domain. That
> >>> means we don't need to vote any resource to access this register.

Reading between the lines here, you're saying that you have to read the
gdsc register to make sure that the gdsc is in some state? Can you
clarify exactly what you're doing? And how do you know that something
else in the kernel can't cause the register to change after it is read?
It certainly seems like we can't be certain because there is voting
involved.

> >>>
> >>> Stephen/Rajendra/Taniya, any suggestion?
> > Why can't you assert a gpu reset signal with the reset APIs? This series
> > seems to jump through a bunch of hoops to get the gdsc and power domain
> > to "reset" when I don't know why any of that is necessary. Can't we
> > simply assert a reset to the hardware after recovery completes so the
> > device is back into a good known POR (power on reset) state?
> That is because there is no register interface to reset GPU CX domain.
> The recommended sequence from HW design folks is to collapse both cx and
> gx gdsc to properly reset gpu/gmu.
>

Ok. One knee jerk reaction is to treat the gdsc as a reset then and
possibly mux that request along with any power domain on/off so that if
the reset is requested and the power domain is off nothing happens.
Otherwise if the power domain is on then it manually sequences and
controls the two gdscs so that the GPU is reset and then restores the
enable state of the power domain.
