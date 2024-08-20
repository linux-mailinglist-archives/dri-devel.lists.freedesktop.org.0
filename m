Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E45E5958D50
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2024 19:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19F010E7F0;
	Tue, 20 Aug 2024 17:28:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nU+36PWl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 352DE10E7F0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2024 17:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724174920; x=1755710920;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gxOpFPPyX4vEfDtz0VCkirxZGrDav49zs5925e143/I=;
 b=nU+36PWlLr2yy9b5oNKBlPOT/LX0Ijp7clA0Q1b8yXz3fl0/77P80Bz3
 XnHIOp4QTUXfhKd/HpM8zot6Ed0Ij//c+gsyyDRKJ3cDrXwYEZc0m1NCJ
 7eGIGDfsikBPmtvtCHptpCMUBy/YE2NwdKxBHr7dQjxwbgFAAmGlgM1hE
 2DQD2TcfjTIGdAL8GKaAwfk3YcCEsTLiostydIzqMrXSehhERZL+1Zme5
 LUYSA7ZNA4/J4SvXkh8kgH6rtJ4Y6KhxbdaeSVJU4QJtkcc4SAgrezJKI
 sxntn6dXVHS6gWDLbW9bfI+XLopO8TRb/5MiMQP1nREUJgwujHQEH5u4f g==;
X-CSE-ConnectionGUID: cJo1DzghRyWzHojHKgqtYg==
X-CSE-MsgGUID: TaRci3tHRQG6fpFsPtv0+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22644752"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22644752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:28:08 -0700
X-CSE-ConnectionGUID: M1PnaZKjTxGoD5szJQWUeQ==
X-CSE-MsgGUID: o+OJD7p9Riqa+7SQuPBl6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="91523618"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 10:27:58 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sgSeA-0000000HOGh-1rJT; Tue, 20 Aug 2024 20:27:54 +0300
Date: Tue, 20 Aug 2024 20:27:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org,
 patches@lists.linux.dev, devicetree@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Pin-yen Lin <treapking@chromium.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Benson Leung <bleung@chromium.org>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org, Guenter Roeck <groeck@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lee Jones <lee@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Prashant Malani <pmalani@chromium.org>,
 Robert Foss <rfoss@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tzung-Bi Shih <tzungbi@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Daniel Scally <djrscally@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Ivan Orlov <ivan.orlov0322@gmail.com>, linux-acpi@vger.kernel.org,
 linux-usb@vger.kernel.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 05/17] usb: typec: Add device managed
 typec_switch_register()
Message-ID: <ZsTSGjdz2HbqcZkJ@smile.fi.intel.com>
References: <20240819223834.2049862-1-swboyd@chromium.org>
 <20240819223834.2049862-6-swboyd@chromium.org>
 <ZsRs6d6uOMb4DqQQ@smile.fi.intel.com>
 <CAE-0n52O01UgrDT2=-JJpZj39BOJNyyQC4w_pgDUmKDmcN=8Yw@mail.gmail.com>
 <ZsTPeEsS1m4Y8imq@smile.fi.intel.com>
 <CAE-0n52FSUFictNQ9kotgFAZPYnJpy+3Ad__QeUN+EiJuBWGwQ@mail.gmail.com>
 <CAE-0n50uOcCHHaw=opEY089ymPBER2H7QLtORFzD6ypwHEKUJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE-0n50uOcCHHaw=opEY089ymPBER2H7QLtORFzD6ypwHEKUJw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 20, 2024 at 10:23:06AM -0700, Stephen Boyd wrote:
> Quoting Stephen Boyd (2024-08-20 10:19:48)
> > Quoting Andy Shevchenko (2024-08-20 10:16:40)
> > > On Tue, Aug 20, 2024 at 10:01:07AM -0700, Stephen Boyd wrote:
> > > > Quoting Andy Shevchenko (2024-08-20 03:16:09)
> > > > > On Mon, Aug 19, 2024 at 03:38:19PM -0700, Stephen Boyd wrote:

...

> > > > > > +     ptr = devres_alloc(devm_typec_switch_unregister, sizeof(*ptr), GFP_KERNEL);
> > > > > > +     if (!ptr)
> > > > > > +             return ERR_PTR(-ENOMEM);
> > > > > > +
> > > > > > +     switch_dev = typec_switch_register(parent ,desc);
> > >
> > > (Side note: wrong location of the white space)
> >
> > Thanks.
> >
> > >
> > > > > > +     if (!IS_ERR(switch_dev)) {
> > >
> > > (Side note: positive conditional is okay)
> > >
> > > > > > +             *ptr = switch_dev;
> > > > > > +             devres_add(parent, ptr);
> > > > > > +     } else {
> > > > > > +             devres_free(ptr);
> > > > > > +     }
> > > > >
> > > > > devm_add_action_or_reset() ?
> > > >
> > > > No. We don't want to call the 'action' devm_typec_switch_unregister()
> > > > when it fails because that would unregister a switch that has never been
> > > > registered.
> > >
> > > Hmm... With devm_add_action_or_reset() we first do things and then try to add
> > > them to the managed resources. In that case it won't be like you described.
> > >
> > > What do I miss?
> >
> > I believe you've missed that this is a wrapper around struct device and
> > the error path is different (put_device() vs. device_unregister()).
> 
> Or you're suggesting devm_add_action_or_reset() after registering the
> switch? Sorry it wasn't clear to me.

Yes, after successful switch registration.

-- 
With Best Regards,
Andy Shevchenko


