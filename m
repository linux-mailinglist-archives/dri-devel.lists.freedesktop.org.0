Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 764277D7CA5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Oct 2023 08:02:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AEAC10E763;
	Thu, 26 Oct 2023 06:02:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E85C10E763
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Oct 2023 06:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698300147; x=1729836147;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=RpV5tiEQXcsp7xAk6InD/tYd82u0eWzjxZbIhp2hf+M=;
 b=mFybrtMYLe7bjpB9l7NsZNd7scE78E1JTADadsNxHMOQCX3I8T2iUN8J
 kvFKGZVKNv4BJ+LwnznCy4ll6Ggma0nul2oC2U8fwc7Q2Pq0k/NLz9FZi
 HiTuyh39cJeTg73CiYZw7bBUvA5V7hzU16u8fVLgZbUOevovjASzLLr6Q
 N9QHLZhdBUajFGrF5fdtxCzNyJOPuhoxN7t9FA+JR8dQRDvgm8zVR8Jfo
 VN2dw3VRP3wLY9m8MRQM2DSQKe+rngP/Gd65sIUatnAE72D0eeFyFBZmi
 DA2vwCemXqY/07e4/dZfGE3cwFyfjYeAFFk7FG/tSqHJ9hTwVAzWXnOhB g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="9023483"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; 
   d="scan'208";a="9023483"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 23:02:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10874"; a="708948563"
X-IronPort-AV: E=Sophos;i="6.03,253,1694761200"; d="scan'208";a="708948563"
Received: from joe-255.igk.intel.com (HELO localhost) ([10.91.220.57])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2023 23:02:24 -0700
Date: Thu, 26 Oct 2023 08:02:22 +0200
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Deepak R Varma <drv@mailo.com>
Subject: Re: [PATCH] accel/ivpu: Delete the TODO file
Message-ID: <20231026060222.GA1024364@linux.intel.com>
References: <ZTAucrOT69/tQK2o@runicha.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZTAucrOT69/tQK2o@runicha.com>
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
Cc: Oded Gabbay <ogabbay@kernel.org>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 19, 2023 at 12:43:54AM +0530, Deepak R Varma wrote:
> The work items listed in the TODO file of this driver file are either
> completed or dropped. The file is no more significant according
> to the maintainers. Hence removing it from the sources.
> 
> Suggested-by: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
Applied to drm-misc-next

Thanks
Stanislaw

> ---
>  drivers/accel/ivpu/TODO | 11 -----------
>  1 file changed, 11 deletions(-)
>  delete mode 100644 drivers/accel/ivpu/TODO
> 
> diff --git a/drivers/accel/ivpu/TODO b/drivers/accel/ivpu/TODO
> deleted file mode 100644
> index 9077217ae10f..000000000000
> --- a/drivers/accel/ivpu/TODO
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -- Move to threaded_irqs to mitigate potential infinite loop in ivpu_ipc_irq_handler()
> -- Implement support for BLOB IDs
> -- Add debugfs support to improve debugging and testing
> -- Add tracing events for performance debugging
> -- Implement HW based scheduling support
> -- Use syncobjs for submit/sync
> -- Refactor IPC protocol to improve message latency
> -- Implement BO cache and MADVISE IOCTL
> -- Add support for user allocated buffers using prime import and dma-buf heaps
> -- Refactor struct ivpu_bo to use struct drm_gem_shmem_object
> -- Add driver/device documentation
> --
> 2.39.2
> 
> 
> 
