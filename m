Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D1653F5BC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 07:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A7412A9A6;
	Tue,  7 Jun 2022 05:55:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A0F10EB3B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 10:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Ze8TQqRMhX7HpjoC+K0KtEGfpNVrb+81cSLdx8Azg70=;
 b=lak033I39OfXfSbKzJeUe8BC8roSULxmHxkZK/86LIzVrv8YZl24KwE2
 CqOqDz+qJaFRZchikutxcTI/ls7zHelAHy5VbFp3UMxMzR8FFnTB6ReUz
 O99ZKjfI+buUt3CFhkEPzwXXpdDGv3NWuu8YYX7TbkyI8HrijqiKvP97B Y=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=keisuke.nishimura@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.91,280,1647298800"; d="scan'208";a="39634374"
Received: from eth-east-parth2-46-193-69-7.wb.wifirst.net (HELO
 [10.188.210.33]) ([46.193.69.7])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 12:51:55 +0200
Message-ID: <4ad227dc-3972-82f5-6c71-271becc37e66@inria.fr>
Date: Mon, 6 Jun 2022 19:51:55 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: mainline build failure due to f1e4c916f97f ("drm/edid: add EDID
 block count and size helpers")
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>
References: <CAK8P3a2Zg2QDS1_Ysn8-Zqqd+K7bbTFS7JV7gPabp6nvPiKaog@mail.gmail.com>
 <91E67F46-A3C7-4159-9E0C-C6C6306F3669@inria.fr>
 <CAK8P3a2iAsemAQdbTZ_E7GGGCXAOeWbjSjLgXEsd5sg_buZWhw@mail.gmail.com>
 <CAHk-=wgO0V9OdY+DFm-f0qZYMyFSm0ptReO+_qgSTEpBLtFV7Q@mail.gmail.com>
 <d971a684-ccd9-3839-1e30-c166fd55cf49@inria.fr>
 <CAHk-=wiViikY0szsJGipSxFmMwdsvxjm7SwDfwNfMHYvQ64kAA@mail.gmail.com>
 <CAK8P3a1m80u+eVnoSJ-APihjNQ1se9=FG+E6tKBb-hRJx5FAVg@mail.gmail.com>
From: Keisuke Nishimura <keisuke.nishimura@inria.fr>
In-Reply-To: <CAK8P3a1m80u+eVnoSJ-APihjNQ1se9=FG+E6tKBb-hRJx5FAVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 07 Jun 2022 05:55:10 +0000
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, Viresh Kumar <vireshk@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, David Airlie <airlied@linux.ie>,
 SoC Team <soc@kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2022/06/02 16:38, Arnd Bergmann wrote:
> I think that SmPL script worked great, almost every instance is
> something that ought to be changed, as long as it stops reporting
> those structures that are also __aligned(). I would extend it to
> also report structures with 'bool', 'enum', or any pointer, but that
> could give more false-positives. Maybe have a separate script
> for those instances embedding atomics or spinlocks (very broken)
> vs the other members (causes more harm than good or might
> need alignment).

I extended my script to detect __packed struct or union without 
__aligned. It is split in two scripts.

The first one is to search for problematic cases where __packed 
structs/unions have atomic types or spinlock types. In this version, 
types whose names contain "atomic" or "spinlock" are targeted.

== Scripts ==
@r@
type T;
identifier i;
type b =~ ".*(atomic|spinlock).*";
position p;
attribute name __packed, __aligned;
attribute at;
@@
  T@p  {
    ...
   b i;
   ...
  } at;
@script:python@
p <<r.p;
T <<r.T;
b <<r.b;
a << r.at;
@@
if not "__align" in a:
   print("{}: {} in {}".format(p[0].file, b, T))


== Results ==
drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls.h: spinlock_t in 
struct key_map
security/tomoyo/common.h: atomic_t in struct tomoyo_shared_acl_head
include/rdma/ib_hdrs.h: struct {  __be32 aeth ;  __be64 atomic_ack_eth ; 
} in union ib_ehdrs
include/rdma/ib_hdrs.h: struct ib_atomic_eth in union ib_ehdrs


The second one is to check the existence of "the other members" such as 
bool, pointer types. The results seem to have a lot of false positives.

== Scripts ==
@r@
type T, T2;
identifier i, eid;
position p;
attribute name __packed, __aligned;
attribute at;
@@
  T@p  {
    ...
(
   dma_addr_t i;
|
   phys_addr_t i;
|
   size_t i;
|
   struct device i;
|
   enum eid i;
|
   enum {...} i;
|
   T2 *i;
|
   bool i;
)
   ...
  } at;
@script:python@
p <<r.p;
T <<r.T;
a << r.at;
@@
if not "__align" in a and "__packed" in a:
   print("{}: {}".format(p[0].file, T))


== Results ==
drivers/net/wireless/purelifi/plfxlc/mac.h: struct plfxlc_header
drivers/gpu/drm/amd/amdgpu/amdgpu_ras_eeprom.h: struct eeprom_table_record
drivers/net/wireless/marvell/mwifiex/fw.h: struct mwifiex_bg_scan_cfg
drivers/net/wireless/marvell/mwifiex/fw.h: struct mwifiex_user_scan_cfg
kernel/power/snapshot.c: struct linked_page
drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls.h: struct key_map
drivers/net/wireless/ti/wlcore/acx.h: struct wl1271_acx_mem_map
drivers/staging/vt6655/desc.h: struct vnt_rx_desc
drivers/staging/vt6655/desc.h: struct vnt_tx_desc
drivers/atm/idt77252.h: struct idt77252_skb_prv
drivers/scsi/myrb.h: struct myrb_enquiry
drivers/scsi/myrb.h: struct myrb_enquiry2
drivers/staging/rtl8192e/rtllib.h: struct sw_chnl_cmd
sound/soc/intel/catpt/messages.c: struct catpt_set_write_pos_input
drivers/firmware/efi/test/efi_test.h: struct efi_getnexthighmonotoniccount
drivers/firmware/efi/test/efi_test.h: struct efi_getnextvariablename
drivers/firmware/efi/test/efi_test.h: struct efi_gettime
drivers/firmware/efi/test/efi_test.h: struct efi_getvariable
drivers/firmware/efi/test/efi_test.h: struct efi_getwakeuptime
drivers/firmware/efi/test/efi_test.h: struct efi_querycapsulecapabilities
drivers/firmware/efi/test/efi_test.h: struct efi_queryvariableinfo
drivers/firmware/efi/test/efi_test.h: struct efi_resetsystem
drivers/firmware/efi/test/efi_test.h: struct efi_settime
drivers/firmware/efi/test/efi_test.h: struct efi_setvariable
drivers/firmware/efi/test/efi_test.h: struct efi_setwakeuptime
fs/cifs/cifs_ioctl.h: struct smb3_notify
sound/soc/intel/skylake/skl-topology.h: struct skl_audio_data_format
sound/soc/intel/skylake/skl-topology.h: struct skl_src_module_cfg
sound/soc/intel/skylake/skl-topology.h: struct skl_up_down_mixer_cfg
drivers/staging/rtl8192e/rtl8192e/rtl_core.h: struct tx_ring
fs/ksmbd/smb2pdu.h: struct fs_type_info
net/tipc/msg.h: struct tipc_skb_cb
drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h: struct sta_rec_bf
drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h: struct sta_rec_bfee
include/linux/platform_data/cyttsp4.h: struct touch_framework
include/linux/platform_data/cyttsp4.h: struct touch_settings
drivers/scsi/wd719x.h: struct wd719x_scb
drivers/scsi/storvsc_drv.c: struct vstor_packet
drivers/net/wwan/iosm/iosm_ipc_mux.h: struct iosm_mux
include/linux/atmdev.h: struct atm_skb_data
drivers/staging/rtl8723bs/include/wlan_bssdef.h: struct wlan_bssid_ex
drivers/infiniband/ulp/iser/iscsi_iser.h: struct iser_login_desc
include/sound/sof/topology.h: struct sof_ipc_comp
drivers/net/wireless/intel/ipw2x00/ipw2200.h: struct clx2_queue
drivers/net/wireless/intel/ipw2x00/ipw2200.h: struct host_cmd
drivers/net/wireless/intel/ipw2x00/ipw2200.h: struct ipw_fw_error
drivers/staging/rtl8192e/rtl819x_HT.h: struct rt_hi_throughput
drivers/net/wireless/marvell/mwifiex/decl.h: struct mwifiex_11h_intf_state
drivers/net/wireless/marvell/mwifiex/decl.h: struct mwifiex_radar_params
security/tomoyo/common.h: struct tomoyo_acl_info
drivers/net/wireless/ti/wl1251/acx.h: struct wl1251_acx_mem_map
drivers/net/wireless/ath/ath10k/core.h: struct ath10k_skb_cb
include/linux/perf_event.h: struct perf_raw_frag
net/nfc/nci/hci.c: struct nci_data
include/net/sctp/ulpevent.h: struct sctp_ulpevent
drivers/net/wireless/ath/ath10k/wmi.h: struct mcast_bcast_rate
drivers/net/wireless/ath/ath10k/wmi.h: struct wmi_bcn_filter_rx_cmd
drivers/net/wireless/ath/ath10k/wmi.h: struct wmi_pno_scan_req
drivers/net/wireless/ath/ath10k/wmi.h: struct wmi_tim_info_arg
sound/soc/qcom/qdsp6/audioreach.c: struct apm_graph_open_params
include/uapi/sound/sof/fw.h: struct snd_sof_blk_hdr
include/uapi/sound/sof/fw.h: struct snd_sof_mod_hdr
drivers/staging/wlan-ng/p80211ioctl.h: struct p80211ioctl_req
drivers/infiniband/ulp/isert/ib_isert.h: struct iser_tx_desc
drivers/infiniband/core/mad_priv.h: struct ib_mad_private
include/linux/hyperv.h: struct vmbus_channel_message_header
drivers/infiniband/hw/irdma/osdep.h: struct irdma_dma_mem
drivers/infiniband/hw/irdma/osdep.h: struct irdma_virt_mem
drivers/crypto/qat/qat_common/adf_cfg_user.h: struct adf_user_cfg_key_val
drivers/net/wireless/marvell/libertas/rx.c: struct rx80211packethdr
include/linux/printk.h: struct pi_entry
net/mac80211/trace.h: struct trace_vif_entry
drivers/staging/r8188eu/include/wlan_bssdef.h: struct wlan_bssid_ex
arch/riscv/include/asm/alternative.h: struct alt_entry
include/uapi/linux/vbox_vmmdev_types.h: struct 
vmmdev_hgcm_function_parameter32
include/uapi/linux/vbox_vmmdev_types.h: struct 
vmmdev_hgcm_function_parameter64
drivers/nfc/st21nfca/st21nfca.h: struct st21nfca_dep_info
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct vidtv_psi_desc
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct 
vidtv_psi_desc_network_name
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct 
vidtv_psi_desc_registration
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct vidtv_psi_desc_service
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct 
vidtv_psi_desc_service_list
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct 
vidtv_psi_desc_service_list_entry
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct 
vidtv_psi_desc_short_event
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct vidtv_psi_table_eit
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct 
vidtv_psi_table_eit_event
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct vidtv_psi_table_nit
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct vidtv_psi_table_pat
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct 
vidtv_psi_table_pat_program
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct vidtv_psi_table_pmt
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct 
vidtv_psi_table_pmt_stream
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct vidtv_psi_table_sdt
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct 
vidtv_psi_table_sdt_service
drivers/media/test-drivers/vidtv/vidtv_psi.h: struct 
vidtv_psi_table_transport
drivers/hv/hv_balloon.c: struct dm_info_header
drivers/input/touchscreen/cyttsp4_core.h: struct cyttsp4_sysinfo_ptr
fs/eventpoll.c: struct epoll_filefd
drivers/net/wireless/ath/ath11k/core.h: struct ath11k_skb_cb
fs/vboxsf/shfl_hostintf.h: struct shfl_createparms
fs/vboxsf/shfl_hostintf.h: struct shfl_fsobjattr
drivers/net/ethernet/mellanox/mlx5/core/esw/vporttbl.c: struct 
mlx5_vport_key
drivers/usb/typec/ucsi/ucsi_ccg.c: struct ucsi_ccg_altmode
drivers/net/wireless/ti/wlcore/wlcore_i.h: struct wl12xx_rx_filter_field
drivers/scsi/qla2xxx/qla_edif_bsg.h: struct extra_auth_els
drivers/scsi/qla2xxx/qla_def.h: struct ql_vnd_mng_host_port_param
drivers/scsi/qla2xxx/qla_def.h: struct ql_vnd_mng_host_stats_param
drivers/staging/rtl8192u/r819xU_phy.h: struct sw_chnl_cmd
drivers/net/wireless/ath/wcn36xx/hal.h: struct wcn36xx_hal_config_bss_params
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_config_bss_params_v1
drivers/net/wireless/ath/wcn36xx/hal.h: struct wcn36xx_hal_config_sta_params
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_config_sta_params_v1
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_finish_scan_req_msg
drivers/net/wireless/ath/wcn36xx/hal.h: struct wcn36xx_hal_join_req_msg
drivers/net/wireless/ath/wcn36xx/hal.h: struct wcn36xx_hal_keys
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_mac_start_parameters
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_mac_stop_req_params
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_remove_bss_key_req_msg
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_remove_sta_key_req_msg
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_set_bss_key_req_msg
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_set_link_state_req_msg
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_set_sta_key_params
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_start_scan_offload_req_msg
drivers/net/wireless/ath/wcn36xx/hal.h: struct wcn36xx_hal_supported_rates
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_supported_rates_v1
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_switch_channel_req_msg
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_update_scan_params_req
drivers/net/wireless/ath/wcn36xx/hal.h: struct 
wcn36xx_hal_update_scan_params_req_ex
drivers/net/wireless/ath/ath11k/wmi.h: struct wmi_request_stats_cmd
drivers/net/wireless/ath/ath11k/wmi.h: struct wmi_vdev_start_resp_event
drivers/net/wireless/intel/ipw2x00/ipw2100.h: struct ipw2100_cmd_header
sound/soc/intel/atom/sst-mfld-dsp.h: struct snd_sst_runtime_params
drivers/misc/mei/hdcp/mei_hdcp.h: struct hdcp_cmd_header
arch/s390/include/asm/debug.h: struct __debug_entry

Keisuke
