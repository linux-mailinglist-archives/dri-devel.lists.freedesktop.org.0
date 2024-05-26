Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B509C8CF26C
	for <lists+dri-devel@lfdr.de>; Sun, 26 May 2024 04:00:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B335910F086;
	Sun, 26 May 2024 02:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kD8ejtD4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59C410F086
 for <dri-devel@lists.freedesktop.org>; Sun, 26 May 2024 02:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716688840; x=1748224840;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=CzcVNZjWSshoEFL81VKFzrkOMmouWtgwix9NhZydeTI=;
 b=kD8ejtD42Yx99GUnYmnNyL+1euD3Y/dEFeTGSFgCyUNplp4JVVgzjkue
 2XRChr5N6oBVlJaOoLmaLNEbA9iStQFZjVSc2N5b6tvN/hWcpyhxOTLeM
 xf4n1Rl3h0QPEZKv0u1gGU/2Mjr5B8pcnk6Xg7tqMJrG6r40dWAFvIhu2
 lcpI4uTYIyKzqtn3NeNF1WbiOvh8CFs3uty5vb/syztNBDv++za0JFoCu
 nsRKEsY/3PwLAWD9x45y6ZajKhuwXcmJc5wZQ5pzN4f1BE+JHEqiKsNYD
 oDZwtnTxaULB9fg1vmglI4xe4cHbVKdHHNNB9n44Fo+rdUGe7f714YSnX g==;
X-CSE-ConnectionGUID: u2rGh+OmRl6LZRuQDEvFyQ==
X-CSE-MsgGUID: zJZHlfAyTguWQGd9MZvHjg==
X-IronPort-AV: E=McAfee;i="6600,9927,11083"; a="23633383"
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; d="scan'208";a="23633383"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2024 19:00:37 -0700
X-CSE-ConnectionGUID: 8bgepjOfSp2uABOKzPJRSg==
X-CSE-MsgGUID: qqwx/AslRHOoP6sn78rbyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,189,1712646000"; d="scan'208";a="39375336"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
 by orviesa004.jf.intel.com with ESMTP; 25 May 2024 19:00:33 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1sB3BW-0007df-0g;
 Sun, 26 May 2024 02:00:30 +0000
Date: Sun, 26 May 2024 09:59:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 6/8] mailbox: mediatek: Add CMDQ secure mailbox driver
Message-ID: <202405260953.uzQ4Rwg2-lkp@intel.com>
References: <20240525230810.24623-7-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240525230810.24623-7-jason-jh.lin@mediatek.com>
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

Hi Jason-JH.Lin,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on next-20240523]
[cannot apply to robh/for-next krzk-dt/for-next fujitsu-integration/mailbox-for-next v6.9]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-JH-Lin/dt-bindings-gce-mt8195-Add-CMDQ_SYNC_TOKEN_SECURE_THR_EOF-event-id/20240526-071102
base:   linus/master
patch link:    https://lore.kernel.org/r/20240525230810.24623-7-jason-jh.lin%40mediatek.com
patch subject: [PATCH v6 6/8] mailbox: mediatek: Add CMDQ secure mailbox driver
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240526/202405260953.uzQ4Rwg2-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240526/202405260953.uzQ4Rwg2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405260953.uzQ4Rwg2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/mailbox/mtk-cmdq-sec-mailbox.c: In function 'cmdq_sec_task_exec_work':
>> drivers/mailbox/mtk-cmdq-sec-mailbox.c:619:31: warning: variable 'data' set but not used [-Wunused-but-set-variable]
     619 |         struct cmdq_sec_data *data;
         |                               ^~~~


vim +/data +619 drivers/mailbox/mtk-cmdq-sec-mailbox.c

   611	
   612	static void cmdq_sec_task_exec_work(struct work_struct *work_item)
   613	{
   614		struct cmdq_sec_task *sec_task = container_of(work_item,
   615							      struct cmdq_sec_task, exec_work);
   616		struct cmdq_sec_thread *sec_thread = container_of(sec_task->task.thread,
   617								 struct cmdq_sec_thread, thread);
   618		struct cmdq_sec *cmdq = container_of(sec_thread->dev, struct cmdq_sec, dev);
 > 619		struct cmdq_sec_data *data;
   620		unsigned long flags;
   621		int err;
   622	
   623		dev_dbg(&cmdq->dev, "%s gce:%#lx sec_task:%p pkt:%p thread:%u",
   624			__func__, (unsigned long)cmdq->base_pa,
   625			sec_task, sec_task->task.pkt, sec_thread->idx);
   626	
   627		if (!sec_task->task.pkt->sec_data) {
   628			dev_err(&cmdq->dev, "pkt:%p without sec_data", sec_task->task.pkt);
   629			return;
   630		}
   631		data = (struct cmdq_sec_data *)sec_task->task.pkt->sec_data;
   632	
   633		mutex_lock(&cmdq->exec_lock);
   634	
   635		spin_lock_irqsave(&sec_thread->thread.chan->lock, flags);
   636		if (!sec_thread->task_cnt) {
   637			mod_timer(&sec_thread->timeout, jiffies +
   638				  msecs_to_jiffies(sec_thread->timeout_ms));
   639			sec_thread->wait_cookie = 1;
   640			sec_thread->next_cookie = 1;
   641			sec_thread->task_cnt = 0;
   642			__raw_writel(0, (void __iomem *)cmdq->shared_mem->va +
   643				     CMDQ_SEC_SHARED_THR_CNT_OFFSET + sec_thread->idx * sizeof(u32));
   644		}
   645	
   646		sec_task->reset_exec = sec_thread->task_cnt ? false : true;
   647		sec_task->wait_cookie = sec_thread->next_cookie;
   648		sec_thread->next_cookie = (sec_thread->next_cookie + 1) % CMDQ_MAX_COOKIE_VALUE;
   649		list_add_tail(&sec_task->task.list_entry, &sec_thread->thread.task_busy_list);
   650		sec_thread->task_cnt += 1;
   651		spin_unlock_irqrestore(&sec_thread->thread.chan->lock, flags);
   652		sec_task->trigger = sched_clock();
   653	
   654		if (!atomic_cmpxchg(&cmdq_path_res, 0, 1)) {
   655			err = cmdq_sec_task_submit(cmdq, NULL, CMD_CMDQ_IWC_PATH_RES_ALLOCATE,
   656						   CMDQ_INVALID_THREAD);
   657			if (err) {
   658				atomic_set(&cmdq_path_res, 0);
   659				goto task_end;
   660			}
   661		}
   662	
   663		if (sec_thread->task_cnt > CMDQ_MAX_TASK_IN_SECURE_THREAD) {
   664			dev_err(&cmdq->dev, "task_cnt:%u cannot more than %u sec_task:%p thread:%u",
   665				sec_thread->task_cnt, CMDQ_MAX_TASK_IN_SECURE_THREAD,
   666				sec_task, sec_thread->idx);
   667			err = -EMSGSIZE;
   668			goto task_end;
   669		}
   670	
   671		err = cmdq_sec_task_submit(cmdq, sec_task, CMD_CMDQ_IWC_SUBMIT_TASK,
   672					   sec_thread->idx);
   673		if (err)
   674			dev_err(&cmdq->dev, "cmdq_sec_task_submit err:%d sec_task:%p thread:%u",
   675				err, sec_task, sec_thread->idx);
   676	
   677	task_end:
   678		if (err) {
   679			struct cmdq_cb_data cb_data;
   680	
   681			cb_data.sta = err;
   682			cb_data.pkt = sec_task->task.pkt;
   683			mbox_chan_received_data(sec_thread->thread.chan, &cb_data);
   684	
   685			spin_lock_irqsave(&sec_thread->thread.chan->lock, flags);
   686			if (!sec_thread->task_cnt)
   687				dev_err(&cmdq->dev, "thread:%u task_cnt:%u cannot below zero",
   688					sec_thread->idx, sec_thread->task_cnt);
   689			else
   690				sec_thread->task_cnt -= 1;
   691	
   692			sec_thread->next_cookie = (sec_thread->next_cookie - 1 +
   693				CMDQ_MAX_COOKIE_VALUE) % CMDQ_MAX_COOKIE_VALUE;
   694			list_del(&sec_task->task.list_entry);
   695			dev_dbg(&cmdq->dev, "gce:%#lx err:%d sec_task:%p pkt:%p",
   696				(unsigned long)cmdq->base_pa, err, sec_task, sec_task->task.pkt);
   697			dev_dbg(&cmdq->dev, "thread:%u task_cnt:%u wait_cookie:%u next_cookie:%u",
   698				sec_thread->idx, sec_thread->task_cnt,
   699				sec_thread->wait_cookie, sec_thread->next_cookie);
   700			spin_unlock_irqrestore(&sec_thread->thread.chan->lock, flags);
   701	
   702			kfree(sec_task);
   703		}
   704	
   705		mutex_unlock(&cmdq->exec_lock);
   706	}
   707	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
