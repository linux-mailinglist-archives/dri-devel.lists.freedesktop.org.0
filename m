Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC62E1B27A1
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26296E0C9;
	Tue, 21 Apr 2020 13:25:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DCD16E0C9
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Apr 2020 13:25:21 +0000 (UTC)
IronPort-SDR: EqvxL1XSdZTzaxWSeykM5IR6gDOiror6OlI3iXcCo+ExonYBZ6C7YyN8wwvkJdZwgzD93GvQs0
 XEpAJIXuJbWw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 06:25:20 -0700
IronPort-SDR: Pxwk5F1PYhQkqNU/uoogRvppqsRUhmVhKkJjfu2H8Ed6nQ0Mx8DgDU3PKrjQOHXJK0ImGAfP4z
 hO+lxJVr2a8Q==
X-IronPort-AV: E=Sophos;i="5.72,410,1580803200"; d="scan'208";a="429528579"
Received: from parkernx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.46.80])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2020 06:25:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 0/8] drm, fbdev: rework dependencies
In-Reply-To: <CAKMK7uE7y8TVbZ8ExpDEA2MuvhSDxKQ6y=eDXSbwgjUzsbm44A@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200417155553.675905-1-arnd@arndb.de>
 <20200417171453.GS3456981@phenom.ffwll.local>
 <20200417190854.GI26002@ziepe.ca> <87y2qq1smt.fsf@intel.com>
 <CAK8P3a0eSHg6Hx-FqpEF-N4LhZjv4o3PooK2eKw7KTntoKKckQ@mail.gmail.com>
 <20200421122726.GW3456981@phenom.ffwll.local> <87a735yp0f.fsf@intel.com>
 <CAMuHMdXRwRe5p65+YM69HDM4BhW+ZuHUju9B9083+=HdCotsqw@mail.gmail.com>
 <CAKMK7uE7y8TVbZ8ExpDEA2MuvhSDxKQ6y=eDXSbwgjUzsbm44A@mail.gmail.com>
Date: Tue, 21 Apr 2020 16:25:09 +0300
Message-ID: <877dy9ynre.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Daniel Drake <dsd@laptop.org>, Arnd Bergmann <arnd@arndb.de>,
 Jason Gunthorpe <jgg@ziepe.ca>, David Airlie <airlied@linux.ie>,
 Masahiro Yamada <masahiroy@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 Saeed Mahameed <saeedm@mellanox.com>, Thomas Hellstrom <thellstrom@vmware.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Jens Frederich <jfrederich@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Apr 2020, Daniel Vetter <daniel@ffwll.ch> wrote:
> To clarify what I was aiming for with my mail: I'm not worried about
> fbdev here, I'm just worried that this will come back, and we'll grow
> select somewhere else until it's become a big & totally horrible mess.
> I think a lot of the backlight selects have also grown because of
> this, so this isn't just a one-off I think.
>
> If Arnd is happy to play "Kconfig select" whack-a-mole ever once in a
> while (and deal with the intermediate compile horrors while everyone
> upgrades) I'm ok with this landing. Just not terribly happy if the
> underlying issue isn't fixed.

And I'll keep ignoring the IS_REACHABLE() patches that make i915 build
with a config that should not exist. ;)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
