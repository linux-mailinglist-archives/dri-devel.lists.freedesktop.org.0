Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E70F0498308
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2DFB10E65B;
	Mon, 24 Jan 2022 15:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471A610E65B
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 15:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643036817; x=1674572817;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=ofCPm7di6Eid72wYq59S277PtXeAc9gsnnYEyZq3mhQ=;
 b=PC11ZBL6iBQSJV8Li1OZwljDM5np/z7e6OhXs9a9DikSujINe4mUYj0E
 EilUKJvFmLT9pAbB0OLv7vQXS9jUGGkvMJloD15G+bxJ95b0gNm0GHzgM
 jPOTaMuq3T/7KoKT/DdieP84+UCqIprLYP5TGc4XrFW3a6XJ5xCYlx8YU
 aCYgsVz8L0YgXzt0Bf4btYJGvM8vvodgWNGpvQANJP9iosVbd7J5Y4ZVP
 KC5wB8AsN2nItdyxCc55cyK1urvdAQw/c1R/uPbBH++Uy/cfQwEmg/gAI
 zdDiWP01xJgyDq+JuTsnMIsDQtllR54QtmQikwgUBpY3zAzRFSAixnxPt A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="243661582"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="243661582"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:06:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="534256787"
Received: from epreiss-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.23])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:06:54 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Philipp Zabel <philipp.zabel@gmail.com>
Subject: Re: [PATCH] drm/edid: improve non-desktop quirk logging
In-Reply-To: <CA+gwMccjh79W5RPGrwaAjxDDaANqgD8O7OVCDSPCYrKwgdYbaA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211213184706.5776-1-philipp.zabel@gmail.com>
 <20211228101051.317989-1-jani.nikula@intel.com>
 <CA+gwMccjh79W5RPGrwaAjxDDaANqgD8O7OVCDSPCYrKwgdYbaA@mail.gmail.com>
Date: Mon, 24 Jan 2022 17:06:41 +0200
Message-ID: <87czkh2mwu.fsf@intel.com>
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
Cc: Jakob Bornecrantz <jakob@collabora.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 23 Jan 2022, Philipp Zabel <philipp.zabel@gmail.com> wrote:
> On Tue, Dec 28, 2021 at 11:10 AM Jani Nikula <jani.nikula@intel.com> wrote:
>>
>> Improve non-desktop quirk logging if the EDID indicates non-desktop. If
>> both are set, note about redundant quirk. If there's no quirk but the
>> EDID indicates non-desktop, don't log non-desktop is set to 0.
>>
>> Cc: Philipp Zabel <philipp.zabel@gmail.com>
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>
> Thank you,
>
> Reviewed-by: Philipp Zabel <philipp.zabel@gmail.com>
> Tested-by: Philipp Zabel <philipp.zabel@gmail.com>

Thanks for the review and testing, pushed to drm-misc-next after v2 of
your HMD EDID patches.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
