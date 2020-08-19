Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA82F24A5DD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 20:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A11866E0B9;
	Wed, 19 Aug 2020 18:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5156E0B9
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 18:21:00 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id j23so12439956vsq.7
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AacBmJ1F+/EQU2Ta6hd78j336wiWeooUogfDqt5vhVU=;
 b=MJ511LjL0Gf8T+5otwSMIHAYNGoOTa7oOz3vFzBU6AZJ6dAX+nI9cC7118htwG/ORX
 eBs8xHYraAXfTg3+3J/RFpfkMga9Cj17oTb4p/TBhXJhoh4jgceQywdVOQqMSK/JOJ3l
 PwBzJDQ8H04HrV4VQtbb6ovc5H+eRX5T4ho3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AacBmJ1F+/EQU2Ta6hd78j336wiWeooUogfDqt5vhVU=;
 b=HS7afv9FPCmYfsKbEUlTbo07UawHsdUVI3ivy2XkXHYWVYaWzAwrkQORUiLPZM5A4s
 rYoAQzUAOzHrXouikPIRtU8Onfz7eJOWjRGGOj6tRaK1OY5nnfZb0O3M01D+HWQbamT0
 mGuYUnmaRcDpX+3nmHTUkVfgbOGxjHu+3wwknN4TJP678fZV01INerQquwspX5gTiaKF
 mtNp3b/ylcH7GuGZdQgj+6WaxPkvz7aywjIaL2vVZa2hT0vEdavNLM4LYdajvr43p8C9
 a5osHUnJAGmUrqT3dxiAdsk0W3R32gACF98LoWJHSC0s5khFhRUaDoMkReD1DeLtwGq1
 aAyg==
X-Gm-Message-State: AOAM5318APn27WGc+VQxZ48mTHezenRXWmj/iBzgDkZCd8cROc0Fq7du
 5NhAVx5XIm1PLyT2mRaAVBuSiFLu+YQFmg==
X-Google-Smtp-Source: ABdhPJwZ1C6kdMmYYo1v1BeNuHn+NtEKLdfoGCrq5wb1BcfjXh/bxxUTXpI0DJrASGNeKc1BAfBoGA==
X-Received: by 2002:a67:de03:: with SMTP id q3mr16590801vsk.160.1597861259070; 
 Wed, 19 Aug 2020 11:20:59 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com.
 [209.85.221.182])
 by smtp.gmail.com with ESMTPSA id g62sm4880256vkf.56.2020.08.19.11.20.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 11:20:57 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id i20so5341532vkk.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:20:57 -0700 (PDT)
X-Received: by 2002:a1f:2fc1:: with SMTP id v184mr15612583vkv.42.1597861257099; 
 Wed, 19 Aug 2020 11:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200817220238.603465-1-robdclark@gmail.com>
 <20200817220238.603465-11-robdclark@gmail.com>
 <CAD=FV=VzYSL-3q0oFPPSP7FiEdLeTEN6Zy=kp-73B=8LAavmVw@mail.gmail.com>
 <CAF6AEGt=tGe3WQfyF_NuvJVXRbMH1=fnNK63MLpz0zxjZ9cwgQ@mail.gmail.com>
In-Reply-To: <CAF6AEGt=tGe3WQfyF_NuvJVXRbMH1=fnNK63MLpz0zxjZ9cwgQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2020 11:20:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XxtA_1gp=gahjZiPkCJUy9ZgRoEnnE4apUQ1WVX_cs4A@mail.gmail.com>
Message-ID: <CAD=FV=XxtA_1gp=gahjZiPkCJUy9ZgRoEnnE4apUQ1WVX_cs4A@mail.gmail.com>
Subject: Re: [PATCH 10/20] dt-bindings: arm-smmu: Add compatible string for
 Adreno GPU SMMU
To: Rob Clark <robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 open list <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Rob Herring <robh+dt@kernel.org>, Sibi Sankar <sibis@codeaurora.org>,
 Vivek Gautam <vivek.gautam@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 19, 2020 at 10:36 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Aug 19, 2020 at 10:03 AM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, Aug 17, 2020 at 3:03 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > From: Jordan Crouse <jcrouse@codeaurora.org>
> > >
> > > Every Qcom Adreno GPU has an embedded SMMU for its own use. These
> > > devices depend on unique features such as split pagetables,
> > > different stall/halt requirements and other settings. Identify them
> > > with a compatible string so that they can be identified in the
> > > arm-smmu implementation specific code.
> > >
> > > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > index 503160a7b9a0..5ec5d0d691f6 100644
> > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > @@ -40,6 +40,10 @@ properties:
> > >                - qcom,sm8150-smmu-500
> > >                - qcom,sm8250-smmu-500
> > >            - const: arm,mmu-500
> > > +      - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> > > +        items:
> > > +          - const: qcom,adreno-smmu
> > > +          - const: qcom,smmu-v2
> >
> > I know I'm kinda late to the game, but this seems weird to me,
> > especially given the later patches in the series like:
> >
> > https://lore.kernel.org/r/20200817220238.603465-19-robdclark@gmail.com
> >
> > Specifically in that patch you can see that this IOMMU already had a
> > compatible string and we're changing it and throwing away the
> > model-specific string?  I'm guessing that you're just trying to make
> > it easier for code to identify the adreno iommu, but it seems like a
> > better way would have been to just add the adreno compatible in the
> > middle, like:
> >
> >       - description: Qcom Adreno GPUs implementing "arm,smmu-v2"
> >         items:
> >           - enum:
> >               - qcom,msm8996-smmu-v2
> >               - qcom,msm8998-smmu-v2
> >               - qcom,sc7180-smmu-v2
> >               - qcom,sdm845-smmu-v2
> >         - const: qcom,adreno-smmu
> >         - const: qcom,smmu-v2
> >
> > Then we still have the SoC-specific compatible string in case we need
> > it but we also have the generic one?  It also means that we're not
> > deleting the old compatible string...
>
> I did bring up the thing about removing the compat string in an
> earlier revision of the series.. but then we realized that
> qcom,sc7180-smmu-v2 was never actually used anywhere.

Right, so at least there's not going to be weird issues where landing
the dts before the code change will break anything.


> But I guess we could:  compatible = "qcom,sc7180-smmu-v2",
> "qcom,adreno-smmu", "qcom,smmu-v2";

Yeah, that was what I was suggesting.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
