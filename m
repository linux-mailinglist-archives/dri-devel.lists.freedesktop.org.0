Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D973B7BFCF2
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8386210E365;
	Tue, 10 Oct 2023 13:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAB410E366
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Oct 2023 13:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696943432; x=1728479432;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=LfvkyWWgd3eiHj7mOmx4QZJ3G+O2ECJyREGq8SLfUKo=;
 b=gu0iz8O48TKgy80zGTJUshXnCZ0uagvN4AirBIM4vVufayYiAsv1dbJW
 rL2uouY31J1806Tu3FU8xTAU5lSk8dQyZhiwqYHfnfhK89mcYvVNN8Tgg
 7VFcYK9ZuyLFlRife7hXEKfaRsYdgbW9yJlWEzf1K4ywBfx/ARfUauaaS
 Jlpz5P+SxgTzTtuLf73UDD85DEgCGugp2uZHswK17nvtGbVEr6X8zt/rF
 D+CCG+niDp4RJw2WshIPmB3CBNs5Z84aVMLZajJA1LxThEoDq9Hvujtdv
 ol/6xhJ0MNCmkCGaiwV5B8v2KqtWFnUzOvHGDh9fINcnE7f2J64MHYnye g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="470651154"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="470651154"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Oct 2023 06:08:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="897186185"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; d="scan'208";a="897186185"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
 by fmsmga001.fm.intel.com with ESMTP; 10 Oct 2023 06:06:40 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1qqCTC-0000SW-2x;
 Tue, 10 Oct 2023 13:08:19 +0000
Date: Tue, 10 Oct 2023 21:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, quic_ajitpals@quicinc.com,
 quic_carlv@quicinc.com, quic_pkanojiy@quicinc.com,
 stanislaw.gruszka@linux.intel.com, ogabbay@kernel.org
Subject: Re: [PATCH 1/2] accel/qaic: Add support for periodic timesync
Message-ID: <202310102021.xKVfIhRT-lkp@intel.com>
References: <20231006163210.21319-2-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231006163210.21319-2-quic_jhugo@quicinc.com>
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
Cc: linux-arm-msm@vger.kernel.org, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jeffrey,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on next-20231010]
[cannot apply to linus/master v6.6-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jeffrey-Hugo/accel-qaic-Add-support-for-periodic-timesync/20231007-003324
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231006163210.21319-2-quic_jhugo%40quicinc.com
patch subject: [PATCH 1/2] accel/qaic: Add support for periodic timesync
config: powerpc-randconfig-003-20231010 (https://download.01.org/0day-ci/archive/20231010/202310102021.xKVfIhRT-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310102021.xKVfIhRT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310102021.xKVfIhRT-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/accel/qaic/qaic_timesync.c: In function 'qaic_timesync_timer':
>> drivers/accel/qaic/qaic_timesync.c:125:25: error: implicit declaration of function 'readq'; did you mean 'readl'? [-Werror=implicit-function-declaration]
     125 |         device_qtimer = readq(mqtsdev->qtimer_addr);
         |                         ^~~~~
         |                         readl
   cc1: some warnings being treated as errors


vim +125 drivers/accel/qaic/qaic_timesync.c

   102	
   103	static void qaic_timesync_timer(struct timer_list *t)
   104	{
   105		struct mqts_dev *mqtsdev = from_timer(mqtsdev, t, timer);
   106		struct qts_host_time_sync_msg_data *sync_msg;
   107		u64 device_qtimer_us;
   108		u64 device_qtimer;
   109		u64 host_time_us;
   110		u64 offset_us;
   111		u64 host_sec;
   112		int ret;
   113	
   114		if (atomic_read(&mqtsdev->buff_in_use)) {
   115			dev_dbg(mqtsdev->dev, "%s buffer not free, schedule next cycle\n", __func__);
   116			goto mod_timer;
   117		}
   118		atomic_set(&mqtsdev->buff_in_use, 1);
   119	
   120		sync_msg = mqtsdev->sync_msg;
   121		sync_msg->header.signature = cpu_to_le16(QAIC_TIMESYNC_SIGNATURE);
   122		sync_msg->header.msg_type = QAIC_TS_SYNC_REQ;
   123		/* Read host UTC time and convert to uS*/
   124		host_time_us = div_u64(ktime_get_real_ns(), NSEC_PER_USEC);
 > 125		device_qtimer = readq(mqtsdev->qtimer_addr);
   126		device_qtimer_us = QAIC_CONV_QTIMER_TO_US(device_qtimer);
   127		/* Offset between host UTC and device time */
   128		offset_us = host_time_us - device_qtimer_us;
   129	
   130		host_sec = div_u64(offset_us, USEC_PER_SEC);
   131		sync_msg->data.tv_usec = cpu_to_le64(offset_us - host_sec * USEC_PER_SEC);
   132		sync_msg->data.tv_sec = cpu_to_le64(host_sec);
   133		ret = mhi_queue_buf(mqtsdev->mhi_dev, DMA_TO_DEVICE, sync_msg, sizeof(*sync_msg), MHI_EOT);
   134		if (ret && (ret != -EAGAIN)) {
   135			dev_err(mqtsdev->dev, "%s unable to queue to mhi:%d\n", __func__, ret);
   136			return;
   137		} else if (ret == -EAGAIN) {
   138			atomic_set(&mqtsdev->buff_in_use, 0);
   139		}
   140	
   141	mod_timer:
   142		ret = mod_timer(t, jiffies + msecs_to_jiffies(timesync_delay_ms));
   143		if (ret)
   144			dev_err(mqtsdev->dev, "%s mod_timer error:%d\n", __func__, ret);
   145	}
   146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
