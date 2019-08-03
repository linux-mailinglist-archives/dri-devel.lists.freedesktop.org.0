Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0749380601
	for <lists+dri-devel@lfdr.de>; Sat,  3 Aug 2019 13:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 679546E4A0;
	Sat,  3 Aug 2019 11:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522746E49E;
 Sat,  3 Aug 2019 11:26:46 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Aug 2019 04:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,342,1559545200"; 
 d="gz'50?scan'50,208,50";a="348654612"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga005.jf.intel.com with ESMTP; 03 Aug 2019 04:26:43 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1htsBP-0008BO-8a; Sat, 03 Aug 2019 19:26:43 +0800
Date: Sat, 3 Aug 2019 19:25:44 +0800
From: kbuild test robot <lkp@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 2/2] drm/syncobj: Lookup the syncobj with RCU protection
Message-ID: <201908031932.wVZZ7h5V%lkp@intel.com>
References: <20190802163659.23255-2-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190802163659.23255-2-chris@chris-wilson.co.uk>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 kbuild-all@01.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Chris,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.3-rc2 next-20190802]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Chris-Wilson/drm-syncobj-Convert-syncobj_idr-to-XArray/20190803-170547
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   include/linux/skbuff.h:893: warning: Function parameter or member 'reserved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'inner_ipproto' not described in 'sk_buff'
   include/net/sock.h:233: warning: Function parameter or member 'skc_addrpair' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_portpair' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_ipv6only' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_net_refcnt' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_v6_daddr' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_v6_rcv_saddr' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_cookie' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_listener' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_tw_dr' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_rcv_wnd' not described in 'sock_common'
   include/net/sock.h:233: warning: Function parameter or member 'skc_tw_rcv_nxt' not described in 'sock_common'
   include/net/sock.h:515: warning: Function parameter or member 'sk_rx_skb_cache' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_wq_raw' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'tcp_rtx_queue' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_tx_skb_cache' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_route_forced_caps' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_txtime_report_errors' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_validate_xmit_skb' not described in 'sock'
   include/net/sock.h:515: warning: Function parameter or member 'sk_bpf_storage' not described in 'sock'
   include/net/sock.h:2439: warning: Function parameter or member 'tcp_rx_skb_cache_key' not described in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2439: warning: Excess function parameter 'sk' description in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2439: warning: Excess function parameter 'skb' description in 'DECLARE_STATIC_KEY_FALSE'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'gso_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'l3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'xfrmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'tlsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'name_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'ieee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'mpls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'xdp_prog' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'gro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'nf_hooks_ingress' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member '____cacheline_aligned_in_smp' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'qdisc_hash' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'xps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2040: warning: Function parameter or member 'xps_rxqs_map' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'
   drivers/net/phy/phylink.c:593: warning: Function parameter or member 'config' not described in 'phylink_create'
   drivers/net/phy/phylink.c:593: warning: Excess function parameter 'ndev' description in 'phylink_create'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'quotactl' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'quota_on' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'sb_free_mnt_opts' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'sb_eat_lsm_opts' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'sb_kern_mount' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'sb_show_options' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'sb_add_mnt_opt' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'd_instantiate' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'getprocattr' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1811: warning: Function parameter or member 'setprocattr' not described in 'security_list_options'
   drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c:142: warning: Function parameter or member 'blockable' not described in 'amdgpu_mn_read_lock'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:347: warning: cannot understand function prototype: 'struct amdgpu_vm_pt_cursor '
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:348: warning: cannot understand function prototype: 'struct amdgpu_vm_pt_cursor '
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:494: warning: Function parameter or member 'start' not described in 'amdgpu_vm_pt_first_dfs'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'adev' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'vm' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'start' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'cursor' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:546: warning: Function parameter or member 'entry' not described in 'for_each_amdgpu_vm_pt_dfs_safe'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:823: warning: Function parameter or member 'level' not described in 'amdgpu_vm_bo_param'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'params' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'bo' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'level' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'pe' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'addr' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'count' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'incr' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:1285: warning: Function parameter or member 'flags' not described in 'amdgpu_vm_update_flags'
   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:2822: warning: Function parameter or member 'pasid' not described in 'amdgpu_vm_make_compute'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:378: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:379: warning: Function parameter or member 'ih' not described in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c:379: warning: Excess function parameter 'entry' description in 'amdgpu_irq_dispatch'
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c:1: warning: 'pp_dpm_sclk pp_dpm_mclk pp_dpm_pcie' not found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:131: warning: Incorrect use of kernel-doc format:          * @atomic_obj
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:237: warning: Incorrect use of kernel-doc format:          * gpu_info FW provided soc bounding box struct or 0 if not
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:242: warning: Function parameter or member 'atomic_obj' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:242: warning: Function parameter or member 'backlight_link' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:242: warning: Function parameter or member 'backlight_caps' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:242: warning: Function parameter or member 'freesync_module' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:242: warning: Function parameter or member 'fw_dmcu' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:242: warning: Function parameter or member 'dmcu_fw_version' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:242: warning: Function parameter or member 'soc_bounding_box' not described in 'amdgpu_display_manager'
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: 'dm_pflip_high_irq' not found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: 'dm_crtc_high_irq' not found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: 'register_hpd_handlers' not found
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_pin' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_unpin' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_res_obj' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_get_sg_table' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_import_sg_table' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_vmap' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_vunmap' not described in 'drm_driver'
   include/drm/drm_drv.h:722: warning: Function parameter or member 'gem_prime_mmap' not described in 'drm_driver'
   include/drm/drm_modeset_helper_vtables.h:1053: warning: Function parameter or member 'prepare_writeback_job' not described in 'drm_connector_helper_funcs'
   include/drm/drm_modeset_helper_vtables.h:1053: warning: Function parameter or member 'cleanup_writeback_job' not described in 'drm_connector_helper_funcs'
   include/drm/drm_atomic_state_helper.h:1: warning: no structured comments found
>> include/drm/drm_syncobj.h:67: warning: Function parameter or member 'rcu' not described in 'drm_syncobj'
   include/net/cfg80211.h:1092: warning: Function parameter or member 'txpwr' not described in 'station_parameters'
   include/net/mac80211.h:4043: warning: Function parameter or member 'sta_set_txpwr' not described in 'ieee80211_ops'
   Documentation/admin-guide/xfs.rst:257: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/uapi/linux/firewire-cdev.h:312: WARNING: Inline literal start-string without end-string.
   drivers/firewire/core-transaction.c:606: WARNING: Inline strong start-string without end-string.
   drivers/message/fusion/mptbase.c:5057: WARNING: Definition list ends without a blank line; unexpected unindent.
   drivers/tty/serial/serial_core.c:1964: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/index.rst:94: WARNING: toctree contains reference to nonexisting document 'virtual/index'
   Documentation/crypto/crypto_engine.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
   Documentation/kbuild/makefiles.rst:1142: WARNING: Inline emphasis start-string without end-string.
   Documentation/kbuild/makefiles.rst:1152: WARNING: Inline emphasis start-string without end-string.
   Documentation/kbuild/makefiles.rst:1154: WARNING: Inline emphasis start-string without end-string.
   include/linux/i2c.h:522: WARNING: Inline strong start-string without end-string.
   include/linux/regulator/driver.h:284: WARNING: Unknown target name: "regulator_regmap_x_voltage".
   include/linux/spi/spi.h:382: WARNING: Unexpected indentation.
   fs/seq_file.c:40: WARNING: Inline strong start-string without end-string.
   fs/seq_file.c:40: WARNING: Inline strong start-string without end-string.
   fs/seq_file.c:40: WARNING: Inline strong start-string without end-string.
   fs/seq_file.c:40: WARNING: Inline strong start-string without end-string.
   fs/posix_acl.c:636: WARNING: Inline emphasis start-string without end-string.
   fs/debugfs/inode.c:399: WARNING: Inline literal start-string without end-string.
   fs/debugfs/inode.c:478: WARNING: Inline literal start-string without end-string.
   fs/debugfs/inode.c:510: WARNING: Inline literal start-string without end-string.
   fs/debugfs/inode.c:603: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:394: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:400: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:439: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:445: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:484: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:490: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:530: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:536: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:578: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:584: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:845: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:851: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:898: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:904: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:1090: WARNING: Inline literal start-string without end-string.
   fs/debugfs/file.c:1096: WARNING: Inline literal start-string without end-string.
   drivers/ata/libata-core.c:5945: WARNING: Unknown target name: "hw".
   kernel/signal.c:349: WARNING: Inline literal start-string without end-string.
   include/linux/xarray.h:232: WARNING: Unexpected indentation.
   include/linux/netdevice.h:3482: WARNING: Inline emphasis start-string without end-string.
   include/linux/netdevice.h:3482: WARNING: Inline emphasis start-string without end-string.
   net/core/dev.c:5008: WARNING: Unknown target name: "page_is".
   Documentation/security/keys/core.rst:1110: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1110: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1108: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1108: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1108: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/kprobetrace.rst:99: WARNING: Explicit markup ends without a blank line; unexpected unindent.
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:245: WARNING: Unexpected indentation.
   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c:248: WARNING: Block quote ends without a blank line; unexpected unindent.
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:271: WARNING: Unexpected indentation.
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:282: WARNING: Unexpected indentation.
   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c:2202: WARNING: Inline emphasis start-string without end-string.
   drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c:2204: WARNING: Inline emphasis start-string without end-string.
   include/drm/drm_connector.h:540: WARNING: Inline interpreted text or phrase reference start-string without end-string.
   include/drm/drm_connector.h:540: WARNING: Inline interpreted text or phrase reference start-string without end-string.
   Documentation/translations/it_IT/process/maintainer-pgp-guide.rst:458: WARNING: Unknown target name: "nitrokey pro".
   Documentation/virt/index.rst: WARNING: document isn't included in any toctree
   include/linux/slab.h:500: WARNING: undefined label: memory-allocation (if the link has no caption the label must precede a section header)
   Documentation/gpu/drm-internals.rst:302: WARNING: Could not lex literal_block as "c". Highlighting skipped.
   WARNING: LaTeX command 'latex' cannot be run (needed for math display), check the imgmath_latex setting
   WARNING: LaTeX command 'latex' cannot be run (needed for math display), check the imgmath_latex setting
   WARNING: LaTeX command 'latex' cannot be run (needed for math display), check the imgmath_latex setting
   Documentation/trace/kprobetrace.rst:68: WARNING: undefined label: user_mem_access (if the link has no caption the label must precede a section header)
   WARNING: LaTeX command 'latex' cannot be run (needed for math display), check the imgmath_latex setting

vim +67 include/drm/drm_syncobj.h

e9083420bbacce2 Dave Airlie     2017-04-04  @67  
e9083420bbacce2 Dave Airlie     2017-04-04   68  void drm_syncobj_free(struct kref *kref);
e9083420bbacce2 Dave Airlie     2017-04-04   69  
e9083420bbacce2 Dave Airlie     2017-04-04   70  /**
e9083420bbacce2 Dave Airlie     2017-04-04   71   * drm_syncobj_get - acquire a syncobj reference
e9083420bbacce2 Dave Airlie     2017-04-04   72   * @obj: sync object
e9083420bbacce2 Dave Airlie     2017-04-04   73   *
924fe8df7fcfa50 Daniel Vetter   2017-12-14   74   * This acquires an additional reference to @obj. It is illegal to call this
e9083420bbacce2 Dave Airlie     2017-04-04   75   * without already holding a reference. No locks required.
e9083420bbacce2 Dave Airlie     2017-04-04   76   */
e9083420bbacce2 Dave Airlie     2017-04-04   77  static inline void
e9083420bbacce2 Dave Airlie     2017-04-04   78  drm_syncobj_get(struct drm_syncobj *obj)
e9083420bbacce2 Dave Airlie     2017-04-04   79  {
e9083420bbacce2 Dave Airlie     2017-04-04   80  	kref_get(&obj->refcount);
e9083420bbacce2 Dave Airlie     2017-04-04   81  }
e9083420bbacce2 Dave Airlie     2017-04-04   82  
e9083420bbacce2 Dave Airlie     2017-04-04   83  /**
e9083420bbacce2 Dave Airlie     2017-04-04   84   * drm_syncobj_put - release a reference to a sync object.
e9083420bbacce2 Dave Airlie     2017-04-04   85   * @obj: sync object.
e9083420bbacce2 Dave Airlie     2017-04-04   86   */
e9083420bbacce2 Dave Airlie     2017-04-04   87  static inline void
e9083420bbacce2 Dave Airlie     2017-04-04   88  drm_syncobj_put(struct drm_syncobj *obj)
e9083420bbacce2 Dave Airlie     2017-04-04   89  {
e9083420bbacce2 Dave Airlie     2017-04-04   90  	kref_put(&obj->refcount, drm_syncobj_free);
e9083420bbacce2 Dave Airlie     2017-04-04   91  }
e9083420bbacce2 Dave Airlie     2017-04-04   92  
131280a162e7fc2 Eric Anholt     2018-11-08   93  /**
131280a162e7fc2 Eric Anholt     2018-11-08   94   * drm_syncobj_fence_get - get a reference to a fence in a sync object
131280a162e7fc2 Eric Anholt     2018-11-08   95   * @syncobj: sync object.
131280a162e7fc2 Eric Anholt     2018-11-08   96   *
131280a162e7fc2 Eric Anholt     2018-11-08   97   * This acquires additional reference to &drm_syncobj.fence contained in @obj,
131280a162e7fc2 Eric Anholt     2018-11-08   98   * if not NULL. It is illegal to call this without already holding a reference.
131280a162e7fc2 Eric Anholt     2018-11-08   99   * No locks required.
131280a162e7fc2 Eric Anholt     2018-11-08  100   *
131280a162e7fc2 Eric Anholt     2018-11-08  101   * Returns:
131280a162e7fc2 Eric Anholt     2018-11-08  102   * Either the fence of @obj or NULL if there's none.
131280a162e7fc2 Eric Anholt     2018-11-08  103   */
131280a162e7fc2 Eric Anholt     2018-11-08  104  static inline struct dma_fence *
131280a162e7fc2 Eric Anholt     2018-11-08  105  drm_syncobj_fence_get(struct drm_syncobj *syncobj)
131280a162e7fc2 Eric Anholt     2018-11-08  106  {
131280a162e7fc2 Eric Anholt     2018-11-08  107  	struct dma_fence *fence;
131280a162e7fc2 Eric Anholt     2018-11-08  108  
131280a162e7fc2 Eric Anholt     2018-11-08  109  	rcu_read_lock();
131280a162e7fc2 Eric Anholt     2018-11-08  110  	fence = dma_fence_get_rcu_safe(&syncobj->fence);
131280a162e7fc2 Eric Anholt     2018-11-08  111  	rcu_read_unlock();
131280a162e7fc2 Eric Anholt     2018-11-08  112  
131280a162e7fc2 Eric Anholt     2018-11-08  113  	return fence;
131280a162e7fc2 Eric Anholt     2018-11-08  114  }
131280a162e7fc2 Eric Anholt     2018-11-08  115  
e9083420bbacce2 Dave Airlie     2017-04-04  116  struct drm_syncobj *drm_syncobj_find(struct drm_file *file_private,
e9083420bbacce2 Dave Airlie     2017-04-04  117  				     u32 handle);
44f8a1396e83f10 Christian König 2019-04-01  118  void drm_syncobj_add_point(struct drm_syncobj *syncobj,
44f8a1396e83f10 Christian König 2019-04-01  119  			   struct dma_fence_chain *chain,
44f8a1396e83f10 Christian König 2019-04-01  120  			   struct dma_fence *fence,
44f8a1396e83f10 Christian König 2019-04-01  121  			   uint64_t point);
0b258ed1a219a97 Christian König 2018-11-14  122  void drm_syncobj_replace_fence(struct drm_syncobj *syncobj,
e9083420bbacce2 Dave Airlie     2017-04-04  123  			       struct dma_fence *fence);
afaf59237843bf8 Jason Ekstrand  2017-08-25  124  int drm_syncobj_find_fence(struct drm_file *file_private,
649fdce23cdf516 Chunming Zhou   2018-10-15  125  			   u32 handle, u64 point, u64 flags,
e9083420bbacce2 Dave Airlie     2017-04-04  126  			   struct dma_fence **fence);
e9083420bbacce2 Dave Airlie     2017-04-04  127  void drm_syncobj_free(struct kref *kref);
1321fd2c010e7cc Marek Olšák     2017-09-12  128  int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
1321fd2c010e7cc Marek Olšák     2017-09-12  129  		       struct dma_fence *fence);
1321fd2c010e7cc Marek Olšák     2017-09-12  130  int drm_syncobj_get_handle(struct drm_file *file_private,
1321fd2c010e7cc Marek Olšák     2017-09-12  131  			   struct drm_syncobj *syncobj, u32 *handle);
684fd0af4732f37 Marek Olšák     2017-09-12  132  int drm_syncobj_get_fd(struct drm_syncobj *syncobj, int *p_fd);
e9083420bbacce2 Dave Airlie     2017-04-04  133  
e9083420bbacce2 Dave Airlie     2017-04-04  134  #endif

:::::: The code at line 67 was first introduced by commit
:::::: e9083420bbacce27e43d418064d0d2dfb4b37aaa drm: introduce sync objects (v4)

:::::: TO: Dave Airlie <airlied@redhat.com>
:::::: CC: Dave Airlie <airlied@redhat.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--a8Wt8u1KmwUX3Y2C
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--a8Wt8u1KmwUX3Y2C--
