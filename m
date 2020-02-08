Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D95031562B1
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2020 03:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5689A6E157;
	Sat,  8 Feb 2020 02:17:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5931E6E157;
 Sat,  8 Feb 2020 02:17:12 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 18:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,415,1574150400"; 
 d="gz'50?scan'50,208,50";a="250633223"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga002.jf.intel.com with ESMTP; 07 Feb 2020 18:17:09 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1j0FgD-000BOy-1C; Sat, 08 Feb 2020 10:17:09 +0800
Date: Sat, 8 Feb 2020 10:16:54 +0800
From: kbuild test robot <lkp@intel.com>
To: Ramalingam C <ramalingam.c@intel.com>
Subject: Re: [PATCH v3] drm/hdcp: optimizing the srm handling
Message-ID: <202002081010.Q7jWYzvm%lkp@intel.com>
References: <20200206105231.24813-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="liskm65zlsl6y2p2"
Content-Disposition: inline
In-Reply-To: <20200206105231.24813-1-ramalingam.c@intel.com>
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, kbuild-all@lists.01.org,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--liskm65zlsl6y2p2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ramalingam,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on drm-intel/for-linux-next]
[also build test WARNING on drm-tip/drm-tip drm-exynos/exynos-drm-next tegra-drm/drm/tegra/for-next linus/master v5.5 next-20200207]
[cannot apply to drm/drm-next]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Ramalingam-C/drm-hdcp-optimizing-the-srm-handling/20200208-060809
base:   git://anongit.freedesktop.org/drm-intel for-linux-next
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'perf_event_alloc' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'perf_event_free' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'perf_event_read' not described in 'security_list_options'
   include/linux/lsm_hooks.h:1830: warning: Function parameter or member 'perf_event_write' not described in 'security_list_options'
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' not found
   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_register_driver' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' not found
   sound/soc/soc-core.c:2522: warning: Function parameter or member 'legacy_dai_naming' not described in 'snd_soc_register_dai'
   include/linux/regulator/machine.h:196: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:223: warning: Function parameter or member 'resume' not described in 'regulator_ops'
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
   include/net/sock.h:2459: warning: Function parameter or member 'tcp_rx_skb_cache_key' not described in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2459: warning: Excess function parameter 'sk' description in 'DECLARE_STATIC_KEY_FALSE'
   include/net/sock.h:2459: warning: Excess function parameter 'skb' description in 'DECLARE_STATIC_KEY_FALSE'
   net/core/skbuff.c:5489: warning: Function parameter or member 'ethernet' not described in 'skb_mpls_push'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'gso_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'l3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'xfrmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'tlsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'name_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'ieee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'mpls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'xdp_prog' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'gro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'nf_hooks_ingress' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'qdisc_hash' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'xps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2082: warning: Function parameter or member 'xps_rxqs_map' not described in 'net_device'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(advertising' not described in 'phylink_link_state'
   include/linux/phylink.h:56: warning: Function parameter or member '__ETHTOOL_DECLARE_LINK_MODE_MASK(lp_advertising' not described in 'phylink_link_state'
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
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'prepare_writeback_job' not described in 'drm_connector_helper_funcs'
   include/drm/drm_modeset_helper_vtables.h:1052: warning: Function parameter or member 'cleanup_writeback_job' not described in 'drm_connector_helper_funcs'
   drivers/gpu/drm/bridge/panel.c:303: warning: Function parameter or member 'bridge' not described in 'drm_panel_bridge_connector'
>> drivers/gpu/drm/drm_hdcp.c:284: warning: Function parameter or member 'ksvs_in' not described in 'drm_hdcp_check_ksvs_revoked'
   drivers/gpu/drm/drm_hdcp.c:284: warning: Excess function parameter 'ksvs' description in 'drm_hdcp_check_ksvs_revoked'
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
   include/linux/devfreq.h:187: warning: Function parameter or member 'last_status' not described in 'devfreq'
   drivers/devfreq/devfreq.c:1818: warning: bad line: - Resource-managed devfreq_register_notifier()
   drivers/devfreq/devfreq.c:1854: warning: bad line: - Resource-managed devfreq_unregister_notifier()
   drivers/devfreq/devfreq-event.c:355: warning: Function parameter or member 'edev' not described in 'devfreq_event_remove_edev'
   drivers/devfreq/devfreq-event.c:355: warning: Excess function parameter 'dev' description in 'devfreq_event_remove_edev'
   Documentation/admin-guide/hw-vuln/tsx_async_abort.rst:142: WARNING: duplicate label virt_mechanism, other instance in Documentation/admin-guide/hw-vuln/mds.rst
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline emphasis start-string without end-string.
   include/uapi/linux/firewire-cdev.h:312: WARNING: Inline literal start-string without end-string.
   drivers/firewire/core-transaction.c:606: WARNING: Inline strong start-string without end-string.
   Documentation/x86/boot.rst:72: WARNING: Malformed table.
   Text in column margin in table line 57.

vim +284 drivers/gpu/drm/drm_hdcp.c

   255	
   256	/**
   257	 * drm_hdcp_check_ksvs_revoked - Check the revoked status of the IDs
   258	 *
   259	 * @drm_dev: drm_device for which HDCP revocation check is requested
   260	 * @ksvs: List of KSVs (HDCP receiver IDs)
   261	 * @ksv_count: KSV count passed in through @ksvs
   262	 *
   263	 * This function reads the HDCP System renewability Message(SRM Table)
   264	 * from userspace as a firmware and parses it for the revoked HDCP
   265	 * KSVs(Receiver IDs) detected by DCP LLC. Once the revoked KSVs are known,
   266	 * revoked state of the KSVs in the list passed in by display drivers are
   267	 * decided and response is sent.
   268	 *
   269	 * SRM should be presented in the name of "display_hdcp_srm.bin".
   270	 *
   271	 * Format of the SRM table, that userspace needs to write into the binary file,
   272	 * is defined at:
   273	 * 1. Renewability chapter on 55th page of HDCP 1.4 specification
   274	 * https://www.digital-cp.com/sites/default/files/specifications/HDCP%20Specification%20Rev1_4_Secure.pdf
   275	 * 2. Renewability chapter on 63rd page of HDCP 2.2 specification
   276	 * https://www.digital-cp.com/sites/default/files/specifications/HDCP%20on%20HDMI%20Specification%20Rev2_2_Final1.pdf
   277	 *
   278	 * Returns:
   279	 * Count of the revoked KSVs or -ve error number incase of the failure.
   280	 */
   281	int drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs_in,
   282					u32 ksv_count)
   283	{
 > 284		u32 revoked_ksv_cnt = 0, i, j;
   285		u8 *revoked_ksv_list = NULL;
   286		int ret = 0;
   287	
   288		ret = drm_hdcp_request_srm(drm_dev, &revoked_ksv_list,
   289					   &revoked_ksv_cnt);
   290	
   291		/* revoked_ksv_cnt will be zero when above function failed */
   292		for (i = 0; i < revoked_ksv_cnt; i++)
   293			for  (j = 0; j < ksv_count; j++)
   294				if (!memcmp(&ksvs_in[j * DRM_HDCP_KSV_LEN],
   295				    &revoked_ksv_list[i * DRM_HDCP_KSV_LEN],
   296				    DRM_HDCP_KSV_LEN)) {
   297					DRM_DEBUG("Revoked KSV is ");
   298					drm_hdcp_print_ksv(&ksvs_in[j * DRM_HDCP_KSV_LEN]);
   299					ret++;
   300				}
   301	
   302		kfree(revoked_ksv_list);
   303		return ret;
   304	}
   305	EXPORT_SYMBOL_GPL(drm_hdcp_check_ksvs_revoked);
   306	

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--liskm65zlsl6y2p2
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--liskm65zlsl6y2p2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--liskm65zlsl6y2p2--
