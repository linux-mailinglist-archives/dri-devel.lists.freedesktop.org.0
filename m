Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF55177AC2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 16:43:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737FF6EA8D;
	Tue,  3 Mar 2020 15:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88FD06EA8D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 15:43:30 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1583250213; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=0RtZ3Aoyz/ucJdUBS4KVjKUFDbZ/LAxf/VkAI5mTDEI=;
 b=G1zCCdIS+K3y8OEE5maFK4oxpMUVWbYWYDrYf5indhfhSZNKlhFDQ+nSLhPnugwQuHRnN6vk
 l75fb1mwl+pi9I/n8nXWuPgio9bD3Dq0dYq3JueIBG/7R2vqwcPd4u35SWk86p+mZT7cdLMw
 /AA6JFM6Fpv7HyG9r9FWHKY57ug=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5e7b1d.7fe2ee899d50-smtp-out-n01;
 Tue, 03 Mar 2020 15:43:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D1A3AC447A0; Tue,  3 Mar 2020 15:43:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 52BD4C43383;
 Tue,  3 Mar 2020 15:43:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 52BD4C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 3 Mar 2020 08:43:21 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [Freedreno] [PATCH v3 1/2] dt-bindings: display: msm: Convert
 GMU bindings to YAML
Message-ID: <20200303154321.GA24212@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 smasetty@codeaurora.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org
References: <1583173424-21832-1-git-send-email-jcrouse@codeaurora.org>
 <1583173424-21832-2-git-send-email-jcrouse@codeaurora.org>
 <20200302204906.GA32123@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200302204906.GA32123@ravnborg.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
 linux-arm-msm@vger.kernel.org, smasetty@codeaurora.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 02, 2020 at 09:49:06PM +0100, Sam Ravnborg wrote:
> Hi Jordan.
> 
> On Mon, Mar 02, 2020 at 11:23:43AM -0700, Jordan Crouse wrote:
> > Convert display/msm/gmu.txt to display/msm/gmu.yaml and remove the old
> > text bindings.
> > 
> > Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> > ---
> > 
> >  .../devicetree/bindings/display/msm/gmu.txt        | 116 -------------------
> > -
> > -Required properties:
> > -- compatible: "qcom,adreno-gmu-XYZ.W", "qcom,adreno-gmu"
> > -    for example: "qcom,adreno-gmu-630.2", "qcom,adreno-gmu"
> > -  Note that you need to list the less specific "qcom,adreno-gmu"
> > -  for generic matches and the more specific identifier to identify
> > -  the specific device.
> > -- reg: Physical base address and length of the GMU registers.
> > -- reg-names: Matching names for the register regions
> > -  * "gmu"
> > -  * "gmu_pdc"
> > -  * "gmu_pdc_seg"
> > -- interrupts: The interrupt signals from the GMU.
> > -- interrupt-names: Matching names for the interrupts
> > -  * "hfi"
> > -  * "gmu"
> > -- clocks: phandles to the device clocks
> > -- clock-names: Matching names for the clocks
> > -   * "gmu"
> > -   * "cxo"
> > -   * "axi"
> > -   * "mnoc"
> The new binding - and arch/arm64/boot/dts/qcom/sdm845.dtsi agrees that
> "mnoc" is wrong.
> 
> > -- power-domains: should be:
> > -	<&clock_gpucc GPU_CX_GDSC>
> > -	<&clock_gpucc GPU_GX_GDSC>
> > -- power-domain-names: Matching names for the power domains
> > -- iommus: phandle to the adreno iommu
> > -- operating-points-v2: phandle to the OPP operating points
> > -
> > -Optional properties:
> > -- sram: phandle to the On Chip Memory (OCMEM) that's present on some Snapdragon
> > -        SoCs. See Documentation/devicetree/bindings/sram/qcom,ocmem.yaml.
> This property is not included in the new binding.

Yeah, that guy shouldn't be here. I'm not sure how it got there in the first
place but I'll update the commit log. Thanks for the poke.

Jordan

> Everything else looked fine to me.
> With sram added - or expalined in commit why it is dropped:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>
> 
> 	Sam
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
