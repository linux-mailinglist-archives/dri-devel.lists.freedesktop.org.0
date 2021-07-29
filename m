Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ABB63DA9D8
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 19:17:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A6B6EE0E;
	Thu, 29 Jul 2021 17:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B9D6EE11
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 17:17:00 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 h7-20020a4ab4470000b0290263c143bcb2so1750395ooo.7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 10:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=a1Jpgqpv2djZJsAG0DhOFk0xd5WwpCit+wt+1ShQN3w=;
 b=IbUizu0+FfdESoAU8NUVe9wutrr/sa7srK/lGLGR6WuyGgwFNN9rj9qseZg3c5JZ2X
 Eufd/DoziaUsBlouBYPxXVAoGSs0/gO/pDUgoc/7GcJzr3yvkOoqAkkViqXG2Lcp/YRF
 6DjRLU9tPwM1ZchhAxMbQ1yVgg3bVbSifylTE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=a1Jpgqpv2djZJsAG0DhOFk0xd5WwpCit+wt+1ShQN3w=;
 b=Cuuqgp/yLVdloUjXaEYsAX/mUIkhhRsgi51PXKOBAgDLTHDf6NrLparVFTSeM36iAf
 FriUYhcvCEeMzh3m63SAzbODbK4pWaukspGQVNMNrZ2SY19w/ib4bcIBiRr3qQqwgFQq
 2a3XkLimX547eCVSiIVSLINfIBK7Xl0hj1mqqyds++pwPXa+XDRZtD42xDxoV8rP7wio
 lYXNEFfs9zrP5dZRDdezSiAq/W3quPH2CeAHeyMEJlaZNNENXaIvilfliG6M9Ji523vp
 pQg4DXDanIadIaIoMRHEEj+0K6brnKSIo3dOJ3MANu7bwZS9sniWIb2bhWiEaD9mpsEQ
 DbvA==
X-Gm-Message-State: AOAM531nG66zGfVRYuQ3GtScHvp8w8KQdaA1V2hx57ZRyVOl8WHjMwQm
 IgkaFg5/DfU/YKt4LcKt2bM08jSOvifWltUvCaTyzg==
X-Google-Smtp-Source: ABdhPJxUpkwe41vVtmTrJYV492tkArFcWpTZmO6apTAf5RO4udVotcMW58RvB7J4AJBtKozsIxNZvmHe6s1rATG0IFE=
X-Received: by 2002:a4a:a6c2:: with SMTP id i2mr3714787oom.92.1627579019804;
 Thu, 29 Jul 2021 10:16:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:16:59 -0500
MIME-Version: 1.0
In-Reply-To: <e1a28bed-a2a9-2bf2-d0f0-3f608a538f69@codeaurora.org>
References: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
 <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com>
 <e1a28bed-a2a9-2bf2-d0f0-3f608a538f69@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 29 Jul 2021 12:16:59 -0500
Message-ID: <CAE-0n50-1eN3wwDukJi0JoTxCKnYx8NT1Ap2r0WDftQ621iBqQ@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: sc7280: Add gpu support
To: Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm@vger.kernel.org
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
 Matthias Kaehlcke <mka@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Akhil P Oommen (2021-07-28 00:17:45)
> On 7/27/2021 5:46 AM, Stephen Boyd wrote:
> > Quoting Akhil P Oommen (2021-07-24 10:29:00)
> >> Add the necessary dt nodes for gpu support in sc7280.
> >>
> >> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >> ---
> >> This patch has dependency on the GPUCC bindings patch here:
> >> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/
> >
> > To avoid the dependency the plain numbers can be used.
>
> But, won't that reduce readability and make things prone to error?

The numbers are not supposed to change so maybe it reduces readability
but I don't see how it is prone to error.

> If
> the other patch doesn't get picked up soon, we should try this option.
> We like to get this patch merged in v5.15.

The clk binding is already picked up but Bjorn would need to merge it
into the qcom tree to use it. I don't know what the plan is there.
