Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C185A19F0DF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 09:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F417189EEB;
	Mon,  6 Apr 2020 07:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 304B989EEB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 07:37:29 +0000 (UTC)
IronPort-SDR: gm66qV27JRhIeOGs/qFaYed9Ugx9dt+cAt99RI3SMJthunRJuAaVqoBo+C0u0YXGsAFS84fbSO
 sbOlBZygRRyw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 00:37:28 -0700
IronPort-SDR: zxLso1bL8TOm8/q9pVl5b7mn+2Qd5Yv+N4xY2VboEbl8J62xz9AZJHXFzSK6xGtOEzeuj0Y5zo
 52evW69Yzqfw==
X-IronPort-AV: E=Sophos;i="5.72,350,1580803200"; d="scan'208";a="424272165"
Received: from maytarsh-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.38.121])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 00:37:23 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: [PATCH v2 1/1] lib/vsprintf: Add support for printing V4L2 and
 DRM fourccs
In-Reply-To: <20200406072857.GD5835@kekkonen.localdomain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200403091156.7814-1-sakari.ailus@linux.intel.com>
 <1105bfe5-88f1-040e-db40-54d7761747d5@rasmusvillemoes.dk>
 <20200406072857.GD5835@kekkonen.localdomain>
Date: Mon, 06 Apr 2020 10:37:20 +0300
Message-ID: <87wo6tkqtr.fsf@intel.com>
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
Cc: Petr Mladek <pmladek@suse.com>, mchehab@kernel.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
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

On Mon, 06 Apr 2020, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> On Fri, Apr 03, 2020 at 02:10:53PM +0200, Rasmus Villemoes wrote:
>> What's wrong with having a
>> 
>> char *fourcc_string(char *buf, u32 x)
>> 
>> that formats x into buf and returns buf, so it can be used in a
>> 
>> char buf[8];
>> pr_debug("bla: %s\n", fourcc_string(buf, x))
>
> I guess that could be one option. But changing the implementation could
> require changing the size of all those buffers.

Not arguing one way or another, just observing that
drm_get_format_name() abstracts that by using:

struct drm_format_name_buf {
	char str[32];
};


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
