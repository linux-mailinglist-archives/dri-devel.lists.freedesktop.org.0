Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE232073C4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 14:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21BB36EB2F;
	Wed, 24 Jun 2020 12:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C63666EB2E
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 12:53:19 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id f2so1023376plr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 05:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O7wgB1PLA24/IElEtiiyYyshpHq9ZAt0FgHZBp4YNRQ=;
 b=brEAxIh+ao1RY2mgzrJutnplvrsHDpRbP3JhBHzSEdr4RyP5HviwcRvnP644j4rjcg
 wljCRJoJl92CPuu8MnHazReBoQ2GdWcIgWLwbrzdHwhr42klN2VXc/z5GBYnOLZQkOSa
 KVjl0/zO1XSvGdQQSCMkhwoSPpnZYlvHpHhQqTFu8WvOpE8mg8gopIQN2uWrLCW1Nj1G
 0bitoBcn6UGo0kiwb98U1Ls155VX1UjmPdYrBWuVcsgHDR46a5GIV80kYnwpTCv8MzJK
 /SuCiTVZtPPk1OuyZFkt5XBLs7vV16SMROdz4YZ4rRuXqyLhAlSvpMycjnv3LKod4VET
 ioBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O7wgB1PLA24/IElEtiiyYyshpHq9ZAt0FgHZBp4YNRQ=;
 b=suhlghWEAn1hh96CYRlbUeGatoaOAC/F+PH0HDPenzJYAKiHXo99ITR5E4Zb4boYjE
 ujwp1GwmeYJLFMKVjV10Lxr08uRSTJBHMZelGmsaz0lZi+BZFoStfHwPRemRvBmzJLY0
 cIHfyPCGhRp07Tl9vS5qiKJvQ05HlkLLweqyaHMJgdwTeIIaCW1o68i6VFWH/xtCkFaZ
 TE24bPgZZd92px2JLus0rW4RhBT/iTH4zpNBtf9xeJZiOhoFOo6hlYVO4prL9h5uUNts
 MsKkV/O6S3TG9jv8Qf5cTXtDKYwz9PSv1bP8LBBWXuAS1lD57gA9Q8jOFANK2Eu6L5YL
 /fAw==
X-Gm-Message-State: AOAM530niXI5apdZUqalz4PHlHQoP58nERw3cLty3gQv90XRWAm84pZz
 YNQhHdUExM1KHWLxI509eFwBNOztHLlrq6QAiS8=
X-Google-Smtp-Source: ABdhPJzJfCnbi1xKsAAERCO6LFHCk7Xz11vkKfP638Hz4Ds2VN3Eb6sOFD6YGrqubiigSoUFs9NPhdtsxb0pxcqm6LM=
X-Received: by 2002:a17:90a:220f:: with SMTP id
 c15mr29721947pje.129.1593003199402; 
 Wed, 24 Jun 2020 05:53:19 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200624114136eucas1p1c84f81b1d78e2dbad7ac1b762f0a4b4f@eucas1p1.samsung.com>
 <20200624114127.3016-1-a.hajda@samsung.com>
 <20200624114127.3016-4-a.hajda@samsung.com>
In-Reply-To: <20200624114127.3016-4-a.hajda@samsung.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 24 Jun 2020 15:53:06 +0300
Message-ID: <CAHp75Vf5ANVRb8ghzdWa1F5U3JaRv9J2mVF8AQ+WwBahQM9Y5A@mail.gmail.com>
Subject: Re: [RESEND PATCH v5 3/5] drivers core: allow probe_err accept
 integer and pointer types
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

On Wed, Jun 24, 2020 at 2:41 PM Andrzej Hajda <a.hajda@samsung.com> wrote:
>
> Many resource acquisition functions return error value encapsulated in
> pointer instead of integer value. To simplify coding we can use macro
> which will accept both types of error.
> With this patch user can use:
>         probe_err(dev, ptr, ...)
> instead of:
>         probe_err(dev, PTR_ERR(ptr), ...)
> Without loosing old functionality:
>         probe_err(dev, err, ...)

...

> + * This helper implements common pattern present in probe functions for error
> + * checking: print message if the error is not -EPROBE_DEFER and propagate it.
> + * In case of -EPROBE_DEFER it sets defer probe reason, which can be checked
> + * later by reading devices_deferred debugfs attribute.
> + * It replaces code sequence:
> + *     if (err != -EPROBE_DEFER)
> + *             dev_err(dev, ...);

Btw, we have now %pe. Can you consider to use it?

> + *     return err;
> + * with
> + *     return probe_err(dev, err, ...);
> + *
> + * Returns @err.
> + *
> + */
> +#define probe_err(dev, err, args...) __probe_err(dev, (long)(err), args)

Can't we use PTR_ERR() here?

-- 
With Best Regards,
Andy Shevchenko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
