Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8CB4CCA59
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 00:57:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75AA710E3C1;
	Thu,  3 Mar 2022 23:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2035410E3C1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 23:56:59 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 w3-20020a4ac183000000b0031d806bbd7eso7607007oop.13
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 15:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=dwS/mMF8qJmYYFw5VmuECBUPxWsibvAI/Ds5lWtd2zw=;
 b=m3CuSnC6oqRK7aLG2h0vxrP4TOLlZDKAr7awdinW0GQ+2rTNU0x8oFNQaIC6BKZDnf
 f7Wd88R/LOLltHPGAnGsC3is2wcwatS1i7hZkbOSbcMdRoALrNUtKXIO6QYyOV/vM8ug
 9RjL+6SkC+yvItdZYFvOoFlcdye7yd/JziLlE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=dwS/mMF8qJmYYFw5VmuECBUPxWsibvAI/Ds5lWtd2zw=;
 b=hVhCxLIo6DIbycTJljUzw1L62glQXMd8CVIVHX0ew9uSFQjf8VB4TVgbv8NPxW6pQw
 Ddey/R2/B5GLKOXiyMCc95uHiol/BUwnMU8yRzJo9wc8ro4gOnkr9GFAPwEP+Bvj4ly1
 MNYkkskyRvunU9lAsDDKVb8vLAAzysj/YWNSeqm27+0Vgf0baegs+zxOG6vPj0SwPXqq
 RfD+0Nl9hV1FAnRgiR1l2i0D2WW6voJ/cMxttwPmAdu8th6QhQx7JNXlw6MnR33kRAIh
 8y3DnIRy9oIfCV+INSIFwkvr/RvvrJY6/Wthr67aDT6+CQXq/IwQhBTNmTnu1BviRkhv
 HMDw==
X-Gm-Message-State: AOAM533HmAbHUByG/8c8Q1DnV1FH2rDJOShs+E1pSl9hCZGID3PUYN5J
 ORtDMANspRcUL2bm1Gpw59me33fD1R/DtTQyjYVvzQ==
X-Google-Smtp-Source: ABdhPJz9sD1I3KbDT/hqOHCp+SihiCCexPpGaQx23kjAJ6wYmV8w9stGqBBZwbhsZ/sDw1S7g/QJrnQLCxhDbWxdoi0=
X-Received: by 2002:a05:6870:3c18:b0:d7:22ed:20b0 with SMTP id
 gk24-20020a0568703c1800b000d722ed20b0mr6012444oab.32.1646351818426; Thu, 03
 Mar 2022 15:56:58 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Mar 2022 15:56:58 -0800
MIME-Version: 1.0
In-Reply-To: <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
References: <1646300401-9063-1-git-send-email-quic_vpolimer@quicinc.com>
 <1646300401-9063-5-git-send-email-quic_vpolimer@quicinc.com>
 <CAA8EJpqkK8q7g8q56rfiOO22ykxgycJTpSJKHuhcqGk05nsVzA@mail.gmail.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 3 Mar 2022 15:56:57 -0800
Message-ID: <CAE-0n53jGQcn=NThrrW92NL-cry8yrFErdSYTHHEHWW48b3xbg@mail.gmail.com>
Subject: Re: [PATCH v4 4/4] arm64/dts/qcom/sm8250: remove assigned-clock-rate
 property for mdp clk
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-03 15:50:50)
> On Thu, 3 Mar 2022 at 12:40, Vinod Polimera <quic_vpolimer@quicinc.com> wrote:
> >
> > Kernel clock driver assumes that initial rate is the
> > max rate for that clock and was not allowing it to scale
> > beyond the assigned clock value.
> >
> > Drop the assigned clock rate property and vote on the mdp clock as per
> > calculated value during the usecase.
> >
> > Fixes: 7c1dffd471("arm64: dts: qcom: sm8250.dtsi: add display system nodes")
>
> Please remove the Fixes tags from all commits. Otherwise the patches
> might be picked up into earlier kernels, which do not have a patch
> adding a vote on the MDP clock.

What patch is that? The Fixes tag could point to that commit.
