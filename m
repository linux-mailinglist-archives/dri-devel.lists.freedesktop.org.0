Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95020421C3A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 03:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE7296F4FE;
	Tue,  5 Oct 2021 01:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B08576F4F8
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 01:51:47 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 c6-20020a9d2786000000b005471981d559so23960190otb.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Oct 2021 18:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=/dkkNpzviYCaFJdQwMp6k08JJ4wijyXvlqLTqGJ1jh0=;
 b=KZCmz7fxQrAK4JnFowRP+/GRUfcb8L4k8Iu9g8CaERdWmvQsS+RiyhmrNv9SvQFEVD
 T6AKEugQqWmsk78/vMnUt2wqQclXISFFYi59AYl7vZ2GtZoJF0OQYJwQVjb2P9mQb/U/
 e3SbW7IIiKTlDvh5hbg3VYgXdxMEdU2XdcDCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=/dkkNpzviYCaFJdQwMp6k08JJ4wijyXvlqLTqGJ1jh0=;
 b=oTZWi6nJ+XEY7AGdM0CmICaAFsxCL+dRbgFeQCZTOkE4eLPNYpJ22k7dgOArVHgVMR
 HbVX1NG3CXZ1aRrWaJeY3mnWSDotBAqe/0/o9Pugn+LHcp+FMmmcLLj3/jlPcUsngbQh
 0X3zOJ6Qes02kPK/8CuogwyaHoVf3JvvN2vi9t2Xyz6aoZGt/mtqdKoXfmKpG4n2Jh3h
 vzRdEcQoLkh7Gv1nz2boSb/JjHe688jFRBo9Io3Hj06kzHLc8iZPiTnEp+r+3GKGC38g
 jR/F0ct4hp5RrRLnsWRQA3vrGgJZ02RLAnLwsHMJldWcv+ds7x5XPDPbA87TplTgyQ5j
 GSsA==
X-Gm-Message-State: AOAM5305bLzebCb4Q65sRNaZQotG4ukcJZuYzMbwus2rzo17gihDUx3N
 ZbkO7uz0Wa4wn3pbRRAtsj/kR9upCneHmGTlUgDiUQ==
X-Google-Smtp-Source: ABdhPJzWLCe5J9N4NEvFccqk7qSekAwNhX8l0RI/XU9tNyqKDe6UT1+tzQun6F9V3idqi29P8qX/SPyM7+msx2mkAW4=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr12435757otn.126.1633398707037; 
 Mon, 04 Oct 2021 18:51:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Oct 2021 21:51:46 -0400
MIME-Version: 1.0
In-Reply-To: <8f344213978f31c04e80b804a931db56@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
 <1629282424-4070-2-git-send-email-mkrishn@codeaurora.org>
 <CAE-0n50b=pX=1MFwGPDvDR=O03tUAkAgyMonGm2+SXBft=16KQ@mail.gmail.com>
 <5adf2ab2c2a162272509d253bd797721@codeaurora.org>
 <CAE-0n53kQU=8pdcWR0OZap1wDgxxwed0qvfaGruc71YT5Cj1iA@mail.gmail.com>
 <8f344213978f31c04e80b804a931db56@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Mon, 4 Oct 2021 21:51:46 -0400
Message-ID: <CAE-0n53wqdo7NBZn4UMRZDtc3MrF6JdvZpjcfGapJT1s5iV2jQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: sc7280: add display dt nodes
To: mkrishn@codeaurora.org
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kalyan_t@codeaurora.org, 
 sbillaka@codeaurora.org, abhinavk@codeaurora.org, robdclark@gmail.com, 
 bjorn.andersson@linaro.org, khsieh@codeaurora.org, rajeevny@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 robh+dt@kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting mkrishn@codeaurora.org (2021-09-30 23:39:07)
> On 2021-09-30 23:28, Stephen Boyd wrote:
> > Quoting mkrishn@codeaurora.org (2021-09-30 04:56:59)
> >> On 2021-08-19 01:27, Stephen Boyd wrote:
> >> > Quoting Krishna Manikandan (2021-08-18 03:27:02)
> >> >> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> >> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> >> index 53a21d0..fd7ff1c 100644
> >> >> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> >> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> >> >> +
> >> >> +                       status = "disabled";
> >> >> +
> >> >> +                       mdp: mdp@ae01000 {
> >> >
> >> > display-controller@ae01000
> >>
> >> Stephen,
> >>     In the current driver code, there is a substring comparison for
> >> "mdp"
> >> in device node name as part of probe sequence. If "mdp" is not present
> >> in the node name, it will
> >>     return an error resulting in probe failure. Can we continue using
> >> mdp
> >> as nodename instead of display controller?
> >>
> >
> > Can we fix the driver to not look for node names and look for
> > compatible
> > strings instead? It took me a minute to find compare_name_mdp() in
> > drivers/gpu/drm/msm/msm_drv.c to understand what you're talking about.
> > Perhaps looking for qcom,mdp5 in there will be sufficient instead of
> > looking at the node name.
>
> Sure Stephen. I will make the necessary changes in msm_drv.c to look for
> compatible string instead of node name.
> Can I include these two changes (changing mdp--> display controller and
> msm_drv.c changes) in a separate series ?
>

Sure. So you'll send the drm driver change now and we'll get the DT
change after that with the more generic node name?
