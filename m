Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2867B4E51FC
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 13:14:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43D210E6BE;
	Wed, 23 Mar 2022 12:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A95A410E6BA;
 Wed, 23 Mar 2022 12:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648037675; x=1679573675;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=u57QIKJsUZ+Vm/BfhacIjRGxQS0VFp1A/d/pDoDwK4k=;
 b=VY+uberZnELDWpNXw0bTroKjUjCBceKFI089BhJLBRWKQyPO4fJ1spSt
 VjEnURogd7LQiaPV7Z7prmZhC4WKNT9szsKKBXsaovUxN5/qLjJWYsBrY
 LBI8kGWtgmZTLD/LEDH/FWgWqq47iwtNfinpGHcAJvql+/pLJ7jbjct8M
 pD1RRR6pT0IVbxI6KA7Pnv5lng1q9aT6eMcxtxU+TaK+dOSx3MM2th7eC
 mkX3Z9hFvpyRsThtfPTYfTnwA5H5afTNEJJ89GqQSmvRRNZ0fnE3YEep+
 TqGhSTBua37A+cOHPnjImNelz+K+PqV6zhD9j02umNmSa6R9UE9C/XnNP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="257809406"
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="257809406"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 05:14:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,204,1643702400"; d="scan'208";a="519338124"
Received: from caliyanx-mobl.gar.corp.intel.com (HELO localhost)
 ([10.252.57.47])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 05:14:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [v8 3/5] drm/edid: read HF-EEODB ext block
In-Reply-To: <v5n3uG2NAQA-QZycdMslyq4R7fW8xPTlrIsDkPubuVyx5tf_VG_YZp_GHylatC_-fTg01rR8sZtbHcGSzqdho8YZyuKDihIX-jJ4CGAgems=@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220317124202.14189-1-shawn.c.lee@intel.com>
 <20220317124202.14189-4-shawn.c.lee@intel.com> <8735j9j7vd.fsf@intel.com>
 <87tuboj2rl.fsf@intel.com>
 <v5n3uG2NAQA-QZycdMslyq4R7fW8xPTlrIsDkPubuVyx5tf_VG_YZp_GHylatC_-fTg01rR8sZtbHcGSzqdho8YZyuKDihIX-jJ4CGAgems=@emersion.fr>
Date: Wed, 23 Mar 2022 14:14:29 +0200
Message-ID: <87o81wj26y.fsf@intel.com>
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
Cc: cooper.chiou@intel.com, william.tseng@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ankit.k.nautiyal@intel.com, Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 23 Mar 2022, Simon Ser <contact@emersion.fr> wrote:
> On Wednesday, March 23rd, 2022 at 13:02, Jani Nikula <jani.nikula@intel.com> wrote:
>
>> Simon and Daniel also tell me on IRC we can't just modify the base block
>> extension count to match HF-EEODB to dodge the problem, because the EDID
>> gets exposed to userspace.
>
> I'm not familiar how the EDID blob gets exposed to user-space. If the
> EDID data gets copied when creating the blob, and the blob is created
> before the kernel mutates the EDID to accomodate for HF-EEODB, then
> this proposal might still be workable.

You'd still end up with tracking separate copies of the EDID, which is
not necessarily easier. There are almost 70 calls to update the
connector EDID property that gets exposed to userspace, and the call
sites would need to know which copy to pass.

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
