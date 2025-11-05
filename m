Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE809C35A15
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:25:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC21D10E71D;
	Wed,  5 Nov 2025 12:24:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GDuIGQZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46FD510E71D;
 Wed,  5 Nov 2025 12:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345478; x=1793881478;
 h=from:to:cc:in-reply-to:references:subject:message-id:
 date:mime-version:content-transfer-encoding;
 bh=0B1jhChxD6ZKpJ6Tuobc4Zvkfa6EY5vmp0IHl/3uNNo=;
 b=GDuIGQZVCwCW4gKpiwvURHFO7ZX0ugDnn9mRu2Xz/yBq9rlM2iZZMSo9
 lCtZ3QcA3Fbz36bE4yv4Y8iIwWSyXDv/QKgCjHN2MQ8E9FSUd5iXKeSs3
 D/uBz4ndO4yX2vSuVczstpO8JPHXFR3CRTYIb0vTgr0it3WEOrZ5pcfZa
 YHH+CnpLGyn9wrBW0FCdANW4LfHZyBteSNadBhEzHuLPu6QaOCgW7N1ab
 2JawefR4QowJYYJyzeLgsQBXzN1nVJgnnzfUNhG2Oxtbhwv+s4uLCbvjm
 gXujSCq/fSgCAgiWg/ki7imXluVvcxCCA0I0iOkfXXymsUk7n6AdWUGqo Q==;
X-CSE-ConnectionGUID: +3NOCuALSWOziZUiXKgdjg==
X-CSE-MsgGUID: 9sf4XVHjRPeKwi/21pgyuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="75906385"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="75906385"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:24:38 -0800
X-CSE-ConnectionGUID: hrEdSF8sSEOfh4uQ5YiACw==
X-CSE-MsgGUID: Y8SSPBRqR+KSkimI4DZj/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="192610893"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.252])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:24:34 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Alex Deucher <alexander.deucher@amd.com>, 
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Perry Yuan <perry.yuan@amd.com>, Antheas Kapenekakis <lkml@antheas.dev>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
In-Reply-To: <20251024152152.3981721-1-lkml@antheas.dev>
References: <20251024152152.3981721-1-lkml@antheas.dev>
Subject: Re: [PATCH v1 0/3] platform/x86/amd: Add S0ix support to the Xbox Ally
Message-Id: <176234546849.15175.7746615027448740430.b4-ty@linux.intel.com>
Date: Wed, 05 Nov 2025 14:24:28 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Fri, 24 Oct 2025 17:21:49 +0200, Antheas Kapenekakis wrote:

> The Xbox Ally features a Van Gogh SoC that on the Steam Deck uses S3.
> Therefore, kernel support for S0ix was previously absent. Introduce
> this support in three patches:
> 
> 1) Add Van Gogh to AMD PMC driver
> 2) Enable spurious_8042 quirk, as it is common in those generations
> 3) Adjust the Van Gogh init logic to avoid powering down the rlc
>    and tweak post init
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo-fixes branch. Note it will show up in the public
platform-drivers-x86/review-ilpo-fixes branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/3] platform/x86/amd/pmc: Add support for Van Gogh SoC
      commit: a400f448c1ad5e22e7ec1700e911f8f9c6a85475
[2/3] platform/x86/amd/pmc: Add spurious_8042 to Xbox Ally
      commit: 50cb52ee1dd60247746a984392632ec4237df127
[3/3] drm/amdgpu: only send the SMU RLC notification on S3
      (no commit info)

--
 i.

