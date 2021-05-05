Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E89F373864
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 12:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992A86E12A;
	Wed,  5 May 2021 10:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9C26E043
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 10:11:25 +0000 (UTC)
IronPort-SDR: rrXjvbWicy81IuPvGRgh9TPNMR1AehG1EbQGcHhnzkJoRsQkVw+k2n/fbpq/UqYkuUM7YZHjys
 VLSEKUpc4fDA==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="219028103"
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
 d="gz'50?scan'50,208,50";a="219028103"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2021 03:11:24 -0700
IronPort-SDR: ovAetEJldZAos3Ri+PIp94JX0Muz3lfK7rA4C0uuLwNG+LQJsPsFBMtQsgsfAzGFZ/jFnpypyU
 51p/PNlkBfLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,274,1613462400"; 
 d="gz'50?scan'50,208,50";a="406491024"
Received: from lkp-server01.sh.intel.com (HELO a48ff7ddd223) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 05 May 2021 03:11:22 -0700
Received: from kbuild by a48ff7ddd223 with local (Exim 4.92)
 (envelope-from <lkp@intel.com>)
 id 1leEUz-0009wf-HU; Wed, 05 May 2021 10:11:21 +0000
Date: Wed, 5 May 2021 18:10:26 +0800
From: kernel test robot <lkp@intel.com>
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 5/6] drm/vmwgfx: Add basic support for SVGA3
Message-ID: <202105051851.zfhpTpQn-lkp@intel.com>
References: <20210505035740.286923-6-zackr@vmware.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="Dxnq1zWXvFF0Q93v"
Content-Disposition: inline
In-Reply-To: <20210505035740.286923-6-zackr@vmware.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sroland@vmware.com, krastevm@vmware.com, kbuild-all@lists.01.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Zack,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-tip/drm-tip]
[also build test WARNING on linus/master next-20210505]
[cannot apply to drm-intel/for-linux-next drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next drm/drm-next v5.12]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Zack-Rusin/drm-vmwgfx-SVGA-v3-and-arm64-support/20210505-120026
base:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
config: x86_64-randconfig-c003-20210505 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build):
        # https://github.com/0day-ci/linux/commit/4acf63c8eca79f6073ada0994b0e2a03c8fcfb71
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Zack-Rusin/drm-vmwgfx-SVGA-v3-and-arm64-support/20210505-120026
        git checkout 4acf63c8eca79f6073ada0994b0e2a03c8fcfb71
        # save the attached .config to linux build tree
        make W=1 W=1 ARCH=x86_64 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:477: warning: expecting prototype for vmw_fifo_commit_flush(). Prototype was for vmw_cmd_commit_flush() instead
   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:492: warning: expecting prototype for vmw_fifo_flush(). Prototype was for vmw_cmd_flush() instead
>> drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:650: warning: expecting prototype for vmw_cmd_emit_dummy_gb_query(). Prototype was for vmw_cmd_emit_dummy_query() instead
   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:667: warning: Function parameter or member 'vmw' not described in 'vmw_cmd_supported'
   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:667: warning: Excess function parameter 'dev_priv' description in 'vmw_cmd_supported'


cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c:674:25-26: WARNING comparing pointer to 0

Please review and possibly fold the followup patch.

vim +650 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c

3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  468  
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  469  
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  470  /**
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  471   * vmw_fifo_commit_flush - Commit fifo space and flush any buffered commands.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  472   *
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  473   * @dev_priv: Pointer to device private structure.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  474   * @bytes: Number of bytes to commit.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  475   */
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-11-18  476  void vmw_cmd_commit_flush(struct vmw_private *dev_priv, uint32_t bytes)
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25 @477  {
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  478  	if (dev_priv->cman)
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  479  		vmw_cmdbuf_commit(dev_priv->cman, bytes, NULL, true);
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  480  	else
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  481  		vmw_local_fifo_commit(dev_priv, bytes);
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  482  }
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  483  
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  484  /**
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  485   * vmw_fifo_flush - Flush any buffered commands and make sure command processing
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  486   * starts.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  487   *
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  488   * @dev_priv: Pointer to device private structure.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  489   * @interruptible: Whether to wait interruptible if function needs to sleep.
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  490   */
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-11-18  491  int vmw_cmd_flush(struct vmw_private *dev_priv, bool interruptible)
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  492  {
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  493  	might_sleep();
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  494  
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  495  	if (dev_priv->cman)
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  496  		return vmw_cmdbuf_cur_flush(dev_priv->cman, interruptible);
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  497  	else
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  498  		return 0;
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  499  }
3eab3d9eef6504 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-25  500  
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-11-18  501  int vmw_cmd_send_fence(struct vmw_private *dev_priv, uint32_t *seqno)
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  502  {
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  503  	struct svga_fifo_cmd_fence *cmd_fence;
b9eb1a6174e58e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-04-02  504  	u32 *fm;
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  505  	int ret = 0;
b9eb1a6174e58e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-04-02  506  	uint32_t bytes = sizeof(u32) + sizeof(*cmd_fence);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  507  
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-11-18  508  	fm = VMW_CMD_RESERVE(dev_priv, bytes);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  509  	if (unlikely(fm == NULL)) {
6bcd8d3c782b7b drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-09-01  510  		*seqno = atomic_read(&dev_priv->marker_seq);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  511  		ret = -ENOMEM;
6bcd8d3c782b7b drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-09-01  512  		(void)vmw_fallback_wait(dev_priv, false, true, *seqno,
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  513  					false, 3*HZ);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  514  		goto out_err;
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  515  	}
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  516  
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  517  	do {
6bcd8d3c782b7b drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-09-01  518  		*seqno = atomic_add_return(1, &dev_priv->marker_seq);
6bcd8d3c782b7b drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-09-01  519  	} while (*seqno == 0);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  520  
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  521  	if (!(vmw_fifo_caps(dev_priv) & SVGA_FIFO_CAP_FENCE)) {
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  522  
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  523  		/*
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  524  		 * Don't request hardware to send a fence. The
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  525  		 * waiting code in vmwgfx_irq.c will emulate this.
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  526  		 */
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  527  
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-11-18  528  		vmw_cmd_commit(dev_priv, 0);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  529  		return 0;
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  530  	}
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  531  
b9eb1a6174e58e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-04-02  532  	*fm++ = SVGA_CMD_FENCE;
b9eb1a6174e58e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-04-02  533  	cmd_fence = (struct svga_fifo_cmd_fence *) fm;
b9eb1a6174e58e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-04-02  534  	cmd_fence->fence = *seqno;
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-11-18  535  	vmw_cmd_commit_flush(dev_priv, bytes);
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  536  	vmw_update_seqno(dev_priv);
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  537  
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  538  out_err:
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  539  	return ret;
fb1d9738ca053e drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Jakob Bornecrantz 2009-12-10  540  }
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  541  
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  542  /**
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  543   * vmw_cmd_emit_dummy_legacy_query - emits a dummy query to the fifo using
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  544   * legacy query commands.
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  545   *
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  546   * @dev_priv: The device private structure.
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  547   * @cid: The hardware context id used for the query.
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  548   *
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  549   * See the vmw_cmd_emit_dummy_query documentation.
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  550   */
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  551  static int vmw_cmd_emit_dummy_legacy_query(struct vmw_private *dev_priv,
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  552  					    uint32_t cid)
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  553  {
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  554  	/*
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  555  	 * A query wait without a preceding query end will
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  556  	 * actually finish all queries for this cid
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  557  	 * without writing to the query result structure.
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  558  	 */
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  559  
459d0fa7359654 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-26  560  	struct ttm_buffer_object *bo = &dev_priv->dummy_query_bo->base;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  561  	struct {
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  562  		SVGA3dCmdHeader header;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  563  		SVGA3dCmdWaitForQuery body;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  564  	} *cmd;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  565  
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-11-18  566  	cmd = VMW_CMD_RESERVE(dev_priv, sizeof(*cmd));
11c454196610ae drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Deepak Rawat      2019-02-14  567  	if (unlikely(cmd == NULL))
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  568  		return -ENOMEM;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  569  
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  570  	cmd->header.id = SVGA_3D_CMD_WAIT_FOR_QUERY;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  571  	cmd->header.size = sizeof(cmd->body);
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  572  	cmd->body.cid = cid;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  573  	cmd->body.type = SVGA3D_QUERYTYPE_OCCLUSION;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  574  
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  575  	if (bo->mem.mem_type == TTM_PL_VRAM) {
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  576  		cmd->body.guestResult.gmrId = SVGA_GMR_FRAMEBUFFER;
0b17fc08e396d0 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Nirmoy Das        2020-06-24  577  		cmd->body.guestResult.offset = bo->mem.start << PAGE_SHIFT;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  578  	} else {
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  579  		cmd->body.guestResult.gmrId = bo->mem.start;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  580  		cmd->body.guestResult.offset = 0;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  581  	}
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  582  
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-11-18  583  	vmw_cmd_commit(dev_priv, sizeof(*cmd));
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  584  
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  585  	return 0;
e2fa3a76839ada drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2011-10-04  586  }
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  587  
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  588  /**
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  589   * vmw_cmd_emit_dummy_gb_query - emits a dummy query to the fifo using
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  590   * guest-backed resource query commands.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  591   *
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  592   * @dev_priv: The device private structure.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  593   * @cid: The hardware context id used for the query.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  594   *
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  595   * See the vmw_cmd_emit_dummy_query documentation.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  596   */
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  597  static int vmw_cmd_emit_dummy_gb_query(struct vmw_private *dev_priv,
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  598  				       uint32_t cid)
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  599  {
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  600  	/*
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  601  	 * A query wait without a preceding query end will
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  602  	 * actually finish all queries for this cid
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  603  	 * without writing to the query result structure.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  604  	 */
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  605  
459d0fa7359654 drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2015-06-26  606  	struct ttm_buffer_object *bo = &dev_priv->dummy_query_bo->base;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  607  	struct {
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  608  		SVGA3dCmdHeader header;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  609  		SVGA3dCmdWaitForGBQuery body;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  610  	} *cmd;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  611  
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-11-18  612  	cmd = VMW_CMD_RESERVE(dev_priv, sizeof(*cmd));
11c454196610ae drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Deepak Rawat      2019-02-14  613  	if (unlikely(cmd == NULL))
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  614  		return -ENOMEM;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  615  
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  616  	cmd->header.id = SVGA_3D_CMD_WAIT_FOR_GB_QUERY;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  617  	cmd->header.size = sizeof(cmd->body);
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  618  	cmd->body.cid = cid;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  619  	cmd->body.type = SVGA3D_QUERYTYPE_OCCLUSION;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  620  	BUG_ON(bo->mem.mem_type != VMW_PL_MOB);
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  621  	cmd->body.mobid = bo->mem.start;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  622  	cmd->body.offset = 0;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  623  
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-11-18  624  	vmw_cmd_commit(dev_priv, sizeof(*cmd));
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  625  
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  626  	return 0;
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  627  }
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  628  
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  629  
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  630  /**
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  631   * vmw_cmd_emit_dummy_gb_query - emits a dummy query to the fifo using
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  632   * appropriate resource query commands.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  633   *
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  634   * @dev_priv: The device private structure.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  635   * @cid: The hardware context id used for the query.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  636   *
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  637   * This function is used to emit a dummy occlusion query with
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  638   * no primitives rendered between query begin and query end.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  639   * It's used to provide a query barrier, in order to know that when
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  640   * this query is finished, all preceding queries are also finished.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  641   *
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  642   * A Query results structure should have been initialized at the start
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  643   * of the dev_priv->dummy_query_bo buffer object. And that buffer object
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  644   * must also be either reserved or pinned when this function is called.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  645   *
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  646   * Returns -ENOMEM on failure to reserve fifo space.
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  647   */
8426ed9c4b42f4 drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2020-11-18  648  int vmw_cmd_emit_dummy_query(struct vmw_private *dev_priv,
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  649  			      uint32_t cid)
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21 @650  {
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  651  	if (dev_priv->has_mob)
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  652  		return vmw_cmd_emit_dummy_gb_query(dev_priv, cid);
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  653  
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  654  	return vmw_cmd_emit_dummy_legacy_query(dev_priv, cid);
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  655  }
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  656  
ddcda24e3bec1d drivers/gpu/drm/vmwgfx/vmwgfx_fifo.c Thomas Hellstrom  2012-11-21  657  
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  658  /**
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  659   * vmw_cmd_supported - returns true if the given device supports
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  660   * command queues.
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  661   *
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  662   * @dev_priv: The device private structure.
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  663   *
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  664   * Returns true if we can issue commands.
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  665   */
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  666  bool vmw_cmd_supported(struct vmw_private *vmw)
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  667  {
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  668  	if ((vmw->capabilities & (SVGA_CAP_COMMAND_BUFFERS |
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  669  				  SVGA_CAP_CMD_BUFFERS_2)) != 0)
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  670  		return true;
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  671  	/*
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  672  	 * We have FIFO cmd's
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04  673  	 */
4acf63c8eca79f drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c  Zack Rusin        2021-05-04 @674  	return vmw->fifo_mem != 0;

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--Dxnq1zWXvFF0Q93v
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--Dxnq1zWXvFF0Q93v
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--Dxnq1zWXvFF0Q93v--
