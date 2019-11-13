Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A510FA796
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 04:51:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBD9D6E05C;
	Wed, 13 Nov 2019 03:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D8ED6E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 03:51:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Nov 2019 19:51:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,299,1569308400"; 
 d="gz'50?scan'50,208,50";a="202629844"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga008.fm.intel.com with ESMTP; 12 Nov 2019 19:51:08 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1iUjgS-0004tG-Fe; Wed, 13 Nov 2019 11:51:08 +0800
Date: Wed, 13 Nov 2019 11:50:40 +0800
From: kbuild test robot <lkp@intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 09/12] drm/modes: parse_cmdline: Add support for
 specifying panel_orientation
Message-ID: <201911131133.YEJjbqD0%lkp@intel.com>
References: <20191110154101.26486-10-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="zwzb2v67frflz5f2"
Content-Disposition: inline
In-Reply-To: <20191110154101.26486-10-hdegoede@redhat.com>
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
Cc: kbuild-all@lists.01.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mathieu =?iso-8859-1?Q?Alexandre-T=E9treault?= <alexandretm@amotus.ca>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zwzb2v67frflz5f2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hans,

I love your patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on v5.4-rc7 next-20191112]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Hans-de-Goede/drm-modes-parse_cmdline-Add-support-for-specifying-panel_orientation-on-the-kernel-cmdline/20191112-173153
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   Warning: The Sphinx 'sphinx_rtd_theme' HTML theme was not found. Make sure you have the theme installed to produce pretty HTML output. Falling back to the default theme.
   WARNING: dot(1) not found, for better output quality install graphviz from http://www.graphviz.org
   WARNING: convert(1) not found, for SVG to PDF conversion install ImageMagick (https://www.imagemagick.org)
   include/linux/regulator/machine.h:196: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:223: warning: Function parameter or member 'resume' not described in 'regulator_ops'
   include/linux/i2c.h:337: warning: Function parameter or member 'init_irq' not described in 'i2c_client'
   drivers/gpio/gpiolib-of.c:92: warning: Excess function parameter 'dev' description in 'of_gpio_need_valid_mask'
   include/linux/spi/spi.h:190: warning: Function parameter or member 'driver_override' not described in 'spi_device'
   mm/util.c:1: warning: 'get_user_pages_fast' not found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier' not found
   include/linux/w1.h:277: warning: Function parameter or member 'of_match_table' not described in 'w1_family'
   fs/posix_acl.c:647: warning: Function parameter or member 'inode' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'mode_p' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'acl' not described in 'posix_acl_update_mode'
   kernel/dma/coherent.c:1: warning: no structured comments found
   include/linux/input/sparse-keymap.h:43: warning: Function parameter or member 'sw' not described in 'key_entry'
   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1: warning: no structured comments found
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:254: warning: Function parameter or member 'hdcp_workqueue' not described in 'amdgpu_display_manager'
   lib/genalloc.c:1: warning: 'gen_pool_add_virt' not found
   lib/genalloc.c:1: warning: 'gen_pool_alloc' not found
   lib/genalloc.c:1: warning: 'gen_pool_free' not found
   lib/genalloc.c:1: warning: 'gen_pool_alloc_algo' not found
   include/linux/rculist.h:374: warning: Excess function parameter 'cond' description in 'list_for_each_entry_rcu'
   include/linux/rculist.h:651: warning: Excess function parameter 'cond' description in 'hlist_for_each_entry_rcu'
   include/net/cfg80211.h:1185: warning: Function parameter or member 'txpwr' not described in 'station_parameters'
   include/net/mac80211.h:4056: warning: Function parameter or member 'sta_set_txpwr' not described in 'ieee80211_ops'
   include/net/mac80211.h:2018: warning: Function parameter or member 'txpwr' not described in 'ieee80211_sta'
   include/drm/drm_connector.h:1074: warning: Incorrect use of kernel-doc format:          * @panel_orientation
>> include/drm/drm_connector.h:1085: warning: Function parameter or member 'panel_orientation' not described in 'drm_cmdline_mode'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'prepare_writeback_job' not described in 'drm_connector_helper_funcs'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'cleanup_writeback_job' not described in 'drm_connector_helper_funcs'
   include/drm/drm_gem_shmem_helper.h:87: warning: Function parameter or member 'madv' not described in 'drm_gem_shmem_object'
   include/drm/drm_gem_shmem_helper.h:87: warning: Function parameter or member 'madv_list' not described in 'drm_gem_shmem_object'
   include/linux/skbuff.h:888: warning: Function parameter or member 'dev_scratch' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'list' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'ip_defrag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'skb_mstamp_ns' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__cloned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'head_frag' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__pkt_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'encapsulation' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'encap_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_valid' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member '__pkt_vlan_present_offset' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'vlan_present' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'csum_level' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'inner_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'remcsum_offload' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'sender_cpu' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'reserved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:888: warning: Function parameter or member 'inner_ipproto' not described in 'sk_buff'
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
   include/net/sock.h:2450: warning: Function parameter or member 'tcp_rx_skb_cache_key' not described in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2450: warning: Excess function parameter 'sk' description in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2450: warning: Excess function parameter 'skb' description in 'DECLARE_STATIC_KEY_FALSE'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'gso_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'l3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'xfrmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'tlsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'name_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'ieee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'mpls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'xdp_prog' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'gro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'nf_hooks_ingress' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member '____cacheline_aligned_in_smp' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'qdisc_hash' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'xps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2053: warning: Function parameter or member 'xps_rxqs_map' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'
   include/linux/lsm_hooks.h:1822: warning: Function parameter or member 'quotactl' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1822: warning: Function parameter or member 'quota_on' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1822: warning: Function parameter or member 'sb_free_mnt_opts' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1822: warning: Function parameter or member 'sb_eat_lsm_opts' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1822: warning: Function parameter or member 'sb_kern_mount' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1822: warning: Function parameter or member 'sb_show_options' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1822: warning: Function parameter or member 'sb_add_mnt_opt' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1822: warning: Function parameter or member 'd_instantiate' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1822: warning: Function parameter or member 'getprocattr' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1822: warning: Function parameter or member 'setprocattr' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1822: warning: Function parameter or member 'locked_down' not described in 'security_list_options'
   Documentation/admin-guide/perf/imx-ddr.rst:21: WARNING: Unexpected indentation.
   Documentation/admin-guide/perf/imx-ddr.rst:34: WARNING: Unexpected indentation.
   Documentation/admin-guide/perf/imx-ddr.rst:40: WARNING: Unexpected indentation.
   Documentation/admin-guide/perf/imx-ddr.rst:45: WARNING: Unexpected indentation.
   Documentation/admin-guide/perf/imx-ddr.rst:52: WARNING: Unexpected indentation.
   Documentation/admin-guide/xfs.rst:257: WARNING: Block quote ends without a blank line; unexpected unindent.
   include/uapi/linux/firewire-cdev.h:312: WARNING: Inline literal start-string without end-string.
   drivers/firewire/core-transaction.c:606: WARNING: Inline strong start-string without end-string.
   drivers/message/fusion/mptbase.c:5057: WARNING: Definition list ends without a blank line; unexpected unindent.
   include/linux/regulator/driver.h:284: WARNING: Unknown target name: "regulator_regmap_x_voltage".
   include/linux/i2c.h:522: WARNING: Inline strong start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:420: WARNING: Unexpected indentation.
   Documentation/driver-api/gpio/driver.rst:418: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:422: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/gpio/driver.rst:424: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:424: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:424: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:428: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:441: WARNING: Unexpected indentation.
   Documentation/driver-api/gpio/driver.rst:435: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:435: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:442: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/gpio/driver.rst:444: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/driver-api/gpio/driver.rst:455: WARNING: Unexpected indentation.
   Documentation/driver-api/gpio/driver.rst:453: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:455: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:458: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/gpio/driver.rst:460: WARNING: Inline emphasis start-string without end-string.

vim +1085 include/drm/drm_connector.h

52217195176115 Daniel Vetter 2016-08-12   958  
772cd52c5574b0 Maxime Ripard 2019-06-19   959  /**
772cd52c5574b0 Maxime Ripard 2019-06-19   960   * struct drm_cmdline_mode - DRM Mode passed through the kernel command-line
772cd52c5574b0 Maxime Ripard 2019-06-19   961   *
772cd52c5574b0 Maxime Ripard 2019-06-19   962   * Each connector can have an initial mode with additional options
772cd52c5574b0 Maxime Ripard 2019-06-19   963   * passed through the kernel command line. This structure allows to
772cd52c5574b0 Maxime Ripard 2019-06-19   964   * express those parameters and will be filled by the command-line
772cd52c5574b0 Maxime Ripard 2019-06-19   965   * parser.
772cd52c5574b0 Maxime Ripard 2019-06-19   966   */
52217195176115 Daniel Vetter 2016-08-12   967  struct drm_cmdline_mode {
3aeeb13d899627 Maxime Ripard 2019-06-19   968  	/**
3aeeb13d899627 Maxime Ripard 2019-06-19   969  	 * @name:
3aeeb13d899627 Maxime Ripard 2019-06-19   970  	 *
3aeeb13d899627 Maxime Ripard 2019-06-19   971  	 * Name of the mode.
3aeeb13d899627 Maxime Ripard 2019-06-19   972  	 */
3aeeb13d899627 Maxime Ripard 2019-06-19   973  	char name[DRM_DISPLAY_MODE_LEN];
3aeeb13d899627 Maxime Ripard 2019-06-19   974  
772cd52c5574b0 Maxime Ripard 2019-06-19   975  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19   976  	 * @specified:
772cd52c5574b0 Maxime Ripard 2019-06-19   977  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19   978  	 * Has a mode been read from the command-line?
772cd52c5574b0 Maxime Ripard 2019-06-19   979  	 */
52217195176115 Daniel Vetter 2016-08-12   980  	bool specified;
772cd52c5574b0 Maxime Ripard 2019-06-19   981  
772cd52c5574b0 Maxime Ripard 2019-06-19   982  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19   983  	 * @refresh_specified:
772cd52c5574b0 Maxime Ripard 2019-06-19   984  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19   985  	 * Did the mode have a preferred refresh rate?
772cd52c5574b0 Maxime Ripard 2019-06-19   986  	 */
52217195176115 Daniel Vetter 2016-08-12   987  	bool refresh_specified;
772cd52c5574b0 Maxime Ripard 2019-06-19   988  
772cd52c5574b0 Maxime Ripard 2019-06-19   989  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19   990  	 * @bpp_specified:
772cd52c5574b0 Maxime Ripard 2019-06-19   991  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19   992  	 * Did the mode have a preferred BPP?
772cd52c5574b0 Maxime Ripard 2019-06-19   993  	 */
52217195176115 Daniel Vetter 2016-08-12   994  	bool bpp_specified;
772cd52c5574b0 Maxime Ripard 2019-06-19   995  
772cd52c5574b0 Maxime Ripard 2019-06-19   996  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19   997  	 * @xres:
772cd52c5574b0 Maxime Ripard 2019-06-19   998  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19   999  	 * Active resolution on the X axis, in pixels.
772cd52c5574b0 Maxime Ripard 2019-06-19  1000  	 */
772cd52c5574b0 Maxime Ripard 2019-06-19  1001  	int xres;
772cd52c5574b0 Maxime Ripard 2019-06-19  1002  
772cd52c5574b0 Maxime Ripard 2019-06-19  1003  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19  1004  	 * @yres:
772cd52c5574b0 Maxime Ripard 2019-06-19  1005  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19  1006  	 * Active resolution on the Y axis, in pixels.
772cd52c5574b0 Maxime Ripard 2019-06-19  1007  	 */
772cd52c5574b0 Maxime Ripard 2019-06-19  1008  	int yres;
772cd52c5574b0 Maxime Ripard 2019-06-19  1009  
772cd52c5574b0 Maxime Ripard 2019-06-19  1010  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19  1011  	 * @bpp:
772cd52c5574b0 Maxime Ripard 2019-06-19  1012  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19  1013  	 * Bits per pixels for the mode.
772cd52c5574b0 Maxime Ripard 2019-06-19  1014  	 */
52217195176115 Daniel Vetter 2016-08-12  1015  	int bpp;
772cd52c5574b0 Maxime Ripard 2019-06-19  1016  
772cd52c5574b0 Maxime Ripard 2019-06-19  1017  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19  1018  	 * @refresh:
772cd52c5574b0 Maxime Ripard 2019-06-19  1019  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19  1020  	 * Refresh rate, in Hertz.
772cd52c5574b0 Maxime Ripard 2019-06-19  1021  	 */
52217195176115 Daniel Vetter 2016-08-12  1022  	int refresh;
772cd52c5574b0 Maxime Ripard 2019-06-19  1023  
772cd52c5574b0 Maxime Ripard 2019-06-19  1024  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19  1025  	 * @rb:
772cd52c5574b0 Maxime Ripard 2019-06-19  1026  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19  1027  	 * Do we need to use reduced blanking?
772cd52c5574b0 Maxime Ripard 2019-06-19  1028  	 */
52217195176115 Daniel Vetter 2016-08-12  1029  	bool rb;
772cd52c5574b0 Maxime Ripard 2019-06-19  1030  
772cd52c5574b0 Maxime Ripard 2019-06-19  1031  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19  1032  	 * @interlace:
772cd52c5574b0 Maxime Ripard 2019-06-19  1033  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19  1034  	 * The mode is interlaced.
772cd52c5574b0 Maxime Ripard 2019-06-19  1035  	 */
52217195176115 Daniel Vetter 2016-08-12  1036  	bool interlace;
772cd52c5574b0 Maxime Ripard 2019-06-19  1037  
772cd52c5574b0 Maxime Ripard 2019-06-19  1038  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19  1039  	 * @cvt:
772cd52c5574b0 Maxime Ripard 2019-06-19  1040  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19  1041  	 * The timings will be calculated using the VESA Coordinated
772cd52c5574b0 Maxime Ripard 2019-06-19  1042  	 * Video Timings instead of looking up the mode from a table.
772cd52c5574b0 Maxime Ripard 2019-06-19  1043  	 */
52217195176115 Daniel Vetter 2016-08-12  1044  	bool cvt;
772cd52c5574b0 Maxime Ripard 2019-06-19  1045  
772cd52c5574b0 Maxime Ripard 2019-06-19  1046  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19  1047  	 * @margins:
772cd52c5574b0 Maxime Ripard 2019-06-19  1048  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19  1049  	 * Add margins to the mode calculation (1.8% of xres rounded
772cd52c5574b0 Maxime Ripard 2019-06-19  1050  	 * down to 8 pixels and 1.8% of yres).
772cd52c5574b0 Maxime Ripard 2019-06-19  1051  	 */
52217195176115 Daniel Vetter 2016-08-12  1052  	bool margins;
772cd52c5574b0 Maxime Ripard 2019-06-19  1053  
772cd52c5574b0 Maxime Ripard 2019-06-19  1054  	/**
772cd52c5574b0 Maxime Ripard 2019-06-19  1055  	 * @force:
772cd52c5574b0 Maxime Ripard 2019-06-19  1056  	 *
772cd52c5574b0 Maxime Ripard 2019-06-19  1057  	 * Ignore the hotplug state of the connector, and force its
772cd52c5574b0 Maxime Ripard 2019-06-19  1058  	 * state to one of the DRM_FORCE_* values.
772cd52c5574b0 Maxime Ripard 2019-06-19  1059  	 */
52217195176115 Daniel Vetter 2016-08-12  1060  	enum drm_connector_force force;
1bf4e09227c345 Maxime Ripard 2019-06-19  1061  
1bf4e09227c345 Maxime Ripard 2019-06-19  1062  	/**
1bf4e09227c345 Maxime Ripard 2019-06-19  1063  	 * @rotation_reflection:
1bf4e09227c345 Maxime Ripard 2019-06-19  1064  	 *
1bf4e09227c345 Maxime Ripard 2019-06-19  1065  	 * Initial rotation and reflection of the mode setup from the
1bf4e09227c345 Maxime Ripard 2019-06-19  1066  	 * command line. See DRM_MODE_ROTATE_* and
1bf4e09227c345 Maxime Ripard 2019-06-19  1067  	 * DRM_MODE_REFLECT_*. The only rotations supported are
1bf4e09227c345 Maxime Ripard 2019-06-19  1068  	 * DRM_MODE_ROTATE_0 and DRM_MODE_ROTATE_180.
1bf4e09227c345 Maxime Ripard 2019-06-19  1069  	 */
1bf4e09227c345 Maxime Ripard 2019-06-19  1070  	unsigned int rotation_reflection;
3d46a3007cd8f7 Maxime Ripard 2019-06-19  1071  
77fbea6d77359f Hans de Goede 2019-11-10  1072  	/**
77fbea6d77359f Hans de Goede 2019-11-10  1073  	 * @panel_orientation
77fbea6d77359f Hans de Goede 2019-11-10 @1074  	 *
77fbea6d77359f Hans de Goede 2019-11-10  1075  	 * drm-connector "panel orientation" property override value,
77fbea6d77359f Hans de Goede 2019-11-10  1076  	 * DRM_MODE_PANEL_ORIENTATION_UNKNOWN if not set.
77fbea6d77359f Hans de Goede 2019-11-10  1077  	 */
77fbea6d77359f Hans de Goede 2019-11-10  1078  	enum drm_panel_orientation panel_orientation;
77fbea6d77359f Hans de Goede 2019-11-10  1079  
3d46a3007cd8f7 Maxime Ripard 2019-06-19  1080  	/**
3d46a3007cd8f7 Maxime Ripard 2019-06-19  1081  	 * @tv_margins: TV margins to apply to the mode.
3d46a3007cd8f7 Maxime Ripard 2019-06-19  1082  	 */
3d46a3007cd8f7 Maxime Ripard 2019-06-19  1083  	struct drm_connector_tv_margins tv_margins;
52217195176115 Daniel Vetter 2016-08-12  1084  };
52217195176115 Daniel Vetter 2016-08-12 @1085  

:::::: The code at line 1085 was first introduced by commit
:::::: 522171951761153172c75b94ae1f4bc9ab631745 drm: Extract drm_connector.[hc]

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--zwzb2v67frflz5f2
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICDUuy10AAy5jb25maWcAlDxrc+M2kt/3V7CSqquZ2krisT2O9678AQIhCTFJcAhQD39h
KTLtUcWWfJK8O/PvrxskRZBsaHJbm8RGP/Bq9Jv++R8/B+z9uHtdHTfr1cvL9+C53Jb71bF8
DJ42L+X/BKEKEmUCEUrzKyBHm+37t982V7c3wedfr3+9+GW/vg7uy/22fAn4bvu0eX4H6s1u
+4+f/wH//xkGX9+A0f6/g+f1+pffgw9h+edmtQ1+t9Sfrj9WPwEuV8lYTgrOC6mLCed335sh
+KWYiUxLldz9fnF9cXHCjVgyOYEuHBacJUUkk/uWCQxOmS6YjouJMooEyARoxAA0Z1lSxGw5
EkWeyEQaySL5IMIWUWZfirnKnOlGuYxCI2NRiIVho0gUWmWmhZtpJlgIM44V/KswTCOxPbKJ
vYKX4FAe39/agxll6l4khUoKHafO1LCeQiSzgmUT2HIszd3VJR58vQUVpxJmN0KbYHMItrsj
Mm4RprAMkQ3gNTRSnEXNAf/0U0vmAgqWG0UQ2zMoNIsMkjbzsZko7kWWiKiYPEhnJy5kBJBL
GhQ9xIyGLB58FMoHuG4B3TWdNuouiDxAZ1nn4IuH89TqPPiaON9QjFkemWKqtElYLO5++rDd
bcuPzjXppZ7JlJO8eaa0LmIRq2xZMGMYn5J4uRaRHBHz26NkGZ+CAIB+gLlAJqJGjOFNBIf3
Pw/fD8fytRXjiUhEJrl9MmmmRs5zc0F6quY0JBNaZDNmUPBiFYruKxyrjIuwfl4ymbRQnbJM
C0Sy11tuH4PdU2+VrWJR/F6rHHjB6zd8GiqHk92yixIyw86A8Yk6SsWBzECRALEoIqZNwZc8
Io7DapFZe7o9sOUnZiIx+iywiEHPsPCPXBsCL1a6yFNcS3N/ZvNa7g/UFU4fihSoVCi5+1IS
hRAZRoIUIwumVZCcTPFa7U4z3cWp72mwmmYxaSZEnBpgbzX3iWkzPlNRnhiWLcmpaywXVpmt
NP/NrA5/BUeYN1jBGg7H1fEQrNbr3fv2uNk+t8dhJL8vgKBgnCuYq5K60xQolfYKWzC9FC3J
nf+NpdglZzwP9PCyYL5lATB3SfArmCW4Q0rl6wrZJdcNfb2k7lTOVu+rH3y6Ik90bQv5FB6p
Fc5G3PT6a/n4Dp5C8FSuju/78mCH6xkJaOe5zVliihG+VOCbJzFLCxONinGU66m7cz7JVJ5q
Wh9OBb9PlQROIIxGZbQcV2tHk2d5kTiZiBgtcKPoHvT2zOqELCQOCnwOlYK8gIOBygxfGvwn
ZgnviHcfTcMP3mOX4acbRxGCJjERCAAXqdWiJmNc9CxkynV6D7NHzOD0LbSSG3cpMdggCUYi
o49rIkwM3k1RKzAaaanH+izGeMoSn2ZJlZYLUnmcXjlc6j19H7nnNXb3T9MysCfj3Lfi3IgF
CRGp8p2DnCQsGock0G7QA7Mq3gPTU7DxJIRJ2uuQqsgzn55i4UzCvuvLog8cJhyxLJMembhH
wmVM047S8VlJQEmzfs+Yej5WG6DT3i4BuCVg4eA9d3SgFl8IeqASYej69tVzgDmLk5F1pOTT
RcczszqrjofScv+027+utusyEP8ut6CzGWgzjlobbFmroj3MQwHCWQFhz8UshhNRPVeuVo9/
c8aW9yyuJiysSfK9GwweGOjVjH47OmKUW6ijfOTuQ0dq5KWHe8omonFl/WhjMNSRBCcpAz2g
aHHuIk5ZFoJ343sT+XgMhihlMLk9VwYK36M81FhGg9dQn3w3WGuOYHF7U1w58Qv87kZs2mQ5
t6o3FBxc2KwFqtykuSmsyoewqXx5urr8BePtnzoSDudV/Xr302q//vrbt9ub39Y2/j7Y6Lx4
LJ+q3090aGxDkRY6T9NOKAo2md9bGzCExXHec2xjtK1ZEhYjWfmUd7fn4Gxx9+mGRmik6wd8
OmgddqeoQLMijPseOATsjSkrxiEnfF5wvkcZet8hmuseOeoQdOrQlC8oGIRLAnMMwtpeAgOk
Bl5WkU5AgkxPn2hh8hTfduU4QrDSIiQC/IsGZPURsMowPpjmbkajg2cFmUSr1iNHEElWQROY
Sy1HUX/JOtepgPP2gK2HZY+ORcU0B6sejQYcrPToRnPBkuzT6rwDeBcQ7Twsi4n2kec2LnTA
YzDvgmXRkmPMJxxvJJ1UDmUE2izSd5e9zI1meD0o33gHgsMbb/zNdL9bl4fDbh8cv79VfnXH
8awZPUBYgcJFa5GYdv9wm2PBTJ6JAgNzWrtOVBSOpaaD7kwY8BJAurwTVMIJrlxG20nEEQsD
V4pics6PqW9FZpJeaOXxqliCXspgO4V1kj22fboEkQQPAXzSSe5LOsXXtzc04PMZgNF0IgNh
cbwgTFF8YxVviwkSDr5qLCXN6AQ+D6ePsYFe09B7z8buf/eM39LjPMu1osUiFuOx5EIlNHQu
Ez6VKfcspAZf0RYzBj3o4TsRYMMmi09noEVEu8IxX2Zy4T3vmWT8qqDzbhboOTt09jxUYOf9
r6A2DYQkIdQKfYK7qZS/nsqxufvsokSf/DB04lLQQ1WgqfO4qxdBursDPE4XfDq5ue4Pq1l3
BIynjPPYaoQxi2W0vLtx4VYdQ8gX66ybIVFcaHyoWkSgG6lgFDiCWrY7d1JPzbC9vI6j00BY
HA4Hp8uJSggu8GxYng0B4JMkOhaGkVPkMSfHH6ZMLWTi7nSaClOFT+TNh7Ek9p5Yw6rR4QTT
OhIT4PmJBoKOHYJql3YAgIGOzOFppZLWbPZ2eeexV8bLcfRfd9vNcbevUlLt5bYxBV4GqOx5
f/e1B+vh1V1EJCaMLyFs8Khno0DgR7SVlLd0+IB8MzFSyoB99yVlYslBTOHN+c9H07da20hJ
q7NEYdaxFxg34lJBrjtpvHrw5prKbs1inUZgHq86JO0o5mrIZTQol3Ss3YJ/yOETtS7rFarx
GNzNu4tv/KL6X2+fPTdsDK4CjIJQM8JJtEl0P9gqkqamgNl5R2vICKUoarwHTH7n4u6ie8Sp
OePxoN6EQEBpjOaz3GavPLq6qhKA3VHzu5trR55MRouLXf+Z4BKZaohJvECrI0ErSRpFC46R
DO0zPRSfLi4oSXwoLj9fdMTwobjqova40GzugI2TfxEL4asJMQ3RZd5daCNN06WWEDWhR52h
QH2q5cnNe2IkjZJxjh4Cr0kC9Jc98jrUm4WazkvxOLQBF+gM2ucFiZPjZRGFhk4hNSrvjO/f
kedKyBt5niqTRvnkFEHs/lPuA1Ccq+fytdweLR/GUxns3rAE3okj6uiKzjBQSqgbEiFbVwzs
NKSYjTvjTTEjGO/L/30vt+vvwWG9eukZC+s4ZN18mFt/IKhPjOXjS9nnNawBObwqgtNV/PAQ
LfPR+6EZCD6kXAblcf3rR3deTAKMck2cZJ0eQCvbqctoT1DHUS5JkIo8pVQQaNq/TYT5/PmC
9oytRlnq8Yg8Ks+Oq9PYbFf774F4fX9ZNZLWfULWMWp5DfC7JVxwiTGNokC9NcI93uxf/7Pa
l0G43/y7yla2yeaQluOxzOI5y+x78WnKiVKTSJxQB7Jqyuf9KnhqZn+0s7uVIA9CAx6su1v3
n8UdAy0zk2MvB+tbkk4jBmbYNsdyjQril8fyDaZCSW1fuTuFqvKFjmVsRooklpUX6q7hD9C1
RcRGIqIUN3K0QZ3EZG2eWM2J5SeOrnvP+mKAgT0XRibFSM9Zv7dCQlSEWTUiH3XfT7lUo5iF
oADgjNAE1Sg2qYypqtI4T6q8p8gyiDtk8oewv/fQ4KB6I3Z/luNUqfseEB83/G7kJFc5UQTX
cMKokuquACpVB0oWDUdVlicQwIGqrYAHGMrMej6DQ69WXnX7VHnfYj6VxuaoiRQbxA3LhOFz
NLZoZil6eFeXI3D4wK0r+teITUxgA+u+nP7tZGICliQJq4xYLUO1WuzgafHFd3HYZeQlnM6L
EWy0KqL2YLFcgNy2YG2X00PC2g6mvvIsAQ8drkS6ufF+JYaQE0z6Y6IbgqpQVAk/S0ExIeZv
ii1ZfUToCFH32T7a81CbPTZyNhSpSsoLzcaiCfT7rOqnXgsNuvI9jJqu6sXywEKVe3K5MuVF
1RLT9HcRW6m91jqXTWLgQUVwq/0Mdz/r2hioOjPbAQ+6N7pgn2asNiPNFBRedWE2P9m/VaID
oy+cCi8/7lf9Gq2TYNiDChjz3t2LaM8TYcij0CCE/auCR9kEUIKDWDupHgDlEehM1N4iQrGM
BtKiK4iNTjrFhnaZnbpLD0EsQF+Qyq9LddsVIZUuG81lIocnjzApPoLzBhMeOgCF7X5yUvu6
VwMA6yn7m2tUZHg1DvPGgRmCWoVrQK2bpjkumzv1mTOgPnl18B6cDAtsedJpdGjGBjX/wWWk
cIlXl0041FXFboUaAgyeLVPTeF0Trma//Lk6lI/BX1VJ922/e9q8dPqNTgwQu2ici6o3rK1L
nuF0iscgmIGXg+2DnN/99PzPf3a7NLHvtsJxjWpnsF41D95e3p833ZCnxcTONnuxEUoi3Rjj
YIPKxMcG/2Qggj/CxldR6Ui6QOsurl+1/YFn1+zZNnporL+7ybv64VJlh/pJm0xgBkKBOXLl
aIQWigpUkqqcmMKu8gSR6m7FLtw+yAp+DkbSzjNwPXzELrBL3QtGq3gBPHjCAf2SixytFmzC
Njr6UbI5hWAfaNOwUYzEGP+DJrnu9bQSJr6V6/fj6s+X0rapBzaBeexI30gm49ig3qS7TCqw
5pn0JNZqjFh6qk64vn6i5CRgvgXaFcbl6w7CsbgNegehxNlEWpOhi1mSs6hjNk/puQpGCFlN
3OVW2KpGRec4PC07sK7GNVqVUROxFeWaeuD6jrGpdZJ3GGKqMjWWyibDr90DBc3PPTk9DNUK
ozDEdzd8r6ncSdMYba1b1fYaZnfXF/+6cTLWhFmnqgBukf2+Ez1y8HoSW+3xJKvo/MJD6ste
PYxyOrB+0MPen16MY8vjTYTXqfKIzFZG4AI9ZWjwlUdgh6YxyyitdHqVqRGV+8I6lsYvzZ00
iDe6xX6vP+TJBIblvzdrN+3QQZaauZsTvSROx5fnnXQPplDI5BvnrNuI2cb+m3W9jkANM3p5
1UA1FVHqqyuJmYnTsaeobsBuMfSkPF1HFftTTsV+TDFY5ind8bJbPdaJkuZdz8H04LcdpILq
E7q5rEjNbY8qreFOm8MejzCD4Ma3e4sgZpmn/6FCwA9PajZgvdARPyPltlkmN8rz4QCCZ3mE
PSojCZpGCt3xieg7PSUYH63odfqO3WHnySTaU60y9ANWY9/DiuVkak59SqCP6v6rVhCqocHN
J7NYBPr97W23P7or7oxX5mZzWHf21px/HsdLtPPkkkEjREpjBwsWUiT3XKKGgIvObmLP3KLQ
4dhXargk9yUEXG4cHJydNSuykOJfV3xxQ8p0j7TOJ35bHQK5PRz376+2I/LwFcT+MTjuV9sD
4gXgE5fBIxzS5g1/7CYb/9/Ulpy9HMG/DMbphDmpyt1/tvjagtcdtrIHHzCpvtmXMMEl/9h8
MCe3R3DWwb8K/ivYly/2U7z2MHooKJ5hkyKt2ughuiSGZyrtjrY5UJX28+a9Saa7w7HHrgXy
1f6RWoIXf/d2Kr7oI+zONRwfuNLxR0f3n9YeDvLA587JkRk+VaSsdB5FN1vQupmaa1kjOXfQ
SD4A0TNzNQxF4GgHxmWClfJa31GH/vZ+HM7Y1iySNB8+mSncgZUw+ZsKkKRbecJPdf6e+rGo
rvKZsFj0X+lps9S07e0QG6lWBQ9otYbnQakk4wkOwYr4etgBdO+D4X5YZG1ZT8TbE01jWVTf
Fnj62ebnqsLJzKf/Un77+9XNt2KSeprsE839QFjRpCp3+9tWDId/Unp2IyLejzLbKtzgCpwc
h90reMc5dpKmOcm9g4QNHENHoxLnS05K8SXdxe6iO9hXtP3QvgpoGtOAaf8Dq+am0uFDTE0a
rF9267/6uldsbVCXTpf4TSQWK8G3xU9/sbptLwscuzjFdvHjDviVwfFrGaweHzfobKxeKq6H
X11VNpzMWZxMvB2eKD29LzNPsDldc7RtQAWbeb6TsVBsnaBD4gqOeYCIfqfTeexpPjRTiOAZ
vY/mC0tCSWk9chuS20vW1JcHI4i5SPRRLxir/KL3l+Pm6X27xptpdNXjsNwZj0NQ3SDfdDw3
Nei3acmvaJcQqO9FnEaetkpkbm6u/uXpZASwjn0VZDZafL64sH66n3qpua8hFMBGFiy+uvq8
wP5DFnoabBHxS7zoN381tvTcQTpaQ0zyyPuZRSxCyZoc0zAc26/evm7WB0qdhJ62ZhgvQmwv
5AN2DEgIb98drvB4Gnxg74+bHTgup66Rj4M/ddBy+FsEVei2X72WwZ/vT0+giMOhLfT0BZBk
VQizWv/1snn+egSPKOLhGTcCoPi3EzQ2KaJrT+e/sK5j3QM/ahMl/WDmUwDWv0XnQas8ob7n
ykEBqCmXBYRzJrKtlpI5JQSEt1+ttME5DOdRKj0tIQg+5TWmPOyRDuQFx6y3/9h1TXE8/fr9
gH88I4hW39GkDhVIAi42zrjgQs7IAzzDp7unCQsnHuVslqkn0kLCTOFnt3NpPB/5x7Hn6YtY
4wfOnu6WeRGJkDYmVZVY2kB8SdyBCBlvUsmaZ7nzNYkFDb5FykDRgrnrDsT80/XN7afbGtIq
G8MruaVVA+rzQVBb5Z9iNsrHZAsXZqWx1kJeYY/OOYd8EUqd+j4Izj0eoE14EnFCB0EquKAk
H2wi3qz3u8Pu6RhMv7+V+19mwfN7CVHcYZgv+BGqs3/DJr6PQrGXqfnGpCCOtmNK8A9PFL6s
wBRCeHHi5fu8NIpYohbnP2uZzpsixOB8uPW29O593zH5p8Tuvc54IW8vPzs1TBgVM0OMjqLw
NNr62NQMbigoo5Gie8akiuPcawmz8nV3LDGIplQNZtAMpkFoD5sgrpi+vR6eSX5prBtRozl2
KHv6fC6JDi8Na/ug7Z8OCNQWgpHN28fg8FauN0+n3NxJwbLXl90zDOsd7yyvMbcEuKIDhuWj
l2wIrSzofrd6XO9efXQkvMrGLdLfxvuyxPbIMviy28svPiY/QrW4m1/jhY/BAGaBX95XL7A0
79pJuHtf+IdGBpe1wIrxtwHPbo5vxnNSNijiU6bkb0mBE3pYtTJsUm0sxsJ4vVxbQ6Nfmkf3
pvN4cBKYJ13DKikdOoC5+QVsS/FlH2yoZXvXwD5HRAQNQWXnj3q0sV+d8kYE0nvjcXGvEobG
/9KLhTFrumDF5W0SY3xM6+QOFvIjb7u71F7QyD3toDEfOlvEBynUoZ9Dc06YDU082z7ud5tH
9zhZEmaq/6lIoy1qdMd9YJ5u336WqkrPzTFdvN5snylfXBvaelWfE5gpuSSCpRM4YNaZzIxI
j8XRkYy9CTL8VgN+TkS/waKxgNVfEKCdom4xry5ZgdqrpMSxuWH12dxcZU5za+vrNH8naayr
njU6hhQLNJmAU5WlleebItsvgxg+bwY41I050qNUAAMcM18vS2h7Fz06p4IV3j+YMmZnqL/k
ytCXi2Wxsb4uPOXGCuyDjrEtwwNT/1fZ1TS3bQPRv+LJqQe1YyeetBcfKIqUOaJIWaDCOBeN
IquKxrHika2Zpr8+2F0AJMBduD050S5BCB+LBfDek/6iOnkNzDSEN9tvwaZVMRfiNiUib5rj
L7vzww/ERnRDoQsZOn+RqoO29LYoJ8uM7xsUk+EzQqKtC1b6wzSSDTjDOvcCWaFoc6Df3mRC
3loJcimrqhhS3NxFbW+6UAK1255Ph9ef3B5llt0L93RZuoLxqrc+mcKFB0FwUd+c2zo7mC1o
a+AoRpyg09DwyEqhGz/4PPA1XyOEnzgY0PDO3U48A/zovm3SA62Uan7zDvJyuIkb/dw8bUZw
H/d8OI5eNn/vdDmHh9Hh+LrbQ/O+88Rcvm1OD7sjBNyu1ftgnoNegA6b74d/7ZGQm+5FY7Cp
Ica1h2Ej/BqgaOW4wLuP75cZj3CK+K8lbR3vGYPrFaIYINAr6nbX7EKwtM4gzSL6+miSsDkD
oRumN1xiGc6O3gSHiF4Polh5+HoCeszpx/n1cPTjGWRvwSoRJGC6batUT4Ac7qah8xj+gXYp
s0qw5kVlBT7GhXeIlerFsIiBfhZp4Vg7gSn4uGM6ACYLFbsWZeEzUVK9503TohGW+WV6xXN/
4bnm6nJS8OMQzEWzWovFfuCZ+trykZdS0BbRwB+jl8UYXySRHlNea4HuuT68BzheLiqofv4C
Mj5sqFTQD32wHX0EWUqIl1O+hA3izhSeVK312Jk2noydobMRhIafcyCvWcswZTtOgGs5HD16
mYSrrDqf9HVx+s941PuOCNAm5czH8YOOmNB+ZsYO5p8fd7ePhH7GT59POj4/4r3bw9PuZT9E
Tuo/qsb8boqiMI6H/6focbcqsubm2qF3dfIJvOlBCdddncV6UPAg0ePfUbFRJz3bxxd03Rox
ZG7lJjQU6AHzqa1houK1LFwMMx1L4iygVnxzdfn+2u+FBZKDRNU1AA7jGxIl3bND/aTECkWE
FUpbJeygc2KFiDUOJDKpbEVcMEil5ol0Th06kThzXZXcEbOnVjN8IWrFrltYFg3Ck89b/2tv
9rLBZApx/14tOY05ejtRFIa1CgHH/Sxjsvt63u9DqQcYrKj0o6TtSiDIxCfWqBXQVkL6gWbd
lKqupG0TvWVZgxyuLDhNXvUYqH9igmmaSMdOQy0KHreWyBso6VqpANcbeH0SudcYksmHaKLD
WhhDpHgD4IYMKOIVkaLoGgO/D2zG8hKlkbmva81MSYZ3NUtUUtlI3kVw+hjLQIqDn411wy5k
cSUVcFBIPG6RMrW6DfCFBuOry7sodSZ+fqa5dLs57v3LljpvAiIfH3mGhD+hocGod4B6NQJm
JevU3rFYhN5xBl/v/izRWznIdevg8IGzOwUMz4gL76rpC2OQABcNaJBoGywAQatDEbMsWwQT
lbJduJdwHXrx24ve/iAkZXTxdH7d/bPT/wCq+R9Ir7f5ExynYNlTXM6HF656W/4pfqiCZcBG
LjZnmQubcEaBrGoUUdy25ATCk+0iCY/Q/GDVKmmzTg5YazlokpO9xSx1m79RFjQfZG42I+Lf
jW/VQxkV5MRI2n3RaHr1Pzrc23EbUUj+1bDq6mYBSWedqQKbRwbJmZBNIT/WPkV0yVi8YVex
VcmyiWN9nS71N6ng1x2GR10gec2uvqCljbRhsZvA482+RCexuVGw+05x+X5PkrsXpsMpYYTx
10smzbE7DtNCITdfOKSEPTzrY8+0HItakBb1eeXoFBKMnXW6TBa3vI+ly7N6A74RqcIc7duY
58TuXGaw8Q7pzCQnQ3UgAnvIuDYPzi1v1BjhCSFo5pEeB57ynAYMPB1e83epZjYXBxUmWhX+
PIGgmNTN9wTYmWI+hhnRbDrxMBbw/1j2tBpjUpHAL6Z86RiqdoCAlRs4+BSy3/WXDrUPKCuD
exb4mRjkqvTFmqkjdc6Rl8lUcW0OSAWdJY1rhTpCjaDgTnyqiHA4Ih6aN+gxLX/fQqR8WfHY
rOLlGPXrpT6Zz4s6nFte9Yy4MLs82GOCmsRv15ef//J0pnoGQULZeawmotq986kknlO6SCKn
GNQQQATmy3fqhuvcj2p2LFVtUUETiDtB5wFipfy5f3AS8QvzI6rwNGkAAA==

--zwzb2v67frflz5f2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--zwzb2v67frflz5f2--
