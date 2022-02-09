Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CB94AF338
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 14:48:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59C3B10E451;
	Wed,  9 Feb 2022 13:48:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8885410E451
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644414485; x=1675950485;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=mCLMTF/Kdx89pdQlhSi2Q8AM8SGXYokPeOlF4018GTY=;
 b=BsOz5rpHY6h/rL56PsMwi/zCDEiIe4oH9/D1knQAKk0BnBFQb+0z6JL2
 OPEivlPXxz82koMYqUr6v73S1saKe+Z/9LNGz597UAOnf5+KvQSBKkKaG
 6uhIeip6dVn7bZdLCxSezXAt0WZj4HMBnPBYfPsfmfLPK5gW/SOxP1wGX
 XVa6qiCbgV0BwqmmhwFtm8KMAHlJEMuzuqMXwFW190ailt5gQgE9T2Qhv
 +PqjUGZxYm5a8k0zdPPpMF9T+HCQL6rLndFPovxFotipl/uyiRqmtSHXu
 sTtL+5zT0XXsGlTV9U/zm14VJyGHTliMKbrRBDTggokilvFL+OeWTccOB Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="229852583"
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="229852583"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 05:48:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,355,1635231600"; d="scan'208";a="601625256"
Received: from smile.fi.intel.com ([10.237.72.61])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2022 05:48:00 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nHnJG-002d2W-2F; Wed, 09 Feb 2022 15:47:02 +0200
Date: Wed, 9 Feb 2022 15:47:01 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 0/4] drm/tiny: Add driver for Solomon SSD1307 OLED
 displays
Message-ID: <YgPF1cBMsd9973Dx@smile.fi.intel.com>
References: <20220204134347.1187749-1-javierm@redhat.com>
 <CAMuHMdVTVX7LFay-rfv=oW96dMA24duMUVGRE62jQSNkrKtyMg@mail.gmail.com>
 <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f178de92-7cb1-dcc5-1f60-9ccfc56bc0a4@redhat.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>, Linux PWM List <linux-pwm@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 08, 2022 at 04:10:49PM +0100, Javier Martinez Canillas wrote:
> On 2/8/22 15:19, Geert Uytterhoeven wrote:
> > On Fri, Feb 4, 2022 at 2:43 PM Javier Martinez Canillas
> > <javierm@redhat.com> wrote:

> >   - Kernel size increased by 349 KiB,
> >   - The "Memory:" line reports 412 KiB less memory,
> >   - On top of that, "free" shows ca. 92 KiB more memory in use after
> >     bootup.

The memory consumption should really be taken seriously, because these kind of
displays are for embedded platforms with limited amount of resources.

Thanks, Geert, for testing and reporting this issue in particular.

-- 
With Best Regards,
Andy Shevchenko


