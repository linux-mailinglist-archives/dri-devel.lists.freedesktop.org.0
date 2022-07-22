Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA7D57E3BE
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 17:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B81D8B157;
	Fri, 22 Jul 2022 15:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AFC08B047;
 Fri, 22 Jul 2022 15:27:43 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id d8so6955989wrp.6;
 Fri, 22 Jul 2022 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91TgSgSA/YJ92ess13xjquT9UadVbNK7ich3jTvC5qI=;
 b=k/TFir2d6KAVi3xNxGUZuwCh/ybufbrNaeiH3SeOXE+3Cj6IUDA0NhAjhrSsJOPn8V
 WFM1U/tGr+K90lpQ+BiLn9ciICmiGj+8hT2H9d67MEfZgGHXvfxKJlwP4xW/EVhHjfJ+
 UaxibEcgJ/3Yj5dxKkcD+oTXGzWRJMKJPyEXQc88EIJGJc2V366zNJ6XXxKxId/snIUQ
 j8gXQi9CCaTu1exkGoZRw5cpQxmhjHBdG82ie8fthDyijBDdSM8HBTVoud6O23HMLJm8
 hEN53vuJ0zAIxgkyq2d0UDgH2RqtMHaUIR8LNTLACioSRku209F4g4t9PNX8fFF/9RpU
 x8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91TgSgSA/YJ92ess13xjquT9UadVbNK7ich3jTvC5qI=;
 b=Et0iqlwZYb/w02TxcLSpi4IhZVqu0jNSyjusaDhh63NPk93pgDgTTb7EyVTDbKdIvB
 KdAvgovKNqYjeUn3ElhjXNr485XlIKmxXy13Ifz3khrx5y1RfqR5xqr5C8p9GooTSmvH
 RtP1miBDZJe86qf6yExPbFZxC9eV5le1KeNMKk0LgLnlwFTNQhWUIUneDyXsCwx7rfLF
 9WffeSbVcotrvE1yPddKlvtUx5yXUsbxBIo7PffMHAO6hEeXx0HuSnjHGeHkgSy1UNjP
 WVGJYbIPXsM2XHQSOEASDBmaWUY93RPbTkZOwNleFmkTTl4am608qdTOOFfmXScj8UMG
 c6Eg==
X-Gm-Message-State: AJIora/qmKuMY9S/32MkD6v//W3jv0+vIIo6dB+895FCM7bSOVPt0PJN
 WiAAizJGiVzVEMvcBj7kFJtC5jWCAXlBUNcGxzk=
X-Google-Smtp-Source: AGRyM1t/dc5V3tlwl/q7T8kwCuJ7BkOWFAp3DDWr7S604HLVvUwtxwwAR54eidgUx5YB6yIo4YaTjmqjVK/7CXLbmNU=
X-Received: by 2002:a05:6000:18a3:b0:21d:c651:4de7 with SMTP id
 b3-20020a05600018a300b0021dc6514de7mr288256wri.679.1658503661395; Fri, 22 Jul
 2022 08:27:41 -0700 (PDT)
MIME-Version: 1.0
References: <1657346375-1461-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220709112837.v2.5.I7291c830ace04fce07e6bd95a11de4ba91410f7b@changeid>
 <CAD=FV=XzvcjS51q78BZ=FPCEVUDMD+VKJ70ksCm5V4qwHN_wRg@mail.gmail.com>
 <c022538d-c616-8f1a-e1c2-c11b5f0de670@quicinc.com>
 <e4dcdd8d-18a9-8da3-7ac3-6cc792139f70@quicinc.com>
 <CAE-0n52TG3hsytN5nRU7W=S6PffSj8yQDmuicN0-qxoW-jxiZQ@mail.gmail.com>
 <0c050434-27ca-1099-d93d-8ad6ace3396e@quicinc.com>
 <CAE-0n53J=dADDTrydVuNZzw38dW_-+Baf8cfn0Q6DSVX_6cLNg@mail.gmail.com>
 <b6ab023b-601d-1df2-b04b-af5961b73bea@quicinc.com>
 <698d3279-6a02-9b1e-a3bd-627b6afbc57e@quicinc.com>
 <1e39d008-f8e5-eea5-90f4-78293bf2c580@quicinc.com>
In-Reply-To: <1e39d008-f8e5-eea5-90f4-78293bf2c580@quicinc.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 22 Jul 2022 08:28:03 -0700
Message-ID: <CAF6AEGsSfB6wY6mxhxO6H0h0OxiSn8yw5WuKJ-v-U9i9mn8AEw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v2 5/7] arm64: dts: qcom: sc7280: Update gpu
 register list
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Matthias Kaehlcke <mka@chromium.org>, LKML <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 21, 2022 at 9:04 AM Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> On 7/20/2022 11:34 AM, Akhil P Oommen wrote:
> > On 7/19/2022 3:26 PM, Rajendra Nayak wrote:
> >>
> >>
> >> On 7/19/2022 12:49 PM, Stephen Boyd wrote:
> >>> Quoting Akhil P Oommen (2022-07-18 23:37:16)
> >>>> On 7/19/2022 11:19 AM, Stephen Boyd wrote:
> >>>>> Quoting Akhil P Oommen (2022-07-18 21:07:05)
> >>>>>> On 7/14/2022 11:10 AM, Akhil P Oommen wrote:
> >>>>>>> IIUC, qcom gdsc driver doesn't ensure hardware is collapsed
> >>>>>>> since they
> >>>>>>> are vote-able switches. Ideally, we should ensure that the hw has
> >>>>>>> collapsed for gpu recovery because there could be transient
> >>>>>>> votes from
> >>>>>>> other subsystems like hypervisor using their vote register.
> >>>>>>>
> >>>>>>> I am not sure how complex the plumbing to gpucc driver would be
> >>>>>>> to allow
> >>>>>>> gpu driver to check hw status. OTOH, with this patch, gpu driver
> >>>>>>> does a
> >>>>>>> read operation on a gpucc register which is in always-on domain.
> >>>>>>> That
> >>>>>>> means we don't need to vote any resource to access this register.
> >>>
> >>> Reading between the lines here, you're saying that you have to read the
> >>> gdsc register to make sure that the gdsc is in some state? Can you
> >>> clarify exactly what you're doing? And how do you know that something
> >>> else in the kernel can't cause the register to change after it is read?
> >>> It certainly seems like we can't be certain because there is voting
> >>> involved.
> > From gpu driver, cx_gdscr.bit[31] (power off status) register can be
> > polled to ensure that it *collapsed at least once*. We don't need to
> > care if something turns ON gdsc after that.
> >
> >>
> >> yes, this looks like the best case effort to get the gpu to recover, but
> >> the kernel driver really has no control to make sure this condition can
> >> always be met (because it depends on other entities like hyp,
> >> trustzone etc right?)
> >> Why not just put a worst case polling delay?
> >
> > I didn't get you entirely. Where do you mean to keep the polling delay?
> >>
> >>>
> >>>>>>>
> >>>>>>> Stephen/Rajendra/Taniya, any suggestion?
> >>>>> Why can't you assert a gpu reset signal with the reset APIs? This
> >>>>> series
> >>>>> seems to jump through a bunch of hoops to get the gdsc and power
> >>>>> domain
> >>>>> to "reset" when I don't know why any of that is necessary. Can't we
> >>>>> simply assert a reset to the hardware after recovery completes so the
> >>>>> device is back into a good known POR (power on reset) state?
> >>>> That is because there is no register interface to reset GPU CX domain.
> >>>> The recommended sequence from HW design folks is to collapse both
> >>>> cx and
> >>>> gx gdsc to properly reset gpu/gmu.
> >>>>
> >>>
> >>> Ok. One knee jerk reaction is to treat the gdsc as a reset then and
> >>> possibly mux that request along with any power domain on/off so that if
> >>> the reset is requested and the power domain is off nothing happens.
> >>> Otherwise if the power domain is on then it manually sequences and
> >>> controls the two gdscs so that the GPU is reset and then restores the
> >>> enable state of the power domain.
> > It would be fatal to asynchronously pull the plug on CX gdsc
> > forcefully because there might be another gpu/smmu driver thread
> > accessing registers in cx domain.
> >
> > -Akhil.
> >
> But, we can move the cx collapse polling to gpucc and expose it to gpu
> driver using 'reset' framework. I am not very familiar with clk driver,
> but I did a rough prototype here (untested):
> https://zerobin.net/?d34b5f958be3b9b8#NKGzdPy9fgcuOqXZ/XqjI7b8JWcivqe+oSTf4yWHSOU=
>
> If this approach is acceptable, I will send it out as a separate series.
>

I'm not super familiar w/ reset framework, but this approach seems
like it would avoid needing to play games with working around runpm as
well.  So that seems like a cleaner approach.

BR,
-R
