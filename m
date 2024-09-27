Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7681398841E
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 14:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45BA10E34E;
	Fri, 27 Sep 2024 12:23:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W1E3rqj5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05F610E34E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 12:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727439801; x=1758975801;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=SANPrl4NCz9Epccn+GEvKYnioOSzJor+XhSApLKdQXc=;
 b=W1E3rqj5Bt0Ant8HC8GFDyuiHzykxlZ/riyCpK9oYUXKhZharThm67K0
 ym/jfJGCoa5VSyaFkRtTKRru82omfFpmznLd1weSMHRYQiOAZWdd/IivH
 dWRyR9xU3zopQ/h8gZO/1RsGtt/V5/4+INGwjUWYM+z0rlDh5ZmLJx0qh
 OtkfCOD/wXhdKi0fpuUMtH/6PZPz4kF/Zu+QhZkegg6DHbjaCo/AcsCWv
 3Wp0w2DX4fZ3utFceIUJzkWkYA1HQovLHiQuUTWaGP/Ef57SS6JLvyTc7
 25Cdde7NZ+r6UHzY9X8X9k0HBp+nmwd/iOpa7bv1PtxsLJi24QBXXPNAy g==;
X-CSE-ConnectionGUID: VVRLFYMiTjiSgzz48m8PVw==
X-CSE-MsgGUID: tPcEbPUVT1yyms3LGvuhCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="26049213"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="26049213"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 05:23:20 -0700
X-CSE-ConnectionGUID: aJ9PsV9HRBCH/nmc2/u7Ug==
X-CSE-MsgGUID: HsYoT79dQaqP1xCPQfS8oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; d="scan'208";a="77355052"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.211])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 05:23:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm: Print bad EDID notices less often
In-Reply-To: <ZvaX-0wBGiHd8YHS@tassilo>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240926180150.2674763-1-ak@linux.intel.com>
 <87frplzboj.fsf@intel.com> <ZvaX-0wBGiHd8YHS@tassilo>
Date: Fri, 27 Sep 2024 15:23:11 +0300
Message-ID: <87wmixxp3k.fsf@intel.com>
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

On Fri, 27 Sep 2024, Andi Kleen <ak@linux.intel.com> wrote:
> On Fri, Sep 27, 2024 at 12:30:04PM +0300, Jani Nikula wrote:
>> On Thu, 26 Sep 2024, Andi Kleen <ak@linux.intel.com> wrote:
>> > I have an old monitor that reports a zero EDID block, which results in a
>> > warning message. This happens on every screen save cycle, and maybe in
>> > some other situations, and over time the whole kernel log gets filled
>> > with these redundant messages.
>> >
>> > Make most of these prints conditional on bad_edid_count like other verbose EDID
>> > messages.
>> 
>> Honestly I think merging this would be counter-productive to addressing
>> the issue properly.
>
> You think it's a problem on the host side, not the monitor side?

Both. :)

Having zero EDID block is an issue with the display, logging excessively
about it is an issue on the host side.

>> Please just give me the chance to look into it.
>> 
>> Is your zero EDID block the base block or an extension block?
>
> It's an extension block I believe.

Now that should be helpful in detecting display changes, and only
logging once per display. Unless you unplug and plug, but that's not so
common.

BR,
Jani.


-- 
Jani Nikula, Intel
