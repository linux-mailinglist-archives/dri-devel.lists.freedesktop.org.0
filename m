Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBDD14F3A4
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 22:18:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A06B6FBE6;
	Fri, 31 Jan 2020 21:18:24 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F456FBE6
 for <dri-devel@freedesktop.org>; Fri, 31 Jan 2020 21:18:22 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580505502; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=c5POQGsK03IMyYhyXfqfpslU7IQ1EXdg2hdGsgrQr9c=;
 b=lf4/xa6Fen1rAhuPRe0DmvOi/9k2+TIv/ZwZU9L0N1NVdekFHAxI1P5pFK9AL3S7KG1L+/hv
 Aoowa9DBeYl1IcQ2VpjBZWX3i3vl2W3rrNrqrgS/9utcVO5bZw3q4dk6cETcmSOqSAkX4lsG
 CCvz72u0cSEPYGFSM7NSnA5BvsE=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyIxOTRiMSIsICJkcmktZGV2ZWxAZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e349999.7ff8a27a3ca8-smtp-out-n03;
 Fri, 31 Jan 2020 21:18:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 223F7C447A3; Fri, 31 Jan 2020 21:18:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 94395C447A4;
 Fri, 31 Jan 2020 21:18:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94395C447A4
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Fri, 31 Jan 2020 14:18:13 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
Message-ID: <20200131211813.GA16531@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Doug Anderson <dianders@chromium.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Rob Clark <robdclark@chromium.org>,
 linux-arm-msm-owner@vger.kernel.org
References: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com>
 <4bd79f53cab95db9286067836722dd4b@codeaurora.org>
 <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>, LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 31, 2020 at 08:08:09AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jan 31, 2020 at 4:16 AM <smasetty@codeaurora.org> wrote:
> >
> > >> +                       reg = <0 0x0506a000 0 0x31000>, <0 0x0b290000
> > >> 0 0x10000>,
> > >> +                               <0 0x0b490000 0 0x10000>;
> > >> +                       reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> > >> +                       interrupts = <GIC_SPI 304
> > >> IRQ_TYPE_LEVEL_HIGH>,
> > >> +                                  <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> > >> +                       interrupt-names = "hfi", "gmu";
> > >> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> > >> +                              <&gpucc GPU_CC_CXO_CLK>,
> > >> +                              <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> > >> +                              <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> > >> +                       clock-names = "gmu", "cxo", "axi", "memnoc";
> > >> +                       power-domains = <&gpucc CX_GDSC>;
> > >
> > > Bindings claim that you need both CX and GC.  Is sc7180 somehow
> > > different?  Bindings also claim that you should be providing
> > > power-domain-names.
> > No this is still needed, We need the GX power domain for GPU recovery
> > use cases where the shutdown was not successful.
> 
> This almost sounds as if the bindings should mark the GX power domain
> as optional?  The driver can function without it but doesn't get all
> the features?  As the binding is written right now I think it is
> "invalid" to not specify a a GX power domain and once the yaml
> conversion is done then it will even be flagged as an error.  That's
> going to make it harder to land the your patch...

For GMU attached targets the GX power domain is mandatory assuming you want to
recover successfully from a hard GMU hang, that is.

Jordan

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
