Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 298DC871555
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 06:42:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553CE11270F;
	Tue,  5 Mar 2024 05:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92C54112813;
 Tue,  5 Mar 2024 01:52:39 +0000 (UTC)
X-QQ-mid: bizesmtp62t1709603425tlfm1u6g
X-QQ-Originating-IP: bOfoihEMseawlWRMJfUotn4eIapOK4hJzqa7PVtpX9M=
Received: from localhost ( [112.22.30.30]) by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 05 Mar 2024 09:50:24 +0800 (CST)
X-QQ-SSF: 01400000000000505000000A0001000
X-QQ-FEAT: aBJFcW+uBGaR7RCsuQoBy5eXJ1KZuuHUtRBZZSI216HiitWH8P8cUz2Cg2MDR
 6WqYitRnkgbwfvlT/0blMffY3wNXYkK5uMhGTeLXZ3Iuzb+eFyMN2aEkk9guJSpYlgC3KxY
 z+w2R2C5Q6fQKuRLC2DGW2tGX9dDFRnhESPT9CPgwTyYsM6nuhviYA7jYWR/uu6q8X2SsM3
 7Ji4l8FhFdCRxux7wuDMywVd5qLLnOfHlVjTv/OWCNiKTuJjcblHWtQ4FiOXZPSWLn84LRu
 /5vh0+dzeb+rr68ICK34GULzlCh0ayPn7SqzI+y7JkGRd/4NlmebYRru5ssz+XRYCb9T937
 PaGtuXjfD72hrxLllYKzb/3SWJKOct2fU9SMMw9uclhD8X3uPfUPkIgQ+ofXsCGeORpxxN7
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 14154700281966297232
Date: Tue, 5 Mar 2024 09:50:23 +0800
From: Dawei Li <dawei.li@shingroup.cn>
To: lucas.demarchi@intel.com, ogabbay@kernel.org,
 thomas.hellstrom@linux.intel.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/xe: Declare __xe_lrc_*_ggtt_addr with __maybe__unused
Message-ID: <1543D46042445CE9+ZeZ6X5Ng2rq3swoo@centos8>
References: <20240204062324.3548268-1-dawei.li@shingroup.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240204062324.3548268-1-dawei.li@shingroup.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-Mailman-Approved-At: Tue, 05 Mar 2024 05:42:37 +0000
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

On Sun, Feb 04, 2024 at 02:23:24PM +0800, Dawei Li wrote:
> Kernel test robot reports building error:
> 
> drivers/gpu/drm/xe/xe_lrc.c:544:1: error: unused function
> '__xe_lrc_regs_ggtt_addr' [-Werror,-Wunused-function]
> 544 | DECL_MAP_ADDR_HELPERS(regs)
>     | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> drivers/gpu/drm/xe/xe_lrc.c:536:19: note: expanded from macro
> 'DECL_MAP_ADDR_HELPERS'
> 536 | static inline u32 __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
>     |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> <scratch space>:54:1: note: expanded from here
> 54 | __xe_lrc_regs_ggtt_addr
>    | ^~~~~~~~~~~~~~~~~~~~~~~
> 
> 1 error generated.
> 
> Declare __xe_lrc_*_ggtt_addr with __maybe_unused to address it.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202402010928.g3j2aSBL-lkp@intel.com/
> Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
> ---
>  drivers/gpu/drm/xe/xe_lrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Just a gentle ping.

Thanks,

    Dawei

> 
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 0ec5ad2539f1..f70e60a2f8a3 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -614,7 +614,7 @@ static inline struct iosys_map __xe_lrc_##elem##_map(struct xe_lrc *lrc) \
>  	iosys_map_incr(&map, __xe_lrc_##elem##_offset(lrc)); \
>  	return map; \
>  } \
> -static inline u32 __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
> +static inline u32 __maybe_unused __xe_lrc_##elem##_ggtt_addr(struct xe_lrc *lrc) \
>  { \
>  	return xe_bo_ggtt_addr(lrc->bo) + __xe_lrc_##elem##_offset(lrc); \
>  } \
> -- 
> 2.27.0
> 
