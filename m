Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5384AAA65A5
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 23:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF6C10E891;
	Thu,  1 May 2025 21:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KgLTQLJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6999010E891
 for <dri-devel@lists.freedesktop.org>; Thu,  1 May 2025 21:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746135244; x=1777671244;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=MJ41/j8bpvaKo0HV0EhEkS4sZ3w9r/QdKBwub0mVVWk=;
 b=KgLTQLJG+30NGHMfmFYL+K4NMFmen0WOiiIX8wb2/g8B+HCqN09cifui
 goF9RGaQ9VEzEhXRjScNo8hQy5svPDL1tYj/7rZaW7NderFkvtc9TY0jH
 7g5bAdFZSZIswztx9OAJA/7zrZpCoIJv55w/EerY01sadAj9WtJ/WKZds
 6L2mOkShR0EZty46FVVz1mPNM59ttzvnTMF5mhr9Ena6iMXPIyHbXl+Rq
 8154c9CW0mRx3GnjFUeKlPnqNgPj9AjUrOpjcAx+kEXOOIxgNfsPwwDiq
 nmmZi2QBwfrH6kK+UfSbG7f14lM+aqGLM6ygRqiFVV3Q9eLlpMP5i+Kwk A==;
X-CSE-ConnectionGUID: ouB4uZmuSuaMzPSFpVX1OQ==
X-CSE-MsgGUID: UoUOn25QSA+drw30at8s2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47829713"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="47829713"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2025 14:33:57 -0700
X-CSE-ConnectionGUID: F8wQRuLNTAWrT0Ov51Y8Eg==
X-CSE-MsgGUID: /qhBleJETD2qEdsgvLYhCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; d="scan'208";a="135462245"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
 by orviesa008.jf.intel.com with ESMTP; 01 May 2025 14:33:52 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
 (envelope-from <lkp@intel.com>) id 1uAbXS-0004Oz-1u;
 Thu, 01 May 2025 21:33:50 +0000
Date: Fri, 2 May 2025 05:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: oushixiong1025@163.com, Sumit Semwal <sumit.semwal@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 Shixiong Ou <oushixiong@kylinos.cn>
Subject: Re: [PATCH 1/3] dma-buf: add flags to skip map_dma_buf() for some
 drivers
Message-ID: <202505020434.7EfUIAjh-lkp@intel.com>
References: <20250430085658.540746-1-oushixiong1025@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250430085658.540746-1-oushixiong1025@163.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on char-misc/char-misc-testing char-misc/char-misc-next char-misc/char-misc-linus usb/usb-testing usb/usb-next usb/usb-linus xen-tip/linux-next linus/master v6.15-rc4]
[cannot apply to tegra/for-next drm-xe/drm-xe-next rmk-arm/drm-armada-devel rmk-arm/drm-armada-fixes next-20250430]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/oushixiong1025-163-com/drm-prime-Support-importing-DMA-BUF-without-sg_table/20250430-170136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20250430085658.540746-1-oushixiong1025%40163.com
patch subject: [PATCH 1/3] dma-buf: add flags to skip map_dma_buf() for some drivers
config: arc-randconfig-002-20250501 (https://download.01.org/0day-ci/archive/20250502/202505020434.7EfUIAjh-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020434.7EfUIAjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505020434.7EfUIAjh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/dma-buf/dma-buf.c:908: warning: Function parameter or struct member 'skip_map' not described in 'dma_buf_dynamic_attach'
>> drivers/dma-buf/dma-buf.c:996: warning: Function parameter or struct member 'skip_map' not described in 'dma_buf_attach'


vim +908 drivers/dma-buf/dma-buf.c

84335675f2223c drivers/dma-buf/dma-buf.c Simona Vetter    2021-01-15   817  
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   818  /**
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   819   * DOC: locking convention
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   820   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   821   * In order to avoid deadlock situations between dma-buf exports and importers,
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   822   * all dma-buf API users must follow the common dma-buf locking convention.
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   823   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   824   * Convention for importers
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   825   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   826   * 1. Importers must hold the dma-buf reservation lock when calling these
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   827   *    functions:
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   828   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   829   *     - dma_buf_pin()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   830   *     - dma_buf_unpin()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   831   *     - dma_buf_map_attachment()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   832   *     - dma_buf_unmap_attachment()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   833   *     - dma_buf_vmap()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   834   *     - dma_buf_vunmap()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   835   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   836   * 2. Importers must not hold the dma-buf reservation lock when calling these
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   837   *    functions:
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   838   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   839   *     - dma_buf_attach()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   840   *     - dma_buf_dynamic_attach()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   841   *     - dma_buf_detach()
e3ecbd21776f1f drivers/dma-buf/dma-buf.c Maíra Canal      2023-02-23   842   *     - dma_buf_export()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   843   *     - dma_buf_fd()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   844   *     - dma_buf_get()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   845   *     - dma_buf_put()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   846   *     - dma_buf_mmap()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   847   *     - dma_buf_begin_cpu_access()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   848   *     - dma_buf_end_cpu_access()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   849   *     - dma_buf_map_attachment_unlocked()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   850   *     - dma_buf_unmap_attachment_unlocked()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   851   *     - dma_buf_vmap_unlocked()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   852   *     - dma_buf_vunmap_unlocked()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   853   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   854   * Convention for exporters
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   855   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   856   * 1. These &dma_buf_ops callbacks are invoked with unlocked dma-buf
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   857   *    reservation and exporter can take the lock:
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   858   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   859   *     - &dma_buf_ops.attach()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   860   *     - &dma_buf_ops.detach()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   861   *     - &dma_buf_ops.release()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   862   *     - &dma_buf_ops.begin_cpu_access()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   863   *     - &dma_buf_ops.end_cpu_access()
8021fa16b7ec0a drivers/dma-buf/dma-buf.c Dmitry Osipenko  2023-05-30   864   *     - &dma_buf_ops.mmap()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   865   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   866   * 2. These &dma_buf_ops callbacks are invoked with locked dma-buf
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   867   *    reservation and exporter can't take the lock:
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   868   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   869   *     - &dma_buf_ops.pin()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   870   *     - &dma_buf_ops.unpin()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   871   *     - &dma_buf_ops.map_dma_buf()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   872   *     - &dma_buf_ops.unmap_dma_buf()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   873   *     - &dma_buf_ops.vmap()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   874   *     - &dma_buf_ops.vunmap()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   875   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   876   * 3. Exporters must hold the dma-buf reservation lock when calling these
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   877   *    functions:
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   878   *
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   879   *     - dma_buf_move_notify()
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   880   */
ae2e7f28a170c0 drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   881  
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   882  /**
85804b70cca68d drivers/dma-buf/dma-buf.c Simona Vetter    2020-12-11   883   * dma_buf_dynamic_attach - Add the device to dma_buf's attachments list
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   884   * @dmabuf:		[in]	buffer to attach device to.
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   885   * @dev:		[in]	device to be attached.
6f49c2515e2258 drivers/dma-buf/dma-buf.c Randy Dunlap     2020-04-07   886   * @importer_ops:	[in]	importer operations for the attachment
6f49c2515e2258 drivers/dma-buf/dma-buf.c Randy Dunlap     2020-04-07   887   * @importer_priv:	[in]	importer private pointer for the attachment
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   888   *
2904a8c1311f02 drivers/dma-buf/dma-buf.c Simona Vetter    2016-12-09   889   * Returns struct dma_buf_attachment pointer for this attachment. Attachments
2904a8c1311f02 drivers/dma-buf/dma-buf.c Simona Vetter    2016-12-09   890   * must be cleaned up by calling dma_buf_detach().
2904a8c1311f02 drivers/dma-buf/dma-buf.c Simona Vetter    2016-12-09   891   *
85804b70cca68d drivers/dma-buf/dma-buf.c Simona Vetter    2020-12-11   892   * Optionally this calls &dma_buf_ops.attach to allow device-specific attach
85804b70cca68d drivers/dma-buf/dma-buf.c Simona Vetter    2020-12-11   893   * functionality.
85804b70cca68d drivers/dma-buf/dma-buf.c Simona Vetter    2020-12-11   894   *
2904a8c1311f02 drivers/dma-buf/dma-buf.c Simona Vetter    2016-12-09   895   * Returns:
2904a8c1311f02 drivers/dma-buf/dma-buf.c Simona Vetter    2016-12-09   896   *
2904a8c1311f02 drivers/dma-buf/dma-buf.c Simona Vetter    2016-12-09   897   * A pointer to newly created &dma_buf_attachment on success, or a negative
2904a8c1311f02 drivers/dma-buf/dma-buf.c Simona Vetter    2016-12-09   898   * error code wrapped into a pointer on failure.
2904a8c1311f02 drivers/dma-buf/dma-buf.c Simona Vetter    2016-12-09   899   *
2904a8c1311f02 drivers/dma-buf/dma-buf.c Simona Vetter    2016-12-09   900   * Note that this can fail if the backing storage of @dmabuf is in a place not
2904a8c1311f02 drivers/dma-buf/dma-buf.c Simona Vetter    2016-12-09   901   * accessible to @dev, and cannot be moved to a more suitable place. This is
2904a8c1311f02 drivers/dma-buf/dma-buf.c Simona Vetter    2016-12-09   902   * indicated with the error code -EBUSY.
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   903   */
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   904  struct dma_buf_attachment *
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   905  dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct device *dev,
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   906  		       const struct dma_buf_attach_ops *importer_ops,
8935ae05eee351 drivers/dma-buf/dma-buf.c Shixiong Ou      2025-04-30   907  		       void *importer_priv, bool skip_map)
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  @908  {
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   909  	struct dma_buf_attachment *attach;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   910  	int ret;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   911  
d1aa06a1eaf5f7 drivers/base/dma-buf.c    Laurent Pinchart 2012-01-26   912  	if (WARN_ON(!dmabuf || !dev))
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   913  		return ERR_PTR(-EINVAL);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   914  
4981cdb063e3e9 drivers/dma-buf/dma-buf.c Christian König  2020-02-19   915  	if (WARN_ON(importer_ops && !importer_ops->move_notify))
4981cdb063e3e9 drivers/dma-buf/dma-buf.c Christian König  2020-02-19   916  		return ERR_PTR(-EINVAL);
4981cdb063e3e9 drivers/dma-buf/dma-buf.c Christian König  2020-02-19   917  
db7942b6292306 drivers/dma-buf/dma-buf.c Markus Elfring   2017-05-08   918  	attach = kzalloc(sizeof(*attach), GFP_KERNEL);
34d84ec4881d13 drivers/dma-buf/dma-buf.c Markus Elfring   2017-05-08   919  	if (!attach)
a9fbc3b73127ef drivers/base/dma-buf.c    Laurent Pinchart 2012-01-26   920  		return ERR_PTR(-ENOMEM);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   921  
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   922  	attach->dev = dev;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   923  	attach->dmabuf = dmabuf;
09606b5446c25b drivers/dma-buf/dma-buf.c Christian König  2018-03-22   924  	if (importer_ops)
09606b5446c25b drivers/dma-buf/dma-buf.c Christian König  2018-03-22   925  		attach->peer2peer = importer_ops->allow_peer2peer;
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   926  	attach->importer_ops = importer_ops;
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   927  	attach->importer_priv = importer_priv;
2ed9201bdd9a8e drivers/base/dma-buf.c    Laurent Pinchart 2012-01-26   928  
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   929  	if (dmabuf->ops->attach) {
a19741e5e5a9f1 drivers/dma-buf/dma-buf.c Christian König  2018-05-28   930  		ret = dmabuf->ops->attach(dmabuf, attach);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   931  		if (ret)
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   932  			goto err_attach;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   933  	}
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   934  	dma_resv_lock(dmabuf->resv, NULL);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   935  	list_add(&attach->node, &dmabuf->attachments);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   936  	dma_resv_unlock(dmabuf->resv);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   937  
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   938  	/* When either the importer or the exporter can't handle dynamic
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   939  	 * mappings we cache the mapping here to avoid issues with the
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   940  	 * reservation object lock.
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   941  	 */
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   942  	if (dma_buf_attachment_is_dynamic(attach) !=
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   943  	    dma_buf_is_dynamic(dmabuf)) {
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   944  		dma_resv_lock(attach->dmabuf->resv, NULL);
809d9c72c2f83e drivers/dma-buf/dma-buf.c Dmitry Osipenko  2022-10-17   945  		if (dma_buf_is_dynamic(attach->dmabuf)) {
7e008b02557cce drivers/dma-buf/dma-buf.c Christian König  2021-05-17   946  			ret = dmabuf->ops->pin(attach);
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   947  			if (ret)
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   948  				goto err_unlock;
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   949  		}
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   950  
8935ae05eee351 drivers/dma-buf/dma-buf.c Shixiong Ou      2025-04-30   951  		if (!skip_map) {
8935ae05eee351 drivers/dma-buf/dma-buf.c Shixiong Ou      2025-04-30   952  			struct sg_table *sgt;
8935ae05eee351 drivers/dma-buf/dma-buf.c Shixiong Ou      2025-04-30   953  
84335675f2223c drivers/dma-buf/dma-buf.c Simona Vetter    2021-01-15   954  			sgt = __map_dma_buf(attach, DMA_BIDIRECTIONAL);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   955  			if (!sgt)
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   956  				sgt = ERR_PTR(-ENOMEM);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   957  			if (IS_ERR(sgt)) {
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   958  				ret = PTR_ERR(sgt);
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   959  				goto err_unpin;
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   960  			}
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   961  			attach->sgt = sgt;
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   962  			attach->dir = DMA_BIDIRECTIONAL;
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   963  		}
8935ae05eee351 drivers/dma-buf/dma-buf.c Shixiong Ou      2025-04-30   964  		dma_resv_unlock(attach->dmabuf->resv);
8935ae05eee351 drivers/dma-buf/dma-buf.c Shixiong Ou      2025-04-30   965  	}
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   966  
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   967  	return attach;
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   968  
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   969  err_attach:
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   970  	kfree(attach);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   971  	return ERR_PTR(ret);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   972  
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   973  err_unpin:
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   974  	if (dma_buf_is_dynamic(attach->dmabuf))
7e008b02557cce drivers/dma-buf/dma-buf.c Christian König  2021-05-17   975  		dmabuf->ops->unpin(attach);
bb42df4662a447 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   976  
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   977  err_unlock:
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   978  	dma_resv_unlock(attach->dmabuf->resv);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   979  
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   980  	dma_buf_detach(dmabuf, attach);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   981  	return ERR_PTR(ret);
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   982  }
cdd30ebb1b9f36 drivers/dma-buf/dma-buf.c Peter Zijlstra   2024-12-02   983  EXPORT_SYMBOL_NS_GPL(dma_buf_dynamic_attach, "DMA_BUF");
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   984  
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   985  /**
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   986   * dma_buf_attach - Wrapper for dma_buf_dynamic_attach
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   987   * @dmabuf:	[in]	buffer to attach device to.
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   988   * @dev:	[in]	device to be attached.
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   989   *
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   990   * Wrapper to call dma_buf_dynamic_attach() for drivers which still use a static
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   991   * mapping.
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   992   */
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03   993  struct dma_buf_attachment *dma_buf_attach(struct dma_buf *dmabuf,
8935ae05eee351 drivers/dma-buf/dma-buf.c Shixiong Ou      2025-04-30   994  					  struct device *dev,
8935ae05eee351 drivers/dma-buf/dma-buf.c Shixiong Ou      2025-04-30   995  					  bool skip_map)
15fd552d186cb0 drivers/dma-buf/dma-buf.c Christian König  2018-07-03  @996  {
8935ae05eee351 drivers/dma-buf/dma-buf.c Shixiong Ou      2025-04-30   997  	return dma_buf_dynamic_attach(dmabuf, dev, NULL, NULL, skip_map);
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26   998  }
cdd30ebb1b9f36 drivers/dma-buf/dma-buf.c Peter Zijlstra   2024-12-02   999  EXPORT_SYMBOL_NS_GPL(dma_buf_attach, "DMA_BUF");
d15bd7ee445d07 drivers/base/dma-buf.c    Sumit Semwal     2011-12-26  1000  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
