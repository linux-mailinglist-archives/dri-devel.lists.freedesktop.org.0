Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285672A915B
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1371D6EAA7;
	Fri,  6 Nov 2020 08:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF1F6E1F9
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 10:57:14 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id b3so520046vsc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 02:57:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NZmePoLLIiaP7pYwZl5Ym7F23h4GkDT/CkXYHiP4lxo=;
 b=sMrO9GRUiQTa3qJHIC5F27I3pHGV5/pX9nBuQ9TmRTxE01Ehxii8CB9TiezKwc2tYJ
 3SHV/Rhxs7BmoKB4aJ9W24W7rjat8dvXU+F20+lfe5dyWM1qwmiRT2/Hz4E+yVMLYnPt
 b7MnO/qq1/9P+on1rkNYRYvwC+wu1WaH12rx3rIlc9KubXnGg8K8RqrwvSVobVT1eBhL
 S5jUjJHcPKtkeDXyshEdMUlmsFSrn0JHuPLo57AVegznV5Ma/kMzEcO9yRsB/eDD9c8G
 VI/lxjTY1cQzy9HDsuMni9iMjRs1YrWj3PYOnqX2Fk0T+EROO60K2racmtEoxOny53Bc
 Vckg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NZmePoLLIiaP7pYwZl5Ym7F23h4GkDT/CkXYHiP4lxo=;
 b=dwi63vfEijOC3owE5OJfi7ZzTSRxurx5ksPMJ/lwDB5/odETGuEt5HqNtl0wrTY/vM
 jv13LH6r9aCdwH619dpJnacvyixxIOWNNkiwsGyXn1gwugKKNKzdgzMCuI83kvMvZgWR
 kiPwS+7PyQA88ZXyTWtscWZA9O6mOPXetbSfgX4oMkUtfy6lB8+3bAerBx4VImMR/L53
 w/5lTvaQZsl5o/maWQ28efRyYkxvZSW3l4jzw6Yl2L+zsWzcoFRpPsGj2vrvVAhdo6Tl
 wp+H4jtzqHkJc+VUouvzahlegS9AQO3nwhzqe2mkCmUIBjZpE8mDVRHr70ddxL1jFIdk
 Mrdg==
X-Gm-Message-State: AOAM531HGsZGw2kZRIY1WHTD/j286wmVmdX2XxPVzi3+0br3jWyFi+4w
 czroqE68B/e03wkFmUGXf3fU1baNYpPoFAauQ1RpmQ==
X-Google-Smtp-Source: ABdhPJxaRHBJV2RUrIs2kqpAdWFFr8Yx3RVQqbiDwrHCSiI8zLcVccVJz2D9BrdKdQ25WwGzjdkbJ1OYioX7LFmCPEw=
X-Received: by 2002:a67:310d:: with SMTP id x13mr785780vsx.19.1604573833960;
 Thu, 05 Nov 2020 02:57:13 -0800 (PST)
MIME-Version: 1.0
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <20201105100603.skrirm7uke4s2xyl@vireshk-i7>
 <CAPDyKFoCJt5MBSKBJ8n1OAMdVsWHdwXTx0zFEcZw_F_gQ6Ug0w@mail.gmail.com>
 <20201105104009.oo4dc6a2gdcwduhk@vireshk-i7>
In-Reply-To: <20201105104009.oo4dc6a2gdcwduhk@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Nov 2020 11:56:37 +0100
Message-ID: <CAPDyKFpQG98d6foc1U6fp3YEBdZ1vLqY9cmWxpUwXoKgDn+ojQ@mail.gmail.com>
Subject: Re: [PATCH v1 00/30] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To: Viresh Kumar <viresh.kumar@linaro.org>
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, DTML <devicetree@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 driverdevel <devel@driverdev.osuosl.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linux-pwm@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 5 Nov 2020 at 11:40, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 05-11-20, 11:34, Ulf Hansson wrote:
> > I am not objecting about scaling the voltage through a regulator,
> > that's fine to me. However, encoding a power domain as a regulator
> > (even if it may seem like a regulator) isn't. Well, unless Mark Brown
> > has changed his mind about this.
> >
> > In this case, it seems like the regulator supply belongs in the
> > description of the power domain provider.
>
> Okay, I wasn't sure if it is a power domain or a regulator here. Btw,
> how do we identify if it is a power domain or a regulator ?

Good question. It's not a crystal clear line in between them, I think.

A power domain to me, means that some part of a silicon (a group of
controllers or just a single piece, for example) needs some kind of
resource (typically a power rail) to be enabled to be functional, to
start with. If there are operating points involved, that's also a
clear indication to me, that it's not a regular regulator.

Maybe we should try to specify this more exactly in some
documentation, somewhere.

>
> > > In case of Qcom earlier (when we added the performance-state stuff),
> > > the eventual hardware was out of kernel's control and we didn't wanted
> > > (allowed) to model it as a virtual regulator just to pass the votes to
> > > the RPM. And so we did what we did.
> > >
> > > But if the hardware (where the voltage is required to be changed) is
> > > indeed a regulator and is modeled as one, then what Dmitry has done
> > > looks okay. i.e. add a supply in the device's node and microvolt
> > > property in the DT entries.
> >
> > I guess I haven't paid enough attention how power domain regulators
> > are being described then. I was under the impression that the CPUfreq
> > case was a bit specific - and we had legacy bindings to stick with.
> >
> > Can you point me to some other existing examples of where power domain
> > regulators are specified as a regulator in each device's node?
>
> No, I thought it is a regulator here and not a power domain.

Okay, thanks!

Kind regards
Uffe
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
