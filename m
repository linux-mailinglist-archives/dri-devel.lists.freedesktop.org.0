Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC4E2A916F
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:35:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC216EE15;
	Fri,  6 Nov 2020 08:35:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F726E1EC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 10:35:03 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id b3so489629vsc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 02:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZdAvLjoOXomWCs8t6TmIL4j/I5mepz3FWTuHztdBTlc=;
 b=BiAiD4e1h7itpTTBhs3DR4K8CfgZymL8qj1e7tZjDyvL22TAbVaJrB6OdCOJ9dCgt8
 uMo1WI+cg7RQpxF0bBlJEyznK83VkivtEouWpjXE0uDzswIn9ngEEIWZkBVtGoJKPI5a
 3gYONlFV9O8ISMzu91uUEboniTdwBNNIgS1GVf+ZVCHpgeExfkJ3HUKHZ4pHVFwQwMtx
 5vGFFB38gJyFP7FBlRczIoGJ/8EUs8e6gc59Rm7O/sKD+Kj4+eFQl2/7R5M52mOjdRQY
 23FqbRx5TWg7iDot8DaIDKVfEKsFUNqqGSEPkpoltdKL/CwkFxGm9pZGSMzsaqx/PW9N
 dskg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZdAvLjoOXomWCs8t6TmIL4j/I5mepz3FWTuHztdBTlc=;
 b=TWQthI+W4vCO3/2xgSB3ZMYmxlJB3Cny7AbXQrPx4Mc1APNKNc6rn+z+HR2d5ERw3B
 I0X3/ZYBb0Au7/H1/WzS1aoogpYQaLvFybyKFDcE6Gg49gOJY4HD+lO7ip1TDjJn46wN
 tvn1g2wu3AOVIfBHrRGmE2vfVqZdxlh/+Sw9axbA5T77ZVHv9CXPRWEyzQnIHM/3QQK3
 W0A6z8sMRWwUrgS3x6sfNFgEkPcKKgRgZyku71iBYKOtIOIOVAX5a+JyaJEzPmmt0yeW
 dzFOVpU3ga2kOqOXYh9bHVqyImuuqhMzP1KRixFHE6gwVpPNxdMc+GHcCykIgJp3XPLD
 l1lg==
X-Gm-Message-State: AOAM532UpVQKOxoeiYjqxpz2IKiqIgZ5bm6IjERJig3fpl1f1kHHJyNJ
 GCtJFO72bp3xncxm/cypmktMuxYHqwZpDyV+jhTPwg==
X-Google-Smtp-Source: ABdhPJxVfapO8HtgRahAnJ4wz7s9HOgbHIAKW7gtu7MmcNt2t4MXd/COFLbP0begvsat+FQbNQGgY8Hv6gEHSKm9IGw=
X-Received: by 2002:a67:f417:: with SMTP id p23mr725992vsn.42.1604572502741;
 Thu, 05 Nov 2020 02:35:02 -0800 (PST)
MIME-Version: 1.0
References: <20201104234427.26477-1-digetx@gmail.com>
 <CAPDyKFr7qTU2RPhA_ZrbCayoTTNUEno1zdmvmv+8HBe-Owrfeg@mail.gmail.com>
 <20201105100603.skrirm7uke4s2xyl@vireshk-i7>
In-Reply-To: <20201105100603.skrirm7uke4s2xyl@vireshk-i7>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Nov 2020 11:34:26 +0100
Message-ID: <CAPDyKFoCJt5MBSKBJ8n1OAMdVsWHdwXTx0zFEcZw_F_gQ6Ug0w@mail.gmail.com>
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

On Thu, 5 Nov 2020 at 11:06, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 05-11-20, 10:45, Ulf Hansson wrote:
> > + Viresh
>
> Thanks Ulf. I found a bug in OPP core because you cc'd me here :)

Happy to help. :-)

>
> > On Thu, 5 Nov 2020 at 00:44, Dmitry Osipenko <digetx@gmail.com> wrote:
> > I need some more time to review this, but just a quick check found a
> > few potential issues...
> >
> > The "core-supply", that you specify as a regulator for each
> > controller's device node, is not the way we describe power domains.
>
> Maybe I misunderstood your comment here, but there are two ways of
> scaling the voltage of a device depending on if it is a regulator (and
> can be modeled as one in the kernel) or a power domain.

I am not objecting about scaling the voltage through a regulator,
that's fine to me. However, encoding a power domain as a regulator
(even if it may seem like a regulator) isn't. Well, unless Mark Brown
has changed his mind about this.

In this case, it seems like the regulator supply belongs in the
description of the power domain provider.

>
> In case of Qcom earlier (when we added the performance-state stuff),
> the eventual hardware was out of kernel's control and we didn't wanted
> (allowed) to model it as a virtual regulator just to pass the votes to
> the RPM. And so we did what we did.
>
> But if the hardware (where the voltage is required to be changed) is
> indeed a regulator and is modeled as one, then what Dmitry has done
> looks okay. i.e. add a supply in the device's node and microvolt
> property in the DT entries.

I guess I haven't paid enough attention how power domain regulators
are being described then. I was under the impression that the CPUfreq
case was a bit specific - and we had legacy bindings to stick with.

Can you point me to some other existing examples of where power domain
regulators are specified as a regulator in each device's node?

Kind regards
Uffe
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
