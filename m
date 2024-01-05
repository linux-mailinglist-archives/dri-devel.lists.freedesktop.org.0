Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F4D8258C3
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 18:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1592510E652;
	Fri,  5 Jan 2024 17:01:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 785DE10E652
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 17:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704474114; x=1736010114;
 h=from:to:subject:in-reply-to:references:date:message-id:
 mime-version; bh=Lf96KfrIZDfGH4piwj6gVCnkNaNDww/MpVnGXVYAXCg=;
 b=El/Bhrz/Y7m4VNmSPG202O23lJfIwB6x5NHBl35G//Bx68qvzZljOcAf
 yFU4iN0Adp6CVXS74MoSZxFSjIJaq3smObF4Ua7UmbzfpGs9DGZWNVAAY
 5lxRxdJddt8IwnKCN5kfmefVNnnabrNCjwMjUQjr4LtggyejYVFkpr2sc
 8x1R9oqTYfxGtgtUtMP1iqHTsl27X+7d3+bfvSRL7zPY0+P4faBaKmcDi
 IEIkHw9pffLXoNXQe2LO4sSHaqs3sjyBGf8oaWsL7TRV30mQgy/FCKpRh
 mwRvOoxX7NOl9agLTyW07B4uomjM/cKHgaigrINwo5dx8W4Ji6RJjDuxm w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="16156000"
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="16156000"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 09:01:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,334,1695711600"; d="scan'208";a="29165049"
Received: from amaslenx-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.36.106])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 09:01:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/probe-helper: convert
 drm_connector_helper_get_modes_from_ddc() to struct drm_edid
In-Reply-To: <54a3c4bc-b013-4096-ab59-b163c4984618@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231114105815.4188901-1-jani.nikula@intel.com>
 <54a3c4bc-b013-4096-ab59-b163c4984618@suse.de>
Date: Fri, 05 Jan 2024 19:01:48 +0200
Message-ID: <87edevyarn.fsf@intel.com>
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

On Tue, 14 Nov 2023, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> If I'm not mistaken, the correct pattern is to read the EDID block in 
> the detect callback and only parse it for modes in get_modes. If so, you 
> might also inline this helper into its only caller in mgag200. I'll 
> later split it up into detect and get_modes.

Never merged this, so I sent your suggested alternative instead [1].

BR,
Jani.

[1] https://patchwork.freedesktop.org/series/128269/


-- 
Jani Nikula, Intel
