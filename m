Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C5D183BB7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Mar 2020 22:50:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A82396EB44;
	Thu, 12 Mar 2020 21:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882A36EB41;
 Thu, 12 Mar 2020 21:49:57 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Mar 2020 14:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,546,1574150400"; 
 d="gz'50?scan'50,208,50";a="354227917"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
 by fmsmga001.fm.intel.com with ESMTP; 12 Mar 2020 14:49:53 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
 (envelope-from <lkp@intel.com>)
 id 1jCViC-0007vK-WA; Fri, 13 Mar 2020 05:49:52 +0800
Date: Fri, 13 Mar 2020 05:49:37 +0800
From: kbuild test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Subject: [drm-tip:drm-tip 3/8] include/drm/drm_modeset_helper_vtables.h:859:
 undefined reference to `drm_connector_attach_encoder'
Message-ID: <202003130532.0JA6Dr39%lkp@intel.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8t9RHnE3ZwKMSgU+"
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: intel-gfx@lists.freedesktop.org, kbuild-all@lists.01.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://anongit.freedesktop.org/drm/drm-tip drm-tip
head:   2e46e269a2843c5d0b6c72bfb7fa9d9913c15415
commit: 1be88a0837ab2a7e95a5177877a9b344f9e6a3e3 [3/8] Merge remote-tracking branch 'drm/drm-next' into drm-tip
config: riscv-randconfig-a001-20200312 (attached as .config)
compiler: riscv32-linux-gcc (GCC) 9.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout 1be88a0837ab2a7e95a5177877a9b344f9e6a3e3
        # save the attached .config to linux build tree
        GCC_VERSION=9.2.0 make.cross ARCH=riscv 

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   riscv32-linux-ld: drivers/virtio/virtio_balloon.o: in function `__list_add':
   include/linux/list.h:72: undefined reference to `balloon_page_dequeue'
   riscv32-linux-ld: drivers/virtio/virtio_balloon.o: in function `virtballoon_probe':
   drivers/virtio/virtio_balloon.c:871: undefined reference to `balloon_page_alloc'
   riscv32-linux-ld: drivers/virtio/virtio_balloon.o: in function `update_balloon_size_func':
   drivers/virtio/virtio_balloon.c:451: undefined reference to `balloon_page_enqueue'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.o: in function `virtio_gpu_remove':
   drivers/gpu/drm/virtio/virtgpu_drv.c:139: undefined reference to `drm_dev_unplug'
>> riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.c:140: undefined reference to `drm_atomic_helper_shutdown'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.c:141: undefined reference to `drm_dev_put'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.o: in function `virtio_gpu_probe':
   drivers/gpu/drm/virtio/virtgpu_drv.c:108: undefined reference to `drm_dev_alloc'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.c:119: undefined reference to `drm_dev_put'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.c:133: undefined reference to `drm_dev_register'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.o: in function `virtio_gpu_pci_quirk':
   drivers/gpu/drm/virtio/virtgpu_drv.c:93: undefined reference to `drm_dev_set_unique'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.o: in function `.LANCHOR0':
   virtgpu_drv.c:(.data+0xc8): undefined reference to `drm_gem_prime_handle_to_fd'
   riscv32-linux-ld: virtgpu_drv.c:(.data+0xcc): undefined reference to `drm_gem_prime_fd_to_handle'
   riscv32-linux-ld: virtgpu_drv.c:(.data+0xf0): undefined reference to `drm_gem_prime_mmap'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.o:(.rodata+0x8): undefined reference to `drm_read'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.o:(.rodata+0x24): undefined reference to `drm_poll'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.o:(.rodata+0x28): undefined reference to `drm_ioctl'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.o:(.rodata+0x30): undefined reference to `drm_gem_mmap'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.o:(.rodata+0x38): undefined reference to `drm_open'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_drv.o:(.rodata+0x40): undefined reference to `drm_release'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_change_queue_depth':
   drivers/scsi/virtio_scsi.c:677: undefined reference to `scsi_change_queue_depth'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `kmalloc_array':
   include/linux/slab.h:589: undefined reference to `sdev_prefix_printk'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_device_reset':
   drivers/scsi/virtio_scsi.c:633: undefined reference to `scsi_remove_host'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.c:643: undefined reference to `scsi_host_put'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_complete_cmd':
   drivers/scsi/virtio_scsi.c:118: undefined reference to `scmd_printk'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtio_scsi_host':
   drivers/scsi/virtio_scsi.c:94: undefined reference to `scsi_device_lookup'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_handle_param_change':
   drivers/scsi/virtio_scsi.c:311: undefined reference to `scsi_device_put'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_handle_event':
   drivers/scsi/virtio_scsi.c:387: undefined reference to `scsi_device_lookup'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_handle_transport_reset':
   drivers/scsi/virtio_scsi.c:285: undefined reference to `scsi_remove_device'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.c:285: undefined reference to `scsi_device_put'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.c:291: undefined reference to `__scsi_iterate_devices'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_rescan_hotunplug':
   drivers/scsi/virtio_scsi.c:337: undefined reference to `__scsi_execute'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.c:340: undefined reference to `__scsi_iterate_devices'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.c:344: undefined reference to `scsi_remove_device'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `scsi_execute_req':
   include/scsi/scsi_device.h:455: undefined reference to `__scsi_iterate_devices'
   riscv32-linux-ld: include/scsi/scsi_device.h:455: undefined reference to `scsi_scan_host'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_rescan_hotunplug':
   drivers/scsi/virtio_scsi.c:352: undefined reference to `scsi_add_device'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtio_scsi_host':
   drivers/scsi/virtio_scsi.c:94: undefined reference to `scsi_rescan_device'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_queuecommand':
   drivers/scsi/virtio_scsi.c:581: undefined reference to `scmd_printk'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_probe':
   drivers/scsi/virtio_scsi.c:850: undefined reference to `scsi_host_alloc'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_init':
   drivers/scsi/virtio_scsi.c:801: undefined reference to `scsi_host_put'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.o: in function `virtscsi_probe':
   drivers/scsi/virtio_scsi.c:872: undefined reference to `scsi_add_host_with_dma'
   riscv32-linux-ld: drivers/scsi/virtio_scsi.c:877: undefined reference to `scsi_scan_host'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_kms.o: in function `virtio_gpu_config_changed_work_func':
   drivers/gpu/drm/virtio/virtgpu_kms.c:48: undefined reference to `drm_helper_hpd_irq_event'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_kms.o: in function `virtio_find_vqs':
   include/linux/virtio_config.h:197: undefined reference to `__drm_err'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_kms.o: in function `virtio_gpu_init':
   drivers/gpu/drm/virtio/virtgpu_kms.c:166: undefined reference to `__drm_err'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_kms.c:175: undefined reference to `__drm_err'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_kms.o: in function `kmalloc_array':
   include/linux/slab.h:593: undefined reference to `__drm_err'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_kms.o: in function `virtio_gpu_get_capsets':
   drivers/gpu/drm/virtio/virtgpu_kms.c:86: undefined reference to `__drm_err'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_gem.o: in function `virtio_gpu_gem_create':
   drivers/gpu/drm/virtio/virtgpu_gem.c:46: undefined reference to `drm_gem_handle_create'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_gem.c:52: undefined reference to `drm_gem_object_put_unlocked'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_gem.c:59: undefined reference to `drm_gem_object_release'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_gem.o: in function `virtio_gpu_mode_dumb_mmap':
   drivers/gpu/drm/virtio/virtgpu_gem.c:97: undefined reference to `drm_gem_object_lookup'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_gem.o: in function `drm_vma_node_offset_addr':
   include/drm/drm_vma_manager.h:204: undefined reference to `drm_gem_object_put_unlocked'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_gem.o: in function `virtio_gpu_gem_object_close':
   drivers/gpu/drm/virtio/virtgpu_gem.c:145: undefined reference to `drm_gem_lock_reservations'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_gem.o: in function `virtio_gpu_array_lock_resv':
   drivers/gpu/drm/virtio/virtgpu_gem.c:209: undefined reference to `drm_gem_unlock_reservations'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_gem.o: in function `virtio_gpu_array_add_fence':
   drivers/gpu/drm/virtio/virtgpu_gem.c:231: undefined reference to `drm_gem_object_put_unlocked'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_gem.o: in function `virtio_gpu_array_put_free':
   drivers/gpu/drm/virtio/virtgpu_gem.c:241: undefined reference to `drm_gem_object_lookup'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `vgdev_atomic_commit_tail':
   drivers/gpu/drm/virtio/virtgpu_display.c:325: undefined reference to `drm_atomic_helper_commit_modeset_disables'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:326: undefined reference to `drm_atomic_helper_commit_modeset_enables'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:327: undefined reference to `drm_atomic_helper_commit_planes'
>> riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:329: undefined reference to `drm_atomic_helper_fake_vblank'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:330: undefined reference to `drm_atomic_helper_commit_hw_done'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:332: undefined reference to `drm_atomic_helper_wait_for_vblanks'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:333: undefined reference to `drm_atomic_helper_cleanup_planes'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `virtio_gpu_conn_mode_valid':
   drivers/gpu/drm/virtio/virtgpu_display.c:200: undefined reference to `__drm_dbg'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `virtio_gpu_conn_get_modes':
   drivers/gpu/drm/virtio/virtgpu_display.c:157: undefined reference to `drm_add_edid_modes'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:164: undefined reference to `drm_add_modes_noedid'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:169: undefined reference to `drm_set_preferred_mode'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:171: undefined reference to `__drm_dbg'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:172: undefined reference to `drm_cvt_mode'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:175: undefined reference to `drm_mode_probed_add'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `virtio_gpu_conn_destroy':
   drivers/gpu/drm/virtio/virtgpu_display.c:230: undefined reference to `drm_connector_unregister'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:231: undefined reference to `drm_connector_cleanup'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `virtio_gpu_user_framebuffer_create':
   drivers/gpu/drm/virtio/virtgpu_display.c:319: undefined reference to `drm_gem_object_lookup'
>> riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:309: undefined reference to `drm_helper_mode_fill_fb_struct'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `virtio_gpu_framebuffer_init':
>> drivers/gpu/drm/virtio/virtgpu_display.c:74: undefined reference to `drm_framebuffer_init'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `virtio_gpu_user_framebuffer_create':
   drivers/gpu/drm/virtio/virtgpu_display.c:313: undefined reference to `drm_gem_object_put_unlocked'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `virtio_gpu_modeset_init':
   drivers/gpu/drm/virtio/virtgpu_display.c:347: undefined reference to `drm_mode_config_init'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `vgdev_output_init':
   drivers/gpu/drm/virtio/virtgpu_display.c:279: undefined reference to `drm_encoder_init'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `drm_encoder_helper_add':
>> include/drm/drm_modeset_helper_vtables.h:859: undefined reference to `drm_connector_attach_encoder'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `vgdev_output_init':
>> drivers/gpu/drm/virtio/virtgpu_display.c:282: undefined reference to `drm_connector_register'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:266: undefined reference to `drm_crtc_init_with_planes'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:269: undefined reference to `drm_connector_init'
>> riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.c:273: undefined reference to `drm_connector_attach_edid_property'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `drm_connector_helper_add':
>> include/drm/drm_modeset_helper_vtables.h:1092: undefined reference to `drm_mode_config_reset'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `virtio_gpu_modeset_fini':
   drivers/gpu/drm/virtio/virtgpu_display.c:371: undefined reference to `drm_mode_config_cleanup'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `.LANCHOR0':
   drivers/gpu/drm/virtio/virtgpu_display.c:58: undefined reference to `drm_gem_fb_destroy'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `.LANCHOR0':
   virtgpu_display.c:(.rodata+0x4): undefined reference to `drm_gem_fb_create_handle'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0x8): undefined reference to `drm_atomic_helper_dirtyfb'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0x1c): undefined reference to `drm_atomic_helper_check'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0x20): undefined reference to `drm_atomic_helper_commit'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `.LANCHOR0':
   drivers/gpu/drm/virtio/virtgpu_display.c:48: undefined reference to `drm_atomic_helper_crtc_reset'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_display.o: in function `.LANCHOR0':
   virtgpu_display.c:(.rodata+0x44): undefined reference to `drm_crtc_cleanup'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0x48): undefined reference to `drm_atomic_helper_set_config'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0x4c): undefined reference to `drm_atomic_helper_page_flip'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0x58): undefined reference to `drm_atomic_helper_crtc_duplicate_state'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0x5c): undefined reference to `drm_atomic_helper_crtc_destroy_state'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0xd4): undefined reference to `drm_atomic_helper_connector_reset'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0xe0): undefined reference to `drm_helper_probe_single_connector_modes'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0xf4): undefined reference to `drm_atomic_helper_connector_duplicate_state'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0xf8): undefined reference to `drm_atomic_helper_connector_destroy_state'
   riscv32-linux-ld: virtgpu_display.c:(.rodata+0x130): undefined reference to `drm_encoder_cleanup'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.o: in function `virtio_gpu_cmd_get_display_info_cb':
   drivers/gpu/drm/virtio/virtgpu_vq.c:655: undefined reference to `__drm_dbg'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.c:664: undefined reference to `__drm_dbg'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.c:672: undefined reference to `drm_helper_hpd_irq_event'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.c:673: undefined reference to `drm_kms_helper_hotplug_event'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.o: in function `virtio_gpu_cmd_get_edid_cb':
   drivers/gpu/drm/virtio/virtgpu_vq.c:745: undefined reference to `drm_do_get_edid'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.o: in function `spin_lock':
   include/linux/spinlock.h:338: undefined reference to `drm_connector_update_edid_property'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.o: in function `reclaim_vbufs':
   drivers/gpu/drm/virtio/virtgpu_vq.c:198: undefined reference to `__drm_dbg'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.o: in function `virtio_gpu_queue_fenced_ctrl_buffer':
   drivers/gpu/drm/virtio/virtgpu_vq.c:383: undefined reference to `drm_dev_enter'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.o: in function `virtio_gpu_queue_ctrl_sgs':
   drivers/gpu/drm/virtio/virtgpu_vq.c:366: undefined reference to `drm_dev_exit'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.o: in function `virtio_gpu_dequeue_ctrl_func':
   drivers/gpu/drm/virtio/virtgpu_vq.c:228: undefined reference to `__drm_dbg'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.c:228: undefined reference to `__drm_err'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.o: in function `__list_del_entry':
   include/linux/list.h:132: undefined reference to `drm_dev_printk'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.o: in function `virtio_gpu_cmd_submit':
   drivers/gpu/drm/virtio/virtgpu_vq.c:1079: undefined reference to `drm_dev_enter'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_vq.o: in function `virtio_gpu_cursor_ping':
   drivers/gpu/drm/virtio/virtgpu_vq.c:1100: undefined reference to `drm_dev_exit'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_object.o: in function `virtio_gpu_cleanup_object':
   drivers/gpu/drm/virtio/virtgpu_object.c:77: undefined reference to `drm_gem_shmem_unpin'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_object.o: in function `virtio_gpu_resource_id_put':
   drivers/gpu/drm/virtio/virtgpu_object.c:60: undefined reference to `drm_gem_shmem_free_object'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_object.o: in function `virtio_gpu_object_create':
   drivers/gpu/drm/virtio/virtgpu_object.c:190: undefined reference to `drm_gem_shmem_create'
>> riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_object.c:239: undefined reference to `drm_gem_shmem_pin'
>> riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_object.c:215: undefined reference to `drm_gem_shmem_get_sg_table'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_object.o: in function `ida_alloc':
>> include/linux/idr.h:272: undefined reference to `drm_gem_shmem_free_object'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_object.o: in function `virtio_gpu_object_create':
>> drivers/gpu/drm/virtio/virtgpu_object.c:230: undefined reference to `__drm_err'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_object.o: in function `dma_map_sg_attrs':
   include/linux/dma-mapping.h:317: undefined reference to `drm_gem_shmem_unpin'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_object.o: in function `.LANCHOR0':
   virtgpu_object.c:(.rodata+0xc): undefined reference to `drm_gem_shmem_print_info'
   riscv32-linux-ld: virtgpu_object.c:(.rodata+0x14): undefined reference to `drm_gem_shmem_pin'
   riscv32-linux-ld: virtgpu_object.c:(.rodata+0x18): undefined reference to `drm_gem_shmem_unpin'
   riscv32-linux-ld: virtgpu_object.c:(.rodata+0x1c): undefined reference to `drm_gem_shmem_get_sg_table'
   riscv32-linux-ld: virtgpu_object.c:(.rodata+0x20): undefined reference to `drm_gem_shmem_vmap'
   riscv32-linux-ld: virtgpu_object.c:(.rodata+0x24): undefined reference to `drm_gem_shmem_vunmap'
   riscv32-linux-ld: virtgpu_object.c:(.rodata+0x28): undefined reference to `drm_gem_shmem_mmap'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_debugfs.o: in function `virtio_gpu_debugfs_init':
   drivers/gpu/drm/virtio/virtgpu_debugfs.c:78: undefined reference to `drm_debugfs_create_files'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.o: in function `virtio_gpu_plane_destroy':
   drivers/gpu/drm/virtio/virtgpu_plane.c:72: undefined reference to `drm_plane_cleanup'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.o: in function `virtio_gpu_plane_atomic_check':
   drivers/gpu/drm/virtio/virtgpu_plane.c:95: undefined reference to `drm_atomic_get_crtc_state'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.c:99: undefined reference to `drm_atomic_helper_check_plane_state'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.o: in function `virtio_gpu_primary_plane_update':
   drivers/gpu/drm/virtio/virtgpu_plane.c:146: undefined reference to `__drm_dbg'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.c:189: undefined reference to `drm_atomic_helper_damage_merged'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.c:167: undefined reference to `__drm_dbg'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.o: in function `virtio_gpu_cursor_plane_update':
   drivers/gpu/drm/virtio/virtgpu_plane.c:253: undefined reference to `__drm_dbg'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.c:273: undefined reference to `__drm_dbg'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.o: in function `virtio_gpu_plane_init':
   drivers/gpu/drm/virtio/virtgpu_plane.c:318: undefined reference to `drm_universal_plane_init'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.o: in function `.LANCHOR0':
   drivers/gpu/drm/virtio/virtgpu_plane.c:76: undefined reference to `drm_atomic_helper_update_plane'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_plane.o: in function `.LANCHOR0':
   virtgpu_plane.c:(.rodata+0x3c): undefined reference to `drm_atomic_helper_disable_plane'
   riscv32-linux-ld: virtgpu_plane.c:(.rodata+0x44): undefined reference to `drm_atomic_helper_plane_reset'
   riscv32-linux-ld: virtgpu_plane.c:(.rodata+0x4c): undefined reference to `drm_atomic_helper_plane_duplicate_state'
   riscv32-linux-ld: virtgpu_plane.c:(.rodata+0x50): undefined reference to `drm_atomic_helper_plane_destroy_state'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_ioctl.o: in function `virtio_gpu_wait_ioctl':
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:406: undefined reference to `drm_gem_object_lookup'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_ioctl.c:418: undefined reference to `drm_gem_object_put_unlocked'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_ioctl.o: in function `virtio_gpu_resource_info_ioctl':
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:291: undefined reference to `drm_gem_object_lookup'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_ioctl.c:302: undefined reference to `drm_gem_object_put_unlocked'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_ioctl.o: in function `atomic_fetch_sub_relaxed':
   arch/riscv/include/asm/atomic.h:141: undefined reference to `drm_gem_handle_create'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_ioctl.o: in function `virtio_gpu_resource_create_ioctl':
   drivers/gpu/drm/virtio/virtgpu_ioctl.c:273: undefined reference to `drm_gem_object_put_unlocked'
   riscv32-linux-ld: drivers/gpu/drm/virtio/virtgpu_ioctl.c:240: undefined reference to `drm_gem_object_release'

vim +859 include/drm/drm_modeset_helper_vtables.h

092d01dae09aa6 Daniel Vetter 2015-12-04  850  
092d01dae09aa6 Daniel Vetter 2015-12-04  851  /**
36b66080dc66ab Daniel Vetter 2015-12-04  852   * drm_encoder_helper_add - sets the helper vtable for an encoder
092d01dae09aa6 Daniel Vetter 2015-12-04  853   * @encoder: DRM encoder
092d01dae09aa6 Daniel Vetter 2015-12-04  854   * @funcs: helper vtable to set for @encoder
092d01dae09aa6 Daniel Vetter 2015-12-04  855   */
092d01dae09aa6 Daniel Vetter 2015-12-04  856  static inline void drm_encoder_helper_add(struct drm_encoder *encoder,
092d01dae09aa6 Daniel Vetter 2015-12-04  857  					  const struct drm_encoder_helper_funcs *funcs)
092d01dae09aa6 Daniel Vetter 2015-12-04  858  {
092d01dae09aa6 Daniel Vetter 2015-12-04 @859  	encoder->helper_private = funcs;
092d01dae09aa6 Daniel Vetter 2015-12-04  860  }
092d01dae09aa6 Daniel Vetter 2015-12-04  861  

:::::: The code at line 859 was first introduced by commit
:::::: 092d01dae09aa6779ed41c3ac637e1e3c835424b drm: Reorganize helper vtables and their docs

:::::: TO: Daniel Vetter <daniel.vetter@ffwll.ch>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--8t9RHnE3ZwKMSgU+
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
IVoWthN4N1LiMNxvADtPgsD1pnzqhYYG3EM8az7qFdbRTPnhQCS++32S6YgnJhCAF40duMyL
NP4114u6VGWIMeMOcz0Jp91CBF5oj9TusZqEhqCME8ktvMGHq6IwnHL9FUFiOdGVzkgC23bs
QY0iLYWPHc9b+Mq2rYBrSSS2E/KqDETCR5AnBMGwUYC73IgpjD/qgadI6unU9fm7cEQSzjgf
rYagztafQdI2O1bnInSs4ffYxnZgDwdVgqcW9xrbMpEFphZ3UdSQ3Kqrzk1NuMBtlkMgEmss
kchG4CCZkJEwJpepCgQhKCkkyQrHKEcS3ZWZp7JKaSfzu/c/jxfOF9zAtKX3WQ66APBvXpDj
xyJL80TK7XBryH6u7S1vmtqy2XS/iOrDgpdbP+VLztxBvv1hl4LD1GFF2P2q5EO83OL0JkhR
M2TpZcYmlJLcGK5F5YHpZluisyqkRAGWXVapZOspOX007Lwd8yYgQfx0vv9TO0CCWILCTfYb
QBeIuhfgJXQlkpvrG8fwUo8iJaPyWZzIfMn+RlH+KMr2jEMLwnncyqAkU4uchVpMnMTpFPMU
AzfDTA7jVEyJQ1zy3TUDwiOcmagLo1Sk+iF8F/vG6a/FMElRhkRN/NkCO9QDXEfxnWe1ONxW
ZZ5L4NoJV2VMyUS2kMc9DnZYbH3PkjOyyVLayvn89ENr51YypDVrGKsLifPHG5d7VNn20JzB
ClJWmznO1SOPzbuhIZAyi41XWSmXXh14c1ZKYzvQ8booy+cbnPCyDVBbrLbkFNSoOecbNq6o
rqY9oSMRsii2XPTcRqJ/Pl+Or2/ne0YzrOKBN7YXSHgflNA1vT6/PzKVlIXAKZHgUWmRiMJe
QZXCdAmGZwDgNOCKDOmQ2i6RpjspHjwkb7OqC6kix//l4Vae3JAOWiM28eRn8e39cnyebOQc
+3p6/QXOBPenP073yHRai/nP8swrweJML1RbgZxB63JwyHgYLTbEan/yt/Pdw/35eawci9eH
0H35j8Xb8fh+fydPOJ/Ob9mnsUq+R6rNuP6n2I9VMMAp5KePuyfZtdG+s3i0w2p2kPN3TPKb
Haiflap6f3o6vfw1aLEXAzJ5NtnFW3aZcoW7I+MPzZFuCRdtJux2+2weJ8uzJHw5k5g9Tc5s
ldVbBSc4bNZJWkRrGlsPkZVpBRwiWrMpuwklePwJuc+jWwaE7jKK8egyEkLzafISibnK+/c9
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

--8t9RHnE3ZwKMSgU+
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--8t9RHnE3ZwKMSgU+--
