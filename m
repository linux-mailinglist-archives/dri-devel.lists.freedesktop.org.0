Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88DA9111B2A
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 22:52:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFE56F418;
	Tue,  3 Dec 2019 21:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4EF6F418;
 Tue,  3 Dec 2019 21:52:53 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 13:52:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,275,1571727600"; 
 d="gz'50?scan'50,208,50";a="412348241"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga006.fm.intel.com with ESMTP; 03 Dec 2019 13:52:51 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1icG6E-00014c-UN; Wed, 04 Dec 2019 05:52:50 +0800
Date: Wed, 4 Dec 2019 05:52:29 +0800
From: kbuild test robot <lkp@intel.com>
To: mikita.lipski@amd.com
Subject: Re: [PATCH v8 11/17] drm/dp_mst: Add DSC enablement helpers to DRM
Message-ID: <201912040533.r3ZveD1B%lkp@intel.com>
References: <20191203143530.27262-12-mikita.lipski@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="eya7qy52cziwccjx"
Content-Disposition: inline
In-Reply-To: <20191203143530.27262-12-mikita.lipski@amd.com>
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
Cc: Mikita Lipski <mikita.lipski@amd.com>, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eya7qy52cziwccjx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20191203]
[cannot apply to drm-intel/for-linux-next linus/master v5.4-rc8 v5.4]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/mikita-lipski-amd-com/DSC-MST-support-for-DRM-and-AMDGPU/20191204-020604
base:    1ab75b2e415a29dba9aec94f203c6f88dbfc0ba0
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' not found
   fs/posix_acl.c:647: warning: Function parameter or member 'inode' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'mode_p' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'acl' not described in 'posix_acl_update_mode'
   include/linux/regulator/machine.h:196: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:223: warning: Function parameter or member 'resume' not described in 'regulator_ops'
   sound/soc/soc-core.c:2509: warning: Function parameter or member 'legacy_dai_naming' not described in 'snd_soc_register_dai'
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
   include/net/sock.h:514: warning: Function parameter or member 'sk_rx_skb_cache' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_wq_raw' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'tcp_rtx_queue' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_tx_skb_cache' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_route_forced_caps' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_txtime_report_errors' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_validate_xmit_skb' not described in 'sock'
   include/net/sock.h:514: warning: Function parameter or member 'sk_bpf_storage' not described in 'sock'
   include/net/sock.h:2454: warning: Function parameter or member 'tcp_rx_skb_cache_key' not described in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2454: warning: Excess function parameter 'sk' description in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2454: warning: Excess function parameter 'skb' description in 'DECLARE_STATIC_KEY_FALSE'
   include/linux/netdevice.h:1779: warning: bad line: spinlock
   include/linux/netdevice.h:2077: warning: Function parameter or member 'gso_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'l3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'xfrmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'tlsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'name_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'ieee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'mpls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'xdp_prog' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'gro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'nf_hooks_ingress' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'qdisc_hash' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'xps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2077: warning: Function parameter or member 'xps_rxqs_map' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'
   include/linux/i2c.h:337: warning: Function parameter or member 'init_irq' not described in 'i2c_client'
   drivers/infiniband/core/umem_odp.c:167: warning: Function parameter or member 'ops' not described in 'ib_umem_odp_alloc_child'
   drivers/infiniband/core/umem_odp.c:217: warning: Function parameter or member 'ops' not described in 'ib_umem_odp_get'
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
   kernel/futex.c:1187: warning: Function parameter or member 'ret' not described in 'wait_for_owner_exiting'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'prepare_writeback_job' not described in 'drm_connector_helper_funcs'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'cleanup_writeback_job' not described in 'drm_connector_helper_funcs'
   drivers/gpu/drm/drm_dp_mst_topology.c:4763: warning: Excess function parameter 'pointer' description in 'drm_dp_mst_atomic_enable_dsc'
   drivers/gpu/drm/drm_dp_mst_topology.c:4763: warning: Excess function parameter 'pointer' description in 'drm_dp_mst_atomic_enable_dsc'
   include/drm/drm_dp_mst_helper.h:162: warning: Function parameter or member 'fec_capable' not described in 'drm_dp_mst_port'
>> drivers/gpu/drm/drm_dp_mst_topology.c:4764: warning: Function parameter or member 'port' not described in 'drm_dp_mst_atomic_enable_dsc'
   drivers/gpu/drm/drm_dp_mst_topology.c:4764: warning: Excess function parameter 'pointer' description in 'drm_dp_mst_atomic_enable_dsc'
   drivers/gpu/drm/drm_dp_mst_topology.c:4763: warning: Excess function parameter 'pointer' description in 'drm_dp_mst_atomic_enable_dsc'
   include/net/cfg80211.h:1189: warning: Function parameter or member 'txpwr' not described in 'station_parameters'
   include/net/mac80211.h:4081: warning: Function parameter or member 'sta_set_txpwr' not described in 'ieee80211_ops'
   include/net/mac80211.h:2036: warning: Function parameter or member 'txpwr' not described in 'ieee80211_sta'
   include/linux/devfreq.h:181: warning: Function parameter or member 'last_status' not described in 'devfreq'
   drivers/devfreq/devfreq.c:1708: warning: bad line: - Resource-managed devfreq_register_notifier()
   drivers/devfreq/devfreq.c:1744: warning: bad line: - Resource-managed devfreq_unregister_notifier()
   drivers/devfreq/devfreq-event.c:355: warning: Function parameter or member 'edev' not described in 'devfreq_event_remove_edev'
   drivers/devfreq/devfreq-event.c:355: warning: Excess function parameter 'dev' description in 'devfreq_event_remove_edev'
   Documentation/admin-guide/xfs.rst:257: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/admin-guide/hw-vuln/tsx_async_abort.rst:142: WARNING: duplicate label virt_mechanism, other instance in Documentation/admin-guide/hw-vuln/mds.rst
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/sysctl/kernel.rst:397: WARNING: Title underline too short.

vim +4764 drivers/gpu/drm/drm_dp_mst_topology.c

  4744	
  4745	/**
  4746	 * drm_dp_mst_atomic_enable_dsc - Set DSC Enable Flag to On/Off
  4747	 * @state: Pointer to the new drm_atomic_state
  4748	 * @pointer: Pointer to the affected MST Port
  4749	 * @pbn: Newly recalculated bw required for link with DSC enabled
  4750	 * @pbn_div: Divider to calculate correct number of pbn per slot
  4751	 * @enable: Boolean flag enabling or disabling DSC on the port
  4752	 *
  4753	 * This function enables DSC on the given Port
  4754	 * by recalculating its vcpi from pbn provided
  4755	 * and sets dsc_enable flag to keep track of which
  4756	 * ports have DSC enabled
  4757	 *
  4758	 */
  4759	int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
  4760					 struct drm_dp_mst_port *port,
  4761					 int pbn, int pbn_div,
  4762					 bool enable)
> 4763	{
> 4764		struct drm_dp_mst_topology_state *mst_state;
  4765		struct drm_dp_vcpi_allocation *pos;
  4766		bool found = false;
  4767		int vcpi = 0;
  4768	
  4769		mst_state = drm_atomic_get_mst_topology_state(state, port->mgr);
  4770	
  4771		if (IS_ERR(mst_state))
  4772			return PTR_ERR(mst_state);
  4773	
  4774		list_for_each_entry(pos, &mst_state->vcpis, next) {
  4775			if (pos->port == port) {
  4776				found = true;
  4777				break;
  4778			}
  4779		}
  4780	
  4781		if (!found) {
  4782			DRM_DEBUG_ATOMIC("[MST PORT:%p] Couldn't find VCPI allocation in mst state %p\n",
  4783					 port, mst_state);
  4784			return -EINVAL;
  4785		}
  4786	
  4787		if (pos->dsc_enabled == enable) {
  4788			DRM_DEBUG_ATOMIC("[MST PORT:%p] DSC flag is already set to %d, returning %d VCPI slots\n",
  4789					 port, enable, pos->vcpi);
  4790			vcpi = pos->vcpi;
  4791		}
  4792	
  4793		if (enable) {
  4794			vcpi = drm_dp_atomic_find_vcpi_slots(state, port->mgr, port, pbn, pbn_div);
  4795			DRM_DEBUG_ATOMIC("[MST PORT:%p] Enabling DSC flag, reallocating %d VCPI slots on the port\n",
  4796					 port, vcpi);
  4797			if (vcpi < 0)
  4798				return -EINVAL;
  4799		}
  4800	
  4801		pos->dsc_enabled = enable;
  4802	
  4803		return vcpi;
  4804	}
  4805	EXPORT_SYMBOL(drm_dp_mst_atomic_enable_dsc);
  4806	/**
  4807	 * drm_dp_mst_atomic_check - Check that the new state of an MST topology in an
  4808	 * atomic update is valid
  4809	 * @state: Pointer to the new &struct drm_dp_mst_topology_state
  4810	 *
  4811	 * Checks the given topology state for an atomic update to ensure that it's
  4812	 * valid. This includes checking whether there's enough bandwidth to support
  4813	 * the new VCPI allocations in the atomic update.
  4814	 *
  4815	 * Any atomic drivers supporting DP MST must make sure to call this after
  4816	 * checking the rest of their state in their
  4817	 * &drm_mode_config_funcs.atomic_check() callback.
  4818	 *
  4819	 * See also:
  4820	 * drm_dp_atomic_find_vcpi_slots()
  4821	 * drm_dp_atomic_release_vcpi_slots()
  4822	 *
  4823	 * Returns:
  4824	 *
  4825	 * 0 if the new state is valid, negative error code otherwise.
  4826	 */
  4827	int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
  4828	{
  4829		struct drm_dp_mst_topology_mgr *mgr;
  4830		struct drm_dp_mst_topology_state *mst_state;
  4831		int i, ret = 0;
  4832	
  4833		for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
  4834			ret = drm_dp_mst_atomic_check_topology_state(mgr, mst_state);
  4835			if (ret)
  4836				break;
  4837		}
  4838	
  4839		return ret;
  4840	}
  4841	EXPORT_SYMBOL(drm_dp_mst_atomic_check);
  4842	

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--eya7qy52cziwccjx
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
wqEZ7CkLNv7eMf9y0QYzbTv9B6u6aJCYagAA

--eya7qy52cziwccjx
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--eya7qy52cziwccjx--
