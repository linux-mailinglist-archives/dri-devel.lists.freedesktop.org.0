Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7AD9C0A5
	for <lists+dri-devel@lfdr.de>; Sun, 25 Aug 2019 00:08:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156B96E0E9;
	Sat, 24 Aug 2019 22:08:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E486E0AA;
 Sat, 24 Aug 2019 22:08:41 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Aug 2019 15:08:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,426,1559545200"; 
 d="gz'50?scan'50,208,50";a="182046620"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga003.jf.intel.com with ESMTP; 24 Aug 2019 15:08:38 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1i1eD7-000IJR-Uh; Sun, 25 Aug 2019 06:08:37 +0800
Date: Sun, 25 Aug 2019 06:08:05 +0800
From: kbuild test robot <lkp@intel.com>
To: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH] dma-buf: Give dma-fence-array distinct lockclasses
Message-ID: <201908250632.t5fuz9sH%lkp@intel.com>
References: <20190824135848.8571-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="4cidjckdpg63gl4j"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190824135848.8571-1-chris@chris-wilson.co.uk>
X-Patchwork-Hint: ignore
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@01.org,
 dri-devel@lists.freedesktop.org,
 Christian =?unknown-8bit?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4cidjckdpg63gl4j
Content-Type: text/plain; charset=unknown-8bit
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Chris,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[cannot apply to v5.3-rc5 next-20190823]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Chris-Wilson/dma-buf-Give-dma-fence-array-distinct-lockclasses/20190825-045722
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   Warning: The Sphinx 'sphinx_rtd_theme' HTML theme was not found. Make sure you have the theme installed to produce pretty HTML output. Falling back to the default theme.
   WARNING: dot(1) not found, for better output quality install graphviz from http://www.graphviz.org
   WARNING: convert(1) not found, for SVG to PDF conversion install ImageMagick (https://www.imagemagick.org)
   include/linux/w1.h:272: warning: Function parameter or member 'of_match_table' not described in 'w1_family'
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
   lib/genalloc.c:1: warning: 'gen_pool_add_virt' not found
   lib/genalloc.c:1: warning: 'gen_pool_alloc' not found
   lib/genalloc.c:1: warning: 'gen_pool_free' not found
   lib/genalloc.c:1: warning: 'gen_pool_alloc_algo' not found
   include/linux/i2c.h:337: warning: Function parameter or member 'init_irq' not described in 'i2c_client'
   include/linux/spi/spi.h:190: warning: Function parameter or member 'driver_override' not described in 'spi_device'
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' not found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier' not found
   fs/direct-io.c:258: warning: Excess function parameter 'offset' description in 'dio_complete'
   fs/libfs.c:496: warning: Excess function parameter 'available' description in 'simple_write_end'
   fs/posix_acl.c:647: warning: Function parameter or member 'inode' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'mode_p' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'acl' not described in 'posix_acl_update_mode'
   include/linux/regulator/machine.h:196: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:223: warning: Function parameter or member 'resume' not described in 'regulator_ops'
   include/linux/input/sparse-keymap.h:43: warning: Function parameter or member 'sw' not described in 'key_entry'
   include/linux/skbuff.h:893: warning: Function parameter or member 'dev_scratch' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'list' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'ip_defrag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'skb_mstamp_ns' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member '__cloned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'head_frag' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member '__pkt_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'encapsulation' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'encap_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'csum_valid' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member '__pkt_vlan_present_offset' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'vlan_present' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'csum_complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'csum_level' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'inner_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'remcsum_offload' not described in 'sk_buff'
   include/linux/skbuff.h:893: warning: Function parameter or member 'sender_cpu' not described in 'sk_buff'
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
   drivers/net/phy/phylink.c:595: warning: Function parameter or member 'config' not described in 'phylink_create'
   drivers/net/phy/phylink.c:595: warning: Excess function parameter 'ndev' description in 'phylink_create'
   include/net/mac80211.h:2006: warning: Function parameter or member 'txpwr' not described in 'ieee80211_sta'
>> drivers/dma-buf/dma-fence-array.c:128: warning: Function parameter or member 'key' not described in '__dma_fence_array_create'
   mm/util.c:1: warning: 'get_user_pages_fast' not found
   mm/slab.c:4215: warning: Function parameter or member 'objp' not described in '__ksize'
   include/net/cfg80211.h:1092: warning: Function parameter or member 'txpwr' not described in 'station_parameters'
   include/net/mac80211.h:4043: warning: Function parameter or member 'sta_set_txpwr' not described in 'ieee80211_ops'
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
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: 'register_hpd_handlers' not found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: 'dm_crtc_high_irq' not found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1: warning: 'dm_pflip_high_irq' not found
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
   drivers/gpu/drm/mcde/mcde_drv.c:1: warning: 'ST-Ericsson MCDE DRM Driver' not found
   Documentation/admin-guide/xfs.rst:257: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/uapi/linux/firewire-cdev.h:312: WARNING: Inline literal start-string without end-string.
   drivers/firewire/core-transaction.c:606: WARNING: Inline strong start-string without end-string.
   Documentation/translations/it_IT/process/maintainer-pgp-guide.rst:458: WARNING: Unknown target name: "nitrokey pro".
   Documentation/trace/kprobetrace.rst:99: WARNING: Explicit markup ends without a blank line; unexpected unindent.
   drivers/message/fusion/mptbase.c:5057: WARNING: Definition list ends without a blank line; unexpected unindent.
   drivers/tty/serial/serial_core.c:1964: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/security/keys/core.rst:1110: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1110: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1108: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1108: WARNING: Inline emphasis start-string without end-string.
   Documentation/security/keys/core.rst:1108: WARNING: Inline emphasis start-string without end-string.
   include/linux/i2c.h:522: WARNING: Inline strong start-string without end-string.
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
   include/linux/regulator/driver.h:284: WARNING: Unknown target name: "regulator_regmap_x_voltage".
   drivers/ata/libata-core.c:5945: WARNING: Unknown target name: "hw".
   include/linux/netdevice.h:3482: WARNING: Inline emphasis start-string without end-string.
   include/linux/netdevice.h:3482: WARNING: Inline emphasis start-string without end-string.
   net/core/dev.c:5013: WARNING: Unknown target name: "page_is".
   include/linux/xarray.h:232: WARNING: Unexpected indentation.
   Documentation/kbuild/makefiles.rst:1142: WARNING: Inline emphasis start-string without end-string.
   Documentation/kbuild/makefiles.rst:1152: WARNING: Inline emphasis start-string without end-string.

vim +128 drivers/dma-buf/dma-fence-array.c

b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  102  
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  103  /**
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25  104   * dma_fence_array_create - Create a custom fence array
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  105   * @num_fences:		[in]	number of fences to add in the array
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  106   * @fences:		[in]	array containing the fences
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  107   * @context:		[in]	fence context to use
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  108   * @seqno:		[in]	sequence number to use
68acb6afb6f56d drivers/dma-buf/fence-array.c     Randy Dunlap    2016-08-16  109   * @signal_on_any:	[in]	signal on any fence in the array
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  110   *
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25  111   * Allocate a dma_fence_array object and initialize the base fence with
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25  112   * dma_fence_init().
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  113   * In case of error it returns NULL.
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  114   *
68acb6afb6f56d drivers/dma-buf/fence-array.c     Randy Dunlap    2016-08-16  115   * The caller should allocate the fences array with num_fences size
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  116   * and fill it with the fences it wants to add to the object. Ownership of this
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25  117   * array is taken and dma_fence_put() is used on each fence on release.
f71045689656e3 drivers/dma-buf/fence-array.c     Christian König 2016-06-01  118   *
f71045689656e3 drivers/dma-buf/fence-array.c     Christian König 2016-06-01  119   * If @signal_on_any is true the fence array signals if any fence in the array
f71045689656e3 drivers/dma-buf/fence-array.c     Christian König 2016-06-01  120   * signals, otherwise it signals when all fences in the array signal.
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  121   */
dd3720da27c1c1 drivers/dma-buf/dma-fence-array.c Chris Wilson    2019-08-24  122  struct dma_fence_array *__dma_fence_array_create(int num_fences,
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25  123  						 struct dma_fence **fences,
f71045689656e3 drivers/dma-buf/fence-array.c     Christian König 2016-06-01  124  						 u64 context, unsigned seqno,
dd3720da27c1c1 drivers/dma-buf/dma-fence-array.c Chris Wilson    2019-08-24  125  						 bool signal_on_any,
dd3720da27c1c1 drivers/dma-buf/dma-fence-array.c Chris Wilson    2019-08-24  126  						 struct lock_class_key *key)
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  127  {
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25 @128  	struct dma_fence_array *array;
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  129  	size_t size = sizeof(*array);
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  130  
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  131  	/* Allocate the callback structures behind the array. */
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25  132  	size += num_fences * sizeof(struct dma_fence_array_cb);
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  133  	array = kzalloc(size, GFP_KERNEL);
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  134  	if (!array)
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  135  		return NULL;
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  136  
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  137  	spin_lock_init(&array->lock);
dd3720da27c1c1 drivers/dma-buf/dma-fence-array.c Chris Wilson    2019-08-24  138  	lockdep_set_class(&array->lock, key);
dd3720da27c1c1 drivers/dma-buf/dma-fence-array.c Chris Wilson    2019-08-24  139  
f54d1867005c33 drivers/dma-buf/dma-fence-array.c Chris Wilson    2016-10-25  140  	dma_fence_init(&array->base, &dma_fence_array_ops, &array->lock,
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  141  		       context, seqno);
03e4e0a9e02cf7 drivers/dma-buf/dma-fence-array.c Chris Wilson    2017-11-14  142  	init_irq_work(&array->work, irq_dma_fence_array_work);
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  143  
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  144  	array->num_fences = num_fences;
f71045689656e3 drivers/dma-buf/fence-array.c     Christian König 2016-06-01  145  	atomic_set(&array->num_pending, signal_on_any ? 1 : num_fences);
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  146  	array->fences = fences;
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  147  
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  148  	return array;
b3dfbdf261e076 drivers/dma-buf/fence-array.c     Gustavo Padovan 2016-06-01  149  }
dd3720da27c1c1 drivers/dma-buf/dma-fence-array.c Chris Wilson    2019-08-24  150  EXPORT_SYMBOL(__dma_fence_array_create);
d5b72a2123dfaf drivers/dma-buf/dma-fence-array.c Philipp Zabel   2017-03-17  151  

:::::: The code at line 128 was first introduced by commit
:::::: f54d1867005c3323f5d8ad83eed823e84226c429 dma-buf: Rename struct fence to dma_fence

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--4cidjckdpg63gl4j
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--4cidjckdpg63gl4j
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--4cidjckdpg63gl4j--
