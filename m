Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC34019D046
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 08:37:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 165676EAF5;
	Fri,  3 Apr 2020 06:37:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46A626EAF5
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 06:37:23 +0000 (UTC)
IronPort-SDR: dBa9mGeQJHkS11c51YaO8KyPdNTVnVxq/zw9cPFFLDXJKDsfVrgzCSx9+e6hxkclBTvFLB+2x7
 7LwO9i5EXiGw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 23:37:22 -0700
IronPort-SDR: uVq+TP60UB0gu+tUe0oDJi+pXCzxXRnZFGpBougHPq3mDYA7uvPNFHvnTQPtYzbVHIepve5iX1
 U0ugja7fX5rg==
X-IronPort-AV: E=Sophos;i="5.72,338,1580803200"; d="scan'208";a="423425676"
Received: from ellenfax-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.38.213])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 23:37:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joe Perches <joe@perches.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Petr Mladek <pmladek@suse.com>
Subject: Re: [PATCH 1/1] lib/vsprintf: Add support for printing V4L2 and DRM
 fourccs
In-Reply-To: <04bb934e551f43540d1daacd2759beacc0b3116a.camel@perches.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200401140522.966-1-sakari.ailus@linux.intel.com>
 <87eet6mgk7.fsf@intel.com>
 <04bb934e551f43540d1daacd2759beacc0b3116a.camel@perches.com>
Date: Fri, 03 Apr 2020 09:37:14 +0300
Message-ID: <87zhbtkrc5.fsf@intel.com>
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-media@vger.kernel.org, Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hverkuil@xs4all.nl, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>, mchehab@kernel.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 02 Apr 2020, Joe Perches <joe@perches.com> wrote:
> On Thu, 2020-04-02 at 11:34 +0300, Jani Nikula wrote:
>> Or could we conceive of a way to make this locally extensible yet safe,
>> letting callers use something like %{foo}, as well as providing a
>> locally relevant function to do the conversion?
>
> No.  printf validation would be broken.

I tossed the idea on a whim, and thinking further I could probably come
up with a number of challenges, but care to elaborate on what you see as
the problem in validation?

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
