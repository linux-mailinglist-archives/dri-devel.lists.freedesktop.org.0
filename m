Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C09441C01DE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 18:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19706E93D;
	Thu, 30 Apr 2020 16:14:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B20F6E935;
 Thu, 30 Apr 2020 16:14:17 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id w4so2066052ioc.6;
 Thu, 30 Apr 2020 09:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9tMKgUNiVkUhpbJNhAr0hm95irgxD28lhjeV8PkyOXw=;
 b=lJBIxD+U8h9JNWqczpIHYOA2edcOylANhJNLxX7tesOutIKTPAgFimaA71Q4BN3lFt
 CGdE71ndDyan0ElbnjdpXRfFAeM3FaoZUuZy4QwOiG6H2+Ms9wxfrmq86ne2Ncxduo2s
 o3oH8+ZOcyM+mE6+HP4hWSsipRphFTDlHJjDks7AcSYXE7geDz7xu6toAZaAdZAWGs7u
 doCtqwvkh1wxfWlI/hclqWa5WNI/PUHzg9W1oPax2zCgrBJN8THiWO9T/BRkfG7p5sQ6
 6byMtoOITdG3H87AkEiMJfkj6f+yvBrPZTtUnw30mdJTdGYwy75RtSWnREdZmACd4nAs
 pzPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9tMKgUNiVkUhpbJNhAr0hm95irgxD28lhjeV8PkyOXw=;
 b=bx0xbBUDlt3qErDrxnysfNwdZE+Nq7/r8Qtmskgm00JmBzeKCKkL/op5aE6mlGPB8D
 /vTZOZ3B2nvQHF8se+i/sIzqMa+qq+KDyWAyGDSsqUFm+oEtCxTNP+Tpj1abohta1lWp
 bSm4sTIzXewQ4M8wXNwBexifQdTDG2vDLCRGqepVsg/qIL3TbjsE2apAvdO8lfH5i+uD
 1qUXI9ozj4NHw2g9CKEK0RxCvCNIsd9o7WF2ApWdBzTv1gmsVoKKxME6IKSQMC5C1IVJ
 fJhHHbsWEWX5gxlwG7rnu86VMOJyRsnQyj9stkPBB4v6UYGHwVn5vRs65vB05v3i5ner
 DF/Q==
X-Gm-Message-State: AGi0PuYRhkOcYwAHOjgH3x8v6ztVIZw5bqJ2OAIGgAjBXRvLCUGQtuU1
 KchBQr67TooBDAPGbq4GiRJIoNNrtbzpLbUiHGo=
X-Google-Smtp-Source: APiQypJNNe1JlSiWqNAvYCGbEyLo6QHM5ubwp0R2i0yMPOBM1qvYMgIWqO2AKVPK+ePUbVGYtX9sAhF9NavoFEScekM=
X-Received: by 2002:a6b:5904:: with SMTP id n4mr2693593iob.142.1588263256671; 
 Thu, 30 Apr 2020 09:14:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200430124602.14463-1-frieder.schrempf@kontron.de>
 <20200430124602.14463-2-frieder.schrempf@kontron.de>
 <5e1f804c4c27927d10b2283747c1cae6606abe7c.camel@pengutronix.de>
 <6a5fbb8a-bf28-9c8e-53c7-7a3e5f338a2c@kontron.de>
In-Reply-To: <6a5fbb8a-bf28-9c8e-53c7-7a3e5f338a2c@kontron.de>
From: Adam Ford <aford173@gmail.com>
Date: Thu, 30 Apr 2020 11:14:02 -0500
Message-ID: <CAHCN7x+sA9cGF6oqvZLKBdhRdZcxgW=U98uB81_R3iq_-Ok9=w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] drm/etnaviv: Prevent IRQ triggering at probe time
 on i.MX8MM
To: Schrempf Frieder <frieder.schrempf@kontron.de>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Peng Fan <peng.fan@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Anson Huang <Anson.Huang@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 "etnaviv@lists.freedesktop.org" <etnaviv@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Li Jun <jun.li@nxp.com>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
 Leonard Crestez <leonard.crestez@nxp.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 30, 2020 at 10:31 AM Schrempf Frieder
<frieder.schrempf@kontron.de> wrote:
>
> Hi Lucas,
>
> On 30.04.20 16:32, Lucas Stach wrote:
> > Hi Frieder,
> >
> > Am Donnerstag, den 30.04.2020, 12:46 +0000 schrieb Schrempf Frieder:
> >> From: Frieder Schrempf <frieder.schrempf@kontron.de>
> >>
> >> On i.MX8MM there is an interrupt getting triggered immediately after
> >> requesting the IRQ, which leads to a stall as the handler accesses
> >> the GPU registers whithout the clock being enabled.
> >>
> >> Enabling the clocks briefly seems to clear the IRQ state, so we do
> >> this before requesting the IRQ.
> >
> > This is most likely caused by improper power-up sequencing. Normally
> > the GPC will trigger a hardware reset of the modules inside a power
> > domain when the domain is powered on. This requires the clocks to be
> > running at this point, as those resets are synchronous, so need clock
> > pulses to propagate through the hardware.
>
> Ok, I was suspecting something like that and your explanation makes
> total sense to me.
>
> >
> >  From what I see the i.MX8MM is still missing the power domain
> > controller integration, but I'm pretty confident that this problem
> > should be solved in the power domain code, instead of the GPU driver.
>
> Ok. I was hoping that GPU support could be added without power domain
> control, but I now see that this is probably not reasonable at all.
> So I will keep on hoping that NXP comes up with an upstreamable solution
> for the power domain handling.


There was a patch for upstream power-domain control from NXP a few days ago:

https://patchwork.kernel.org/cover/10904511/

Can these be somehow tested to see if it helps the issue with the GPU?

adam
>
> Thanks,
> Frieder
>
> >
> > Regards,
> > Lucas
> >
> >> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> >> ---
> >>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c | 29 ++++++++++++++++++++-----
> >> --
> >>   1 file changed, 22 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >> b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >> index a31eeff2b297..23877c1f150a 100644
> >> --- a/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gpu.c
> >> @@ -1775,13 +1775,6 @@ static int etnaviv_gpu_platform_probe(struct
> >> platform_device *pdev)
> >>              return gpu->irq;
> >>      }
> >>
> >> -    err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
> >> -                           dev_name(gpu->dev), gpu);
> >> -    if (err) {
> >> -            dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq,
> >> err);
> >> -            return err;
> >> -    }
> >> -
> >>      /* Get Clocks: */
> >>      gpu->clk_reg = devm_clk_get(&pdev->dev, "reg");
> >>      DBG("clk_reg: %p", gpu->clk_reg);
> >> @@ -1805,6 +1798,28 @@ static int etnaviv_gpu_platform_probe(struct
> >> platform_device *pdev)
> >>              gpu->clk_shader = NULL;
> >>      gpu->base_rate_shader = clk_get_rate(gpu->clk_shader);
> >>
> >> +    /*
> >> +     * On i.MX8MM there is an interrupt getting triggered
> >> immediately
> >> +     * after requesting the IRQ, which leads to a stall as the
> >> handler
> >> +     * accesses the GPU registers whithout the clock being enabled.
> >> +     * Enabling the clocks briefly seems to clear the IRQ state, so
> >> we do
> >> +     * this here before requesting the IRQ.
> >> +     */
> >> +    err = etnaviv_gpu_clk_enable(gpu);
> >> +    if (err)
> >> +            return err;
> >> +
> >> +    err = etnaviv_gpu_clk_disable(gpu);
> >> +    if (err)
> >> +            return err;
> >> +
> >> +    err = devm_request_irq(&pdev->dev, gpu->irq, irq_handler, 0,
> >> +                           dev_name(gpu->dev), gpu);
> >> +    if (err) {
> >> +            dev_err(dev, "failed to request IRQ%u: %d\n", gpu->irq,
> >> err);
> >> +            return err;
> >> +    }
> >> +
> >>      /* TODO: figure out max mapped size */
> >>      dev_set_drvdata(dev, gpu);
> >>
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
