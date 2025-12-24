Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD316CDBEF4
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 11:12:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E78410E93C;
	Wed, 24 Dec 2025 10:12:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oColYT7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F72710E93C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766571120; x=1798107120;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=5z1guFUcp3PiZ1mJvphWJEQT9yKrp+OX2pIL0PT9hoQ=;
 b=oColYT7KcXpE0jmvsafQNzlrWsJPqSTpzF12OtIbmAIiJA6wcGhOy05N
 BDfN68NeJQ295KbLm2aJgm07vi7NL597wSAMAqaEc3v5Jh1vRgIdyyi8H
 wNeBLo7Jbwj+HtbdTu5UM+ge5sj11VRgWA4ahtyAQXXV70FPxr3zNqvsF
 A78rNLsYwBC/++WUCwnzMnYEClcom4Xf/j07kF4XpXjWr/sUXcKv8ZYFP
 epvvNibQryPj2BXseoimv7eNCvRV2Wcn7je7tPTwQWZoSkPIiQ1VEiTsZ
 3ABvW/UW2CkO4Sfl0cw25qmj6DErU+jJkAsHHNhEY5IECCHIgrnlsTtCJ w==;
X-CSE-ConnectionGUID: 3oJjTsTKR6q7ejs/waLbIg==
X-CSE-MsgGUID: SRXcNn5VQemULMIJsQy4rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="72273019"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; d="scan'208";a="72273019"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Dec 2025 02:11:59 -0800
X-CSE-ConnectionGUID: zs4kUCMSSFeq0Vrn7sfkqA==
X-CSE-MsgGUID: 8pqrvxb0Roee+TnO2WMuGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; d="scan'208";a="205061381"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
 by orviesa005.jf.intel.com with ESMTP; 24 Dec 2025 02:11:56 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
 (envelope-from <lkp@intel.com>) id 1vYLqT-000000002vR-28Mx;
 Wed, 24 Dec 2025 10:11:53 +0000
Date: Wed, 24 Dec 2025 18:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
 troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, ogabbay@kernel.org,
 lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] accel/qaic: Handle DBC deactivation if the owner went away
Message-ID: <202512241701.p3agYhbp-lkp@intel.com>
References: <20251223153151.2232297-1-youssef.abdulrahman@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223153151.2232297-1-youssef.abdulrahman@oss.qualcomm.com>
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

Hi Youssef,

kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v6.19-rc2 next-20251219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Youssef-Samir/accel-qaic-Handle-DBC-deactivation-if-the-owner-went-away/20251223-233305
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20251223153151.2232297-1-youssef.abdulrahman%40oss.qualcomm.com
patch subject: [PATCH] accel/qaic: Handle DBC deactivation if the owner went away
config: i386-randconfig-012-20251224 (https://download.01.org/0day-ci/archive/20251224/202512241701.p3agYhbp-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241701.p3agYhbp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241701.p3agYhbp-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/accel/qaic/qaic_control.c:1471:1: error: function definition is not allowed here
    1471 | {
         | ^
   drivers/accel/qaic/qaic_control.c:1484:1: error: function definition is not allowed here
    1484 | {
         | ^
   drivers/accel/qaic/qaic_control.c:1492:1: error: function definition is not allowed here
    1492 | {
         | ^
   drivers/accel/qaic/qaic_control.c:1515:1: error: function definition is not allowed here
    1515 | {
         | ^
   drivers/accel/qaic/qaic_control.c:1539:1: error: function definition is not allowed here
    1539 | {
         | ^
   drivers/accel/qaic/qaic_control.c:1544:1: error: function definition is not allowed here
    1544 | {
         | ^
   drivers/accel/qaic/qaic_control.c:1592:1: error: function definition is not allowed here
    1592 | {
         | ^
>> drivers/accel/qaic/qaic_control.c:1602:2: error: expected '}'
    1602 | }
         |  ^
   drivers/accel/qaic/qaic_control.c:1404:1: note: to match this '{'
    1404 | {
         | ^
   8 errors generated.


vim +1471 drivers/accel/qaic/qaic_control.c

129776ac2e3823 Jeff Hugo 2023-03-27  1469  
129776ac2e3823 Jeff Hugo 2023-03-27  1470  static void free_wrapper_from_list(struct wrapper_list *wrappers, struct wrapper_msg *wrapper)
129776ac2e3823 Jeff Hugo 2023-03-27 @1471  {
129776ac2e3823 Jeff Hugo 2023-03-27  1472  	bool all_done = false;
129776ac2e3823 Jeff Hugo 2023-03-27  1473  
129776ac2e3823 Jeff Hugo 2023-03-27  1474  	spin_lock(&wrappers->lock);
129776ac2e3823 Jeff Hugo 2023-03-27  1475  	kref_put(&wrapper->ref_count, free_wrapper);
129776ac2e3823 Jeff Hugo 2023-03-27  1476  	all_done = list_empty(&wrappers->list);
129776ac2e3823 Jeff Hugo 2023-03-27  1477  	spin_unlock(&wrappers->lock);
129776ac2e3823 Jeff Hugo 2023-03-27  1478  
129776ac2e3823 Jeff Hugo 2023-03-27  1479  	if (all_done)
129776ac2e3823 Jeff Hugo 2023-03-27  1480  		kfree(wrappers);
129776ac2e3823 Jeff Hugo 2023-03-27  1481  }
129776ac2e3823 Jeff Hugo 2023-03-27  1482  
129776ac2e3823 Jeff Hugo 2023-03-27  1483  void qaic_mhi_ul_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
129776ac2e3823 Jeff Hugo 2023-03-27  1484  {
129776ac2e3823 Jeff Hugo 2023-03-27  1485  	struct wire_msg *msg = mhi_result->buf_addr;
129776ac2e3823 Jeff Hugo 2023-03-27  1486  	struct wrapper_msg *wrapper = container_of(msg, struct wrapper_msg, msg);
129776ac2e3823 Jeff Hugo 2023-03-27  1487  
129776ac2e3823 Jeff Hugo 2023-03-27  1488  	free_wrapper_from_list(wrapper->head, wrapper);
129776ac2e3823 Jeff Hugo 2023-03-27  1489  }
129776ac2e3823 Jeff Hugo 2023-03-27  1490  
129776ac2e3823 Jeff Hugo 2023-03-27  1491  void qaic_mhi_dl_xfer_cb(struct mhi_device *mhi_dev, struct mhi_result *mhi_result)
129776ac2e3823 Jeff Hugo 2023-03-27  1492  {
129776ac2e3823 Jeff Hugo 2023-03-27  1493  	struct qaic_device *qdev = dev_get_drvdata(&mhi_dev->dev);
129776ac2e3823 Jeff Hugo 2023-03-27  1494  	struct wire_msg *msg = mhi_result->buf_addr;
129776ac2e3823 Jeff Hugo 2023-03-27  1495  	struct resp_work *resp;
129776ac2e3823 Jeff Hugo 2023-03-27  1496  
129776ac2e3823 Jeff Hugo 2023-03-27  1497  	if (mhi_result->transaction_status || msg->hdr.magic_number != MANAGE_MAGIC_NUMBER) {
129776ac2e3823 Jeff Hugo 2023-03-27  1498  		kfree(msg);
129776ac2e3823 Jeff Hugo 2023-03-27  1499  		return;
129776ac2e3823 Jeff Hugo 2023-03-27  1500  	}
129776ac2e3823 Jeff Hugo 2023-03-27  1501  
129776ac2e3823 Jeff Hugo 2023-03-27  1502  	resp = kmalloc(sizeof(*resp), GFP_ATOMIC);
129776ac2e3823 Jeff Hugo 2023-03-27  1503  	if (!resp) {
129776ac2e3823 Jeff Hugo 2023-03-27  1504  		kfree(msg);
129776ac2e3823 Jeff Hugo 2023-03-27  1505  		return;
129776ac2e3823 Jeff Hugo 2023-03-27  1506  	}
129776ac2e3823 Jeff Hugo 2023-03-27  1507  
129776ac2e3823 Jeff Hugo 2023-03-27  1508  	INIT_WORK(&resp->work, resp_worker);
129776ac2e3823 Jeff Hugo 2023-03-27  1509  	resp->qdev = qdev;
129776ac2e3823 Jeff Hugo 2023-03-27  1510  	resp->buf = msg;
129776ac2e3823 Jeff Hugo 2023-03-27  1511  	queue_work(qdev->cntl_wq, &resp->work);
129776ac2e3823 Jeff Hugo 2023-03-27  1512  }
129776ac2e3823 Jeff Hugo 2023-03-27  1513  
129776ac2e3823 Jeff Hugo 2023-03-27  1514  int qaic_control_open(struct qaic_device *qdev)
129776ac2e3823 Jeff Hugo 2023-03-27  1515  {
129776ac2e3823 Jeff Hugo 2023-03-27  1516  	if (!qdev->cntl_ch)
129776ac2e3823 Jeff Hugo 2023-03-27  1517  		return -ENODEV;
129776ac2e3823 Jeff Hugo 2023-03-27  1518  
129776ac2e3823 Jeff Hugo 2023-03-27  1519  	qdev->cntl_lost_buf = false;
129776ac2e3823 Jeff Hugo 2023-03-27  1520  	/*
129776ac2e3823 Jeff Hugo 2023-03-27  1521  	 * By default qaic should assume that device has CRC enabled.
129776ac2e3823 Jeff Hugo 2023-03-27  1522  	 * Qaic comes to know if device has CRC enabled or disabled during the
129776ac2e3823 Jeff Hugo 2023-03-27  1523  	 * device status transaction, which is the first transaction performed
129776ac2e3823 Jeff Hugo 2023-03-27  1524  	 * on control channel.
129776ac2e3823 Jeff Hugo 2023-03-27  1525  	 *
129776ac2e3823 Jeff Hugo 2023-03-27  1526  	 * So CRC validation of first device status transaction response is
129776ac2e3823 Jeff Hugo 2023-03-27  1527  	 * ignored (by calling valid_crc_stub) and is done later during decoding
129776ac2e3823 Jeff Hugo 2023-03-27  1528  	 * if device has CRC enabled.
129776ac2e3823 Jeff Hugo 2023-03-27  1529  	 * Now that qaic knows whether device has CRC enabled or not it acts
129776ac2e3823 Jeff Hugo 2023-03-27  1530  	 * accordingly.
129776ac2e3823 Jeff Hugo 2023-03-27  1531  	 */
129776ac2e3823 Jeff Hugo 2023-03-27  1532  	qdev->gen_crc = gen_crc;
129776ac2e3823 Jeff Hugo 2023-03-27  1533  	qdev->valid_crc = valid_crc_stub;
129776ac2e3823 Jeff Hugo 2023-03-27  1534  
129776ac2e3823 Jeff Hugo 2023-03-27  1535  	return mhi_prepare_for_transfer(qdev->cntl_ch);
129776ac2e3823 Jeff Hugo 2023-03-27  1536  }
129776ac2e3823 Jeff Hugo 2023-03-27  1537  
129776ac2e3823 Jeff Hugo 2023-03-27  1538  void qaic_control_close(struct qaic_device *qdev)
129776ac2e3823 Jeff Hugo 2023-03-27  1539  {
129776ac2e3823 Jeff Hugo 2023-03-27  1540  	mhi_unprepare_from_transfer(qdev->cntl_ch);
129776ac2e3823 Jeff Hugo 2023-03-27  1541  }
129776ac2e3823 Jeff Hugo 2023-03-27  1542  
129776ac2e3823 Jeff Hugo 2023-03-27  1543  void qaic_release_usr(struct qaic_device *qdev, struct qaic_user *usr)
129776ac2e3823 Jeff Hugo 2023-03-27  1544  {
129776ac2e3823 Jeff Hugo 2023-03-27  1545  	struct wire_trans_terminate_to_dev *trans;
129776ac2e3823 Jeff Hugo 2023-03-27  1546  	struct wrapper_list *wrappers;
129776ac2e3823 Jeff Hugo 2023-03-27  1547  	struct wrapper_msg *wrapper;
129776ac2e3823 Jeff Hugo 2023-03-27  1548  	struct wire_msg *msg;
129776ac2e3823 Jeff Hugo 2023-03-27  1549  	struct wire_msg *rsp;
129776ac2e3823 Jeff Hugo 2023-03-27  1550  
129776ac2e3823 Jeff Hugo 2023-03-27  1551  	wrappers = alloc_wrapper_list();
129776ac2e3823 Jeff Hugo 2023-03-27  1552  	if (!wrappers)
129776ac2e3823 Jeff Hugo 2023-03-27  1553  		return;
129776ac2e3823 Jeff Hugo 2023-03-27  1554  
129776ac2e3823 Jeff Hugo 2023-03-27  1555  	wrapper = add_wrapper(wrappers, sizeof(*wrapper) + sizeof(*msg) + sizeof(*trans));
129776ac2e3823 Jeff Hugo 2023-03-27  1556  	if (!wrapper)
129776ac2e3823 Jeff Hugo 2023-03-27  1557  		return;
129776ac2e3823 Jeff Hugo 2023-03-27  1558  
129776ac2e3823 Jeff Hugo 2023-03-27  1559  	msg = &wrapper->msg;
129776ac2e3823 Jeff Hugo 2023-03-27  1560  
129776ac2e3823 Jeff Hugo 2023-03-27  1561  	trans = (struct wire_trans_terminate_to_dev *)msg->data;
129776ac2e3823 Jeff Hugo 2023-03-27  1562  
129776ac2e3823 Jeff Hugo 2023-03-27  1563  	trans->hdr.type = cpu_to_le32(QAIC_TRANS_TERMINATE_TO_DEV);
129776ac2e3823 Jeff Hugo 2023-03-27  1564  	trans->hdr.len = cpu_to_le32(sizeof(*trans));
129776ac2e3823 Jeff Hugo 2023-03-27  1565  	trans->handle = cpu_to_le32(usr->handle);
129776ac2e3823 Jeff Hugo 2023-03-27  1566  
129776ac2e3823 Jeff Hugo 2023-03-27  1567  	mutex_lock(&qdev->cntl_mutex);
129776ac2e3823 Jeff Hugo 2023-03-27  1568  	wrapper->len = sizeof(msg->hdr) + sizeof(*trans);
129776ac2e3823 Jeff Hugo 2023-03-27  1569  	msg->hdr.magic_number = MANAGE_MAGIC_NUMBER;
129776ac2e3823 Jeff Hugo 2023-03-27  1570  	msg->hdr.sequence_number = cpu_to_le32(qdev->next_seq_num++);
129776ac2e3823 Jeff Hugo 2023-03-27  1571  	msg->hdr.len = cpu_to_le32(wrapper->len);
129776ac2e3823 Jeff Hugo 2023-03-27  1572  	msg->hdr.count = cpu_to_le32(1);
129776ac2e3823 Jeff Hugo 2023-03-27  1573  	msg->hdr.handle = cpu_to_le32(usr->handle);
129776ac2e3823 Jeff Hugo 2023-03-27  1574  	msg->hdr.padding = cpu_to_le32(0);
129776ac2e3823 Jeff Hugo 2023-03-27  1575  	msg->hdr.crc32 = cpu_to_le32(qdev->gen_crc(wrappers));
129776ac2e3823 Jeff Hugo 2023-03-27  1576  
129776ac2e3823 Jeff Hugo 2023-03-27  1577  	/*
129776ac2e3823 Jeff Hugo 2023-03-27  1578  	 * msg_xfer releases the mutex
129776ac2e3823 Jeff Hugo 2023-03-27  1579  	 * We don't care about the return of msg_xfer since we will not do
129776ac2e3823 Jeff Hugo 2023-03-27  1580  	 * anything different based on what happens.
129776ac2e3823 Jeff Hugo 2023-03-27  1581  	 * We ignore pending signals since one will be set if the user is
129776ac2e3823 Jeff Hugo 2023-03-27  1582  	 * killed, and we need give the device a chance to cleanup, otherwise
129776ac2e3823 Jeff Hugo 2023-03-27  1583  	 * DMA may still be in progress when we return.
129776ac2e3823 Jeff Hugo 2023-03-27  1584  	 */
129776ac2e3823 Jeff Hugo 2023-03-27  1585  	rsp = msg_xfer(qdev, wrappers, qdev->next_seq_num - 1, true);
129776ac2e3823 Jeff Hugo 2023-03-27  1586  	if (!IS_ERR(rsp))
129776ac2e3823 Jeff Hugo 2023-03-27  1587  		kfree(rsp);
129776ac2e3823 Jeff Hugo 2023-03-27  1588  	free_wrapper_from_list(wrappers, wrapper);
129776ac2e3823 Jeff Hugo 2023-03-27  1589  }
129776ac2e3823 Jeff Hugo 2023-03-27  1590  
129776ac2e3823 Jeff Hugo 2023-03-27  1591  void wake_all_cntl(struct qaic_device *qdev)
129776ac2e3823 Jeff Hugo 2023-03-27  1592  {
129776ac2e3823 Jeff Hugo 2023-03-27  1593  	struct xfer_queue_elem *elem;
129776ac2e3823 Jeff Hugo 2023-03-27  1594  	struct xfer_queue_elem *i;
129776ac2e3823 Jeff Hugo 2023-03-27  1595  
129776ac2e3823 Jeff Hugo 2023-03-27  1596  	mutex_lock(&qdev->cntl_mutex);
129776ac2e3823 Jeff Hugo 2023-03-27  1597  	list_for_each_entry_safe(elem, i, &qdev->cntl_xfer_list, list) {
129776ac2e3823 Jeff Hugo 2023-03-27  1598  		list_del_init(&elem->list);
129776ac2e3823 Jeff Hugo 2023-03-27  1599  		complete_all(&elem->xfer_done);
129776ac2e3823 Jeff Hugo 2023-03-27  1600  	}
129776ac2e3823 Jeff Hugo 2023-03-27  1601  	mutex_unlock(&qdev->cntl_mutex);
129776ac2e3823 Jeff Hugo 2023-03-27 @1602  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
