Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D598A31E6E5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Feb 2021 08:27:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDBB489D99;
	Thu, 18 Feb 2021 07:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE5989D99
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Feb 2021 07:27:13 +0000 (UTC)
IronPort-SDR: R92RHp9iJ2ZqoRmD0AOIGXqqGRyOdp6bc2ElQGMVirKIb7cPkaQN/eWsVnQEkjSEvv/d1mublg
 tL8CrKYO2v3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9898"; a="183548736"
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="183548736"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 23:27:13 -0800
IronPort-SDR: /sCPfWNKE52fh+yCaJ2IFkZ1S2LTiaA22tcHVAEgS89O3W/yKVbJa4uQ6Q22XLdKjY10vAhRse
 dGhgDJfDzvtw==
X-IronPort-AV: E=Sophos;i="5.81,186,1610438400"; d="scan'208";a="362331541"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 23:27:09 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
 by paasikivi.fi.intel.com (Postfix) with SMTP id 3A9132036A;
 Thu, 18 Feb 2021 09:27:07 +0200 (EET)
Date: Thu, 18 Feb 2021 09:27:07 +0200
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v9 0/4] Add %p4cc printk modifier for V4L2 and DRM fourcc
 codes
Message-ID: <20210218072707.GD3@paasikivi.fi.intel.com>
References: <20210216155723.17109-1-sakari.ailus@linux.intel.com>
 <9e279133-298d-433f-0694-5366861a6dbe@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9e279133-298d-433f-0694-5366861a6dbe@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Petr Mladek <pmladek@suse.com>, mchehab@kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hverkuil@xs4all.nl,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, laurent.pinchart@ideasonboard.com,
 Joe Perches <joe@perches.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 17, 2021 at 01:14:42PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 16.02.21 um 16:57 schrieb Sakari Ailus:
> > Hi all,
> > 
> > 	On merging --- it would seem everyone is happy with merging this
> > 	through the drm-misc tree. The last patch should wait until all
> > 	users are gone for sure, probably to the next kernel release.
> > 	There are no users of drm_get_format_name() in linux-next
> > 	currently after the 3rd patch.
> 
> I've merged patches 1 to 3 into drm-misc-next. Patch 4 (and maybe some final
> fix-up patch) will land when all DRM trees have catched up the changes.

Thank you!

-- 
Sakari Ailus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
