Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8DEA1C536
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 22:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E67B810E0B8;
	Sat, 25 Jan 2025 21:00:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eeTLqWE4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A9E10E0B8
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jan 2025 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737838829; x=1769374829;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=w38M3xFduFl92Dwbku2VjcMj2Y64tDFjmvRdCM65bRw=;
 b=eeTLqWE4Qo0QgDx+LqmoxrsOPnfHg/1k9eS5JrzZRaRpy/MwbOAPGX7N
 7Qm/ddpdW3Br2e4A+XYOyedST7MmIoYSQF7w0RjiJevqPMnYeQIxhVJyh
 4Qa7les/4BAa7JL7TitwUdU4yNgyqugkkbbXmuRYboPaxEcOP0UtEQFv1
 4N355E1kJL8d3K0onJgGP/AAy+Qn+yG+BOcGGLqHFUULpR2vfjsdCWVu2
 jV/bdeC3LLgm/gvbFlAGy+2JKoK+l3gGZMHjXS1E4RXe2MvUitLPmcb1z
 Uc9ZnRARXQQn3pkSo3uCqo6/pRHpL0k/ljE9aQ48ooDfUFITKsFLc5XdD A==;
X-CSE-ConnectionGUID: JsbkIh/zRSu9XK90jLRzfw==
X-CSE-MsgGUID: X6nZaT81S/uvE+SOqujC/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="48936413"
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; d="scan'208";a="48936413"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2025 13:00:28 -0800
X-CSE-ConnectionGUID: XW8tmLwHRcKMgJq5yGngPQ==
X-CSE-MsgGUID: UDug9DFZSbqulYNmD31BnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,235,1732608000"; d="scan'208";a="138930210"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2025 13:00:28 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org,
	Gustavo Sousa <gustavo.sousa@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Simona Vetter <simona@ffwll.ch>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH] drm/print: Include drm_device.h
Date: Sat, 25 Jan 2025 13:00:06 -0800
Message-ID: <173783869267.2491684.5867603319107748289.b4-ty@intel.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250121210935.84357-1-gustavo.sousa@intel.com>
References: <20250121210935.84357-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Tue, 21 Jan 2025 18:09:25 -0300, Gustavo Sousa wrote:
> The header drm_print.h uses members of struct drm_device pointers, as
> such, it should include drm_device.h to let the compiler know the full
> type definition.
> 
> Without such include, users of drm_print.h that don't explicitly need
> drm_device.h would bump into build errors and be forced to include the
> latter.
> 
> [...]

Applied to drm-misc-fixes, thanks!

[1/1] drm/print: Include drm_device.h
      commit: e0f63bc68f59d281e2d06e596f6c1bd9382a15cd

Best regards,
-- 
Lucas De Marchi <lucas.demarchi@intel.com>
