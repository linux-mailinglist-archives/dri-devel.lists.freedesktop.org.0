Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qKCTBZqDkmkEugEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 03:40:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38825140ABA
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 03:40:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6DC10E0FF;
	Mon, 16 Feb 2026 02:40:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MHORJyfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26F9310E0FF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 02:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771209620; x=1802745620;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Q+c3RfmNudyA6okLo+b6gNeR3tguUr+7BZ3rKjSmwsE=;
 b=MHORJyfnsdcM4IbSDTP9Fg0UaUHz/PiXGvVufQkJp2uc/66MkAp9owli
 5eOviDkL1fV/+LiXbLrJLLi4PkSvavjIE8fOouJjBzB9mZLCrCr6ifLqp
 HfRmBkITI7hZFDcQzgBv5EOn2GO6FCZ23NtYn84KJic+0AHgobd7TDc6Q
 3Y//qg65d/UvSxFl1U2sZiaMuIREwOZtVE7tDxKRmsNlB6aoVR3VNh+7U
 Z4f7mCeQu7MiLBR+P1c2EE90JHSEiZf6Coi0D3GKmTf43OyQ6osdGegjo
 nC0fhc58ybAxkUVQWOpycPcLvKb2C80LX39045U5KlELvad9mteT5mzwJ w==;
X-CSE-ConnectionGUID: lzwbhhoeS9WVqe/d3hB20Q==
X-CSE-MsgGUID: ecTq1NrgSGSZZvMgh9eiwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72339104"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="72339104"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 18:40:19 -0800
X-CSE-ConnectionGUID: FNjSZKsPQKSeUnZ2ulGTAA==
X-CSE-MsgGUID: Te9ANFRZQ9+VG5o4AwGH0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="244056967"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
 by orviesa002.jf.intel.com with ESMTP; 15 Feb 2026 18:40:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vroWz-00000000zKO-1Mvg;
 Mon, 16 Feb 2026 02:40:13 +0000
Date: Mon, 16 Feb 2026 10:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, srini@kernel.org,
 linux-arm-msm@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de,
 dmitry.baryshkov@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with
 GENMASK
Message-ID: <202602161009.M2K52X34-lkp@intel.com>
References: <20260215182136.3995111-3-ekansh.gupta@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260215182136.3995111-3-ekansh.gupta@oss.qualcomm.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:llvm@lists.linux.dev,m:oe-kbuild-all@lists.linux.dev,m:gregkh@linuxfoundation.org,m:quic_bkumar@quicinc.com,m:linux-kernel@vger.kernel.org,m:quic_chennak@quicinc.com,m:arnd@arndb.de,m:dmitry.baryshkov@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[lkp@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[01.org:url,intel.com:mid,intel.com:dkim,intel.com:email,git-scm.com:url]
X-Rspamd-Queue-Id: 38825140ABA
X-Rspamd-Action: no action

Hi Ekansh,

kernel test robot noticed the following build errors:

[auto build test ERROR on char-misc/char-misc-testing]
[also build test ERROR on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.19 next-20260213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ekansh-Gupta/misc-fastrpc-Move-fdlist-to-invoke-context-structure/20260216-022305
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260215182136.3995111-3-ekansh.gupta%40oss.qualcomm.com
patch subject: [PATCH v6 2/4] misc: fastrpc: Replace hardcoded ctxid mask with GENMASK
config: hexagon-randconfig-001-20260216 (https://download.01.org/0day-ci/archive/20260216/202602161009.M2K52X34-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260216/202602161009.M2K52X34-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602161009.M2K52X34-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/misc/fastrpc.c:518:29: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     518 |         idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
         |                                    ^
>> drivers/misc/fastrpc.c:654:15: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     654 |         ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
         |                      ^
   drivers/misc/fastrpc.c:2509:10: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2509 |         ctxid = FIELD_GET(FASTRPC_CTXID_MASK, rsp->ctx);
         |                 ^
   3 errors generated.


vim +/FIELD_GET +518 drivers/misc/fastrpc.c

   500	
   501	static void fastrpc_context_free(struct kref *ref)
   502	{
   503		struct fastrpc_invoke_ctx *ctx;
   504		struct fastrpc_channel_ctx *cctx;
   505		unsigned long flags;
   506		int i;
   507	
   508		ctx = container_of(ref, struct fastrpc_invoke_ctx, refcount);
   509		cctx = ctx->cctx;
   510	
   511		for (i = 0; i < ctx->nbufs; i++)
   512			fastrpc_map_put(ctx->maps[i]);
   513	
   514		if (ctx->buf)
   515			fastrpc_buf_free(ctx->buf);
   516	
   517		spin_lock_irqsave(&cctx->lock, flags);
 > 518		idr_remove(&cctx->ctx_idr, FIELD_GET(FASTRPC_CTXID_MASK, ctx->ctxid));
   519		spin_unlock_irqrestore(&cctx->lock, flags);
   520	
   521		kfree(ctx->maps);
   522		kfree(ctx->olaps);
   523		kfree(ctx);
   524	
   525		fastrpc_channel_ctx_put(cctx);
   526	}
   527	
   528	static void fastrpc_context_get(struct fastrpc_invoke_ctx *ctx)
   529	{
   530		kref_get(&ctx->refcount);
   531	}
   532	
   533	static void fastrpc_context_put(struct fastrpc_invoke_ctx *ctx)
   534	{
   535		kref_put(&ctx->refcount, fastrpc_context_free);
   536	}
   537	
   538	static void fastrpc_context_put_wq(struct work_struct *work)
   539	{
   540		struct fastrpc_invoke_ctx *ctx =
   541				container_of(work, struct fastrpc_invoke_ctx, put_work);
   542	
   543		fastrpc_context_put(ctx);
   544	}
   545	
   546	#define CMP(aa, bb) ((aa) == (bb) ? 0 : (aa) < (bb) ? -1 : 1)
   547	static int olaps_cmp(const void *a, const void *b)
   548	{
   549		struct fastrpc_buf_overlap *pa = (struct fastrpc_buf_overlap *)a;
   550		struct fastrpc_buf_overlap *pb = (struct fastrpc_buf_overlap *)b;
   551		/* sort with lowest starting buffer first */
   552		int st = CMP(pa->start, pb->start);
   553		/* sort with highest ending buffer first */
   554		int ed = CMP(pb->end, pa->end);
   555	
   556		return st == 0 ? ed : st;
   557	}
   558	
   559	static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
   560	{
   561		u64 max_end = 0;
   562		int i;
   563	
   564		for (i = 0; i < ctx->nbufs; ++i) {
   565			ctx->olaps[i].start = ctx->args[i].ptr;
   566			ctx->olaps[i].end = ctx->olaps[i].start + ctx->args[i].length;
   567			ctx->olaps[i].raix = i;
   568		}
   569	
   570		sort(ctx->olaps, ctx->nbufs, sizeof(*ctx->olaps), olaps_cmp, NULL);
   571	
   572		for (i = 0; i < ctx->nbufs; ++i) {
   573			/* Falling inside previous range */
   574			if (ctx->olaps[i].start < max_end) {
   575				ctx->olaps[i].mstart = max_end;
   576				ctx->olaps[i].mend = ctx->olaps[i].end;
   577				ctx->olaps[i].offset = max_end - ctx->olaps[i].start;
   578	
   579				if (ctx->olaps[i].end > max_end) {
   580					max_end = ctx->olaps[i].end;
   581				} else {
   582					ctx->olaps[i].mend = 0;
   583					ctx->olaps[i].mstart = 0;
   584				}
   585	
   586			} else  {
   587				ctx->olaps[i].mend = ctx->olaps[i].end;
   588				ctx->olaps[i].mstart = ctx->olaps[i].start;
   589				ctx->olaps[i].offset = 0;
   590				max_end = ctx->olaps[i].end;
   591			}
   592		}
   593	}
   594	
   595	static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
   596				struct fastrpc_user *user, u32 kernel, u32 sc,
   597				struct fastrpc_invoke_args *args)
   598	{
   599		struct fastrpc_channel_ctx *cctx = user->cctx;
   600		struct fastrpc_invoke_ctx *ctx = NULL;
   601		unsigned long flags;
   602		int ret;
   603	
   604		ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
   605		if (!ctx)
   606			return ERR_PTR(-ENOMEM);
   607	
   608		INIT_LIST_HEAD(&ctx->node);
   609		ctx->fl = user;
   610		ctx->nscalars = REMOTE_SCALARS_LENGTH(sc);
   611		ctx->nbufs = REMOTE_SCALARS_INBUFS(sc) +
   612			     REMOTE_SCALARS_OUTBUFS(sc);
   613	
   614		if (ctx->nscalars) {
   615			ctx->maps = kcalloc(ctx->nscalars,
   616					    sizeof(*ctx->maps), GFP_KERNEL);
   617			if (!ctx->maps) {
   618				kfree(ctx);
   619				return ERR_PTR(-ENOMEM);
   620			}
   621			ctx->olaps = kcalloc(ctx->nscalars,
   622					    sizeof(*ctx->olaps), GFP_KERNEL);
   623			if (!ctx->olaps) {
   624				kfree(ctx->maps);
   625				kfree(ctx);
   626				return ERR_PTR(-ENOMEM);
   627			}
   628			ctx->args = args;
   629			fastrpc_get_buff_overlaps(ctx);
   630		}
   631	
   632		/* Released in fastrpc_context_put() */
   633		fastrpc_channel_ctx_get(cctx);
   634	
   635		ctx->sc = sc;
   636		ctx->retval = -1;
   637		ctx->pid = current->pid;
   638		ctx->client_id = user->client_id;
   639		ctx->cctx = cctx;
   640		init_completion(&ctx->work);
   641		INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
   642	
   643		spin_lock(&user->lock);
   644		list_add_tail(&ctx->node, &user->pending);
   645		spin_unlock(&user->lock);
   646	
   647		spin_lock_irqsave(&cctx->lock, flags);
   648		ret = idr_alloc_cyclic(&cctx->ctx_idr, ctx, 1,
   649				       FASTRPC_CTX_MAX, GFP_ATOMIC);
   650		if (ret < 0) {
   651			spin_unlock_irqrestore(&cctx->lock, flags);
   652			goto err_idr;
   653		}
 > 654		ctx->ctxid = FIELD_PREP(FASTRPC_CTXID_MASK, ret);
   655		spin_unlock_irqrestore(&cctx->lock, flags);
   656	
   657		kref_init(&ctx->refcount);
   658	
   659		return ctx;
   660	err_idr:
   661		spin_lock(&user->lock);
   662		list_del(&ctx->node);
   663		spin_unlock(&user->lock);
   664		fastrpc_channel_ctx_put(cctx);
   665		kfree(ctx->maps);
   666		kfree(ctx->olaps);
   667		kfree(ctx);
   668	
   669		return ERR_PTR(ret);
   670	}
   671	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
