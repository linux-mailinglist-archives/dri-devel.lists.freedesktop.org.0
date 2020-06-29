Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E9E20D034
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 18:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A5789B83;
	Mon, 29 Jun 2020 16:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9763989B83
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 16:36:56 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id l6so5192184pjq.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cP6iQsVZnZL9cfv3sLl/5r6hzqX0rVayprzDZmD8fls=;
 b=q5EC2OafxVTf2u/iQVD0g8yJF3Y1bDOuicqD7IHdDsvf5/fGCEdbx9n3vhiYTT2qiC
 fXBtNHHkfMBVzxvHYFkKG4rc+UqQ1k+C6Zc1++iOwPtLEWdKwxKR0b4Hexnp5badz2e9
 Emob2Nui7WvtyIQWV2bepfCdG5Z+H4LQOzS6+qE7Mk/UpmWlaayYsRadT8JfLDeJuF7b
 ekEIDf7quMaUYxhU8LTapw6ta8ft2Dnmm1EFyyS+Va4/NSNILgilR0dN32QjzYEyHoPS
 cVvD1LHMsN1bihCtlFjyMsdBqea389T0XZ7BeI/GjaXKXlZmPjNU8WYzYSUbXsvl1n2F
 1iIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cP6iQsVZnZL9cfv3sLl/5r6hzqX0rVayprzDZmD8fls=;
 b=KkGL+6jKsUpbyfgvEHYrhZWTpExN19MKTaFbUt1/4oKmPGbRrkuGOw+sKuS1Ec8VFn
 O57elDWdKF5LYSJMlJp1fA6b2lnF7ayizIreO2QVCmnyqVtiWSuER3RVha2mn10uKzht
 d1dhq4n3sBufHv2O0gWsvY4BTdBlbuFUsrNIVBnAVd+goJHYGkNS0hlaHoxNRqTlPKGX
 dXCgWyZifP4eu2/W8DWIBz2zSbpBHDOmADyy2qltYqDnnJb6WCYnarp8s2y8GSOtDe1G
 /278PNBnfL12EA/AnMxlZvmsJkKDYCzDelmeQ54LIvIUZPhkTWr1uWjqrRPuZdlqcOm0
 2BKw==
X-Gm-Message-State: AOAM532YPK+8K/4WeuB2UF+8/98pbCOvD1+cyNm4+Vl5Cj29PTgCb2Pt
 Hgm3Rs8Zf5/VgXfbuKiXA8trbk6r6g+q5MRd2so=
X-Google-Smtp-Source: ABdhPJxY0TieHGnK37IC/NZ8PHvS+nU0xr2yP6SeSbn2otyH5MinztJSPrmwBVJET9OWG4mysZKu95H1GtfccfKlpyw=
X-Received: by 2002:a17:90a:b30d:: with SMTP id
 d13mr18146343pjr.181.1593448616001; 
 Mon, 29 Jun 2020 09:36:56 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200629112249eucas1p160b845444f8fbad96bdec41e9d3938da@eucas1p1.samsung.com>
 <20200629112242.18380-1-a.hajda@samsung.com>
 <20200629112242.18380-3-a.hajda@samsung.com>
In-Reply-To: <20200629112242.18380-3-a.hajda@samsung.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 29 Jun 2020 19:36:42 +0300
Message-ID: <CAHp75VdS_u8h4qfBxsQRUp1-2SL_hq20=dQkpteXH7Xg7epArQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/4] driver core: add deferring probe reason to
 devices_deferred property
To: Andrzej Hajda <a.hajda@samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 29, 2020 at 2:22 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> /sys/kernel/debug/devices_deferred property contains list of deferred devices.
> This list does not contain reason why the driver deferred probe, the patch
> improves it.
> The natural place to set the reason is dev_err_probe function introduced recently,
> ie. if dev_err_probe will be called with -EPROBE_DEFER instead of printk the message
> will be attached to deferred device and printed when user read devices_deferred

to a deferred

reads

> property.

...

> @@ -3984,10 +3986,12 @@ int dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
>         vaf.fmt = fmt;
>         vaf.va = &args;
>
> -       if (err != -EPROBE_DEFER)

> +       if (err != -EPROBE_DEFER) {

Why not positive conditional? (Okay, I'm fine with either in this case)

>                 dev_err(dev, "error %d: %pV", err, &vaf);
> -       else
> +       } else {
> +               device_set_deferred_probe_reson(dev, &vaf);
>                 dev_dbg(dev, "error %d: %pV", err, &vaf);
> +       }

To reduce churn, you may move {} addition to the first patch.

...

>         list_for_each_entry(curr, &deferred_probe_pending_list, deferred_probe)
> -               seq_printf(s, "%s\n", dev_name(curr->device));
> +               seq_printf(s, "%s\t%s", dev_name(curr->device),
> +                          curr->device->p->deferred_probe_reason ?: "\n");

Hmm... "\t" will be dangling in the latter case.

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
