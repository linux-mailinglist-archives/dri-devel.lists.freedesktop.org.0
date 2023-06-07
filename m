Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBF8725708
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 10:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C504D10E08C;
	Wed,  7 Jun 2023 08:12:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D9D310E08C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 08:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686125543; x=1717661543;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=MLXJN8f1wgeJvba3Z+b92UH3LzPWiFgfUtqTwlhYIpI=;
 b=A5Sce54dms6u952zU/uOLn0MhgEa7ZXL2gLJkMk5JrQrHmSY2z6PKS/9
 eNQzlcTclWhVmV2ELqR+xSfE2gQWYGZlo15Usy1PVx5n4gd5wDmmI+TAS
 S487CyURyzNqbjtHni//2a//ldqQ1VBaKc13sVluFMQESIiOivtuF1pV7
 ZdUG2dO+jTkbZczg+P2WOnxoToarmQNyCsymBhEGWfsUewDOnzFjjwB3p
 bvhZVW98R2hAQmFaQGBKXc/nMaKHcLCzcRDC6IPfDDjjZ28Q2UmYbDHE5
 M8FhvZcB3dhuVinUXzZ6nbojRweCnFQx1PwBQ1zQLuI2Fy3hxH44p0YM/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="336544335"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="336544335"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 01:12:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10733"; a="956122146"
X-IronPort-AV: E=Sophos;i="6.00,223,1681196400"; d="scan'208";a="956122146"
Received: from nnesher-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.57.222])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 01:12:18 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v9 8/8] drm: Remove usage of deprecated DRM_DEBUG_KMS
In-Reply-To: <20230607035351.GD14101@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1686047727.git.code@siddh.me>
 <35bd95856a69f141640c27ea2b5e4073275032f7.1686047727.git.code@siddh.me>
 <20230606150419.GI5197@pendragon.ideasonboard.com>
 <87mt1ctgm7.fsf@intel.com>
 <20230607035351.GD14101@pendragon.ideasonboard.com>
Date: Wed, 07 Jun 2023 11:12:16 +0300
Message-ID: <87jzwfu1wf.fsf@intel.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Siddh Raman Pant <code@siddh.me>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 07 Jun 2023, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> Hi Jani,
>
> On Wed, Jun 07, 2023 at 12:39:44AM +0300, Jani Nikula wrote:
>> On Tue, 06 Jun 2023, Laurent Pinchart wrote:
>> > On Tue, Jun 06, 2023 at 04:15:22PM +0530, Siddh Raman Pant wrote:
>> >> @@ -777,7 +793,7 @@ int drm_client_modeset_probe(struct drm_client_dev *client, unsigned int width,
>> >>  	int i, ret = 0;
>> >>  	bool *enabled;
>> >>  
>> >> -	DRM_DEBUG_KMS("\n");
>> >> +	drm_dbg_kms(dev, "\n");
>> >
>> > This message is pretty useless, it could be dropped on top of this
>> > series.
>> 
>> They do debug log the function being called.
>
> I overlooked the fact that ___drm_dbg() prints the caller's function
> name using __builtin_return_address(). It thus has marginally more value
> than I thought. Still, function tracing is best performed with ftrace().

I'm not going to argue this one too much, but it can be quite a step
getting a random bug reporter from providing dmesgs to running ftrace.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
