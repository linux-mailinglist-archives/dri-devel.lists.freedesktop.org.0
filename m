Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE621B672
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 15:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2FD6EC4A;
	Fri, 10 Jul 2020 13:31:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA7D6EC4A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 13:31:38 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EE8620578;
 Fri, 10 Jul 2020 13:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594387898;
 bh=roVKF9WachsmsskcJZjXabT8G0JYpFRwtH55QGG8Ys8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0ovFL5uznNZwgSUCQqQuc49b3L2yB3zwOqRg1TS2fda5WJPfTXSySKVdluS6kFtKN
 07MFLtqfnOmOQ5Uawwt/84sGSEpq6JEHsJ+njKN+vIMFwxKzYUMtBJKb38CwLzT4hj
 ZpK+Zy7lAui02JYNYC8edVnp2a50pKcidY4K1t6M=
Date: Fri, 10 Jul 2020 15:31:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH v8 2/5] driver core: add deferring probe reason to
 devices_deferred property
Message-ID: <20200710133143.GA2085030@kroah.com>
References: <CAHp75VegHLG5tgVFjwmpmDfSqELqNXcb9dFSM4jLRx+anW7Lsw@mail.gmail.com>
 <CGME20200702134434eucas1p233a3f66f5bdb4b97f4f49d2d43d45297@eucas1p2.samsung.com>
 <20200702134421.6412-1-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702134421.6412-1-a.hajda@samsung.com>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 andy.shevchenko@gmail.com, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 02, 2020 at 03:44:21PM +0200, Andrzej Hajda wrote:
> /sys/kernel/debug/devices_deferred property contains list of deferred devices.
> This list does not contain reason why the driver deferred probe, the patch
> improves it.
> The natural place to set the reason is dev_err_probe function introduced
> recently, ie. if dev_err_probe will be called with -EPROBE_DEFER instead of
> printk the message will be attached to a deferred device and printed when user
> reads devices_deferred property.
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> Reviewed-by: Mark Brown <broonie@kernel.org>
> Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
> ---
> v8:
> - improved commit message

I'm totally confused by this series.  Can you resend the whole thing,
as a full series, not just random individual patches in the series
incremented?  It's a pain to try to fish them all out as to which is the
"latest" with all of the needed reviewed by lines :(

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
