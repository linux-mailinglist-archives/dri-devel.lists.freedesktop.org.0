Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE0D117916
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 531D36E570;
	Mon,  9 Dec 2019 22:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C780B6E570
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:11:28 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 14:11:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,296,1571727600"; 
 d="gz'50?scan'50,208,50";a="295700359"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by orsmga001.jf.intel.com with ESMTP; 09 Dec 2019 14:11:00 -0800
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1ieRF6-0009UW-7Y; Tue, 10 Dec 2019 06:11:00 +0800
Date: Tue, 10 Dec 2019 06:10:07 +0800
From: kbuild test robot <lkp@intel.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 1/2] gpu: host1x: Rename "parent" to "host"
Message-ID: <201912100624.uPcasUJT%lkp@intel.com>
References: <20191209130336.2257506-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="dp3rx4yfa5zgfdtl"
Content-Disposition: inline
In-Reply-To: <20191209130336.2257506-1-thierry.reding@gmail.com>
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
Cc: kbuild-all@lists.01.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, dri-devel@lists.freedesktop.org,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dp3rx4yfa5zgfdtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thierry,

I love your patch! Perhaps something to improve:

[auto build test WARNING on next-20191209]
[also build test WARNING on tegra-drm/drm/tegra/for-next v5.5-rc1]
[cannot apply to tegra/for-next drm-intel/for-linux-next v5.4]
[if your patch is applied to the wrong git tree, please drop us a note to help
improve the system. BTW, we also suggest to use '--base' option to specify the
base tree in git format-patch, please see https://stackoverflow.com/a/37406982]

url:    https://github.com/0day-ci/linux/commits/Thierry-Reding/gpu-host1x-Rename-parent-to-host/20191210-025426
base:    6cf8298daad041cd15dc514d8a4f93ca3636c84e
reproduce: make htmldocs

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/usb/typec/bus.c:1: warning: 'typec_altmode_unregister_driver' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_register_notifier' not found
   drivers/usb/typec/class.c:1: warning: 'typec_altmode_unregister_notifier' not found
   fs/posix_acl.c:647: warning: Function parameter or member 'inode' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'mode_p' not described in 'posix_acl_update_mode'
   fs/posix_acl.c:647: warning: Function parameter or member 'acl' not described in 'posix_acl_update_mode'
   include/linux/regulator/machine.h:196: warning: Function parameter or member 'max_uV_step' not described in 'regulation_constraints'
   include/linux/regulator/driver.h:223: warning: Function parameter or member 'resume' not described in 'regulator_ops'
   sound/soc/soc-core.c:2519: warning: Function parameter or member 'legacy_dai_naming' not described in 'snd_soc_register_dai'
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
   net/core/skbuff.c:5489: warning: Function parameter or member 'ethernet' not described in 'skb_mpls_push'
   include/linux/netdevice.h:1780: warning: bad line: spinlock
   include/linux/netdevice.h:2083: warning: Function parameter or member 'gso_partial_features' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'l3mdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'xfrmdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'tlsdev_ops' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'name_assign_type' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'ieee802154_ptr' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'mpls_ptr' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'xdp_prog' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'gro_flush_timeout' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'nf_hooks_ingress' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'qdisc_hash' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'xps_cpus_map' not described in 'net_device'
   include/linux/netdevice.h:2083: warning: Function parameter or member 'xps_rxqs_map' not described in 'net_device'
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
>> include/linux/host1x.h:58: warning: Function parameter or member 'host' not described in 'host1x_client'
   include/net/cfg80211.h:1189: warning: Function parameter or member 'txpwr' not described in 'station_parameters'
   include/net/mac80211.h:4081: warning: Function parameter or member 'sta_set_txpwr' not described in 'ieee80211_ops'
   include/net/mac80211.h:2036: warning: Function parameter or member 'txpwr' not described in 'ieee80211_sta'
   include/linux/devfreq.h:189: warning: Function parameter or member 'last_status' not described in 'devfreq'
   drivers/devfreq/devfreq.c:1737: warning: bad line: - Resource-managed devfreq_register_notifier()
   drivers/devfreq/devfreq.c:1773: warning: bad line: - Resource-managed devfreq_unregister_notifier()
   drivers/devfreq/devfreq-event.c:355: warning: Function parameter or member 'edev' not described in 'devfreq_event_remove_edev'
   drivers/devfreq/devfreq-event.c:355: warning: Excess function parameter 'dev' description in 'devfreq_event_remove_edev'
   Documentation/admin-guide/xfs.rst:257: WARNING: Block quote ends without a blank line; unexpected unindent.
   Documentation/admin-guide/hw-vuln/tsx_async_abort.rst:142: WARNING: duplicate label virt_mechanism, other instance in Documentation/admin-guide/hw-vuln/mds.rst
   Documentation/watch_queue.rst:166: WARNING: Inline literal start-string without end-string.
   Documentation/watch_queue.rst:166: WARNING: Inline emphasis start-string without end-string.
   Documentation/watch_queue.rst:166: WARNING: Inline emphasis start-string without end-string.
   Documentation/watch_queue.rst:166: WARNING: Inline emphasis start-string without end-string.
   Documentation/watch_queue.rst:243: WARNING: Inline literal start-string without end-string.
   Documentation/watch_queue.rst:243: WARNING: Inline emphasis start-string without end-string.
   Documentation/watch_queue.rst:242: WARNING: Inline emphasis start-string without end-string.
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:358: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/admin-guide/ras.rst:363: WARNING: Definition list ends without a blank line; unexpected unindent.
   Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline emphasis start-string without end-string.
   Documentation/driver-api/driver-model/driver.rst:215: WARNING: Inline emphasis start-string without end-string.
   include/uapi/linux/firewire-cdev.h:312: WARNING: Inline literal start-string without end-string.
   drivers/firewire/core-transaction.c:606: WARNING: Inline strong start-string without end-string.
   Documentation/usb/index.rst:5: WARNING: toctree contains reference to nonexisting document 'usb/rio'
   Documentation/usb/index.rst:5: WARNING: toctree contains reference to nonexisting document 'usb/wusb-design-overview'
   Documentation/x86/boot.rst:72: WARNING: Malformed table.
   Text in column margin in table line 57.

vim +58 include/linux/host1x.h

53fa7f7204c97d Thierry Reding 2013-09-24  32  
466749f13e33d8 Thierry Reding 2017-04-10  33  /**
466749f13e33d8 Thierry Reding 2017-04-10  34   * struct host1x_client - host1x client structure
466749f13e33d8 Thierry Reding 2017-04-10  35   * @list: list node for the host1x client
466749f13e33d8 Thierry Reding 2017-04-10  36   * @parent: pointer to struct device representing the host1x controller
466749f13e33d8 Thierry Reding 2017-04-10  37   * @dev: pointer to struct device backing this host1x client
aacdf19849734d Thierry Reding 2019-02-08  38   * @group: IOMMU group that this client is a member of
466749f13e33d8 Thierry Reding 2017-04-10  39   * @ops: host1x client operations
466749f13e33d8 Thierry Reding 2017-04-10  40   * @class: host1x class represented by this client
466749f13e33d8 Thierry Reding 2017-04-10  41   * @channel: host1x channel associated with this client
466749f13e33d8 Thierry Reding 2017-04-10  42   * @syncpts: array of syncpoints requested for this client
466749f13e33d8 Thierry Reding 2017-04-10  43   * @num_syncpts: number of syncpoints requested for this client
466749f13e33d8 Thierry Reding 2017-04-10  44   */
53fa7f7204c97d Thierry Reding 2013-09-24  45  struct host1x_client {
53fa7f7204c97d Thierry Reding 2013-09-24  46  	struct list_head list;
2a924f65e52681 Thierry Reding 2019-12-09  47  	struct device *host;
53fa7f7204c97d Thierry Reding 2013-09-24  48  	struct device *dev;
aacdf19849734d Thierry Reding 2019-02-08  49  	struct iommu_group *group;
53fa7f7204c97d Thierry Reding 2013-09-24  50  
53fa7f7204c97d Thierry Reding 2013-09-24  51  	const struct host1x_client_ops *ops;
53fa7f7204c97d Thierry Reding 2013-09-24  52  
53fa7f7204c97d Thierry Reding 2013-09-24  53  	enum host1x_class class;
53fa7f7204c97d Thierry Reding 2013-09-24  54  	struct host1x_channel *channel;
53fa7f7204c97d Thierry Reding 2013-09-24  55  
53fa7f7204c97d Thierry Reding 2013-09-24  56  	struct host1x_syncpt **syncpts;
53fa7f7204c97d Thierry Reding 2013-09-24  57  	unsigned int num_syncpts;
53fa7f7204c97d Thierry Reding 2013-09-24 @58  };
53fa7f7204c97d Thierry Reding 2013-09-24  59  

:::::: The code at line 58 was first introduced by commit
:::::: 53fa7f7204c97dc0c86b99ff8365ad6a7b2ebd78 drm/tegra: Introduce tegra_drm_client structure

:::::: TO: Thierry Reding <treding@nvidia.com>
:::::: CC: Thierry Reding <treding@nvidia.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Center
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org Intel Corporation

--dp3rx4yfa5zgfdtl
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
E4gr+tYCFGD5cxxvTHrTkJ1y/wEZ7/Xno2oAAA==

--dp3rx4yfa5zgfdtl
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--dp3rx4yfa5zgfdtl--
