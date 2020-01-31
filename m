Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FE514F3AF
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 22:21:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4327B6EA0B;
	Fri, 31 Jan 2020 21:21:23 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE506E25C
 for <dri-devel@freedesktop.org>; Fri, 31 Jan 2020 21:21:22 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id k188so5263878vsc.8
 for <dri-devel@freedesktop.org>; Fri, 31 Jan 2020 13:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=HUmCvJ9CZbdv53S+5E2jaUgTCUMelwKvc+ZJXLHusD8=;
 b=Nnl0+Bo1hXc3/nI2eC7rLC5xKh8kpmJHLW6gmtYzPVgWfPAswoamHz4LnJ49Haf71s
 aQM53390WwHBbtRhrCen4hqzlvS6qbIjTuOdQAKFJAU4KIHhCvqHg5tw10c0RoeObmy9
 hCO8Lf/TOgG+r5lp5d3nsuYJqnBaLe6oG/xBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=HUmCvJ9CZbdv53S+5E2jaUgTCUMelwKvc+ZJXLHusD8=;
 b=A/3AmsL5BUsCRN7DdeWSUoe2zIJ5Oj63oK4e1nI6Q8tTuYC9aEbqtI0f3bAr/PN7Yx
 CVYJdx1rC7D3zEIB4CxdI/a2ZNeN9V7wjkxAiaU3nmYa557yelEPs0uPET4gIweQ/jlk
 jKUmUKduATBikVlb3fgb0sDSuCxJlSSSUohprlUmTcj09rtLaJJoj4VBrzs0yQZnzg/E
 RHEMMvTYji+75j/SAtn2YTW+re3C4GwmiBsXaZ5JaMUnD7ucpECc0op03OGHYkH8EGqG
 Ulios7So/EOZlt2PL5ADsQPaA3wT7HOZNSYbsq3pFjm/gL/YU9N59IgME3tjrXhWwxKl
 bfuA==
X-Gm-Message-State: APjAAAWiaC06EW/FicK8i0SuLd9iByfd1PoKzb3dNVN6VmrgvzczwLEv
 +HyhtawEBpu9uCg1pZNPs03thbIyQwo=
X-Google-Smtp-Source: APXvYqydRUMLxjr8qsqYum2duwLZeqwpRgmvhhDLdVZHU8KUrdMiI6WFXMaBON7SN9T/BptdGB5y7Q==
X-Received: by 2002:a67:b30b:: with SMTP id a11mr7760263vsm.154.1580505680613; 
 Fri, 31 Jan 2020 13:21:20 -0800 (PST)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com.
 [209.85.217.52])
 by smtp.gmail.com with ESMTPSA id d187sm1696434vke.45.2020.01.31.13.21.19
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 31 Jan 2020 13:21:19 -0800 (PST)
Received: by mail-vs1-f52.google.com with SMTP id p6so5270563vsj.11
 for <dri-devel@freedesktop.org>; Fri, 31 Jan 2020 13:21:19 -0800 (PST)
X-Received: by 2002:a67:8704:: with SMTP id j4mr8789829vsd.106.1580505679208; 
 Fri, 31 Jan 2020 13:21:19 -0800 (PST)
MIME-Version: 1.0
References: <1580117390-6057-1-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=VFVC6XJ=OXJCSd2_oij5vggKnTedGP0Gj4KHC50QH0SQ@mail.gmail.com>
 <4bd79f53cab95db9286067836722dd4b@codeaurora.org>
 <CAD=FV=X7pUvab1FXkPbxio_0hW0mvAguFbPAcfQ1=K9HD9bMug@mail.gmail.com>
 <20200131211813.GA16531@jcrouse1-lnx.qualcomm.com>
In-Reply-To: <20200131211813.GA16531@jcrouse1-lnx.qualcomm.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 31 Jan 2020 13:21:07 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VLGPd4jiq8ELqaaC68S6-Fs=FXov1VOMQtAtfzOR+w5A@mail.gmail.com>
Message-ID: <CAD=FV=VLGPd4jiq8ELqaaC68S6-Fs=FXov1VOMQtAtfzOR+w5A@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7180: Add A618 gpu dt blob
To: Doug Anderson <dianders@chromium.org>,
 Sharat Masetty <smasetty@codeaurora.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel@freedesktop.org, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Kaehlcke <mka@chromium.org>, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm-owner@vger.kernel.org
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

On Fri, Jan 31, 2020 at 1:18 PM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> On Fri, Jan 31, 2020 at 08:08:09AM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Fri, Jan 31, 2020 at 4:16 AM <smasetty@codeaurora.org> wrote:
> > >
> > > >> +                       reg = <0 0x0506a000 0 0x31000>, <0 0x0b290000
> > > >> 0 0x10000>,
> > > >> +                               <0 0x0b490000 0 0x10000>;
> > > >> +                       reg-names = "gmu", "gmu_pdc", "gmu_pdc_seq";
> > > >> +                       interrupts = <GIC_SPI 304
> > > >> IRQ_TYPE_LEVEL_HIGH>,
> > > >> +                                  <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
> > > >> +                       interrupt-names = "hfi", "gmu";
> > > >> +                       clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
> > > >> +                              <&gpucc GPU_CC_CXO_CLK>,
> > > >> +                              <&gcc GCC_DDRSS_GPU_AXI_CLK>,
> > > >> +                              <&gcc GCC_GPU_MEMNOC_GFX_CLK>;
> > > >> +                       clock-names = "gmu", "cxo", "axi", "memnoc";
> > > >> +                       power-domains = <&gpucc CX_GDSC>;
> > > >
> > > > Bindings claim that you need both CX and GC.  Is sc7180 somehow
> > > > different?  Bindings also claim that you should be providing
> > > > power-domain-names.
> > > No this is still needed, We need the GX power domain for GPU recovery
> > > use cases where the shutdown was not successful.
> >
> > This almost sounds as if the bindings should mark the GX power domain
> > as optional?  The driver can function without it but doesn't get all
> > the features?  As the binding is written right now I think it is
> > "invalid" to not specify a a GX power domain and once the yaml
> > conversion is done then it will even be flagged as an error.  That's
> > going to make it harder to land the your patch...
>
> For GMU attached targets the GX power domain is mandatory assuming you want to
> recover successfully from a hard GMU hang, that is.

Sure.  I guess we can quibble about whether this means optional or
mandatory, but it won't gain much.  ;-)

...seems like for now (assuming it works) we should at least specify
it and put a <0>.  Then we should make it a relatively high priority
to get it hooked up more properly.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
