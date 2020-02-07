Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56259155072
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 03:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D3036E581;
	Fri,  7 Feb 2020 02:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf44.google.com (mail-qv1-xf44.google.com
 [IPv6:2607:f8b0:4864:20::f44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE8A6E578
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 02:04:16 +0000 (UTC)
Received: by mail-qv1-xf44.google.com with SMTP id n8so267839qvg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 18:04:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f/k2mGN9MY7NNfoOb4gMqNsjIZIFXh28kOhlDVSQmA0=;
 b=n54HafII/Lex3YLQXDbmveG7TRPxgfQUwWoNXykBlSczgnFnbEiABU6Nlwne2EnVqZ
 BLZNg9eH05yf+6HnfQFJWO3Ox35KsJoJtLmFEwLlc7LmqfuMonfkWKrE2MVp0ijf+rlC
 pgFHFzmYKEZYMyZMpnzqCt5JXY3Du2ndL/p2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f/k2mGN9MY7NNfoOb4gMqNsjIZIFXh28kOhlDVSQmA0=;
 b=OJWgIbXP78ai6gXJg8v+oSUdLrGPWNAzawLhkSPpMKi0f7q6Vvb1ekJN3woyYP2BTN
 MMORLZ8SoDcFB/M5LfpTxWc0yldwitqkup1FyW0cXWZznNTASV4DllwgLwrUmYmhDUYO
 bhlYHOzQsXnvxJp9Y/NOIfq4dxuoIiftuuj9VxUfRDxnRMLyH8MY7nBDRDvRF52MFNv5
 EQZMtRRkeAi+wqUQsuBldSLIlkj+OVvN0Oo5FIII5YWo19McJtGa2j5aCvr67wuO8if8
 +zc6WjzqDgX9AYJlzAyv853T4xVybauvOc7Bd53CflRekxzwjCS0s+qt6MiQyUjT3SMB
 1CkA==
X-Gm-Message-State: APjAAAXc0C3OxpqfZjSKLv/XlHk5oivY5dOE7zxt+bx4moMEU6SXyaFo
 cdofTEk4ea5ThlodvsJaGhBaTUnqo6YJKL+Gv2fbrw==
X-Google-Smtp-Source: APXvYqy6BPTxmJROJmd8xpRbLnJsPInZlt9zqkAt5bAH9XGkXglHOonteC+kQPoH8wbuH3FDnIt6xkHqcmjd+EAPUBo=
X-Received: by 2002:ad4:5a48:: with SMTP id ej8mr4977078qvb.187.1581041055375; 
 Thu, 06 Feb 2020 18:04:15 -0800 (PST)
MIME-Version: 1.0
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-6-drinkcat@chromium.org>
 <b58a8cf9-3275-cf89-6dff-596aceeb8000@arm.com>
 <CANMq1KBcNr=1_poBHrA_SDo_h-5i3e5TMqASEVaDj5LevsRcOQ@mail.gmail.com>
 <CAPDyKFr4Vz1ihuFQNnhDLEnOs=BZ1n2wzw3CATgPcDXs9g54uA@mail.gmail.com>
In-Reply-To: <CAPDyKFr4Vz1ihuFQNnhDLEnOs=BZ1n2wzw3CATgPcDXs9g54uA@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 7 Feb 2020 10:04:04 +0800
Message-ID: <CANMq1KBCd0wNgVAxAzxBwafHoafPExz07wKFhEWQFViAc0LL1Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/panfrost: Add support for multiple power
 domain support
To: Ulf Hansson <ulf.hansson@linaro.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ulf,

On Mon, Jan 27, 2020 at 3:55 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Fri, 10 Jan 2020 at 02:53, Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > +Ulf to keep me honest on the power domains
> >
> > On Thu, Jan 9, 2020 at 10:08 PM Steven Price <steven.price@arm.com> wrote:
> > >
> > > On 08/01/2020 05:23, Nicolas Boichat wrote:
> > > > When there is a single power domain per device, the core will
> > > > ensure the power domains are all switched on.
> > > >
> > > > However, when there are multiple ones, as in MT8183 Bifrost GPU,
> > > > we need to handle them in driver code.
> > > >
> > > >
> > > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > > ---
> > > >
> > > > The downstream driver we use on chromeos-4.19 currently uses 2
> > > > additional devices in device tree to accomodate for this [1], but
> > > > I believe this solution is cleaner.
> > >
> > > I'm not sure what is best, but it seems odd to encode this into the Panfrost driver itself - it doesn't have any knowledge of what to do with these power domains. The naming of the domains looks suspiciously like someone thought that e.g. only half of the cores could be powered, but it doesn't look like that was implemented in the chromeos driver linked and anyway that is *meant* to be automatic in the hardware! (I.e. if you only power up one cores in one core stack then the PDC should only enable the power domain for that set of cores).
> >
> > This is actually implemented in the Chrome OS driver [1]. IMHO power
> > domains are a bit confusing [2]:
> >  i. If there's only 1 power domain in the device, then the core takes
> > care of power on the domain (based on pm_runtime)
> >  ii. If there's more than 1 power domain, then the device needs to
> > link the domains manually.
> >
> > So the Chrome OS [1] driver takes approach (i), by creating 3 devices,
> > each with 1 power domain that is switched on/off automatically using
> > pm_runtime.
> >
> > This patch takes approach (ii) with device links to handle the extra domains.
> >
> > I believe the latter is more upstream-friendly, but, as always,
> > suggestions welcome.
>
> Apologies for the late reply. A few comments below.

No worries, than for the helpful reply!

> If the device is partitioned across multiple PM domains (it may need
> several power rails), then that should be described with the "multi PM
> domain" approach in the DTS. As in (ii).
>
> Using "device links" is however optional, as it may depend on the use
> case. If all multiple PM domains needs to be powered on/off together,
> then it's certainly recommended to use device links.

That's the case here, there's no support for turning on/off the
domains individually.

> However, if the PM domains can be powered on/off independently (one
> can be on while another is off), then it's probably easier to operate
> directly with runtime PM, on the returned struct *device from
> dev_pm_domain_attach_by_id().
>
> Also note, there is dev_pm_domain_attach_by_name(), which allows us to
> specify a name for the PM domain in the DTS, rather than using an
> index. This may be more future proof to use.

Agree, probably better to have actual names than just "counting" the
number of domains like I do, especially as we have a compatible struct
anyway. I'll update the patch.

> [...]
>
> Hope this helps.
>
> Kind regards
> Uffe
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
