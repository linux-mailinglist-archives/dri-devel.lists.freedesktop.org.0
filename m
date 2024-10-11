Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEDD99A220
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 12:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C7A10EAC2;
	Fri, 11 Oct 2024 10:56:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bfc7b9Sx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C2AA10EAC2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 10:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728644185; x=1760180185;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=kpGxzkZzzxaLvDkxPWO6wpDQtNbTBC7RruwKOm88EFA=;
 b=Bfc7b9SxKtIAn2HyDbisW3vA+hyxWkUxOuYPlwe9agMcJFbASEFKzqFI
 tWuMvYrdb45VxCKsbVQN8vBDNPcanVh7nBfp94wNyFiEwfAqp8ufbjo9k
 SZmLvokJ1S8ylz4sZhp7XLW2LQLSrRjOSlu+qeWix3/z89ATcALDxC4/B
 jhCbsDTI0hHx26fJaffxxGVBb/eVOHEFpWkB9bYF3gMYLGddqqdKWxnMa
 kB6uQ+GNGJADZlMar8Ub6DnTWt3Kg422lX0D71XGxxjqdGPTeNwyFmC15
 Zu4YiDPGLmsUZFaNZmueUOEKgTo8tnC+mHrwwBmXC+Z6SNcQIDIjUlEt+ A==;
X-CSE-ConnectionGUID: acbp7Hq7R+m1g89z2cCiHg==
X-CSE-MsgGUID: MTlZPeymRzCWsqsQK7EL9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11221"; a="39168567"
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="39168567"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 03:56:25 -0700
X-CSE-ConnectionGUID: bi4gwU6LQemhsHprU9JqDw==
X-CSE-MsgGUID: tNp2rZTSQNqLsEJ5F1YBYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,195,1725346800"; d="scan'208";a="107730669"
Received: from jwbates1-mobl.amr.corp.intel.com (HELO [10.245.100.202])
 ([10.245.100.202])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 03:56:24 -0700
Message-ID: <4ba0d5af-fd17-44df-86cf-7fea91e87bb6@linux.intel.com>
Date: Fri, 11 Oct 2024 12:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] accel/ivpu: Intel NPU Panther Lake support
To: Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com
References: <20241004162505.1695605-1-maciej.falkowski@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20241004162505.1695605-1-maciej.falkowski@linux.intel.com>
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

On 10/4/2024 6:25 PM, Maciej Falkowski wrote:
> This patchset adds initial support for 5th generation Intel NPU
> that is going to be present in the upcoming Panther Lake CPUs.
> 
> Maciej Falkowski (1):
>   accel/ivpu: Add initial Panther Lake support
> 
> Wachowski, Karol (1):
>   accel/ivpu: Update power island delays
> 
>  drivers/accel/ivpu/ivpu_drv.c         |  1 +
>  drivers/accel/ivpu/ivpu_drv.h         | 10 ++++--
>  drivers/accel/ivpu/ivpu_fw.c          |  3 ++
>  drivers/accel/ivpu/ivpu_hw_40xx_reg.h |  2 ++
>  drivers/accel/ivpu/ivpu_hw_ip.c       | 49 +++++++++++++++++----------
>  5 files changed, 45 insertions(+), 20 deletions(-)
> 

