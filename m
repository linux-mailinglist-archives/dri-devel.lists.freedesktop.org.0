Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FC668B76D
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 09:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC5E10E128;
	Mon,  6 Feb 2023 08:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 006FD10E128
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 08:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675672482; x=1707208482;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=tj2d63Gw+z72b/Tt/QsmBKDZZjioBSuUSG1712UsN2I=;
 b=ZpID9eUCX5KfmK0BsVIufo89HQ7hBJknkX5IB6uH7sZEPcc9Z1shzley
 nGiw7tdXAMavQbpfrll37I6SD7iA/1FTA1+7j8fJskU3pr9ucS1ibD6Pp
 x8eDlfjwasHel1zinEOFYG1Tfn5XmoJ/mvA+W4j4cat8ksTYFIhimnjaC
 LNvghdt4vA2MLIktbKVpeui3MAMfhAlxs131s11yFiA1UJyDpkg3lL290
 eIsG7w76rznRsTODsBt5LOodm5RF5oBoOw5+3nn9O/dm8x8+4xE0Q5b6x
 dL/fCeqZEynM59yeWzJnDDYFZV4OEdyHqIFMsV0nmNzdIL8RZ91ikVzRa w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="308800375"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="308800375"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 00:34:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="729941462"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; d="scan'208";a="729941462"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.149.225])
 ([10.249.149.225])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2023 00:34:41 -0800
Message-ID: <e2faebbb-8b71-e439-0c5f-e628d353948c@linux.intel.com>
Date: Mon, 6 Feb 2023 09:34:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/4] accel/ivpu: Fixes for 6.3
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20230202092114.2637452-1-stanislaw.gruszka@linux.intel.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patchset applied to drm-misc-next and cherry-picked to drm-misc-next-fixes.
Thanks.

On 02.02.2023 10:21, Stanislaw Gruszka wrote:
> Few fixes intended for 6.3.
> 
> Andrzej Kacprowski (2):
>   accel/ivpu: Fix FW API data alignment issues
>   accel/ivpu: Send VPU_JSM_MSG_CONTEXT_DELETE when deleting context
> 
> Stanislaw Gruszka (2):
>   accel/ivpu: Set dma max_segment_size
>   accel/ivpu: Fix old dma_buf api usage
> 
>  drivers/accel/ivpu/ivpu_drv.c     |  2 +
>  drivers/accel/ivpu/ivpu_fw.c      | 37 +++++++++++------
>  drivers/accel/ivpu/ivpu_gem.c     |  8 +---
>  drivers/accel/ivpu/ivpu_job.c     |  5 ++-
>  drivers/accel/ivpu/ivpu_jsm_msg.c | 11 +++++
>  drivers/accel/ivpu/ivpu_jsm_msg.h |  2 +-
>  drivers/accel/ivpu/vpu_jsm_api.h  | 67 ++++++++++++++++++-------------
>  7 files changed, 81 insertions(+), 51 deletions(-)
> 
