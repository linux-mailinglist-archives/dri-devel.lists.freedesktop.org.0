Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C97E814A0B9
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2020 10:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A4E6EA99;
	Mon, 27 Jan 2020 09:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB476EA97;
 Mon, 27 Jan 2020 09:28:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 01:17:38 -0800
X-IronPort-AV: E=Sophos;i="5.70,369,1574150400"; d="scan'208";a="221679165"
Received: from jpanina-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.52.12])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Jan 2020 01:17:35 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 joonas.lahtinen@linux.intel.com, linux-kernel@vger.kernel.org,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 0/2] drm/i915/gem: conversion to new drm logging macros
In-Reply-To: <157996851987.2524.2577321446102599250@skylake-alporthouse-com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200122125750.9737-1-wambui.karugax@gmail.com>
 <157996851987.2524.2577321446102599250@skylake-alporthouse-com>
Date: Mon, 27 Jan 2020 11:17:37 +0200
Message-ID: <871rrlcl72.fsf@intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 25 Jan 2020, Chris Wilson <chris@chris-wilson.co.uk> wrote:
> Quoting Wambui Karuga (2020-01-22 12:57:48)
>> This series is a part of the conversion to  the new struct drm_device
>> based logging macros in drm/i915.
>> This series focuses on the drm/i915/gem directory and converts all
>> straightforward instances of the printk based logging macros to the new
>> macros.
>
> Overall, I'm not keen on this as it perpetuates the mistake of putting
> client debug message in dmesg and now gives them even more an air of
> being device driver debug messages. We need a mechanism by which we
> report the details of what a client did wrong back to that client
> (tracefs + context/client getparam to return an isolated debug fd is my
> idea).

I don't disagree, but I also don't think this makes things (much) worse
in that regard.

>
>> Wambui Karuga (2):
>>   drm/i915/gem: initial conversion to new logging macros using
>>     coccinelle.
>>   drm/i915/gem: manual conversion to struct drm_device logging macros.
>
> Still this is a necessary evil for the current situation,
> Acked-by: Chris Wilson <chris@chris-wilson.co.uk>

Thanks, pushed both.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
