Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F08D23DAB90
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 21:02:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9806EE32;
	Thu, 29 Jul 2021 19:02:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC1C6EE31
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 19:02:15 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id u10so9759070oiw.4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 12:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Su69e0VwCDTVXaZGqAhM3F7LtZETVHlakvlYKvoZayM=;
 b=SebcM8G3BBQpdbYfLQP0sdWaVQX0nFTrotqhmuGnCKbjKWaSNqupvYNVRfuM7GhE5z
 LbpWNsB4ztjfjw6ymIQKoHysAEYtFeGSFdsbJ5mQSqQzMdhlctZh2XtEA5M99LcG/f3b
 lMmA1rH5F2+pMRgkFSwb5QYY8Dh708WIynYSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Su69e0VwCDTVXaZGqAhM3F7LtZETVHlakvlYKvoZayM=;
 b=EcyJk4eF5k1XTp8w9YGLz8+z6tiBsRImjb3COMKA+m6lyidWZ4Gx8pRSBU9tARusQa
 m2WMm5CZqZ6IfE/GZsC6z1ccAJ85W8Vz6X/2o76etErLXpqvtzDFa45+tR7dF3f2KCj7
 ukM5eMe+wMT1aG4xoUaG/w59xVwfELgAgFYEPUqpUjuM3AlWy0axNEf4nDSXsagjYyRk
 nBN8VmKwMuwg9lX0hIeY2giiY0DmpEARkY648cHCXu+wT3oCNhr5NsfV+5WNqH+ZLQKk
 QcbYcypj5pmoByTMDp8Nck0xrVBCBbgHQusqYqXwXSiNSyvA9YZtdYXJNYNrz4GMeuY5
 qzlg==
X-Gm-Message-State: AOAM531uDeeKHdjl/cHofKOS9Ixsj9oF/gGRDkcoWx5Uprz5NrVxrr0V
 E3SpTH4AA9zrURDSg1zes26zdLZKX71uU1v2LTcZ2w==
X-Google-Smtp-Source: ABdhPJz7dbzotSQmyoBhO3gVd5uNSdiIKcidtDyg1R8EG+Y9ws7CEIXpDqoO0HYTgqDy8Fs8af2iAnOgsNNuQTnmwHI=
X-Received: by 2002:a54:468d:: with SMTP id k13mr11054293oic.125.1627585334851; 
 Thu, 29 Jul 2021 12:02:14 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 29 Jul 2021 12:02:14 -0700
MIME-Version: 1.0
In-Reply-To: <308d8f1e-9f23-9d78-42cc-a42ce3463027@codeaurora.org>
References: <1627147740-11590-1-git-send-email-akhilpo@codeaurora.org>
 <CAE-0n52mEy1GReYwcVrffT2KOy4EHMHH-RyCJ_mmxhaeXwGdYA@mail.gmail.com>
 <e1a28bed-a2a9-2bf2-d0f0-3f608a538f69@codeaurora.org>
 <CAE-0n50-1eN3wwDukJi0JoTxCKnYx8NT1Ap2r0WDftQ621iBqQ@mail.gmail.com>
 <308d8f1e-9f23-9d78-42cc-a42ce3463027@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 29 Jul 2021 12:02:14 -0700
Message-ID: <CAE-0n5211NZx43Q0UwHJATYYV7zXPH3WWx66808rEmOgSBDQyg@mail.gmail.com>
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

Quoting Akhil P Oommen (2021-07-29 11:57:23)
> On 7/29/2021 10:46 PM, Stephen Boyd wrote:
> > Quoting Akhil P Oommen (2021-07-28 00:17:45)
> >> On 7/27/2021 5:46 AM, Stephen Boyd wrote:
> >>> Quoting Akhil P Oommen (2021-07-24 10:29:00)
> >>>> Add the necessary dt nodes for gpu support in sc7280.
> >>>>
> >>>> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> >>>> ---
> >>>> This patch has dependency on the GPUCC bindings patch here:
> >>>> https://patchwork.kernel.org/project/linux-arm-msm/patch/1619519590-3019-4-git-send-email-tdas@codeaurora.org/
> >>>
> >>> To avoid the dependency the plain numbers can be used.
> >>
> >> But, won't that reduce readability and make things prone to error?
> >
> > The numbers are not supposed to change so maybe it reduces readability
> > but I don't see how it is prone to error.
>
> I cross check GPU's clock list whenever there is a system level issue
> like NoC errors. So it is convenient to have the clock names here, at
> least for me. But, I will budge if it is not easy to manage the dependency.

To clarify my statement, the defines can be used eventually once the
header file is part of the same tree. A duplicate patch between clk and
qcom trees is fine or pulling in the clk branch works too.

>
> >
> >> If
> >> the other patch doesn't get picked up soon, we should try this option.
> >> We like to get this patch merged in v5.15.
> >
> > The clk binding is already picked up but Bjorn would need to merge it
> > into the qcom tree to use it. I don't know what the plan is there.
> >
>
> Bjorn, could you please advise here?
>
> -Akhil.
