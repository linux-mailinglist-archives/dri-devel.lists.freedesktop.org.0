Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BD236716B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 19:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B4E89FA9;
	Wed, 21 Apr 2021 17:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC9C26E0D2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 17:35:56 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id d25so5670137oij.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 10:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bpCDUCqT+OwFgcpuj2fWjG7Ict+dwXTyBgmfzjmmGUA=;
 b=ha7VaYqROLvrno8Mb48a0pB5ztbq7g1jMJQuyX0dIyPCkf8Pox5BobKLegQbGOB2Ce
 HrtSuHfNSAazYmqyvfHKd2LAoDY1yMLGEzCDH3+sMgIAE9hk1BuxAdwiuTY16HG26Nwr
 xiv40MYdWAIXQeKvyVhgv31tPkpvIKBHTSDFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpCDUCqT+OwFgcpuj2fWjG7Ict+dwXTyBgmfzjmmGUA=;
 b=B173vcUX1S1zGsUrIecZcZmFhK0qJgbIWCWCDyJlkGwvMHdUTp8H2KCe4DJ25QzpKU
 x2lP1zbxcOctl6yuv7GHfmPUH+5oVLqTE1LRyGMOFb4Re2AsBNNRLz/mmpWpJioRg8ux
 tCosJcSJb6xnCIuxI8tkIfmB0HhqjMGE8eiVxOBrpCa8gIRk0j/o8Vxk2TjxUNia2E+x
 R+BGnD3loPq3kvaMgQ5jertAnwIC4vKdxKpNp7MSOzo7XCldFsdpcLvsff+Ls/OCcb8j
 f5PQqHMJhyrMtSLG9Sfi40ntLdn+lgNKwiouU7LT+36c2haECxRHfwPQnDem4B7o9lyP
 2mUQ==
X-Gm-Message-State: AOAM530PWZcDopBt0VlGz7CIrQb+AB1uhDpE+CAV3FJmkWn2WCMazS/d
 /YS8aCB+CYklE/YhXlJ11Gi5yJNy3VAXcKadn8KGnQ==
X-Google-Smtp-Source: ABdhPJxCdv/2UXlFHN7cOjKdT/S6ke/GdeUg68Mvr9awrcgGqzHVKWJISzYhPxKassQZvnwbBz5DnvBYF6OUsWKIg70=
X-Received: by 2002:a05:6808:9b0:: with SMTP id
 e16mr6983191oig.128.1619026555765; 
 Wed, 21 Apr 2021 10:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210421130105.1226686-1-gregkh@linuxfoundation.org>
In-Reply-To: <20210421130105.1226686-1-gregkh@linuxfoundation.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 21 Apr 2021 19:35:44 +0200
Message-ID: <CAKMK7uFONR-12CZEGJLrjgS0N-kF_v7_cXJEiSBPFoBbyRHn0w@mail.gmail.com>
Subject: Re: [PATCH 000/190] Revertion of all of the umn.edu commits
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 intel-gfx <intel-gfx@lists.freedesktop.org>, "Anholt, Eric" <eric@anholt.net>, 
 "airlied@gmail.com" <airlied@gmail.com>
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
Cc: Jean Delvare <jdelvare@suse.com>, David Airlie <airlied@linux.ie>,
 Kangjie Lu <kjlu@umn.edu>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Aditya Pakki <pakki001@umn.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 21, 2021 at 3:01 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I have been meaning to do this for a while, but recent events have
> finally forced me to do so.
>
> Commits from @umn.edu addresses have been found to be submitted in "bad
> faith" to try to test the kernel community's ability to review "known
> malicious" changes.  The result of these submissions can be found in a
> paper published at the 42nd IEEE Symposium on Security and Privacy
> entitled, "Open Source Insecurity: Stealthily Introducing
> Vulnerabilities via Hypocrite Commits" written by Qiushi Wu (University
> of Minnesota) and Kangjie Lu (University of Minnesota).
>
> Because of this, all submissions from this group must be reverted from
> the kernel tree and will need to be re-reviewed again to determine if
> they actually are a valid fix.  Until that work is complete, remove this
> change to ensure that no problems are being introduced into the
> codebase.
>
> This patchset has the "easy" reverts, there are 68 remaining ones that
> need to be manually reviewed.  Some of them are not able to be reverted
> as they already have been reverted, or fixed up with follow-on patches
> as they were determined to be invalid.  Proof that these submissions
> were almost universally wrong.

Will you take care of these remaining ones in subsequent patches too?

> I will be working with some other kernel developers to determine if any
> of these reverts were actually valid changes, were actually valid, and
> if so, will resubmit them properly later.  For now, it's better to be
> safe.
>
> I'll take this through my tree, so no need for any maintainer to worry
> about this, but they should be aware that future submissions from anyone
> with a umn.edu address should be by default-rejected unless otherwise
> determined to actually be a valid fix (i.e. they provide proof and you
> can verify it, but really, why waste your time doing that extra work?)
>
> thanks,
>
> greg k-h
>
> Greg Kroah-Hartman (190):
>   Revert "net/rds: Avoid potential use after free in
>     rds_send_remove_from_sock"
>   Revert "media: st-delta: Fix reference count leak in delta_run_work"
>   Revert "media: sti: Fix reference count leaks"
>   Revert "media: exynos4-is: Fix several reference count leaks due to
>     pm_runtime_get_sync"
>   Revert "media: exynos4-is: Fix a reference count leak due to
>     pm_runtime_get_sync"
>   Revert "media: exynos4-is: Fix a reference count leak"
>   Revert "media: ti-vpe: Fix a missing check and reference count leak"
>   Revert "media: stm32-dcmi: Fix a reference count leak"
>   Revert "media: s5p-mfc: Fix a reference count leak"
>   Revert "media: camss: Fix a reference count leak."
>   Revert "media: platform: fcp: Fix a reference count leak."
>   Revert "media: rockchip/rga: Fix a reference count leak."
>   Revert "media: rcar-vin: Fix a reference count leak."
>   Revert "media: rcar-vin: Fix a reference count leak."
>   Revert "firmware: Fix a reference count leak."
>   Revert "drm/nouveau: fix reference count leak in
>     nouveau_debugfs_strap_peek"
>   Revert "drm/nouveau: fix reference count leak in
>     nv50_disp_atomic_commit"
>   Revert "drm/nouveau: fix multiple instances of reference count leaks"
>   Revert "drm/nouveau/drm/noveau: fix reference count leak in
>     nouveau_fbcon_open"
>   Revert "PCI: Fix pci_create_slot() reference count leak"
>   Revert "omapfb: fix multiple reference count leaks due to
>     pm_runtime_get_sync"
>   Revert "drm/radeon: Fix reference count leaks caused by
>     pm_runtime_get_sync"
>   Revert "drm/radeon: fix multiple reference count leak"
>   Revert "drm/amdkfd: Fix reference count leaks."

I didn't review these carefully, but from a quick look they all seem
rather inconsequental. Either error paths that are very unlikely, or
drivers which are very dead (looking at the entire list, not just what
you reverted here).

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Also adding drm maintainers/lists, those aren't all on your cc it
seems. I will also forward this to fd.o sitewranglers as abuse of our
infrastructure, it's for community collaboration, not for inflicting
experiments on unconsenting subjects.

I'me dropping non-drm people here so not everyone gets spammed too badly.
-Daniel

>   Revert "platform/chrome: cros_ec_ishtp: Fix a double-unlock issue"
>   Revert "usb: dwc3: pci: Fix reference count leak in
>     dwc3_pci_resume_work"
>   Revert "ASoC: rockchip: Fix a reference count leak."
>   Revert "RDMA/rvt: Fix potential memory leak caused by rvt_alloc_rq"
>   Revert "EDAC: Fix reference count leaks"
>   Revert "ASoC: tegra: Fix reference count leaks."
>   Revert "test_objagg: Fix potential memory leak in error handling"
>   Revert "ASoC: img-parallel-out: Fix a reference count leak"
>   Revert "ASoC: img: Fix a reference count leak in img_i2s_in_set_fmt"
>   Revert "efi/esrt: Fix reference count leak in
>     esre_create_sysfs_entry."
>   Revert "scsi: iscsi: Fix reference count leak in
>     iscsi_boot_create_kobj"
>   Revert "vfio/mdev: Fix reference count leak in
>     add_mdev_supported_type"
>   Revert "RDMA/core: Fix several reference count leaks."
>   Revert "cpuidle: Fix three reference count leaks"
>   Revert "iommu: Fix reference count leak in iommu_group_alloc."
>   Revert "ACPI: CPPC: Fix reference count leak in
>     acpi_cppc_processor_probe()"
>   Revert "ACPI: sysfs: Fix reference count leak in
>     acpi_sysfs_add_hotplug_profile()"
>   Revert "ASoC: fix incomplete error-handling in img_i2s_in_probe."
>   Revert "qlcnic: fix missing release in qlcnic_83xx_interrupt_test."
>   Revert "RDMA/pvrdma: Fix missing pci disable in pvrdma_pci_probe()"
>   Revert "usb: gadget: fix potential double-free in m66592_probe."
>   Revert "net/mlx4_core: fix a memory leak bug."
>   Revert "rxrpc: Fix a memory leak in rxkad_verify_response()"
>   Revert "net: sun: fix missing release regions in cas_init_one()."
>   Revert "agp/intel: Fix a memory leak on module initialisation failure"
>   Revert "nfp: abm: fix a memory leak bug"
>   Revert "power: supply: core: fix memory leak in HWMON error path"
>   Revert "media: media/saa7146: fix incorrect assertion in
>     saa7146_buffer_finish"
>   Revert "ecryptfs: replace BUG_ON with error handling code"
>   Revert "clk: samsung: Remove redundant check in
>     samsung_cmu_register_one"
>   Revert "fs: ocfs: remove unnecessary assertion in dlm_migrate_lockres"
>   Revert "media: davinci/vpfe_capture.c: Avoid BUG_ON for register
>     failure"
>   Revert "media: saa7146: Avoid using BUG_ON as an assertion"
>   Revert "media: cx231xx: replace BUG_ON with recovery code"
>   Revert "RDMA/srpt: Remove unnecessary assertion in
>     srpt_queue_response"
>   Revert "staging: kpc2000: remove unnecessary assertions in
>     kpc_dma_transfer"
>   Revert "xen/grant-table: remove multiple BUG_ON on gnttab_interface"
>   Revert "scsi: libfc: remove unnecessary assertion on ep variable"
>   Revert "hdlcdrv: replace unnecessary assertion in hdlcdrv_register"
>   Revert "nfc: s3fwrn5: replace the assertion with a WARN_ON"
>   Revert "nfsd: remove unnecessary assertion in nfsd4_encode_replay"
>   Revert "bpf: Remove unnecessary assertion on fp_old"
>   Revert "net: caif: replace BUG_ON with recovery code"
>   Revert "fore200e: Fix incorrect checks of NULL pointer dereference"
>   Revert "mac80211: Remove redundant assertion"
>   Revert "rfkill: Fix incorrect check to avoid NULL pointer dereference"
>   Revert "pppoe: remove redundant BUG_ON() check in pppoe_pernet"
>   Revert "net: atm: Reduce the severity of logging in unlink_clip_vcc"
>   Revert "media: rcar_drif: fix a memory disclosure"
>   Revert "drm/gma500: fix memory disclosures due to uninitialized bytes"
>   Revert "gma/gma500: fix a memory disclosure bug due to uninitialized
>     bytes"
>   Revert "net: ixgbevf: fix a missing check of
>     ixgbevf_write_msg_read_ack"
>   Revert "rapidio: fix a NULL pointer dereference when
>     create_workqueue() fails"
>   Revert "ASoC: cs43130: fix a NULL pointer dereference"
>   Revert "ASoC: rt5645: fix a NULL pointer dereference"
>   Revert "ALSA: usx2y: fix a double free bug"
>   Revert "tracing: Fix a memory leak by early error exit in
>     trace_pid_write()"
>   Revert "rsi: Fix NULL pointer dereference in kmalloc"
>   Revert "net: cw1200: fix a NULL pointer dereference"
>   Revert "net: ieee802154: fix missing checks for regmap_update_bits"
>   Revert "audit: fix a memory leak bug"
>   Revert "x86/PCI: Fix PCI IRQ routing table memory leak"
>   Revert "udf: fix an uninitialized read bug and remove dead code"
>   Revert "mmc_spi: add a status check for spi_sync_locked"
>   Revert "PCI: endpoint: Fix a potential NULL pointer dereference"
>   Revert "net/smc: fix a NULL pointer dereference"
>   Revert "pinctrl: axp209: Fix NULL pointer dereference after
>     allocation"
>   Revert "power: charger-manager: fix a potential NULL pointer
>     dereference"
>   Revert "iio: hmc5843: fix potential NULL pointer dereferences"
>   Revert "iio: adc: fix a potential NULL pointer dereference"
>   Revert "rtlwifi: fix a potential NULL pointer dereference"
>   Revert "net: mwifiex: fix a NULL pointer dereference"
>   Revert "video: imsttfb: fix potential NULL pointer dereferences"
>   Revert "video: hgafb: fix potential NULL pointer dereference"
>   Revert "omapfb: Fix potential NULL pointer dereference in kmalloc"
>   Revert "staging: greybus: audio_manager: fix a missing check of
>     ida_simple_get"
>   Revert "PCI: xilinx: Check for __get_free_pages() failure"
>   Revert "media: video-mux: fix null pointer dereferences"
>   Revert "thunderbolt: property: Fix a missing check of kzalloc"
>   Revert "char: hpet: fix a missing check of ioremap"
>   Revert "libnvdimm/btt: Fix a kmemdup failure check"
>   Revert "tty: ipwireless: fix missing checks for ioremap"
>   Revert "RDMA/i40iw: Handle workqueue allocation failure"
>   Revert "usb: u132-hcd: fix potential NULL pointer dereference"
>   Revert "usb: sierra: fix a missing check of device_create_file"
>   Revert "scsi: qla4xxx: fix a potential NULL pointer dereference"
>   Revert "gpio: aspeed: fix a potential NULL pointer dereference"
>   Revert "libnvdimm/namespace: Fix a potential NULL pointer dereference"
>   Revert "x86/hpet: Prevent potential NULL pointer dereference"
>   Revert "staging: rtl8188eu: Fix potential NULL pointer dereference of
>     kcalloc"
>   Revert "thunderbolt: Fix a missing check of kmemdup"
>   Revert "thunderbolt: property: Fix a NULL pointer dereference"
>   Revert "media: si2165: fix a missing check of return value"
>   Revert "scsi: ufs: fix a missing check of devm_reset_control_get"
>   Revert "tty: mxs-auart: fix a potential NULL pointer dereference"
>   Revert "tty: atmel_serial: fix a potential NULL pointer dereference"
>   Revert "serial: mvebu-uart: Fix to avoid a potential NULL pointer
>     dereference"
>   Revert "HID: logitech: check the return value of
>     create_singlethread_workqueue"
>   Revert "netfilter: ip6t_srh: fix NULL pointer dereferences"
>   Revert "spi : spi-topcliff-pch: Fix to handle empty DMA buffers"
>   Revert "net: tipc: fix a missing check of nla_nest_start"
>   Revert "net: openvswitch: fix a NULL pointer dereference"
>   Revert "ALSA: sb8: add a check for request_region"
>   Revert "net: strparser: fix a missing check for
>     create_singlethread_workqueue"
>   Revert "qlcnic: Avoid potential NULL pointer dereference"
>   Revert "ALSA: usx2y: Fix potential NULL pointer dereference"
>   Revert "net: 8390: fix potential NULL pointer dereferences"
>   Revert "net: fujitsu: fix a potential NULL pointer dereference"
>   Revert "net: qlogic: fix a potential NULL pointer dereference"
>   Revert "md: Fix failed allocation of md_register_thread"
>   Revert "net: rocker: fix a potential NULL pointer dereference"
>   Revert "net: thunder: fix a potential NULL pointer dereference"
>   Revert "net: lio_core: fix two NULL pointer dereferences"
>   Revert "net: liquidio: fix a NULL pointer dereference"
>   Revert "isdn: mISDNinfineon: fix potential NULL pointer dereference"
>   Revert "isdn: mISDN: Fix potential NULL pointer dereference of
>     kzalloc"
>   Revert "libertas: add checks for the return value of
>     sysfs_create_group"
>   Revert "rtc: hym8563: fix a missing check of block data read"
>   Revert "power: twl4030: fix a missing check of return value"
>   Revert "misc/ics932s401: Add a missing check to
>     i2c_smbus_read_word_data"
>   Revert "leds: lp5523: fix a missing check of return value of
>     lp55xx_read"
>   Revert "media: dvb: Add check on sp8870_readreg"
>   Revert "media: dvb: add return value check on Write16"
>   Revert "media: mt312: fix a missing check of mt312 reset"
>   Revert "media: lgdt3306a: fix a missing check of return value"
>   Revert "media: gspca: mt9m111: Check write_bridge for timeout"
>   Revert "media: gspca: Check the return value of write_bridge for
>     timeout"
>   Revert "media: usb: gspca: add a missed check for goto_low_power"
>   Revert "media: usb: gspca: add a missed return-value check for
>     do_command"
>   Revert "ath6kl: return error code in ath6kl_wmi_set_roam_lrssi_cmd()"
>   Revert "brcmfmac: add a check for the status of usb_register"
>   Revert "serial: max310x: pass return value of spi_register_driver"
>   Revert "Input: ad7879 - add check for read errors in interrupt"
>   Revert "ALSA: sb: fix a missing check of snd_ctl_add"
>   Revert "ALSA: gus: add a check of the status of snd_ctl_add"
>   Revert "Staging: rts5208: Fix error handling on rtsx_send_cmd"
>   Revert "staging: rts5208: Add a check for ms_read_extra_data"
>   Revert "dmaengine: qcom_hidma: Check for driver register failure"
>   Revert "dmaengine: mv_xor: Fix a missing check in mv_xor_channel_add"
>   Revert "iio: ad9523: fix a missing check of return value"
>   Revert "mfd: mc13xxx: Fix a missing check of a register-read failure"
>   Revert "infiniband: bnxt_re: qplib: Check the return value of
>     send_message"
>   Revert "gdrom: fix a memory leak bug"
>   Revert "net: marvell: fix a missing check of acpi_match_device"
>   Revert "atl1e: checking the status of atl1e_write_phy_reg"
>   Revert "net: dsa: bcm_sf2: Propagate error value from mdio_write"
>   Revert "net: stmicro: fix a missing check of clk_prepare"
>   Revert "net: (cpts) fix a missing check of clk_prepare"
>   Revert "niu: fix missing checks of niu_pci_eeprom_read"
>   Revert "net: chelsio: Add a missing check on cudg_get_buffer"
>   Revert "ipv6/route: Add a missing check on proc_dointvec"
>   Revert "net/net_namespace: Check the return value of
>     register_pernet_subsys()"
>   Revert "hwmon: (lm80) fix a missing check of bus read in lm80 probe"
>   Revert "net: netxen: fix a missing check and an uninitialized use"
>   Revert "drivers/regulator: fix a missing check of return value"
>   Revert "net: socket: fix a missing-check bug"
>   Revert "dm ioctl: harden copy_params()'s copy_from_user() from
>     malicious users"
>   Revert "ethtool: fix a missing-check bug"
>   Revert "media: isif: fix a NULL pointer dereference bug"
>   Revert "yam: fix a missing-check bug"
>   Revert "net: cxgb3_main: fix a missing-check bug"
>   Revert "virt: vbox: Only copy_from_user the request-header once"
>   Revert "ALSA: control: fix a redundant-copy issue"
>   Revert "scsi: 3w-xxxx: fix a missing-check bug"
>   Revert "scsi: 3w-9xxx: fix a missing-check bug"
>   Revert "ethtool: fix a potential missing-check bug"
>
>  arch/x86/kernel/hpet.c                        |  2 --
>  arch/x86/pci/irq.c                            | 10 ++----
>  drivers/acpi/cppc_acpi.c                      |  1 -
>  drivers/acpi/sysfs.c                          |  4 +--
>  drivers/atm/fore200e.c                        | 25 +++++----------
>  drivers/cdrom/gdrom.c                         |  1 -
>  drivers/char/agp/intel-gtt.c                  |  4 +--
>  drivers/char/hpet.c                           |  2 --
>  drivers/clk/samsung/clk.c                     |  4 +++
>  drivers/cpuidle/sysfs.c                       |  6 ++--
>  drivers/dma/mv_xor.c                          |  5 +--
>  drivers/dma/qcom/hidma_mgmt.c                 |  3 +-
>  drivers/edac/edac_device_sysfs.c              |  1 -
>  drivers/edac/edac_pci_sysfs.c                 |  2 +-
>  drivers/firmware/efi/esrt.c                   |  2 +-
>  drivers/firmware/qemu_fw_cfg.c                |  7 ++---
>  drivers/gpio/gpio-aspeed.c                    |  2 --
>  drivers/gpu/drm/amd/amdkfd/kfd_topology.c     | 20 +++---------
>  drivers/gpu/drm/gma500/cdv_intel_display.c    |  2 --
>  drivers/gpu/drm/gma500/oaktrail_crtc.c        |  2 --
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c     |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_drm.c         |  8 ++---
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c       |  4 +--
>  drivers/gpu/drm/nouveau/nouveau_gem.c         |  4 +--
>  drivers/gpu/drm/radeon/radeon_connectors.c    | 20 +++---------
>  drivers/gpu/drm/radeon/radeon_display.c       |  4 +--
>  drivers/gpu/drm/radeon/radeon_drv.c           |  4 +--
>  drivers/gpu/drm/radeon/radeon_kms.c           |  4 +--
>  drivers/hid/hid-logitech-hidpp.c              |  8 +----
>  drivers/hwmon/lm80.c                          | 11 ++-----
>  drivers/iio/adc/mxs-lradc-adc.c               |  2 --
>  drivers/iio/frequency/ad9523.c                |  7 ++---
>  drivers/iio/magnetometer/hmc5843_i2c.c        |  7 +----
>  drivers/iio/magnetometer/hmc5843_spi.c        |  7 +----
>  drivers/infiniband/core/sysfs.c               | 10 +++---
>  drivers/infiniband/hw/bnxt_re/qplib_sp.c      |  5 +--
>  drivers/infiniband/hw/i40iw/i40iw.h           |  2 +-
>  drivers/infiniband/hw/i40iw/i40iw_cm.c        | 18 ++---------
>  drivers/infiniband/hw/i40iw/i40iw_main.c      |  5 +--
>  .../infiniband/hw/vmw_pvrdma/pvrdma_main.c    |  2 +-
>  drivers/infiniband/sw/rdmavt/qp.c             |  6 ++--
>  drivers/infiniband/ulp/srpt/ib_srpt.c         |  2 ++
>  drivers/input/touchscreen/ad7879.c            | 11 +++----
>  drivers/iommu/iommu.c                         |  2 +-
>  drivers/isdn/hardware/mISDN/hfcsusb.c         |  3 --
>  drivers/isdn/hardware/mISDN/mISDNinfineon.c   |  5 +--
>  drivers/leds/leds-lp5523.c                    |  4 +--
>  drivers/md/dm-ioctl.c                         | 18 +++++++----
>  drivers/md/raid10.c                           |  2 --
>  drivers/md/raid5.c                            |  2 --
>  drivers/media/common/saa7146/saa7146_fops.c   |  2 ++
>  drivers/media/common/saa7146/saa7146_video.c  |  6 ++--
>  drivers/media/dvb-frontends/drxd_hard.c       | 30 +++++++-----------
>  drivers/media/dvb-frontends/lgdt3306a.c       |  5 +--
>  drivers/media/dvb-frontends/mt312.c           |  4 +--
>  drivers/media/dvb-frontends/si2165.c          |  8 ++---
>  drivers/media/dvb-frontends/sp8870.c          |  4 +--
>  drivers/media/platform/davinci/isif.c         |  3 +-
>  drivers/media/platform/davinci/vpfe_capture.c | 31 +++++++++----------
>  drivers/media/platform/exynos4-is/fimc-isp.c  |  4 +--
>  drivers/media/platform/exynos4-is/fimc-lite.c |  2 +-
>  drivers/media/platform/exynos4-is/media-dev.c |  4 +--
>  drivers/media/platform/exynos4-is/mipi-csis.c |  4 +--
>  .../media/platform/qcom/camss/camss-csiphy.c  |  4 +--
>  drivers/media/platform/rcar-fcp.c             |  4 +--
>  drivers/media/platform/rcar-vin/rcar-dma.c    |  4 +--
>  drivers/media/platform/rcar-vin/rcar-v4l2.c   |  4 +--
>  drivers/media/platform/rcar_drif.c            |  1 -
>  drivers/media/platform/rockchip/rga/rga-buf.c |  1 -
>  drivers/media/platform/s5p-mfc/s5p_mfc_pm.c   |  4 +--
>  drivers/media/platform/sti/delta/delta-v4l2.c |  4 +--
>  drivers/media/platform/sti/hva/hva-hw.c       |  2 --
>  drivers/media/platform/stm32/stm32-dcmi.c     |  4 ++-
>  drivers/media/platform/ti-vpe/vpe.c           |  2 --
>  drivers/media/platform/video-mux.c            |  5 ---
>  drivers/media/usb/cx231xx/cx231xx-i2c.c       |  3 +-
>  drivers/media/usb/gspca/cpia1.c               | 14 ++-------
>  drivers/media/usb/gspca/m5602/m5602_mt9m111.c |  8 ++---
>  drivers/media/usb/gspca/m5602/m5602_po1030.c  |  8 ++---
>  drivers/mfd/mc13xxx-core.c                    |  4 +--
>  drivers/misc/ics932s401.c                     |  2 --
>  drivers/mmc/host/mmc_spi.c                    |  4 ---
>  drivers/net/caif/caif_serial.c                |  4 +--
>  drivers/net/dsa/bcm_sf2.c                     |  7 +++--
>  drivers/net/ethernet/8390/pcnet_cs.c          | 10 ------
>  .../net/ethernet/atheros/atl1e/atl1e_main.c   |  4 +--
>  .../net/ethernet/cavium/liquidio/lio_core.c   | 10 ------
>  .../net/ethernet/cavium/liquidio/lio_main.c   |  5 ---
>  .../net/ethernet/cavium/thunder/nicvf_main.c  |  6 ----
>  .../net/ethernet/chelsio/cxgb3/cxgb3_main.c   | 17 ----------
>  .../net/ethernet/chelsio/cxgb4/cudbg_lib.c    |  4 ---
>  drivers/net/ethernet/fujitsu/fmvj18x_cs.c     |  5 ---
>  drivers/net/ethernet/intel/ixgbevf/vf.c       |  5 +--
>  .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  2 --
>  drivers/net/ethernet/mellanox/mlx4/fw.c       |  2 +-
>  drivers/net/ethernet/netronome/nfp/abm/main.c |  1 -
>  .../ethernet/qlogic/netxen/netxen_nic_init.c  |  3 +-
>  drivers/net/ethernet/qlogic/qla3xxx.c         |  6 ----
>  .../ethernet/qlogic/qlcnic/qlcnic_83xx_hw.c   |  4 +--
>  .../ethernet/qlogic/qlcnic/qlcnic_ethtool.c   |  2 --
>  drivers/net/ethernet/rocker/rocker_main.c     |  5 ---
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  4 +--
>  drivers/net/ethernet/sun/cassini.c            |  3 +-
>  drivers/net/ethernet/sun/niu.c                | 10 ++----
>  drivers/net/ethernet/ti/cpts.c                |  4 +--
>  drivers/net/hamradio/hdlcdrv.c                |  2 ++
>  drivers/net/hamradio/yam.c                    |  4 ---
>  drivers/net/ieee802154/mcr20a.c               |  6 ----
>  drivers/net/ppp/pppoe.c                       |  2 ++
>  drivers/net/wireless/ath/ath6kl/wmi.c         |  4 ++-
>  .../broadcom/brcm80211/brcmfmac/usb.c         |  6 +---
>  drivers/net/wireless/marvell/libertas/mesh.c  |  5 ---
>  drivers/net/wireless/marvell/mwifiex/cmdevt.c |  6 ----
>  drivers/net/wireless/realtek/rtlwifi/base.c   |  5 ---
>  drivers/net/wireless/rsi/rsi_91x_mac80211.c   | 30 +++++++-----------
>  drivers/net/wireless/st/cw1200/main.c         |  5 ---
>  drivers/nfc/s3fwrn5/firmware.c                |  5 +--
>  drivers/nvdimm/btt_devs.c                     | 18 +++--------
>  drivers/nvdimm/namespace_devs.c               |  5 +--
>  drivers/pci/controller/pcie-xilinx.c          | 12 ++-----
>  drivers/pci/endpoint/functions/pci-epf-test.c |  5 ---
>  drivers/pci/slot.c                            |  6 ++--
>  drivers/pinctrl/pinctrl-axp209.c              |  2 --
>  drivers/platform/chrome/cros_ec_ishtp.c       |  4 +--
>  drivers/power/supply/charger-manager.c        |  3 --
>  drivers/power/supply/power_supply_hwmon.c     |  2 +-
>  drivers/power/supply/twl4030_charger.c        |  4 +--
>  drivers/rapidio/rio_cm.c                      |  8 -----
>  drivers/regulator/palmas-regulator.c          |  5 +--
>  drivers/rtc/rtc-hym8563.c                     |  2 --
>  drivers/scsi/3w-9xxx.c                        |  5 ---
>  drivers/scsi/3w-xxxx.c                        |  3 --
>  drivers/scsi/iscsi_boot_sysfs.c               |  2 +-
>  drivers/scsi/qla4xxx/ql4_os.c                 |  2 --
>  drivers/scsi/ufs/ufs-hisi.c                   |  4 ---
>  drivers/spi/spi-topcliff-pch.c                | 15 ++-------
>  drivers/staging/greybus/audio_manager.c       |  3 --
>  drivers/staging/kpc2000/kpc_dma/fileops.c     |  2 ++
>  drivers/staging/rtl8188eu/core/rtw_xmit.c     |  9 ++----
>  drivers/staging/rtl8188eu/include/rtw_xmit.h  |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 14 ++++-----
>  drivers/staging/rtl8723bs/include/rtw_xmit.h  |  2 +-
>  drivers/staging/rts5208/ms.c                  |  5 +--
>  drivers/staging/rts5208/sd.c                  |  7 +----
>  drivers/target/tcm_fc/tfc_io.c                |  1 +
>  drivers/thunderbolt/property.c                | 16 +---------
>  drivers/tty/ipwireless/main.c                 |  8 -----
>  drivers/tty/serial/atmel_serial.c             |  4 ---
>  drivers/tty/serial/max310x.c                  |  4 +--
>  drivers/tty/serial/mvebu-uart.c               |  3 --
>  drivers/tty/serial/mxs-auart.c                |  4 ---
>  drivers/usb/dwc3/dwc3-pci.c                   |  4 +--
>  drivers/usb/gadget/udc/m66592-udc.c           |  2 +-
>  drivers/usb/host/u132-hcd.c                   |  2 --
>  drivers/usb/storage/sierra_ms.c               |  4 ++-
>  drivers/vfio/mdev/mdev_sysfs.c                |  2 +-
>  drivers/video/fbdev/hgafb.c                   |  2 --
>  drivers/video/fbdev/imsttfb.c                 |  5 ---
>  drivers/video/fbdev/omap2/omapfb/dss/dispc.c  |  7 ++---
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  7 ++---
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  7 ++---
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  5 ++-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  5 ++-
>  .../omap2/omapfb/dss/omapdss-boot-init.c      |  2 --
>  drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  7 ++---
>  drivers/virt/vboxguest/vboxguest_linux.c      |  4 +--
>  drivers/xen/grant-table.c                     |  4 +++
>  fs/ecryptfs/crypto.c                          |  6 ++--
>  fs/nfsd/nfs4xdr.c                             |  2 ++
>  fs/ocfs2/dlm/dlmmaster.c                      |  2 ++
>  fs/udf/namei.c                                | 15 +++++++++
>  kernel/auditfilter.c                          | 12 +++----
>  kernel/bpf/core.c                             |  2 ++
>  kernel/trace/trace.c                          |  5 +--
>  lib/test_objagg.c                             |  4 +--
>  net/atm/clip.c                                |  6 ++--
>  net/core/net_namespace.c                      |  3 +-
>  net/ethtool/ioctl.c                           |  8 -----
>  net/ipv6/netfilter/ip6t_srh.c                 |  6 ----
>  net/ipv6/route.c                              |  6 +---
>  net/mac80211/util.c                           |  1 +
>  net/openvswitch/datapath.c                    |  4 ---
>  net/rds/message.c                             |  1 -
>  net/rds/send.c                                |  2 +-
>  net/rfkill/core.c                             |  7 ++---
>  net/rxrpc/rxkad.c                             |  2 +-
>  net/smc/smc_ism.c                             |  5 ---
>  net/socket.c                                  | 11 ++-----
>  net/strparser/strparser.c                     |  2 --
>  net/tipc/group.c                              |  3 --
>  sound/core/control_compat.c                   |  3 +-
>  sound/isa/gus/gus_main.c                      | 13 ++------
>  sound/isa/sb/sb16_main.c                      | 10 ++----
>  sound/isa/sb/sb8.c                            |  4 ---
>  sound/soc/codecs/cs43130.c                    |  2 --
>  sound/soc/codecs/rt5645.c                     |  3 --
>  sound/soc/img/img-i2s-in.c                    |  5 +--
>  sound/soc/img/img-parallel-out.c              |  4 +--
>  sound/soc/rockchip/rockchip_pdm.c             |  4 +--
>  sound/soc/tegra/tegra30_ahub.c                |  4 +--
>  sound/soc/tegra/tegra30_i2s.c                 |  4 +--
>  sound/usb/usx2y/usb_stream.c                  |  5 ---
>  sound/usb/usx2y/usbusx2y.c                    |  4 ++-
>  204 files changed, 306 insertions(+), 826 deletions(-)
>
> --
> 2.31.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
