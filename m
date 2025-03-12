Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8D5A5D98A
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 10:34:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A5510E750;
	Wed, 12 Mar 2025 09:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aJP4r0Qj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F03F10E744
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 09:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741772090; x=1773308090;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=sxeSq7DARLje9UuKWZjona4rNmtHMjZR+LVlnGPftZA=;
 b=aJP4r0Qj0eJ5jlXdp66ytulFAzIvax5kR//X/TxtHCQivTdXqwOzjb74
 S9e2jPLMuIY28dF5b84u7CWZgcgSHHOiQ7RAXz6ez3w6NWApvPZ6xqrMd
 srtnQHJfMB7Z3qxMt4jdfdNfbsu9rdn0nWXGEKHYSCtdGa/AlyNDQwTMS
 eFBXK1UDte39t4+0qoFD4xzabHFqSNIGmiNrVOsHBTa+sION7zhMFQhmi
 54/BOs77ExFCbjeqerQq5k7Uon12AZpqBsvFlQwZt9Fd+zFW0TI9WxzwT
 2j720tLnZEk1XB40r6cU2zqu2GQ4TJoNkfw35Sp/cLLiKsidWf4jzzwgj g==;
X-CSE-ConnectionGUID: tkr4V1heQcGIKrMH5UEkPw==
X-CSE-MsgGUID: zCuUWoxLS3K1vPmEz4otzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="46623922"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="46623922"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:34:50 -0700
X-CSE-ConnectionGUID: Bp/rXOZ7QwesnFy/i3bkNg==
X-CSE-MsgGUID: 4oiua/KRTiOtZ3Qz8jcjTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="125617858"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:34:47 -0700
Date: Wed, 12 Mar 2025 11:34:43 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, kernel-dev@igalia.com,
 stable@vger.kernel.org, Emma Anholt <emma@anholt.net>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: Re: [PATCH v3 0/7] drm/v3d: Fix GPU reset issues on the Raspberry Pi 5
Message-ID: <Z9FVMyP_t_fNndm0@black.fi.intel.com>
References: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250311-v3d-gpu-reset-fixes-v3-0-64f7a4247ec0@igalia.com>
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

On Tue, Mar 11, 2025 at 03:13:42PM -0300, Maíra Canal wrote:
> This series addresses GPU reset issues reported in [1], where running a
> long compute job would trigger repeated GPU resets, leading to a UI
> freeze.
> 
> Patches #1 and #2 prevent the same faulty job from being resubmitted in a
> loop, mitigating the first cause of the issue.
> 
> However, the issue isn't entirely solved. Even with only a single GPU
> reset, the UI still freezes on the Raspberry Pi 5, indicating a GPU hang.
> Patches #3 to #6 address this by properly configuring the V3D_SMS
> registers, which are required for power management and resets in V3D 7.1.

Not sure how much it helps your case, but still leaving it here in case it
turns out to be useful here. It's already in -next and trending 6.15 merge.

https://patchwork.freedesktop.org/series/138070/

Raag
