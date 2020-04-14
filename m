Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E15D81A7950
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 13:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE056E0C5;
	Tue, 14 Apr 2020 11:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E17646E0C5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:21:12 +0000 (UTC)
IronPort-SDR: OQlvjR/sDd0a/0Cme7j+7zxFfAR6XkdY49hUEFjKJ9ULpZZ00Di8uww8EM8Vi8vYg2CRnShkWF
 Ic5jwErPddsg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 04:21:12 -0700
IronPort-SDR: nBh+HDJOG1IQJScmUMIMFGy/LFqCdBemrRKIn7RuiyV93w4yPA5GwtKIR6yoVpjAtr89ryOHZW
 3VEk34ZEzXzw==
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="399921309"
Received: from mdoerbec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 04:21:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <contact@emersion.fr>, Yussuf Khalil <dev@pp3345.net>
Subject: Re: [PATCH 5/5] drm/i915: Replace "Broadcast RGB" with "RGB
 quantization range" property
In-Reply-To: <87ftd6mi3e.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200413214024.46500-1-dev@pp3345.net>
 <20200413214024.46500-6-dev@pp3345.net>
 <daCvJk4O6rHOwEometGSPENJupb6adPr583_dLEetvftUQPbK4198VDijHGzM9uTm9bP3TEyGCZvxKe5PSvqWBg5xhXkL_7EiAQlmEPKWQI=@emersion.fr>
 <87ftd6mi3e.fsf@intel.com>
Date: Tue, 14 Apr 2020 14:21:06 +0300
Message-ID: <87d08amhy5.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Apr 2020, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 13 Apr 2020, Simon Ser <contact@emersion.fr> wrote:
>> On Monday, April 13, 2020 11:40 PM, Yussuf Khalil <dev@pp3345.net> wrote:
>>
>>> DRM now has a globally available "RGB quantization range" connector
>>> property. i915's "Broadcast RGB" that fulfils the same purpose is now
>>> considered deprecated, so drop it in favor of the DRM property.
>>
>> For a UAPI point-of-view, I'm not sure this is fine. Some user-space
>> might depend on this property, dropping it would break such user-space.
>
> Agreed.
>
>> Can we make this property deprecated but still keep it for backwards
>> compatibility?
>
> Would be nice to make the i915 specific property an "alias" for the new
> property, however I'm not sure how you'd make that happen. Otherwise
> juggling between the two properties is going to be a nightmare.

Ah, the obvious easy choice is to use the property and enum names
already being used by i915 and gma500, and you have no problem. Perhaps
they're not the names you'd like, but then looking at the total lack of
consistency across property naming makes them fit right in. ;)

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
