Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A21845B16
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 16:16:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CEEA10EF28;
	Thu,  1 Feb 2024 15:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLbVQuJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7335C10EF36;
 Thu,  1 Feb 2024 15:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706800582; x=1738336582;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=A316KNzrAV6T6rXy7TU0QVcJJI2i/GiKTSFrMmqOl2Y=;
 b=FLbVQuJcpHF6Ef3NbuAjFjyJydEe6rb1OtOOLw7kYqnwfpFYUsBY3ZaY
 EtmooMTKP7lnVklx7xUdLRVNPv5Pq5LU82guwgOjDo85elfgX6E3suQHV
 +fMgBt7OFYPPcybLkf3Vqt5BcJLLbES+8koteupohQdls2T1bRuHTimkl
 IlvZhGc0a9dsJyjJzRg1HrcnN5BSkixKIgn//ry1RVDwbAJYfYNurpPee
 wc0VloTHdyu2PDvZSLgxU7zOs2ho4HQnNxCs/DwMLm7GIKmbVKdwMnAJQ
 ulUEcfdIWfoFMzpP2uJM5OZ543oAiMG90Aa9xocQdSjfYB8/yB8ce9ygz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="17303332"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="17303332"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:16:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="37216882"
Received: from unknown (HELO localhost) ([10.237.66.162])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 07:16:13 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Paz Zcharya <pazz@chromium.org>
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>, Luca Coelho
 <luciano.coelho@intel.com>, Subrata Banik <subratabanik@google.com>,
 Manasi Navare <navaremanasi@chromium.org>, Drew Davenport
 <ddavenport@chromium.org>, Sean Paul <seanpaul@chromium.org>, Marcin
 Wojtas <mwojtas@chromium.org>, khaled.almahallawy@intel.com,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915/display: Include debugfs.h in
 intel_display_debugfs_params.c
In-Reply-To: <ZbuxsF7ubmL6lzdR@google.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240131204658.795278-1-pazz@chromium.org>
 <87o7d0h73r.fsf@intel.com> <ZbuxsF7ubmL6lzdR@google.com>
Date: Thu, 01 Feb 2024 17:16:10 +0200
Message-ID: <87v878fc5h.fsf@intel.com>
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

On Thu, 01 Feb 2024, Paz Zcharya <pazz@chromium.org> wrote:
> Thank you so much for the super prompt reply!

FYI, looks like we've got some hiccup in CI, will merge after we get
results.

BR,
Jani.


-- 
Jani Nikula, Intel
