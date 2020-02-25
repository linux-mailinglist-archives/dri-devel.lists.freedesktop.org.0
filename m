Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D049916F0B3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 21:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 575386EBAC;
	Tue, 25 Feb 2020 20:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B64A6EBAC
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 20:57:48 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 146422467D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 20:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582664268;
 bh=rEf2Wh9b2Cqc5tJSuDzSluIyGn5h8PEv+2AGQEQ1p7s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gg6Rej+lEjdE3MacAgPmABGfeEK4naM3qOPYaKvI6VDiP+dnMybL0IxoHGVGDs7yy
 E3V+I76+lUu0xY/bwpiOuR2QpnM95bq/0c4t6LVntRLm17lQNFftdzZSonrfhuEA9D
 oR7Ir/7pF1qi7QFUxPXnrZq2XPZK6VAIOSpFAbUg=
Received: by mail-qk1-f177.google.com with SMTP id f3so574747qkh.3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 12:57:48 -0800 (PST)
X-Gm-Message-State: APjAAAUgINMoboCKW4W+SV1F22XzL9eJBiJOJhnmpcE+GNsUyU8CEr9J
 iW119luSF/pTCMcCapV8e558i9NyC3hqjGBL/w==
X-Google-Smtp-Source: APXvYqz2R5nikNFiKQzE3WzYAa4JRDhsDEPVyRy8hsiD3YIxfbq2k/r6k7Ue9axTsmsjn+eGEtYJoB+gv797DdDBI14=
X-Received: by 2002:a37:a750:: with SMTP id q77mr933467qke.119.1582664267060; 
 Tue, 25 Feb 2020 12:57:47 -0800 (PST)
MIME-Version: 1.0
References: <20200221194731.13814-1-lukasz.luba@arm.com>
 <20200221194731.13814-5-lukasz.luba@arm.com>
In-Reply-To: <20200221194731.13814-5-lukasz.luba@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Feb 2020 14:57:36 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJ1D6Cf2cxdskDS2JCEe8ja6uUeoSpA3i-wxNgi=S1SYA@mail.gmail.com>
Message-ID: <CAL_JsqJ1D6Cf2cxdskDS2JCEe8ja6uUeoSpA3i-wxNgi=S1SYA@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/panfrost: Register to the Energy Model with
 devfreq device
To: Lukasz Luba <lukasz.luba@arm.com>
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
Cc: Nishanth Menon <nm@ti.com>, juri.lelli@redhat.com,
 Peter Zijlstra <peterz@infradead.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, bsegall@google.com,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Morten Rasmussen <Morten.Rasmussen@arm.com>, patrick.bellasi@matbug.net,
 Amit Kucheria <amit.kucheria@verdurent.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Kevin Hilman <khilman@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Steven Price <steven.price@arm.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Ingo Molnar <mingo@redhat.com>, NXP Linux Team <linux-imx@nxp.com>,
 Zhang Rui <rui.zhang@intel.com>, mgorman@suse.de, orjan.eide@arm.com,
 "open list:THERMAL" <linux-pm@vger.kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Steven Rostedt <rostedt@goodmis.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-omap <linux-omap@vger.kernel.org>, Dietmar.Eggemann@arm.com,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, David Airlie <airlied@linux.ie>,
 javi.merino@arm.com, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 qperret@google.com, Stephen Boyd <sboyd@kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <kernel@pengutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
 Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 21, 2020 at 1:48 PM Lukasz Luba <lukasz.luba@arm.com> wrote:
>
> Add device to the Energy Model framework. It will create a dedicated
> and unified data structures used i.e. in the thermal framework.
> The power model used in dev_pm_opp subsystem is simplified and created
> based on DT 'dynamic-power-coefficient', volatage and frequency. It is

typo.

> similar to the CPU model used in Energy Aware Scheduler.
>
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_devfreq.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> index 413987038fbf..d527a5113950 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
> @@ -105,6 +105,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
>         }
>         pfdev->devfreq.devfreq = devfreq;
>
> +       dev_pm_opp_of_register_em(dev, NULL);

Can't fail?

> +
>         cooling = of_devfreq_cooling_register(dev->of_node, devfreq);
>         if (IS_ERR(cooling))
>                 DRM_DEV_INFO(dev, "Failed to register cooling device\n");
> @@ -118,6 +120,7 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
>  {
>         if (pfdev->devfreq.cooling)
>                 devfreq_cooling_unregister(pfdev->devfreq.cooling);
> +       dev_pm_opp_of_unregister_em(&pfdev->pdev->dev);
>         dev_pm_opp_of_remove_table(&pfdev->pdev->dev);

Does it make sense to keep this (and the registration side) as
separate calls? Perhaps there's some ordering requirement with
everything between dev_pm_opp_of_add_table() and
dev_pm_opp_of_register_em()?

While you're just adding 2 lines, it seems there's a lot of complexity
exposed to the driver just to initialize devfreq/opp.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
