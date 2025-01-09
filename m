Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E59A06FCA
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 09:14:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5904010ED1A;
	Thu,  9 Jan 2025 08:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aELf8a9t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C160D10ED1A
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 08:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736410459; x=1767946459;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OhNiCWllDtUWcKxJST1KwJzFGZsWobW6flcFNa74q0M=;
 b=aELf8a9tsk23hPTGzcQDq4+bdXs+jUwF+Q5XYg/GzxMK/077zffDlvsX
 g7b6IXPE6jMPFJ2Ll2ATu3+dc4983/xXL4WT4TELh+aE0mPrTmB+en+fG
 Zre3G9ylFjkAawYWyL5mGsLc62avP4Rgelw7QJI4ZWwW3WwHZ1fkl9CT2
 lLsns/lJtaKUM54RbV8B36A8Ezvt6K4sCBJVcFNTWgUMZcTMGW36W9TN3
 KClFLEFOR2XXS2waXF0PExWn6YeUTgMJxfrzdAwmOVqgUQA6CsbX3HSO+
 xjJYdaI3k7gr9LmniUdtb/CiV+87W0Db8wD8Sz7ypExz9e5EvUdSYXgO/ g==;
X-CSE-ConnectionGUID: CGeOPSn5Ry6TK+eo+WuESg==
X-CSE-MsgGUID: LpZmd56CRLq0HWTL70aCDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="47233889"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="47233889"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:14:19 -0800
X-CSE-ConnectionGUID: dlTtGNrzTVG8KIHlzcO8KQ==
X-CSE-MsgGUID: 4oMkXkXqRGedbiXRSydyfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="103304042"
Received: from mgorski-mobl1.ger.corp.intel.com (HELO [10.245.84.116])
 ([10.245.84.116])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 00:14:18 -0800
Message-ID: <9f4fcc55-ec00-46f5-867e-b495c8ac99b2@linux.intel.com>
Date: Thu, 9 Jan 2025 09:14:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] accel/ivpu: Changes for 6.14
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, oded.gabbay@gmail.com,
 quic_jhugo@quicinc.com
References: <20250107173238.381120-1-maciej.falkowski@linux.intel.com>
 <Z37BxlgEqnpwkt0A@phenom.ffwll.local>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Z37BxlgEqnpwkt0A@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi,

On 1/8/2025 7:19 PM, Simona Vetter wrote:
> On Tue, Jan 07, 2025 at 06:32:23PM +0100, Maciej Falkowski wrote:
>> This patchset contains latest changes for Intel NPU driver
>> including enabling HWS by default, adding memory utilization,
>> MMU optimizations, and others.
> 
> Note that we generally cut feauture merges around -rc6 for drm subtrees,
> so this is cutting it awfully close. But I guess should be ok because big
> holidays and all that. In general would be better to send patches as you
> go instead of a big dump before the next merge window.
> -Sima

Yeah, sorry about this. We had a 3 week delay due to holidays.
We will try to post patches weekly this year.

Regards,
Jacek
