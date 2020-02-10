Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C941572D0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 11:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007FC6EBDC;
	Mon, 10 Feb 2020 10:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969046EBDC;
 Mon, 10 Feb 2020 10:29:07 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Feb 2020 02:29:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,424,1574150400"; 
 d="gz'50?scan'50,208,50";a="280597395"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by FMSMGA003.fm.intel.com with ESMTP; 10 Feb 2020 02:29:04 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j16JL-000Dmq-KR; Mon, 10 Feb 2020 18:29:03 +0800
Date: Mon, 10 Feb 2020 18:28:34 +0800
From: kbuild test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/6] drm: Add drm_simple_encoder_{init,create}()
Message-ID: <202002101841.dbljrw5D%lkp@intel.com>
References: <20200207084135.4524-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="oyuukydk5nr5gigi"
Content-Disposition: inline
In-Reply-To: <20200207084135.4524-3-tzimmermann@suse.de>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: kbuild-all@lists.01.org, Thomas Zimmermann <tzimmermann@suse.de>,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kraxel@redhat.com,
 alexander.deucher@amd.com, spice-devel@lists.freedesktop.org, sam@ravnborg.org,
 emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oyuukydk5nr5gigi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.6-rc1 next-20200210]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Thomas-Zimmermann/drm-Provide-a-simple-encoder/20200210-153139
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bb6d3fb354c5ee8d6bde2d576eb7220ea09862b9
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'getprocattr' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'setprocattr' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'locked_down' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'perf_event_open' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'perf_event_alloc' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'perf_event_free' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'perf_event_read' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'perf_event_write' not described in 'security_list_options'
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' not found
   include/linux/regulator/machine.h:196: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:223: warning: Function parameter or member 'resume' not described in 'regulator_ops'
   include/linux/skbuff.h:890: warning: Function parameter or member 'dev_scratch' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'list' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'ip_defrag_offset' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'skb_mstamp_ns' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member '__cloned_offset' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'head_frag' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member '__pkt_type_offset' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'encapsulation' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'encap_hdr_csum' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'csum_valid' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member '__pkt_vlan_present_offset' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'vlan_present' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'csum_complete_sw' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'csum_level' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'inner_protocol_type' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'remcsum_offload' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'sender_cpu' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'reserved_tailroom' not described in 'sk_buff'
   include/linux/skbuff.h:890: warning: Function parameter or member 'inner_ipproto' not described in 'sk_buff'
   include/net/sock.h:232: warning: Function parameter or member 'skc_addrpair' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_portpair' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_ipv6only' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_net_refcnt' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_v6_daddr' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_v6_rcv_saddr' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_cookie' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_listener' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_tw_dr' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_rcv_wnd' not described in 'sock_common'
   include/net/sock.h:232: warning: Function parameter or member 'skc_tw_rcv_nxt' not described in 'sock_common'
   include/net/sock.h:498: warning: Function parameter or member 'sk_rx_skb_cache' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_wq_raw' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'tcp_rtx_queue' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_tx_skb_cache' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_route_forced_caps' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_txtime_report_errors' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_validate_xmit_skb' not described in 'sock'
   include/net/sock.h:498: warning: Function parameter or member 'sk_bpf_storage' not described in 'sock'
   include/net/sock.h:2444: warning: Function parameter or member 'tcp_rx_skb_cache_key' not described in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2444: warning: Excess function parameter 'sk' description in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2444: warning: Excess function parameter 'skb' description in 'DECLARE_STATIC_KEY_FALSE'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'gso_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'l3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'xfrmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'tlsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'name_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'ieee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'mpls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'xdp_prog' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'gro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'xdp_bulkq' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'xps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'xps_rxqs_map' not described in 'net_device'
   include/linux/netdevice.h:2100: warning: Function parameter or member 'qdisc_hash' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'
   drivers/infiniband/core/umem_odp.c:161: warning: Function parameter or member 'ops' not described in 'ib_umem_odp_alloc_child'
   drivers/infiniband/core/umem_odp.c:211: warning: Function parameter or member 'ops' not described in 'ib_umem_odp_get'
   drivers/infiniband/ulp/iser/iscsi_iser.h:401: warning: Function parameter or member 'all_list' not described in 'iser_fr_desc'
   drivers/infiniband/ulp/iser/iscsi_iser.h:415: warning: Function parameter or member 'all_list' not described in 'iser_fr_pool'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd0' not described in 'opa_vesw_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd1' not described in 'opa_vesw_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd2' not described in 'opa_vesw_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd3' not described in 'opa_vesw_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:148: warning: Function parameter or member 'rsvd4' not described in 'opa_vesw_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd0' not described in 'opa_per_veswport_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd1' not described in 'opa_per_veswport_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd2' not described in 'opa_per_veswport_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:205: warning: Function parameter or member 'rsvd3' not described in 'opa_per_veswport_info'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:263: warning: Function parameter or member 'tbl_entries' not described in 'opa_veswport_mactable'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:342: warning: Function parameter or member 'reserved' not described in 'opa_veswport_summary_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd0' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd1' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd2' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd3' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd4' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd5' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd6' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd7' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd8' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:394: warning: Function parameter or member 'rsvd9' not described in 'opa_veswport_error_counters'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:460: warning: Function parameter or member 'reserved' not described in 'opa_vnic_vema_mad'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:485: warning: Function parameter or member 'reserved' not described in 'opa_vnic_notice_attr'
   drivers/infiniband/ulp/opa_vnic/opa_vnic_encap.h:500: warning: Function parameter or member 'reserved' not described in 'opa_vnic_vema_mad_trap'
   include/linux/input/sparse-keymap.h:43: warning: Function parameter or member 'sw' not described in 'key_entry'
   drivers/gpu/drm/drm_encoder.c:202: warning: Excess function parameter 'funcs' description in 'drm_simple_encoder_init'
>> drivers/gpu/drm/drm_encoder.c:203: warning: Function parameter or member 'encoder' not described in 'drm_simple_encoder_init'
   drivers/gpu/drm/drm_encoder.c:203: warning: Excess function parameter 'funcs' description in 'drm_simple_encoder_init'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'prepare_writeback_job' not described in 'drm_connector_helper_funcs'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'cleanup_writeback_job' not described in 'drm_connector_helper_funcs'
   drivers/gpu/drm/bridge/panel.c:303: warning: Function parameter or member 'bridge' not described in 'drm_panel_bridge_connector'
   include/drm/drm_dp_mst_helper.h:162: warning: Function parameter or member 'fec_capable' not described in 'drm_dp_mst_port'
   include/drm/gpu_scheduler.h:103: warning: Function parameter or member 'priority' not described in 'drm_sched_entity'
   drivers/gpu/drm/i915/i915_vma.h:1: warning: 'Virtual Memory Address' not found
   drivers/gpu/drm/i915/i915_gem_gtt.c:1: warning: 'Global GTT views' not found
   include/linux/host1x.h:66: warning: Function parameter or member 'parent' not described in 'host1x_client'
   include/linux/host1x.h:66: warning: Function parameter or member 'usecount' not described in 'host1x_client'
   include/linux/host1x.h:66: warning: Function parameter or member 'lock' not described in 'host1x_client'
   include/net/cfg80211.h:1189: warning: Function parameter or member 'txpwr' not described in 'station_parameters'
   include/net/mac80211.h:4081: warning: Function parameter or member 'sta_set_txpwr' not described in 'ieee80211_ops'
   include/net/mac80211.h:2036: warning: Function parameter or member 'txpwr' not described in 'ieee80211_sta'
   kernel/sched/fair.c:3526: warning: Excess function parameter 'flags' description in 'attach_entity_load_avg'
   Documentation/admin-guide/acpi/fan_performance_states.rst:21: WARNING: Literal block ends without a blank line; unexpected unindent.
   Documentation/admin-guide/acpi/fan_performance_states.rst:41: WARNING: Literal block expected; none found.
   Documentation/admin-guide/perf/imx-ddr.rst:47: WARNING: Unexpected indentation.
   Documentation/x86/index.rst:7: WARNING: toctree contains reference to nonexisting document 'x86/intel_mpx'
   Documentation/admin-guide/bootconfig.rst:26: WARNING: Literal block expected; none found.
   Documentation/admin-guide/hw-vuln/tsx_async_abort.rst:142: WARNING: duplicate label virt_mechanism, other instance in Documentation/admin-guide/hw-vuln/mds.rst
   drivers/message/fusion/mptbase.c:5057: WARNING: Definition list ends without a blank line; unexpected unindent.
   include/uapi/linux/firewire-cdev.h:312: WARNING: Inline literal start-string without end-string.
   drivers/firewire/core-transaction.c:606: WARNING: Inline strong start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:425: WARNING: Unexpected indentation.
   Documentation/driver-api/gpio/driver.rst:423: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:427: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:429: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:433: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:446: WARNING: Unexpected indentation.
   Documentation/driver-api/gpio/driver.rst:440: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:440: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:447: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/gpio/driver.rst:449: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/driver-api/gpio/driver.rst:462: WARNING: Unexpected indentation.
   Documentation/driver-api/gpio/driver.rst:460: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:462: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:465: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:467: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:471: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/gpio/driver.rst:478: WARNING: Inline emphasis start-string without end-string.
   include/linux/spi/spi.h:399: WARNING: Unexpected indentation.
   Documentation/power/index.rst:7: WARNING: toctree contains reference to nonexisting document 'power/interface'
   Documentation/power/pm_qos_interface.rst:12: WARNING: Unexpected indentation.
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
   include/linux/devfreq.h:156: WARNING: Inline emphasis start-string without end-string.
   include/linux/devfreq.h:261: WARNING: Inline emphasis start-string without end-string.
   include/linux/devfreq.h:281: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/dmaengine/client.rst:203: WARNING: Unexpected indentation.
   Documentation/driver-api/dmaengine/client.rst:204: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/dmaengine/client.rst:210: WARNING: Unexpected indentation.
   Documentation/driver-api/dmaengine/client.rst:211: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/dmaengine/client.rst:220: WARNING: Unexpected indentation.
   Documentation/driver-api/dmaengine/client.rst:221: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/dmaengine/client.rst:229: WARNING: Unexpected indentation.
   Documentation/driver-api/dmaengine/client.rst:230: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/dmaengine/provider.rst:270: WARNING: Unexpected indentation.
   Documentation/driver-api/dmaengine/provider.rst:273: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/dmaengine/provider.rst:288: WARNING: Unexpected indentation.
   Documentation/driver-api/dmaengine/provider.rst:290: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline emphasis start-string without end-string.
   Documentation/filesystems/fuse.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
   Documentation/filesystems/ubifs-authentication.rst:94: WARNING: Inline interpreted text or phrase reference start-string without end-string.
   Documentation/trace/events.rst:589: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/trace/events.rst:620: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:623: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:626: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:703: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:697: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:722: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:775: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/trace/events.rst:814: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:817: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:820: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:823: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:826: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:829: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:832: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:844: WARNING: Unexpected indentation.
   Documentation/trace/events.rst:845: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/trace/events.rst:849: WARNING: Unexpected indentation.
   Documentation/trace/events.rst:850: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/trace/events.rst:883: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:886: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:889: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:895: WARNING: Bullet list ends without a blank line; unexpected unindent.
   Documentation/trace/events.rst:895: WARNING: Inline emphasis start-string without end-string.
   Documentation/trace/events.rst:968: WARNING: Inline emphasis start-string without end-string.
   fs/inode.c:1608: WARNING: Inline emphasis start-string without end-string.
   fs/inode.c:1608: WARNING: Inline emphasis start-string without end-string.
   fs/inode.c:1614: WARNING: Inline emphasis start-string without end-string.
   fs/seq_file.c:40: WARNING: Inline strong start-string without end-string.

vim +203 drivers/gpu/drm/drm_encoder.c

   184	
   185	/**
   186	 * drm_simple_encoder_init - Init a preallocated encoder
   187	 * @dev: drm device
   188	 * @funcs: callbacks for this encoder
   189	 * @encoder_type: user visible type of the encoder
   190	 * @name: printf style format string for the encoder name, or NULL
   191	 *        for default name
   192	 *
   193	 * Initialises a preallocated encoder that has no further functionality. The
   194	 * encoder will be released automatically.
   195	 *
   196	 * Returns:
   197	 * Zero on success, error code on failure.
   198	 */
   199	int drm_simple_encoder_init(struct drm_device *dev,
   200				    struct drm_encoder *encoder,
   201				    int encoder_type, const char *name, ...)
   202	{
 > 203		char *namestr = NULL;
   204		int ret;
   205	
   206		if (name) {
   207			va_list ap;
   208	
   209			va_start(ap, name);
   210			namestr = kvasprintf(GFP_KERNEL, name, ap);
   211			va_end(ap);
   212			if (!namestr)
   213				return -ENOMEM;
   214		}
   215	
   216		ret = __drm_encoder_init(dev, encoder,
   217					 &drm_simple_encoder_funcs_cleanup,
   218					 encoder_type, namestr);
   219		if (ret)
   220			goto err_kfree;
   221	
   222		return 0;
   223	
   224	err_kfree:
   225		if (name)
   226			kfree(namestr);
   227		return ret;
   228	}
   229	EXPORT_SYMBOL(drm_simple_encoder_init);
   230	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--oyuukydk5nr5gigi
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
zb2f3ckqm2zSf6Sx7JJkaQAA

--oyuukydk5nr5gigi
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--oyuukydk5nr5gigi--
