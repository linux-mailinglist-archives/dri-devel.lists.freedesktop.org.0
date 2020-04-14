Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DE01A7946
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 13:18:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 168816E091;
	Tue, 14 Apr 2020 11:18:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3146E091
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 11:18:04 +0000 (UTC)
IronPort-SDR: cKh7v9eOSpOHOJd8Qfq5915VUFAQzlcXe1dwGaSmB8jSq9Xr00MSDBJlHiXfrtM86h2CwbKshK
 1wiMcNpW2u9A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 04:18:03 -0700
IronPort-SDR: ja267ebaQ9w4t55QmJPranFoVXx+4cvcrpwcVGbI8B0YFKIgy+eSJqoJfG4sOiZogYLjr/HyON
 pRcKinROhUmQ==
X-IronPort-AV: E=Sophos;i="5.72,382,1580803200"; d="scan'208";a="427028399"
Received: from mdoerbec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.38.76])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2020 04:18:00 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <contact@emersion.fr>, Yussuf Khalil <dev@pp3345.net>
Subject: Re: [PATCH 5/5] drm/i915: Replace "Broadcast RGB" with "RGB
 quantization range" property
In-Reply-To: <daCvJk4O6rHOwEometGSPENJupb6adPr583_dLEetvftUQPbK4198VDijHGzM9uTm9bP3TEyGCZvxKe5PSvqWBg5xhXkL_7EiAQlmEPKWQI=@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200413214024.46500-1-dev@pp3345.net>
 <20200413214024.46500-6-dev@pp3345.net>
 <daCvJk4O6rHOwEometGSPENJupb6adPr583_dLEetvftUQPbK4198VDijHGzM9uTm9bP3TEyGCZvxKe5PSvqWBg5xhXkL_7EiAQlmEPKWQI=@emersion.fr>
Date: Tue, 14 Apr 2020 14:17:57 +0300
Message-ID: <87ftd6mi3e.fsf@intel.com>
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

On Mon, 13 Apr 2020, Simon Ser <contact@emersion.fr> wrote:
> On Monday, April 13, 2020 11:40 PM, Yussuf Khalil <dev@pp3345.net> wrote:
>
>> DRM now has a globally available "RGB quantization range" connector
>> property. i915's "Broadcast RGB" that fulfils the same purpose is now
>> considered deprecated, so drop it in favor of the DRM property.
>
> For a UAPI point-of-view, I'm not sure this is fine. Some user-space
> might depend on this property, dropping it would break such user-space.

Agreed.

> Can we make this property deprecated but still keep it for backwards
> compatibility?

Would be nice to make the i915 specific property an "alias" for the new
property, however I'm not sure how you'd make that happen. Otherwise
juggling between the two properties is going to be a nightmare.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
