Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6CA614F068
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 17:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 918756FB97;
	Fri, 31 Jan 2020 16:08:28 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 662E56FB96
 for <dri-devel@freedesktop.org>; Fri, 31 Jan 2020 16:08:27 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id 7so4648869vsr.10
 for <dri-devel@freedesktop.org>; Fri, 31 Jan 2020 08:08:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4xPLoiaUgyd94a+bWIqEdjSO+/pm7JzzixTlR76nC4k=;
 b=cCCXrbR60CBlDAGSpmvFYrjjyE1DVVDlZhNhjXqkIlKpR2BcoPRCHGrUSSTCDfRqDk
 72D2LUsRS4KoF3mrsLr5JyigXGZ9EsF0j5WPA+OZLvWstHHFS/ADUWF2H+JRsfTpY1YT
 ZYDGjjQ7IrKGRYG64lWiFl0zCmZnBnqC4m0/4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4xPLoiaUgyd94a+bWIqEdjSO+/pm7JzzixTlR76nC4k=;
 b=HP3z+PmH9ZQsZ9oZkxcty5Tixlrrw//ovyf1/Im0JYjGcjIEG2xbSPNtIdJFpCO9Jz
 qXE5AnXYPKsJQaF3ZhbJStOvLZAGWh/BY4W6vinQ+1Rd3pvlDu8UFWFMgGyyyDOpk9AJ
 z49qcApo/layjGcKX6ZABt8hBGPrfrnhaIjo2Qtfqso9MozO6nm1kfvcoqkn3Ed8m0tb
 fB4agI3d4QK0xUvqizkW4YGdV85N2WfI1CguEpLUwgAwvXGauhFLN991FgEs/dVvT2wW
 zKKwSgwaaZ3gy3dO1IoJNQJGBNaVbM6P6zrGkGWXuA82EhrZWOoq93TWlyqrPqB3IBZ8
 3btg==
X-Gm-Message-State: APjAAAX432ZUjE35L9BPmq3P2F59BXt2o1FvntX3hlXZ13oCDcgpZOoA
 B1SINqmH0jVcTwvOZBV8WJwkwGnS2UA=
X-Google-Smtp-Source: APXvYqy97le7nFxwZI7J0VguozMJohADidx3DStxOlGHdi8aiV9GzKGVmxgHkDZM3VbvP95lHdbJoA==
X-Received: by 2002:a67:fc41:: with SMTP id p1mr5389777vsq.6.1580486905716;
 Fri, 31 Jan 2020 08:08:25 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com.
 [209.85.221.169])
 by smtp.gmail.com with ESMTPSA id r1sm2339103vsi.33.2020.01.31.08.08.24
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 08:08:24 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id w4so600466vkd.5
 for <dri-devel@freedesktop.org>; Fri, 31 Jan 2020 08:08:24 -0800 (PST)
X-Received: by 2002:a1f:a9d0:: with SMTP id s199mr6709266vke.40.1580486903706; 
 Fri, 31 Jan 2020 08:08:23 -0800 (PST)
MIME-Version: 1.0
References: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com>
 <4bd79f53cab95db9286067836722dd4b@codeaurora.org>
In-Reply-To: <4bd79f53cab95db9286067836722dd4b@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Jan 2020 08:08:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
Message-ID: <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To: Sharat Masetty <smasetty@codeaurora.org>
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
 LKML <linux-kernel@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 freedreno <freedreno@lists.freedesktop.org>,
 linux-arm-msm-owner@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Jan 31, 2020 at 4:16 AM <smasetty@codeaurora.org> wrote:
>
> >> +                       reg = <0 0x0506a000 0 0x31000>, <0 0x0b290000
> >> 0 0x10000>,
> >> +                               <0 0x0b490000 0 0x10000>;
> >> +                       reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> >> +                       interrupts = <GIC_SPI 304
> >> IRQ_TYPE_LEVEL_HIGH>,
> >> +                                  <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> >> +                       interrupt-names = "hfi", "gmu";
> >> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> >> +                              <&gpucc GPU_CC_CXO_CLK>,
> >> +                              <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> >> +                              <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> >> +                       clock-names = "gmu", "cxo", "axi", "memnoc";
> >> +                       power-domains = <&gpucc CX_GDSC>;
> >
> > Bindings claim that you need both CX and GC.  Is sc7180 somehow
> > different?  Bindings also claim that you should be providing
> > power-domain-names.
> No this is still needed, We need the GX power domain for GPU recovery
> use cases where the shutdown was not successful.

This almost sounds as if the bindings should mark the GX power domain
as optional?  The driver can function without it but doesn't get all
the features?  As the binding is written right now I think it is
"invalid" to not specify a a GX power domain and once the yaml
conversion is done then it will even be flagged as an error.  That's
going to make it harder to land the your patch...

> I am working the Taniya
> to get the dependencies sorted out to bring this change in. This should
> be
> okay for the time being.

What breaks today if you add in the GX power domain here?

Oh, I see.  It's not even provided by the 'gpucc-sc7180.c' file.  What
happens if you do this for now:

  power-domains = <&gpucc CX_GDSC>, <0>;
  power-domain-names = "cx", "gx";

That seems to be the trendy thing to do if a phandle to something is
"required" but the code isn't ready for it.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
