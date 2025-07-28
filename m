Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F9EB136D1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jul 2025 10:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E271710E4B0;
	Mon, 28 Jul 2025 08:37:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/FO4OCN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF20010E4B0
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jul 2025 08:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753691845; x=1785227845;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=5HW/snAwIfD0ye/vlk7UVQKjebSwKda+D9Cu1oL4vnA=;
 b=W/FO4OCN3lqXtg8Gkk2vgrw+UTMIbgYl6YnR7kHP6mpEzJpmOQrGKZsW
 PfE3PSlDNefWiEf1XDWKhfLoCfU2zWXglx/bnt97nZxFuv0gHaZ15XYZM
 i0uUuI/MWJwligLwusms4/QJ1Xg+3F+J5FzoSNTAeg+/VxqK1/D4W5ojS
 ODBWew+cwlp07wnnHOksdIYvD0MKiR+DMJNN3AITjpPe0q5GJcE3zltw4
 FAq09VhG8HedUmi/fc9ycP5vRbKcxUFY7YAxQWDsN5MR9nIMgWvsPIEED
 gAwBvEw7SiMlkYbyDl6eMVZpAOnVDe+u7TYXPSTBqc9sE9qiOAEF/xS8g g==;
X-CSE-ConnectionGUID: dK0/bI3CSw6ibYM7aDFH4A==
X-CSE-MsgGUID: +nm45r1LTiyVeVscvqZOYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="55632433"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="55632433"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 01:37:25 -0700
X-CSE-ConnectionGUID: bck5GSs4RA++hfw3vrtZRA==
X-CSE-MsgGUID: AuuhnS7uQ1O63BgrikIfLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="167694648"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.225])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 01:37:21 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov
 <lumag@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] drm/tests: edid: Update CTA-861 HDMI Vendor
 Specific Data Block
In-Reply-To: <89bce051-3732-48a8-9679-11a404bbbfb3@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250625-drm-update-edid-v1-0-2d963743ab9e@kernel.org>
 <20250625-drm-update-edid-v1-2-2d963743ab9e@kernel.org>
 <046193df-bb11-4d84-98a4-c6d46d359316@suse.de>
 <20250716-realistic-cream-ammonite-304cca@houat>
 <89bce051-3732-48a8-9679-11a404bbbfb3@suse.de>
Date: Mon, 28 Jul 2025 11:37:18 +0300
Message-ID: <94c88860a39219dc29075d4c8f2ec351c7ce25f6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 16 Jul 2025, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 16.07.25 um 17:06 schrieb Maxime Ripard:
>> Hi Thomas,
>>
>> On Mon, Jul 14, 2025 at 01:02:33PM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 25.06.25 um 17:14 schrieb Maxime Ripard:
>>>> For some reason, the HDMI VSDBs in our kunit EDIDs had a length longer
>>>> than expected.
>>>>
>>>> While this was harmless, we should get rid of it to make it somewhat
>>>> predictable.
>>> Dump question: should these errors be kept in another test specifically for
>>> detecting this problem?
>> I'm not entirely sure what you mean here, sorry. Did you mean that we
>> should get some tests to prevent that kind of EDIDs from being accepted
>> by the kernel?
>>
>> If so, I guess it would mean getting a test suite for the EDID parser
>> itself, which is definitely something that should happen at some point
>> but seems a little out of scope to me.
>
> OK. I meant that these are ill-formed EDIDs and the kernel's EDID 
> processing should handle them gracefully. A test could verify this. Not 
> a blocker for this series, of course.

Going through old mails... I'll note that EDIDs in general contain so
much garbage that we simply can't reject them if there are issues. They
do need to be handled gracefully, of course.

BR,
Jani.


-- 
Jani Nikula, Intel
