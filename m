Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76990149FA9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 09:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BF26EA39;
	Mon, 27 Jan 2020 08:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C4D6E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2020 07:55:47 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id b79so5037792vsd.9
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jan 2020 23:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JisW5FdHqDfpueRuACrKxki3mS2+DqkIGJ6tqvYKBYg=;
 b=kSO/uE+41usEvH7ebSjUhk6e1/GR1kdSgxZbiRxsCAhlZoPKgznwup/h/2aiurqXba
 seFxgj3oUfrgEWcKa+G614+LeCAaTNBjCdbjJPXw0HZTQ7jIJIx56MVRyj5idy2Njihw
 1lvg7u/sCsRI9lQAUgiE+1pj3eYt3mM8RKqpvOqGY4GoQ8WpnDC8loBTB3RIAdXpJd1t
 uvhGn77x1mkhssxugQBP4QZX/BGJNtXHXbfds528PcECqhauXzE+uRrC+XgHw3VmoWxm
 cfiAWEvIJOhatU7LA2qPT3/WwEw8MlcDjWSC/qZE6TC9IgUl8qSgQSK+hpv1LKGzU+vi
 04YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JisW5FdHqDfpueRuACrKxki3mS2+DqkIGJ6tqvYKBYg=;
 b=KiUr8BfuZDKmMI9DWXesXwSJzHSpKIMMOKmbJsyf2pJblMRqDsQfTlDWu4JmTtIu3H
 n5dU+PiyFQMixyeE5ZFerbHxYpzdd6rkLQPQkSicz96up++rsQCyXuwJBBnPBtOCJSQ5
 oVjZTQLIEF2O6Lwj/3lxWrD/Ea+50+P5fPCi1B4X2n6TSq9xT0hkPgBtfRnumZG1AIJi
 E4G/eq0Vcek5NfqaT+VsBSoYah3LG8uss5jly3ScYr9ecvGQg3I0MvMC7ZbmL2jkt+gw
 zGoKTXqOozyr0wOF6cLO1M7ajwZeEYqFMvEXYvF7nYUfl4eK0QErMpsHRSVstdqJBn76
 m/7g==
X-Gm-Message-State: APjAAAUG56rNQpQZytaLRq0jKujZmHCFUYSHSLsm80XsR4yW1sgexZHX
 LZh2EKZMN4EK9/BtiwH3p+R+4D6LPOyZz8juMNY6Jg==
X-Google-Smtp-Source: APXvYqyL1TCg49AaeGX4CVUErd9kezem7knF5p9I+JWV1m4AIpmUm9yBXdiHxcp8rC0t9W4QBLYziKJLuXWuYii+iQs=
X-Received: by 2002:a67:ee02:: with SMTP id f2mr584267vsp.165.1580111746386;
 Sun, 26 Jan 2020 23:55:46 -0800 (PST)
MIME-Version: 1.0
References: <20200108052337.65916-1-drinkcat@chromium.org>
 <20200108052337.65916-6-drinkcat@chromium.org>
 <b58a8cf9-3275-cf89-6dff-596aceeb8000@arm.com>
 <CANMq1KBcNr=1_poBHrA_SDo_h-5i3e5TMqASEVaDj5LevsRcOQ@mail.gmail.com>
In-Reply-To: <CANMq1KBcNr=1_poBHrA_SDo_h-5i3e5TMqASEVaDj5LevsRcOQ@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 Jan 2020 08:55:10 +0100
Message-ID: <CAPDyKFr4Vz1ihuFQNnhDLEnOs=BZ1n2wzw3CATgPcDXs9g54uA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/panfrost: Add support for multiple power
 domain support
To: Nicolas Boichat <drinkcat@chromium.org>
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:15:48 +0000
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

On Fri, 10 Jan 2020 at 02:53, Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> +Ulf to keep me honest on the power domains
>
> On Thu, Jan 9, 2020 at 10:08 PM Steven Price <steven.price@arm.com> wrote:
> >
> > On 08/01/2020 05:23, Nicolas Boichat wrote:
> > > When there is a single power domain per device, the core will
> > > ensure the power domains are all switched on.
> > >
> > > However, when there are multiple ones, as in MT8183 Bifrost GPU,
> > > we need to handle them in driver code.
> > >
> > >
> > > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > > ---
> > >
> > > The downstream driver we use on chromeos-4.19 currently uses 2
> > > additional devices in device tree to accomodate for this [1], but
> > > I believe this solution is cleaner.
> >
> > I'm not sure what is best, but it seems odd to encode this into the Panfrost driver itself - it doesn't have any knowledge of what to do with these power domains. The naming of the domains looks suspiciously like someone thought that e.g. only half of the cores could be powered, but it doesn't look like that was implemented in the chromeos driver linked and anyway that is *meant* to be automatic in the hardware! (I.e. if you only power up one cores in one core stack then the PDC should only enable the power domain for that set of cores).
>
> This is actually implemented in the Chrome OS driver [1]. IMHO power
> domains are a bit confusing [2]:
>  i. If there's only 1 power domain in the device, then the core takes
> care of power on the domain (based on pm_runtime)
>  ii. If there's more than 1 power domain, then the device needs to
> link the domains manually.
>
> So the Chrome OS [1] driver takes approach (i), by creating 3 devices,
> each with 1 power domain that is switched on/off automatically using
> pm_runtime.
>
> This patch takes approach (ii) with device links to handle the extra domains.
>
> I believe the latter is more upstream-friendly, but, as always,
> suggestions welcome.

Apologies for the late reply. A few comments below.

If the device is partitioned across multiple PM domains (it may need
several power rails), then that should be described with the "multi PM
domain" approach in the DTS. As in (ii).

Using "device links" is however optional, as it may depend on the use
case. If all multiple PM domains needs to be powered on/off together,
then it's certainly recommended to use device links.

However, if the PM domains can be powered on/off independently (one
can be on while another is off), then it's probably easier to operate
directly with runtime PM, on the returned struct *device from
dev_pm_domain_attach_by_id().

Also note, there is dev_pm_domain_attach_by_name(), which allows us to
specify a name for the PM domain in the DTS, rather than using an
index. This may be more future proof to use.

[...]

Hope this helps.

Kind regards
Uffe
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
