Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF5492B4D0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 12:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CDE10E4E1;
	Tue,  9 Jul 2024 10:10:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QbRw6unN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37310E4E6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720519816; x=1752055816;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=aJOfIDatk3vEMdHF2A2FfLbUH1bI23Rmm2FvHwmD1J8=;
 b=QbRw6unNCtMYNvl59uTfCHlsCsrZJ8OBw7Kx2nuzw9qeR8i4TkvfkB/t
 qz1kQsFX01aLX3cfi3HwEEdnPlb1vleLy+EZOcv6ib7rYT2HUFjX18M3B
 /Rv5zK2NwmL5CYLTN3XFbU+gWG3Ze+WEixEOA7Z0tcWR790oOAVDWVWZ6
 gEXgRxh2k00W/GmR74escroNIy3AjXLBNHhiSirnX0UtnjDXxCj6CVSq5
 ogq/a+gTYMwiodSUhdNlliWj7GT7Xn/oM4qlJOjoN5N4KAvUgKXc1t3Wn
 7cVxrYy0hKDW1cvLncGoQFh5bRNoOKUkXZsw6cy4IYzsA8qdbmk1Jk0Pm A==;
X-CSE-ConnectionGUID: 5nVgS5NfQMePzM0U07N5wA==
X-CSE-MsgGUID: VgqaTRtTTAuqjiZbvR8Jhw==
X-IronPort-AV: E=McAfee;i="6700,10204,11127"; a="17581038"
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="17581038"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 03:10:10 -0700
X-CSE-ConnectionGUID: fG2qZg3TRm+mflpFiR6edA==
X-CSE-MsgGUID: uiux1DIKTHmbdKxyz9w0dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; d="scan'208";a="78538860"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.246.19.58])
 ([10.246.19.58])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2024 03:10:06 -0700
Message-ID: <73a245d2-2e12-476a-b22a-cc11bdcecef0@linux.intel.com>
Date: Tue, 9 Jul 2024 12:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/ivpu: Add missing MODULE_FIRMWARE metadata
To: "Alexander F. Lent" <lx@xanderlent.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Andrzej Kacprowski <andrzej.kacprowski@linux.intel.com>,
 Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240708-fix-ivpu-firmware-metadata-v2-1-78b953172026@xanderlent.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240708-fix-ivpu-firmware-metadata-v2-1-78b953172026@xanderlent.com>
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

Just two more comments and we are good to go.

On 09.07.2024 02:25, Alexander F. Lent wrote:
> +/* Add module metadata for the production firmware paths.
> + * This needs to be kept in sync with fw_names above.
> + */
I would prefer: 
/* Production fw_names from the table above */

> +MODULE_FIRMWARE("intel/vpu/vpu_37xx_v0.0.bin");
> +MODULE_FIRMWARE("intel/vpu/vpu_37xx_v0.0.bin");
You probably meant *40xx*.

Regards,
Jacek
