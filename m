Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD50152671
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 07:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D78A16E117;
	Wed,  5 Feb 2020 06:51:43 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1527D6E117
 for <dri-devel@freedesktop.org>; Wed,  5 Feb 2020 06:51:41 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580885503; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=FEUHkLBJ+nAGJuyoz3LEU26JARROyquI5FGuyUlZs9g=;
 b=PJ+u2sUNGTqIhHAX3Syi37z/mqW16j3oPsi0A1fg+iYwHY6sb8G8ofiqetpgBRP9s/jkLNIC
 lCTW9Lu7uXiljg1cexb3kaoa4222Cz1qNSIZqqrIQ182/bD8qGqgnr/SQKjgWrf3go6UtdVz
 Y0bYmCZdsSHIJy3VyPfMM+G4hoE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3a65fb.7fdfd83ff0a0-smtp-out-n03;
 Wed, 05 Feb 2020 06:51:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29BE3C433CB; Wed,  5 Feb 2020 06:51:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: smasetty)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8AF06C43383;
 Wed,  5 Feb 2020 06:51:38 +0000 (UTC)
MIME-Version: 1.0
Date: Wed, 05 Feb 2020 12:21:38 +0530
From: smasetty@codeaurora.org
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
In-Reply-To: <CAD=FV=XJF4KworkHFLoNtxB7d+VyGqZSZkDUdie+09ur1g5thw@mail.gmail.com>
References: <1580472220-3453-1-git-send-email-smasetty@codeaurora.org>
 <1580472220-3453-2-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=XJF4KworkHFLoNtxB7d+VyGqZSZkDUdie+09ur1g5thw@mail.gmail.com>
Message-ID: <1e29097cc1cdf18671379f6420f872b0@codeaurora.org>
X-Sender: smasetty@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: "open list:OPEN FIRMWARE
 AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm-owner@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-01 03:13, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jan 31, 2020 at 4:04 AM Sharat Masetty 
> <smasetty@codeaurora.org> wrote:
>> 
>> +               adreno_smmu: iommu@5040000 {
>> +                       compatible = "qcom,sc7180-smmu-v2", 
>> "qcom,smmu-v2";
>> +                       reg = <0 0x05040000 0 0x10000>;
>> +                       #iommu-cells = <1>;
>> +                       #global-interrupts = <2>;
>> +                       interrupts = <GIC_SPI 229 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 231 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 364 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 365 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 366 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 367 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 368 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 369 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 370 
>> IRQ_TYPE_EDGE_RISING>,
>> +                                       <GIC_SPI 371 
>> IRQ_TYPE_EDGE_RISING>;
>> +                       clocks = <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
>> +                               <&gcc GCC_GPU_CFG_AHB_CLK>,
>> +                               <&gcc GCC_DDRSS_GPU_AXI_CLK>;
>> +
>> +                       clock-names = "bus", "iface", "mem_iface_clk";
> 
> Repeated comment from v2 feedback:
> 
> Please send a patch to:
> 
> Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> 
> ...adding 'qcom,sc7180-smmu-v2'.  If you do this it will point out
> that you've added a new clock: "mem_iface_clk".  Is this truly a new
> clock in sc7180 compared to previous IOMMUs?  ...or is it not really
> needed?
I can confirm that this clock is needed for SC7180. I will send out a 
new patch
to update the documentation this week.
> 
> 
>> +               gmu: gmu@506a000 {
>> +                       compatible="qcom,adreno-gmu-618.0", 
>> "qcom,adreno-gmu";
>> +                       reg = <0 0x0506a000 0 0x31000>, <0 0x0b290000 
>> 0 0x10000>,
>> +                               <0 0x0b490000 0 0x10000>;
>> +                       reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
>> +                       interrupts = <GIC_SPI 304 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                                  <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "hfi", "gmu";
>> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
>> +                              <&gpucc GPU_CC_CXO_CLK>,
>> +                              <&gcc GCC_DDRSS_GPU_AXI_CLK>,
>> +                              <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
>> +                       clock-names = "gmu", "cxo", "axi", "memnoc";
>> +                       power-domains = <&gpucc CX_GDSC>;
>> +                       power-domain-names = "cx";
> 
> As per continued comments on v2, please see if this works for you:
> 
>   power-domains = <&gpucc CX_GDSC>, <0>;
>   power-domain-names = "cx", "gx";
> 
> ...and work to get something more real for "gx" ASAP.  It did seem to
> boot for me and (unless someone disagrees) it seems better than
> totally leaving it out / violating the bindings?
> 
> 
> -Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
