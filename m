Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B6C8A184D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 17:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8158210EFA0;
	Thu, 11 Apr 2024 15:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="R7pDm3GO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A3810EB2D;
 Thu, 11 Apr 2024 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=h/MHPqAJUaQnVuOJ9LRPRm8bT9y8j34KRGcWL/KK0UA=; b=R7pDm3GO8Ii5Ili8nlCHbqY/ci
 HwQiGoHrPt0/QFJGLkfOYWapAgqNSD0m7dN47qkovXWmIJGWNxm24EBH2uEXCEf1pwbP/T0uTO8gR
 /rf/ABFbrwhzwh1YaFsnJvOjD4FFPRlfjqXYQ4RRF8PPw0rOa25/OIn9ZdvO0hQc8wJpxKcRL7i/l
 0y/jb12ZbyYiTzdtSNeuMI4b98guH1CwWtzoAnQiVaDAeoxaKUcUwh1eqyGFcqjXXvAmxC4RhZeLx
 5jIDVlbbv4+L8DyPrR2/AwByKwg+ryYd7CukrFp9FKQQRznSA/iPSrw4ecKOwVRqeyHtPJVHvE+yq
 YiNbS37w==;
Received: from [50.53.2.121] (helo=[192.168.254.15])
 by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
 id 1ruw71-0000000CgHE-2Zjz; Thu, 11 Apr 2024 15:13:15 +0000
Message-ID: <5ca63761-93e4-47e2-8fd0-e300a08f044a@infradead.org>
Date: Thu, 11 Apr 2024 08:13:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] treewide: Fix common grammar mistake "the the"
To: Thorsten Blum <thorsten.blum@toblux.com>, kernel-janitors@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-s390@vger.kernel.org, speakup@linux-speakup.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-wireless@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-afs@lists.infradead.org,
 ecryptfs@vger.kernel.org, netfs@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 linux-arch@vger.kernel.org, io-uring@vger.kernel.org, cocci@inria.fr,
 linux-perf-users@vger.kernel.org
References: <20240411150437.496153-4-thorsten.blum@toblux.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240411150437.496153-4-thorsten.blum@toblux.com>
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



On 4/11/24 8:04 AM, Thorsten Blum wrote:
> Use `find . -type f -exec sed -i 's/\<the the\>/the/g' {} +` to find all
> occurrences of "the the" and replace them with a single "the".
> 
> Changes only comments and documentation - no code changes.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
> ---
>  Documentation/trace/histogram.rst                 | 2 +-
>  arch/arm/Kconfig                                  | 4 ++--
>  arch/arm/include/asm/unwind.h                     | 2 +-
>  arch/arm64/Kconfig                                | 2 +-
>  arch/arm64/kernel/entry-ftrace.S                  | 2 +-
>  arch/s390/kernel/perf_cpum_sf.c                   | 2 +-
>  arch/s390/kernel/sthyi.c                          | 2 +-
>  drivers/accessibility/speakup/speakup_soft.c      | 2 +-
>  drivers/gpu/drm/i915/display/intel_crt.c          | 2 +-
>  drivers/gpu/drm/i915/i915_request.c               | 2 +-
>  drivers/mailbox/Kconfig                           | 2 +-
>  drivers/net/wireless/intel/iwlwifi/fw/api/tx.h    | 4 ++--
>  drivers/net/wireless/intel/iwlwifi/mvm/phy-ctxt.c | 2 +-
>  drivers/scsi/bfa/bfa_fcs_rport.c                  | 2 +-
>  drivers/scsi/fcoe/fcoe_ctlr.c                     | 2 +-
>  drivers/scsi/isci/host.h                          | 2 +-
>  drivers/scsi/isci/remote_device.h                 | 2 +-
>  drivers/scsi/isci/remote_node_context.h           | 2 +-
>  drivers/scsi/isci/task.c                          | 2 +-
>  fs/afs/flock.c                                    | 2 +-
>  fs/ecryptfs/keystore.c                            | 2 +-
>  fs/netfs/direct_read.c                            | 2 +-
>  fs/netfs/direct_write.c                           | 2 +-
>  fs/overlayfs/super.c                              | 2 +-
>  include/uapi/asm-generic/fcntl.h                  | 2 +-
>  io_uring/kbuf.c                                   | 2 +-
>  lib/zstd/common/fse_decompress.c                  | 2 +-
>  lib/zstd/decompress/zstd_decompress_block.c       | 2 +-
>  scripts/coccinelle/misc/badty.cocci               | 2 +-
>  tools/perf/Documentation/perf-diff.txt            | 2 +-
>  30 files changed, 32 insertions(+), 32 deletions(-)
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
#Randy
