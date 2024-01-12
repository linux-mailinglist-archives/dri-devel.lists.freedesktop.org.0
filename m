Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1A82C33E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 17:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051BC10EB36;
	Fri, 12 Jan 2024 16:03:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71A5F10EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705075412;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=eM/q6+ASudnWqkA1GcXB1FCKeCcpDQUk18zBNzi9GWQ=;
 b=EPyccGXzvWuLJ6sVE713iqdorKRc9whGwPuBHzoDp6ZrcpjRJxcWZxeGCmaWcQNXG6S5cd
 qzGZJVN3X07CL+J5tP18a2JoKzPxsaD2rBMFAjBWoq+lT7nAQAG4lcdUJl7vXnRIwD+ZLf
 7HQPkdL+DlVLClGMjkUwHlRcHU1ZjdY=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-I-BqwHg6NjeTafbv0stI1w-1; Fri, 12 Jan 2024 11:03:31 -0500
X-MC-Unique: I-BqwHg6NjeTafbv0stI1w-1
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-1d4d947ff1bso53263565ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 08:03:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705075408; x=1705680208;
 h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eM/q6+ASudnWqkA1GcXB1FCKeCcpDQUk18zBNzi9GWQ=;
 b=Fay6udx5MmhnaFX+jyDPGZd46+TrmLOLfvJeBXTF5uOVXVPfr//ue9A0YzYEDz0hr/
 fMudOcH9pEkHHCXLMw7m+vGaGXqH/l/tNU/lTxyHF5jjmAJyDtFvTCR3x61a8/4Emhvl
 wPBYvq1C1ybNRFWtdnz/jtEbTcKwQSRuXcoGw4zzz+ho72nU7d33S/2KXejkdRkb/cU0
 1xPf6e3Sb9SOirflXJ0Cy5V4yVSVSWUUR3qmdiR6La0PcbmvZU9fVpv75Zoe5aPAQWiE
 1ioEuK0+i/+6cqti648WAOqo/CPUkL+yuka3F7BVZVQWSvgJttXSSlFtrf/DmzcNtCGF
 exRg==
X-Gm-Message-State: AOJu0YzmLgJ7ALibRldIK8rbnYPwFVETyxjsb/CZq9aTNd/Hpbj8D/1g
 SOLPGwIaynjWhWEgW0nGFBKsYFiuChwi/zhHZcM+xHW3Qz6mnfbcMT8hAAOvNYFMCI1m1DHN+as
 AA6I40xIscUbPjFwf12rTgn5vg3pbNoEM+x8Vs/H4CZvHDYjWeK8OKMd/1STY3ZeOAAgmjzw5g3
 DL0pTOSdGvWAt2VgShmg==
X-Received: by 2002:a17:902:e54b:b0:1d3:7368:663 with SMTP id
 n11-20020a170902e54b00b001d373680663mr1899487plf.7.1705075408072; 
 Fri, 12 Jan 2024 08:03:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHEE3bhlZZ9B9maxsi7Sr2DAFspnJ7Rv2qjDio1rzvyTwaxz5hENcZdZtmImKgo2rzVWof6LQ==
X-Received: by 2002:a17:902:e54b:b0:1d3:7368:663 with SMTP id
 n11-20020a170902e54b00b001d373680663mr1899454plf.7.1705075407622; 
 Fri, 12 Jan 2024 08:03:27 -0800 (PST)
Received: from rh (p200300c93f0273004f0fe90936098834.dip0.t-ipconnect.de.
 [2003:c9:3f02:7300:4f0f:e909:3609:8834])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a170902c98b00b001d4c97a2adcsm3319022plc.108.2024.01.12.08.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jan 2024 08:03:27 -0800 (PST)
Date: Fri, 12 Jan 2024 17:03:17 +0100 (CET)
From: Sebastian Ott <sebott@redhat.com>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev, 
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/virtio: set segment size for virtio_gpu device
Message-ID: <29a2b89d-7bf0-9dcb-5208-cd8e7d26e2f2@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; format=flowed; charset=US-ASCII
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
Cc: David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hej,

debug dma code is not happy with virtio gpu (arm64 VM):

[  305.881733] ------------[ cut here ]------------
[  305.883117] DMA-API: virtio-pci 0000:07:00.0: mapping sg segment longer than device claims to support [len=262144] [max=65536]
[  305.885976] WARNING: CPU: 8 PID: 2002 at kernel/dma/debug.c:1177 check_sg_segment+0x2d0/0x420
[  305.888038] Modules linked in: crct10dif_ce(+) polyval_ce polyval_generic ghash_ce virtio_gpu(+) virtio_net net_failover virtio_blk(+) virtio_dma_buf virtio_console failover virtio_mmio scsi_dh_r dac scsi_dh_emc scsi_dh_alua dm_multipath qemu_fw_cfg
[  305.893496] CPU: 8 PID: 2002 Comm: (udev-worker) Not tainted 6.7.0 #1
[  305.895070] Hardware name: QEMU KVM Virtual Machine, BIOS edk2-20230524-3.fc37 05/24/2023
[  305.897112] pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  305.897129] pc : check_sg_segment+0x2d0/0x420
[  305.897139] lr : check_sg_segment+0x2d0/0x420
[  305.897145] sp : ffff80008ffc69d0
[  305.897149] x29: ffff80008ffc69d0 x28: dfff800000000000 x27: ffffb0232879e578
[  305.897167] x26: ffffffff00000000 x25: ffffb0232778c060 x24: ffff19ee9b2060c0
[  305.897181] x23: 00000000ffffffff x22: ffffb0232ab9ce10 x21: ffff19eece5c64ac
[  305.906942] x20: 0000000000010000 x19: ffff19eece5c64a0 x18: ffff19eec36fc304
[  305.908633] x17: 6e61687420726567 x16: 6e6f6c20746e656d x15: 6765732067732067
[  305.910352] x14: 00000000f1f1f1f1 x13: 0000000000000001 x12: ffff700011ff8cc3
[  305.912044] x11: 1ffff00011ff8cc2 x10: ffff700011ff8cc2 x9 : ffffb02324a70e54
[  305.913751] x8 : 00008fffee00733e x7 : ffff80008ffc6617 x6 : 0000000000000001
[  305.915451] x5 : ffff80008ffc6610 x4 : 1fffe33e70564622 x3 : dfff800000000000
[  305.917158] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff19f382b23100
[  305.918864] Call trace:
[  305.919474]  check_sg_segment+0x2d0/0x420
[  305.920443]  debug_dma_map_sg+0x2a0/0x428
[  305.921402]  __dma_map_sg_attrs+0xf4/0x1a8
[  305.922388]  dma_map_sgtable+0x7c/0x100
[  305.923318]  drm_gem_shmem_get_pages_sgt+0x15c/0x328
[  305.924500]  virtio_gpu_object_shmem_init.constprop.0.isra.0+0x50/0x628 [virtio_gpu]
[  305.926390]  virtio_gpu_object_create+0x198/0x478 [virtio_gpu]
[  305.927802]  virtio_gpu_mode_dumb_create+0x2a0/0x4c8 [virtio_gpu]
[  305.929272]  drm_mode_create_dumb+0x1c0/0x280
[  305.930327]  drm_client_framebuffer_create+0x140/0x328
[  305.931555]  drm_fbdev_generic_helper_fb_probe+0x1bc/0x5c0
[  305.932871]  __drm_fb_helper_initial_config_and_unlock+0x1e0/0x630
[  305.934372]  drm_fb_helper_initial_config+0x50/0x68
[  305.935540]  drm_fbdev_generic_client_hotplug+0x148/0x200
[  305.936819]  drm_client_register+0x130/0x200
[  305.937856]  drm_fbdev_generic_setup+0xe8/0x320
[  305.938932]  virtio_gpu_probe+0x13c/0x2d0 [virtio_gpu]
[  305.940190]  virtio_dev_probe+0x38c/0x600
[  305.941153]  really_probe+0x334/0x9c8
[  305.942047]  __driver_probe_device+0x164/0x3d8
[  305.943102]  driver_probe_device+0x64/0x180
[  305.944094]  __driver_attach+0x1d4/0x488
[  305.945045]  bus_for_each_dev+0x104/0x198
[  305.946008]  driver_attach+0x44/0x68
[  305.946892]  bus_add_driver+0x23c/0x4a8
[  305.947838]  driver_register+0xf8/0x3d0
[  305.948770]  register_virtio_driver+0x74/0xc8
[  305.949836]  virtio_gpu_driver_init+0x20/0xff8 [virtio_gpu]
[  305.951237]  do_one_initcall+0x17c/0x8c0
[  305.952182]  do_init_module+0x1dc/0x630
[  305.953106]  load_module+0x10c0/0x1638
[  305.954012]  init_module_from_file+0xe0/0x140
[  305.955058]  idempotent_init_module+0x2c0/0x590
[  305.956174]  __arm64_sys_finit_module+0xb4/0x140
[  305.957282]  invoke_syscall+0xd8/0x258
[  305.958187]  el0_svc_common.constprop.0+0x16c/0x240
[  305.959526]  do_el0_svc+0x48/0x68
[  305.960456]  el0_svc+0x58/0x118
[  305.961310]  el0t_64_sync_handler+0x120/0x130
[  305.962510]  el0t_64_sync+0x194/0x198
[  305.963509] irq event stamp: 37944
[  305.964412] hardirqs last  enabled at (37943): [<ffffb02324a7439c>] console_unlock+0x1a4/0x1c8
[  305.966602] hardirqs last disabled at (37944): [<ffffb023276724e4>] el1_dbg+0x24/0xa0
[  305.968535] softirqs last  enabled at (37930): [<ffffb0232475114c>] __do_softirq+0x8e4/0xe1c
[  305.970781] softirqs last disabled at (37925): [<ffffb0232475a9b0>] ____do_softirq+0x18/0x30
[  305.972937] ---[ end trace 0000000000000000 ]---

The 64K max_segment size of the device seems to be inherited by PCIs default.
The sg list is crated via this drm helper:

struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 				       struct page **pages, unsigned int nr_pages)
{
...
 	if (dev)
 		max_segment = dma_max_mapping_size(dev->dev);
 	if (max_segment == 0)
 		max_segment = UINT_MAX;
 	err = sg_alloc_table_from_pages_segment(sg, pages, nr_pages, 0,
 						nr_pages << PAGE_SHIFT,
 						max_segment, GFP_KERNEL);
...
}

I'm a bit puzzled why this uses dma_max_mapping_size() and not
dma_get_max_seg_size(). But since this is used by a lot of drivers
I'm not really keen to touch this code that works like this for ages.

So let's just make debug dma code aware of the actual segment size
that's used by the device:

--->8
drm/virtio: set segment size for virtio_gpu device

Set the segment size of the virtio_gpu device to the value
used by the drm helpers when allocating sg lists to fix the
following complaint from DMA_API debug code:
DMA-API: virtio-pci 0000:07:00.0: mapping sg segment longer than device claims to support [len=262144] [max=65536]

Signed-off-by: Sebastian Ott <sebott@redhat.com>
---
  drivers/gpu/drm/virtio/virtgpu_drv.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 4334c7608408..74b2cb3295af 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -94,6 +94,7 @@ static int virtio_gpu_probe(struct virtio_device *vdev)
  			goto err_free;
  	}

+	dma_set_max_seg_size(dev->dev, dma_max_mapping_size(dev->dev) ? : UINT_MAX);
  	ret = virtio_gpu_init(vdev, dev);
  	if (ret)
  		goto err_free;
-- 
2.43.0

