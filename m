Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB921D73DB
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 11:22:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E4B26E084;
	Mon, 18 May 2020 09:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 963E06E084
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 09:22:24 +0000 (UTC)
IronPort-SDR: zdML9LHktwsv8NtVtqDlM+LO3vH7Gm2sY2PxAUHg6kqB2XRn3EtvgYMcz0BgR7F8EJW1WmiOe2
 3webOoes3mcw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 02:22:24 -0700
IronPort-SDR: AqiTfXFnGHeUzTaRoxfm3MY1AT1wmgM4AqRV9ONFgrDn99dmHmS3aBcyL8tX0kAxBHVHu0TZq6
 h+O+tyE4sWKg==
X-IronPort-AV: E=Sophos;i="5.73,406,1583222400"; d="scan'208";a="439147209"
Received: from ahermans-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.41.209])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2020 02:22:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH v2] drm/debugfs: fix plain echo to connector "force"
 attribute
In-Reply-To: <CACvgo52u6pVjA5SjSf6E6aXWuvhb5t=VDcndd+P7Oyup676Obw@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87shgq8qh9.fsf@nikula.org>
 <20170817104307.17124-1-m.tretter@pengutronix.de> <87mv6y8lup.fsf@nikula.org>
 <CACvgo52u6pVjA5SjSf6E6aXWuvhb5t=VDcndd+P7Oyup676Obw@mail.gmail.com>
Date: Mon, 18 May 2020 12:22:18 +0300
Message-ID: <87wo5938dx.fsf@intel.com>
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
Cc: Sascha Hauer <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Michael Tretter <m.tretter@pengutronix.de>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 17 May 2020, Emil Velikov <emil.l.velikov@gmail.com> wrote:
> On Thu, 17 Aug 2017 at 12:34, Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>
>> On Thu, 17 Aug 2017, Michael Tretter <m.tretter@pengutronix.de> wrote:
>> > Using plain echo to set the "force" connector attribute fails with
>> > -EINVAL, because echo appends a newline to the output.
>> >
>> > Replace strcmp with sysfs_streq to also accept strings that end with a
>> > newline.
>> >
>> > v2: use sysfs_streq instead of stripping trailing whitespace
>> >
>> > Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
>>
>> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>
> Seems like this fell through the cracks. Pushed to drm-misc-next.

From 2017? How'd you find it? :o

My bad, thanks.


BR,
Jani.



-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
