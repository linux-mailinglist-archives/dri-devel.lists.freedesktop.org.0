Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E4F1D89B6
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 23:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F666E286;
	Mon, 18 May 2020 21:00:04 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 739C16E286
 for <dri-devel@freedesktop.org>; Mon, 18 May 2020 21:00:03 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id z12so1906931uap.6
 for <dri-devel@freedesktop.org>; Mon, 18 May 2020 14:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4vQAvXs8YebqJQNpvsgx+YOpDZkNHLr4/g7pen09M+Y=;
 b=UzmCAWI3Et1k/ZetXQXo8P7q5FAsHXBwwnFSCGgtDVWBYyDfVAPaFJFOP+/jbBxQPZ
 x63KZMFIM/dDJIh3QlTuH2yECcrZwYZCpiYH9MFtMCDOG8n18NeS6lZ7oPGMpcTGWu85
 xnn+GfXK8uB79yIF6irfWr1brh/7UoNiSPDHs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4vQAvXs8YebqJQNpvsgx+YOpDZkNHLr4/g7pen09M+Y=;
 b=Ek6lLaqkkcYKJZsvqGrbhOqfsYad8R+hbnzVTtQoqFazTC+FU9fjKTqF6vPoLLfZ7N
 jIiT+iEe8g4nVYOHzvIZkBZ6myKg92nuTs1aLxcMb2R8qkmGuuQt3KOim10kqtg7eNSf
 zpQGJh9SbsI7v2TZn+kOQYFMowwggPIEaCcfqA+I2jGSvB4c3Dgfqln4v4okjfiNlRjp
 BVf6RqMCF070RJmgZUxy8r55sZKDYXCyFUr5ZMbe+TFO5g1aPSKKwcfXASyWbN6bZ5nB
 q3egUXd3Q2jNnZ5tfbqfFpFCLoxzPXmQr5gR3cmDPcop1s3wlWJTYiLwpygUPsGv5Lxj
 Er8w==
X-Gm-Message-State: AOAM530l4eqNfRFU1iIRkei+Ci3W2EJuFUzm3nuVZZkiiUHzIHn85mkl
 sX33WcbJDnrUpucPyUrPRgTJzVbdKYM=
X-Google-Smtp-Source: ABdhPJyYag/4g5OPy/UX9/C4pijA4FZv1RH4lT6K+vGFU7oDECQaoyiBbHZEsR8Keah6oIP02WQYVw==
X-Received: by 2002:ab0:4ac9:: with SMTP id t9mr13474967uae.40.1589835602274; 
 Mon, 18 May 2020 14:00:02 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id n17sm3464402vkn.29.2020.05.18.14.00.00
 for <dri-devel@freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 May 2020 14:00:01 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id i89so1073028uad.5
 for <dri-devel@freedesktop.org>; Mon, 18 May 2020 14:00:00 -0700 (PDT)
X-Received: by 2002:ab0:b13:: with SMTP id b19mr12713480uak.91.1589835600274; 
 Mon, 18 May 2020 14:00:00 -0700 (PDT)
MIME-Version: 1.0
References: <1588329036-18732-1-git-send-email-smasetty@codeaurora.org>
 <1588329036-18732-2-git-send-email-smasetty@codeaurora.org>
 <CAD=FV=WXv9DYf7LWoFBvro=7Bzeb1_0bXAvRH-suzxnrCu+V2A@mail.gmail.com>
 <20200518143920.GJ32394@willie-the-truck>
In-Reply-To: <20200518143920.GJ32394@willie-the-truck>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 May 2020 13:59:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=We2+5QHimzr+ukit9qkDKQaaTHYEZGkVbOwsNuy11k9A@mail.gmail.com>
Message-ID: <CAD=FV=We2+5QHimzr+ukit9qkDKQaaTHYEZGkVbOwsNuy11k9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: arm-smmu: Add sc7180 compatible string
To: Will Deacon <will@kernel.org>
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Sharat Masetty <smasetty@codeaurora.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Matthias Kaehlcke <mka@chromium.org>, dri-devel@freedesktop.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 18, 2020 at 7:39 AM Will Deacon <will@kernel.org> wrote:
>
> On Fri, May 15, 2020 at 12:05:39PM -0700, Doug Anderson wrote:
> > On Fri, May 1, 2020 at 3:30 AM Sharat Masetty <smasetty@codeaurora.org> wrote:
> > >
> > > This patch simply adds a new compatible string for SC7180 platform.
> > >
> > > Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> > > ---
> > >  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > index 6515dbe..986098b 100644
> > > --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> > > @@ -28,6 +28,7 @@ properties:
> > >            - enum:
> > >                - qcom,msm8996-smmu-v2
> > >                - qcom,msm8998-smmu-v2
> > > +              - qcom,sc7180-smmu-v2
> > >                - qcom,sdm845-smmu-v2
> > >            - const: qcom,smmu-v2
> >
> > Is anything blocking this patch from landing now?
>
> I thought updates to the bindings usually went via Rob and the device-tree
> tree, but neither of those are on cc.
>
> Perhaps resend with that fixed?

Ah, I guess I wasn't familiar with how things worked for this file, or
maybe things have changed recently?  I'm used to most bindings going
through the same tree as the drivers that use them.  Usually if things
are at all complicated maintainers wait for an Ack from Rob (so he
should have been CCed for sure) and then land.

In this case it actually looks like Bjorn landed it in the Qualcomm
and I just didn't realize it.  That seems like it should be fine since
it's in the middle of a clause that's all Qualcomm and the change
shouldn't be controversial in any way.  :-)

Thanks!

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
