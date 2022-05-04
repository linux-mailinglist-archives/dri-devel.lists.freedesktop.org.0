Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610BF51994E
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CECD10F4FD;
	Wed,  4 May 2022 08:10:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDB410F502;
 Wed,  4 May 2022 08:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651651809; x=1683187809;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=U7Dh3mmr6w+jLjSfpg4/LN+4HdQEQo6xw6oSKDldwjY=;
 b=RNHUDYcarZ5HbylZWB8qpizd2GLc8PkrjdO9gwfJtqVWaY6y2d3/2IPE
 Qun6ISUP4DORNdXUwec3HyEKNXOmKQE/SY3rSkQHV8cGLlPtLcYGttndi
 f7g0W5LP5fx9DmTr6IMVcKtHPkBJMIfFLKr2+gldoAt1L7B6QgJMK6HUv
 NSBU6QZaIFWRa1NKStTPkm/z9UEvq2mFlgBD3TPkN9mIUJlVmmZBVcU0U
 HipFnbw+9cafNtto9slQw96m/lGRmJoiRFuwyEDNKMTsW/FpMPsrKfkjA
 9waGr3A71GbmkYoZ7NUnz9or44SkEvaa9i8SeBINv20LkESzr4/10oYng g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="249677759"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="249677759"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:10:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="693524926"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:10:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 00/20] drm/edid: CEA data block iterators, and more
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1651569697.git.jani.nikula@intel.com>
Date: Wed, 04 May 2022 11:10:04 +0300
Message-ID: <87h765n2g3.fsf@intel.com>
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

On Tue, 03 May 2022, Jani Nikula <jani.nikula@intel.com> wrote:
> I've kind of lost track of the version numbers on some of the iterator
> patches, but this is the next version (or mostly a resend) of
> [1]. There's an additional rename patch for SCDS.

Argh, forgot to send this series to dri-devel. Instead of sending the
series yet another time, I bounced each message to dri-devel, and at
least the archive indicates it worked fine. Fingers crossed.

BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
