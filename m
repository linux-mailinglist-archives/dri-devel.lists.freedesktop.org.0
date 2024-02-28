Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4924E86B2E5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Feb 2024 16:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB4510E1AC;
	Wed, 28 Feb 2024 15:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gzPuJk+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55E3C10E191;
 Wed, 28 Feb 2024 15:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709133313; x=1740669313;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=WAxObAqakeLGzwhrqHs1ZAj+fUUXuHCeGTVZ4Ijiuxw=;
 b=gzPuJk+jh6hhBOgWklnnYV4i3735Pe3debUjWxBqB6rxxZ7F4sW5OEPn
 qAaatcwrtR6TwJQlA6Jc9J09Qat2zRTE0FD3CN25cT1OcUAFZiNgMD10C
 kF5o4DrvQa4TSl7CKZMeNrc5fhYUcys4++IDAlb6BHztwTlZrmqsNfGEY
 7c7QbdwQlKZvvB6A79flWa7WmDVX6creeuA9ey3Y1ukA7xUdlkSRlvCnO
 xOERCu4hZeQFTAPHuYSlg6RNMVXpvH9K6XtjGUgV+wuwSnIsx66s6vZqI
 7CgAcZJxsRH1jG3bH3Gdf5fLYEsIqn06PRS/Vo6ZSd6gHhw0RLwfDvDtu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="3401555"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="3401555"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 07:15:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="7890500"
Received: from tmelzer-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.32.33])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2024 07:15:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, ankit.k.nautiyal@intel.com, Mitul
 Golani <mitulkumar.ajitkumar.golani@intel.com>
Subject: Re: [PATCH v12 0/8] Enable Adaptive Sync SDP Support for DP
In-Reply-To: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240228143823.2762595-1-mitulkumar.ajitkumar.golani@intel.com>
Date: Wed, 28 Feb 2024 17:14:58 +0200
Message-ID: <87wmqo8vt9.fsf@intel.com>
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

On Wed, 28 Feb 2024, Mitul Golani <mitulkumar.ajitkumar.golani@intel.com> wrote:
> -v12:
> - Update cover letter

Did you just send the entire series again within 30 minutes just to
update the cover letter? You could've just replied to the cover
letter...

BR,
Jani.

-- 
Jani Nikula, Intel
