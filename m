Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02523E8AD5
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 09:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4206E0B7;
	Wed, 11 Aug 2021 07:11:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C182489FED;
 Wed, 11 Aug 2021 07:11:10 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="213217350"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="213217350"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 00:11:09 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="516567085"
Received: from fbrausse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.251.209.112])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2021 00:11:05 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@gmail.com>,
 Matt Roper <matthew.d.roper@intel.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: missing signoff on drm-intel-gt-next pull
In-Reply-To: <162866195438.4169.13003970815194920952@jlahtine-mobl.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPM=9tyT17Qbd0b46Xap=vGhiicTKko7qCEsFJwOBVsb=_2axA@mail.gmail.com>
 <162866195438.4169.13003970815194920952@jlahtine-mobl.ger.corp.intel.com>
Date: Wed, 11 Aug 2021 10:11:02 +0300
Message-ID: <877dgso3qx.fsf@intel.com>
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

On Wed, 11 Aug 2021, Joonas Lahtinen <joonas.lahtinen@linux.intel.com> wrote:
> Quoting Dave Airlie (2021-08-11 06:48:39)
>> dim: db47fe727e1f ("drm/i915/step:
>> s/<platform>_revid_tbl/<platform>_revids"): committer Signed-off-by
>> missing.
>> 
>> I'm not sure how much pain it is to fix that up, but
>> commit db47fe727e1fc516cf60fc9ab8299605ef3c2d54
>> Author: Anusha Srivatsa <anusha.srivatsa@intel.com>
>> Commit: Matt Roper <matthew.d.roper@intel.com>
>> 
>>     drm/i915/step: s/<platform>_revid_tbl/<platform>_revids
>> 
>>     Simplify the stepping info array name.
>> 
>>     Cc: Jani Nikula <jani.nikula@linux.intel.com>
>>     Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>>     Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>>     Link: https://patchwork.freedesktop.org/patch/msgid/20210713193635.3390052-2-matthew.d.roper@intel.com
>> 
>> It's definitely missing an S-o-b by anyone who handled the patch.
>> 
>> Let me know if it's insanely painful to fix that.
>
> Added you to the earlier mail thread that discussed the incident.
>
> There are now 277 patches on top of that patch, so means rebasing all of
> those and changing the hashes and trying to fixup all the Fixes:.
>
> So it's painful but not insanely so. Let me know if you want the tree
> rebased.
>
> Regards, Joonas

The commit came in via a topic branch also to drm-intel-next, so that's
another 168 commits to rebase. There's a lot of people working on top of
those trees, so I'm leaning on the very painful side.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
