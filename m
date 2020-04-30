Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0B5A1C0497
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 20:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B2A6E0DD;
	Thu, 30 Apr 2020 18:21:37 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vk1-xa41.google.com (mail-vk1-xa41.google.com
 [IPv6:2607:f8b0:4864:20::a41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 497326E09F
 for <dri-devel@freedesktop.org>; Thu, 30 Apr 2020 18:21:36 +0000 (UTC)
Received: by mail-vk1-xa41.google.com with SMTP id j127so118576vke.4
 for <dri-devel@freedesktop.org>; Thu, 30 Apr 2020 11:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=SR5cmb+TdKfA9P9unlHlcoWqQ+iFT2b4XsANwGqxz5Y=;
 b=Kt9s26Qov6Qn68/Pe3SRmeowZf7qJWgEO/1aiZYlcrWn/63/H0Mxf0JJVVMFh+pL7n
 K4YQd/0YimnlqtXjKhoN+B+6gQ/2W073uz2X5RxT5/69tfGQIiW/gnVrr3EHLGpP1Q86
 2T/hEImFFlMGoRGn2f5o5tH6Ov3xB60rvdHTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=SR5cmb+TdKfA9P9unlHlcoWqQ+iFT2b4XsANwGqxz5Y=;
 b=gcwy8dys+tOZQyUXt9+sgATQHwnlit/r2qFEv0DnBv0HgBuN1sob7CvSfkKEdsYv5g
 tbt7hoTAvi2BjoiKsQKDE6zRniIbBpW//KY2cF3y5AngPGUdLY783LIiLOU2KEVL7aqa
 i7W3pC+A+ayWKCkqdM3UcuPS/tGhp9RxdgiG4VHxOZrNfYY9rh3GhGxeBAXmqfxTaHYG
 dIk5AhKoJf7MSU7hUuTvC4zYEZiQk9us9B5woU63InWkmYDUrbz8jySPyFdUtsnr7Z+I
 K4shxJnAH5sSVf0CtPAMneYZD2IG7RfKsvfn134mUB2AXPWUcHSU89foBknirUZAIhUe
 lBmw==
X-Gm-Message-State: AGi0PuaNAFk+lNkJY024aPWdmE8jZIkXxjOlCmx9P93/MrUW0DxuQYJ9
 U7TL1xUjmTV+DiCix613NI4wfNbgH+k=
X-Google-Smtp-Source: APiQypLufp1WaJr4wZ36kw/+Fya0bvVQIIB1CUxWP0t0CKS8WQd/DbNlklag1IMgoLQYXL9uNzEUlA==
X-Received: by 2002:a1f:cd06:: with SMTP id d6mr4005106vkg.94.1588270894969;
 Thu, 30 Apr 2020 11:21:34 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41])
 by smtp.gmail.com with ESMTPSA id v3sm148686vka.45.2020.04.30.11.21.33
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Apr 2020 11:21:33 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id s11so4698571vsq.13
 for <dri-devel@freedesktop.org>; Thu, 30 Apr 2020 11:21:33 -0700 (PDT)
X-Received: by 2002:a67:bd07:: with SMTP id y7mr112084vsq.109.1588270892989;
 Thu, 30 Apr 2020 11:21:32 -0700 (PDT)
MIME-Version: 1.0
References: <1588219187-19295-1-git-send-email-smasetty@codeaurora.org>
 <20200430181233.GA21991@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200430181233.GA21991@jcrouse1-lnx.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Apr 2020 11:21:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Usp5RxgXtjtgBe6jR3o=-+EXkYZuVzx_AF3=BsVu+OeA@mail.gmail.com>
Message-ID: <CAD=FV=Usp5RxgXtjtgBe6jR3o=-+EXkYZuVzx_AF3=BsVu+OeA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: arm-smmu: Add sc7180 compatible string
 and mem_iface clock
To: Sharat Masetty <smasetty@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel@freedesktop.org, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Matthias Kaehlcke <mka@chromium.org>, Doug Anderson <dianders@chromium.org>,
 Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 30, 2020 at 11:12 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Thu, Apr 30, 2020 at 09:29:47AM +0530, Sharat Masetty wrote:
> > This patch adds a new compatible string for sc7180 and also an
> > additional clock listing needed to power the TBUs and the TCU.
> >
> > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > ---
> > v2: Addressed review comments from Doug
> >
> >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > index 6515dbe..ba5dba4 100644
> > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > @@ -28,6 +28,7 @@ properties:
> >            - enum:
> >                - qcom,msm8996-smmu-v2
> >                - qcom,msm8998-smmu-v2
> > +              - qcom,sc7180-smmu-v2
> >                - qcom,sdm845-smmu-v2
> >            - const: qcom,smmu-v2
> >
> > @@ -113,16 +114,23 @@ properties:
> >        present in such cases.
> >
> >    clock-names:
> > +    minItems: 2
> > +    maxItems: 3
> >      items:
> >        - const: bus
> >        - const: iface
> > +      - const: mem_iface
>
> Hi Sharat -
>
> I think there was a bit of confusion due to renaming between downstream and
> upstream.  Currently for the sdm845 and friends we have:
>
>   clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>      <&gcc GCC_GPU_CFG_AHB_CLK>;
>   clock-names = "bus", "iface";
>
> Confusingly these same clocks downstream are "mem_iface_clk" and "iface_clk"
> respectively.
>
> It looks like you are trying to add GCC_DDRSS_GPU_AXI_CLK as "mem_iface" which
> was formerly "mem_clk" downstream. I'm not sure if the naming change is
> intentional or you were trying to make upstream and downstream match and didn't
> realize that they were renamed.
>
> I'm not sure if we need DDRSS_GPU_AXI_CLK or not. Empirically it works without
> it for sdm845 (I don't have a sc7180 to test) but we should probably loop back
> with either the clock team or the hardware designers to be sure there isn't a
> corner case that is missing. I agree with Doug that its always best if we don't
> need to add a clock.

I can confirm that on sc7180 the GPU seems to come up just fine
without the clock being specified in the iommu node.  Definitely would
be good to know what's broken and if nothing is broken maybe we can
change this patch to just add the sc7180 compatible string and drop
the clock.  I do note that the GMU already has a reference to the same
"GCC_DDRSS_GPU_AXI_CLK" clock.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
