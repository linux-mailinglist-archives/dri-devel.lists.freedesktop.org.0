Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 562BD8547AF
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 12:02:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A21C10E217;
	Wed, 14 Feb 2024 11:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZJRhovYG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C015D10E200;
 Wed, 14 Feb 2024 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707908514; x=1739444514;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=2oQW5Nm6qeov20SsW8p+m90TU5srcqBVn5qob69I23U=;
 b=ZJRhovYGgvsBXINT4SFTcMvboScaQH8CukqQW9h7U1p04/IGznEfxpiQ
 tjeXWYb8k4+qbztYqMwVFmS6pDr53EZE0F+fJVhMVXbsVoOS8Kht83KBo
 IhqPBRYtSRKyjpeBmt3Jcm4NSREov3/2lMxm0KWBuCjmioApDNPHA4pOR
 97t8PTntt1bOyqHW7kvorucEdS2g91IdyGqqaQsLA/wGrNI9/j3bfBoAd
 0x0jgbOYMJoVp5ju6+xZxpsL5h0eaVBOZqtN64u5GeBXNJQfhAMVCYdvy
 8Trg2AJAa31KJ7Fot1UnCo5Fpv5dWLnt0c1etPazOKR0t9Xs2iNSTD4EY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="1824673"
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; 
   d="scan'208";a="1824673"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,159,1705392000"; d="scan'208";a="26314489"
Received: from kwszolek-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.190])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2024 03:01:48 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Oded
 Gabbay <ogabbay@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dim-tools@lists.freedesktop.org
Subject: Re: [PULL] drm-intel-next
In-Reply-To: <87cyt8cxsh.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <87cyt8cxsh.fsf@intel.com>
Date: Wed, 14 Feb 2024 13:01:45 +0200
Message-ID: <87o7cj71ie.fsf@intel.com>
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

On Wed, 07 Feb 2024, Jani Nikula <jani.nikula@intel.com> wrote:
> Hi Dave & Sima -
>
> drm-intel-next-2024-02-07:
> drm/i915 feature pull for v6.9:

Ping, this hasn't been merged yet.

BR,
Jani.

-- 
Jani Nikula, Intel
