Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD8BA2560D
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 10:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824D610E459;
	Mon,  3 Feb 2025 09:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HXuVE+y1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A311310E459
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 09:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738575755; x=1770111755;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=19SWEe1RQN7GHj5gefbAzDxCzGkQIurEvP6+575NrSQ=;
 b=HXuVE+y10x4iWGVG0VNLTEipEuVPayJVF7g6sh3KeE20KDZCmwsOBfmb
 79WcUoojxlumxvyH4I46EKHfbLv6aiMAxmJ3SOIZioIKO0fzS2Ct74TBQ
 Ckp+RDnTijw1mZ5PKGtqJl/vhm3698apeCm3SUKoNJXQuRkGWq8GoI9Fb
 t07j8GTf19X7uG/+JPpLjo3tJPNY1Vb1VcrSpQ7HdOGwfPZQPupXzum/O
 9LsSua+k7Tp6Kp4n82F/fVZGgHFEG2IMseDYlhHbn/Ju0pMg1dQhRBeV5
 Vee4o/wg+hp4Cc/qCBmSOt+Z69c3C5bX6tyZwkxXnhLWTt0o5cTAnjLnz g==;
X-CSE-ConnectionGUID: tj6LwbHkQEmcrwIIZHADPQ==
X-CSE-MsgGUID: 9sQ1kqZkREGl/xoCXxtcmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39161732"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39161732"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:42:34 -0800
X-CSE-ConnectionGUID: Gyx7v5taRGiaLWVfdMQgkw==
X-CSE-MsgGUID: GY5GMsOoQaaXGDwAMw8hrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="133495808"
Received: from jbolejkx-mobl.ger.corp.intel.com (HELO [10.245.114.74])
 ([10.245.114.74])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 01:42:33 -0800
Message-ID: <a6444538-0b20-48e9-843e-4a1fffc9f824@linux.intel.com>
Date: Mon, 3 Feb 2025 10:42:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] accel/ivpu: Changes for 6.15
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 maciej.falkowski@linux.intel.com
References: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20250129125636.1047413-1-jacek.lawrynowicz@linux.intel.com>
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

Applied to drm-misc-next

On 1/29/2025 1:56 PM, Jacek Lawrynowicz wrote:
> Most notable is the addition of hardware fault injection support which allows
> to test error handling paths in the driver.
> 
> Jacek Lawrynowicz (2):
>   accel/ivpu: Add support for hardware fault injection
>   accel/ivpu: Update last_busy in IRQ handler
> 
> Karol Wachowski (3):
>   accel/ivpu: Fix missing MMU events if file_priv is unbound
>   accel/ivpu: Turn on HWS by default on all platforms
>   accel/ivpu: Move recovery work to system_unbound_wq
> 
> Tomasz Rusinowicz (1):
>   accel/ivpu: Enable recovery and adjust timeouts for fpga
> 
>  drivers/accel/ivpu/ivpu_debugfs.c   |  5 +++
>  drivers/accel/ivpu/ivpu_fw.c        | 10 +----
>  drivers/accel/ivpu/ivpu_hw.c        | 33 +++++++++++----
>  drivers/accel/ivpu/ivpu_hw_ip.c     |  4 +-
>  drivers/accel/ivpu/ivpu_hw_reg_io.h | 64 +++++++++++++++++------------
>  drivers/accel/ivpu/ivpu_job.c       |  8 +++-
>  drivers/accel/ivpu/ivpu_pm.c        |  7 +---
>  7 files changed, 78 insertions(+), 53 deletions(-)
> 
> --
> 2.45.1

