Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA0655D23C
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 15:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D6B10EF4E;
	Tue, 28 Jun 2022 13:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6B7C10EF4E;
 Tue, 28 Jun 2022 13:10:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 148126170D;
 Tue, 28 Jun 2022 13:10:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86553C3411D;
 Tue, 28 Jun 2022 13:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656421830;
 bh=zaJPEAaU+2IfbqDeHuN4dAvwwL5eGrjWz/+JpqGOhkY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=lZBjp0/akQQG/fsX+EOzNJDZnz3AgW8oxqYgMuJ9ki9PciNapkpDFse9sUtmk4DW+
 hVYKROeXjkxwHbMmIdTaxiPRNHushRD9zKxTC1x5gr7YL1BsfHCWObKDhOrjAF3LG0
 WoJLiFtW5PUfGrGu6eCn9tHLbj7l83vtpEgetMlBOIizblbmiXEvUA6LanFmZSBG2+
 e8zgAe7z/B48hU9t+1t8O1ffXmP4LV9XOd0C5CmCCiam2dXYESoVFlxgP5qj5hs1hn
 Eti9QjQMH9n6YUFbUvVe058E7zWtgwPORzUcNR3th/aQ9Hq+aG93r2lLgXfG653zHV
 rR7M5tigR+4+w==
From: Mark Brown <broonie@kernel.org>
To: mchehab@kernel.org, linux-doc@vger.kernel.org
In-Reply-To: <cover.1656409369.git.mchehab@kernel.org>
References: <cover.1656409369.git.mchehab@kernel.org>
Subject: Re: (subset) [PATCH 00/22] Fix kernel-doc warnings at linux-next
Message-Id: <165642182225.1205882.7217075149410531618.b4-ty@kernel.org>
Date: Tue, 28 Jun 2022 14:10:22 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: heikki.krogerus@linux.intel.com, linux-cachefs@redhat.com,
	airlied@linux.ie, dave.hansen@linux.intel.com,
	dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
	glider@google.com, myungjoo.ham@samsung.com, hpa@zytor.com,
	sumit.semwal@linaro.org, corbet@lwn.net, mchehab+huawei@kernel.org,
	x86@kernel.org, kyungmin.park@samsung.com,
	kasan-dev@googlegroups.com, cw00.choi@samsung.com, mingo@redhat.com,
	kuba@kernel.org, pabeni@redhat.com, linux-media@vger.kernel.org,
	elver@google.com, linux-pm@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org, bp@alien8.de,
	Al Viro <viro@zeniv.linux.org.uk>, tglx@linutronix.de,
	Andrew Morton <akpm@linux-foundation.org>, dvyukov@google.com,
	linux-sgx@vger.kernel.org, balbi@kernel.org,
	amd-gfx@lists.freedesktop.org, netdev@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, davem@davemloft.net,
	ogle.com@freedesktop.org, linux-fsdevel@vger.kernel.org,
	johannes@sipsolutions.net, edumazet@go, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Jun 2022 10:46:04 +0100, Mauro Carvalho Chehab wrote:
> As we're currently discussing about making kernel-doc issues fatal when
> CONFIG_WERROR is enable, let's fix all 60 kernel-doc warnings
> inside linux-next:
> 
> 	arch/x86/include/uapi/asm/sgx.h:19: warning: Enum value 'SGX_PAGE_MEASURE' not described in enum 'sgx_page_flags'
> 	arch/x86/include/uapi/asm/sgx.h:97: warning: Function parameter or member 'rdi' not described in 'sgx_enclave_user_handler_t'
> 	arch/x86/include/uapi/asm/sgx.h:97: warning: Function parameter or member 'rsi' not described in 'sgx_enclave_user_handler_t'
> 	arch/x86/include/uapi/asm/sgx.h:97: warning: Function parameter or member 'rdx' not described in 'sgx_enclave_user_handler_t'
> 	arch/x86/include/uapi/asm/sgx.h:97: warning: Function parameter or member 'rsp' not described in 'sgx_enclave_user_handler_t'
> 	arch/x86/include/uapi/asm/sgx.h:97: warning: Function parameter or member 'r8' not described in 'sgx_enclave_user_handler_t'
> 	arch/x86/include/uapi/asm/sgx.h:97: warning: Function parameter or member 'r9' not described in 'sgx_enclave_user_handler_t'
> 	arch/x86/include/uapi/asm/sgx.h:124: warning: Function parameter or member 'reserved' not described in 'sgx_enclave_run'
> 	drivers/devfreq/devfreq.c:707: warning: Function parameter or member 'val' not described in 'qos_min_notifier_call'
> 	drivers/devfreq/devfreq.c:707: warning: Function parameter or member 'ptr' not described in 'qos_min_notifier_call'
> 	drivers/devfreq/devfreq.c:717: warning: Function parameter or member 'val' not described in 'qos_max_notifier_call'
> 	drivers/devfreq/devfreq.c:717: warning: Function parameter or member 'ptr' not described in 'qos_max_notifier_call'
> 	drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:5095: warning: expecting prototype for amdgpu_device_gpu_recover_imp(). Prototype was for amdgpu_device_gpu_recover() instead
> 	drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:544: warning: Function parameter or member 'dmub_outbox_params' not described in 'amdgpu_display_manager'
> 	drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:544: warning: Function parameter or member 'num_of_edps' not described in 'amdgpu_display_manager'
> 	drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:544: warning: Function parameter or member 'disable_hpd_irq' not described in 'amdgpu_display_manager'
> 	drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:544: warning: Function parameter or member 'dmub_aux_transfer_done' not described in 'amdgpu_display_manager'
> 	drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h:544: warning: Function parameter or member 'delayed_hpd_wq' not described in 'amdgpu_display_manager'
> 	drivers/gpu/drm/amd/include/amd_shared.h:224: warning: Enum value 'PP_GFX_DCS_MASK' not described in enum 'PP_FEATURE_MASK'
> 	drivers/gpu/drm/scheduler/sched_main.c:999: warning: Function parameter or member 'dev' not described in 'drm_sched_init'
> 	drivers/usb/dwc3/core.h:1328: warning: Function parameter or member 'async_callbacks' not described in 'dwc3'
> 	drivers/usb/dwc3/gadget.c:675: warning: Function parameter or member 'mult' not described in 'dwc3_gadget_calc_tx_fifo_size'
> 	fs/attr.c:36: warning: Function parameter or member 'ia_vfsuid' not described in 'chown_ok'
> 	fs/attr.c:36: warning: Excess function parameter 'uid' description in 'chown_ok'
> 	fs/attr.c:63: warning: Function parameter or member 'ia_vfsgid' not described in 'chgrp_ok'
> 	fs/attr.c:63: warning: Excess function parameter 'gid' description in 'chgrp_ok'
> 	fs/namei.c:649: warning: Function parameter or member 'mnt' not described in 'path_connected'
> 	fs/namei.c:649: warning: Function parameter or member 'dentry' not described in 'path_connected'
> 	fs/namei.c:1089: warning: Function parameter or member 'inode' not described in 'may_follow_link'
> 	include/drm/gpu_scheduler.h:463: warning: Function parameter or member 'dev' not described in 'drm_gpu_scheduler'
> 	include/linux/dcache.h:309: warning: expecting prototype for dget, dget_dlock(). Prototype was for dget_dlock() instead
> 	include/linux/fscache.h:270: warning: Function parameter or member 'cookie' not described in 'fscache_use_cookie'
> 	include/linux/fscache.h:270: warning: Excess function parameter 'object' description in 'fscache_use_cookie'
> 	include/linux/fscache.h:287: warning: Function parameter or member 'cookie' not described in 'fscache_unuse_cookie'
> 	include/linux/fscache.h:287: warning: Excess function parameter 'object' description in 'fscache_unuse_cookie'
> 	include/linux/genalloc.h:54: warning: Function parameter or member 'start_addr' not described in 'genpool_algo_t'
> 	include/linux/kfence.h:221: warning: Function parameter or member 'slab' not described in '__kfence_obj_info'
> 	include/linux/regulator/driver.h:434: warning: Function parameter or member 'n_ramp_values' not described in 'regulator_desc'
> 	include/linux/textsearch.h:51: warning: Function parameter or member 'list' not described in 'ts_ops'
> 	include/linux/usb/typec_altmode.h:132: warning: Function parameter or member 'altmode' not described in 'typec_altmode_get_orientation'
> 	include/net/cfg80211.h:391: warning: Function parameter or member 'bw' not described in 'ieee80211_eht_mcs_nss_supp'
> 	include/net/cfg80211.h:437: warning: Function parameter or member 'eht_cap' not described in 'ieee80211_sband_iftype_data'
> 	include/net/cfg80211.h:507: warning: Function parameter or member 's1g' not described in 'ieee80211_sta_s1g_cap'
> 	include/net/cfg80211.h:1390: warning: Function parameter or member 'counter_offset_beacon' not described in 'cfg80211_color_change_settings'
> 	include/net/cfg80211.h:1390: warning: Function parameter or member 'counter_offset_presp' not described in 'cfg80211_color_change_settings'
> 	include/net/cfg80211.h:1430: warning: Enum value 'STATION_PARAM_APPLY_STA_TXPOWER' not described in enum 'station_parameters_apply_mask'
> 	include/net/cfg80211.h:2195: warning: Function parameter or member 'dot11MeshConnectedToAuthServer' not described in 'mesh_config'
> 	include/net/cfg80211.h:2341: warning: Function parameter or member 'short_ssid' not described in 'cfg80211_scan_6ghz_params'
> 	include/net/cfg80211.h:3328: warning: Function parameter or member 'kck_len' not described in 'cfg80211_gtk_rekey_data'
> 	include/net/cfg80211.h:3698: warning: Function parameter or member 'ftm' not described in 'cfg80211_pmsr_result'
> 	include/net/cfg80211.h:3828: warning: Function parameter or member 'global_mcast_stypes' not described in 'mgmt_frame_regs'
> 	include/net/cfg80211.h:4977: warning: Function parameter or member 'ftm' not described in 'cfg80211_pmsr_capabilities'
> 	include/net/cfg80211.h:5742: warning: Function parameter or member 'u' not described in 'wireless_dev'
> 	include/net/cfg80211.h:5742: warning: Function parameter or member 'links' not described in 'wireless_dev'
> 	include/net/cfg80211.h:5742: warning: Function parameter or member 'valid_links' not described in 'wireless_dev'
> 	include/net/cfg80211.h:6076: warning: Function parameter or member 'is_amsdu' not described in 'ieee80211_data_to_8023_exthdr'
> 	include/net/cfg80211.h:6949: warning: Function parameter or member 'sig_dbm' not described in 'cfg80211_notify_new_peer_candidate'
> 	include/net/mac80211.h:6250: warning: Function parameter or member 'vif' not described in 'ieee80211_channel_switch_disconnect'
> 	mm/memory.c:1729: warning: Function parameter or member 'mt' not described in 'unmap_vmas'
> 	net/mac80211/sta_info.h:569: warning: Function parameter or member 'cur_max_bandwidth' not described in 'link_sta_info'
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[18/22] regulator: fix a kernel-doc warning
        commit: 0e584d46218e3b9dc12a98e18e81a0cd3e0d5419

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark
