Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EADA5B2F821
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 14:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546A210E96B;
	Thu, 21 Aug 2025 12:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F4mELOpC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85DD10E96B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 12:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755779713; x=1787315713;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=DGvtspg+o3hfUEstMz0E2+Cnk1KXwX8hkIEwnGjIn7k=;
 b=F4mELOpCmdDMtPhVvAb/UzuZDYEl+pqHbuXtT5iczIR64pu+xXePVtAM
 mx3lazEOR0a9Twe7JJ+JR/RPX9Hh3JcWYCez71WglkPJm/5yqJsPBHVnN
 D6+l9/fSiLH0VQHqOjFs1t4uEx5THFAHTz0VxZQfi8tXcXUwXSkvcYVJX
 QwFelGV1fTqg7zkuoV71nh6XvdA7D0vPVN5zCFkcHRghGgqtsNmg3T5kj
 3mzJ4Kus69SzDTqUWjTh9Tz/A2EjUV4uokELwEhWYDt1QN6KVJd9w3n47
 GFeznt3iQ3V7IqDgsDnAkDtKCQR3qtFwv/NJmWwUJUj+LdmVAWaGduYxX g==;
X-CSE-ConnectionGUID: smGwGoRHRy6PCQ9erTsXQw==
X-CSE-MsgGUID: p5vhAwwFSVe4f7bMdUaJfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="80664173"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="80664173"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 05:35:12 -0700
X-CSE-ConnectionGUID: LBW8nRnRQyym4I4hZR4PSg==
X-CSE-MsgGUID: R8EN2j4AQj2jVZVb6lceMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; d="scan'208";a="192082428"
Received: from mfalkows-mobl.ger.corp.intel.com (HELO [10.245.121.109])
 ([10.245.121.109])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2025 05:35:10 -0700
Message-ID: <d1b744c9-0f2d-4ff8-832f-209167cb940b@linux.intel.com>
Date: Thu, 21 Aug 2025 14:35:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: accel: amdxdna: Update compiler information
To: Lizhi Hou <lizhi.hou@amd.com>, ogabbay@kernel.org,
 quic_jhugo@quicinc.com, jacek.lawrynowicz@linux.intel.com,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, max.zhen@amd.com, sonal.santan@amd.com,
 mario.limonciello@amd.com
References: <20250820233817.4050006-1-lizhi.hou@amd.com>
Content-Language: en-US
From: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>
In-Reply-To: <20250820233817.4050006-1-lizhi.hou@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>

On 8/21/2025 1:38 AM, Lizhi Hou wrote:
> The compiler information is outdated. Update it to the latest.
>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> ---
>   Documentation/accel/amdxdna/amdnpu.rst | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/accel/amdxdna/amdnpu.rst b/Documentation/accel/amdxdna/amdnpu.rst
> index fbe0a7585345..42e54904f9a8 100644
> --- a/Documentation/accel/amdxdna/amdnpu.rst
> +++ b/Documentation/accel/amdxdna/amdnpu.rst
> @@ -223,13 +223,13 @@ Userspace components
>   Compiler
>   --------
>   
> -Peano is an LLVM based open-source compiler for AMD XDNA Array compute tile
> -available at:
> +Peano is an LLVM based open-source single core compiler for AMD XDNA Array
> +compute tile. Peano is available at:
>   https://github.com/Xilinx/llvm-aie
>   
> -The open-source IREE compiler supports graph compilation of ML models for AMD
> -NPU and uses Peano underneath. It is available at:
> -https://github.com/nod-ai/iree-amd-aie
> +IRON is an open-source array compiler for AMD XDNA Array based NPU which uses
> +Peano underneath. IRON is available at:
> +https://github.com/Xilinx/mlir-aie
>   
>   Usermode Driver (UMD)
>   ---------------------
