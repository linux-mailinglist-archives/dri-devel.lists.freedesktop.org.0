Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C359E65EAA8
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BA510E6FD;
	Thu,  5 Jan 2023 12:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de
 [80.237.130.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA20610E6FD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:28:52 +0000 (UTC)
Received: from [2a02:8108:963f:de38:eca4:7d19:f9a2:22c5]; authenticated
 by wp530.webpack.hosteurope.de running ExIM with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 id 1pDPMY-0002B2-4e; Thu, 05 Jan 2023 13:28:50 +0100
Message-ID: <c32ea02c-d706-ea2f-aa13-660b8db958ef@leemhuis.info>
Date: Thu, 5 Jan 2023 13:28:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [REGRESSION] GM20B probe fails after commit 2541626cfb79
Content-Language: en-US, de-DE
To: bskeggs@redhat.com, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>
References: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
From: Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20221228144914.z7t7a4fdwvbblnak@wslaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de; regressions@leemhuis.info; 1672921732;
 522eca5f; 
X-HE-SMSGID: 1pDPMY-0002B2-4e
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
Cc: nouveau@lists.freedesktop.org, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 regressions@lists.linux.dev, dri-devel@lists.freedesktop.org,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[adding Karol and Lyude to the list of recipients]

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

On 28.12.22 15:49, Diogo Ivo wrote:
> Hello,
> 
> Commit 2541626cfb79 breaks GM20B probe with
> the following kernel log:
Just wondering: is anyone looking on this? The report was posted more
than a week ago and didn't even get a single reply yet afaics. This of
course can happen at this time of the year, but I nevertheless thought a
quick status inquiry might be a good idea at this point.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
If I did something stupid, please tell me, as explained on that page.

> [    2.153892] ------------[ cut here ]------------
> [    2.153897] WARNING: CPU: 1 PID: 36 at drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgf100.c:273 gf100_vmm_valid+0x2c4/0x390
> [    2.153916] Modules linked in:
> [    2.153922] CPU: 1 PID: 36 Comm: kworker/u8:1 Not tainted 6.1.0+ #1
> [    2.153929] Hardware name: Google Pixel C (DT)
> [    2.153933] Workqueue: events_unbound deferred_probe_work_func
> [    2.153943] pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    2.153950] pc : gf100_vmm_valid+0x2c4/0x390
> [    2.153959] lr : gf100_vmm_valid+0xb4/0x390
> [    2.153966] sp : ffffffc009e134b0
> [    2.153969] x29: ffffffc009e134b0 x28: 0000000000000000 x27: ffffffc008fd44c8
> [    2.153979] x26: 00000000ffffffea x25: ffffffc0087b98d0 x24: ffffff8080f89038
> [    2.153987] x23: ffffff8081fadc08 x22: 0000000000000000 x21: 0000000000000000
> [    2.153995] x20: ffffff8080f8a000 x19: ffffffc009e13678 x18: 0000000000000000
> [    2.154003] x17: f37a8b93418958e6 x16: ffffffc009f0d000 x15: 0000000000000000
> [    2.154011] x14: 0000000000000002 x13: 000000000003a020 x12: ffffffc008000000
> [    2.154019] x11: 0000000102913000 x10: 0000000000000000 x9 : 0000000000000000
> [    2.154026] x8 : ffffffc009e136d8 x7 : ffffffc008fd44c8 x6 : ffffff80803d0f00
> [    2.154034] x5 : 0000000000000000 x4 : ffffff8080f88c00 x3 : 0000000000000010
> [    2.154041] x2 : 000000000000000c x1 : 00000000ffffffea x0 : 00000000ffffffea
> [    2.154050] Call trace:
> [    2.154053]  gf100_vmm_valid+0x2c4/0x390
> [    2.154061]  nvkm_vmm_map_valid+0xd4/0x204
> [    2.154069]  nvkm_vmm_map_locked+0xa4/0x344
> [    2.154076]  nvkm_vmm_map+0x50/0x84
> [    2.154083]  nvkm_firmware_mem_map+0x84/0xc4
> [    2.154094]  nvkm_falcon_fw_oneinit+0xc8/0x320
> [    2.154101]  nvkm_acr_oneinit+0x428/0x5b0
> [    2.154109]  nvkm_subdev_oneinit_+0x50/0x104
> [    2.154114]  nvkm_subdev_init_+0x3c/0x12c
> [    2.154119]  nvkm_subdev_init+0x60/0xa0
> [    2.154125]  nvkm_device_init+0x14c/0x2a0
> [    2.154133]  nvkm_udevice_init+0x60/0x9c
> [    2.154140]  nvkm_object_init+0x48/0x1b0
> [    2.154144]  nvkm_ioctl_new+0x168/0x254
> [    2.154149]  nvkm_ioctl+0xd0/0x220
> [    2.154153]  nvkm_client_ioctl+0x10/0x1c
> [    2.154162]  nvif_object_ctor+0xf4/0x22c
> [    2.154168]  nvif_device_ctor+0x28/0x70
> [    2.154174]  nouveau_cli_init+0x150/0x590
> [    2.154180]  nouveau_drm_device_init+0x60/0x2a0
> [    2.154187]  nouveau_platform_device_create+0x90/0xd0
> [    2.154193]  nouveau_platform_probe+0x3c/0x9c
> [    2.154200]  platform_probe+0x68/0xc0
> [    2.154207]  really_probe+0xbc/0x2dc
> [    2.154211]  __driver_probe_device+0x78/0xe0
> [    2.154216]  driver_probe_device+0xd8/0x160
> [    2.154221]  __device_attach_driver+0xb8/0x134
> [    2.154226]  bus_for_each_drv+0x78/0xd0
> [    2.154230]  __device_attach+0x9c/0x1a0
> [    2.154234]  device_initial_probe+0x14/0x20
> [    2.154239]  bus_probe_device+0x98/0xa0
> [    2.154243]  deferred_probe_work_func+0x88/0xc0
> [    2.154247]  process_one_work+0x204/0x40c
> [    2.154256]  worker_thread+0x230/0x450
> [    2.154261]  kthread+0xc8/0xcc
> [    2.154266]  ret_from_fork+0x10/0x20
> [    2.154273] ---[ end trace 0000000000000000 ]---
> [    2.154278] nouveau 57000000.gpu: pmu: map -22
> [    2.154285] nouveau 57000000.gpu: acr: one-time init failed, -22
> [    2.154559] nouveau 57000000.gpu: init failed with -22
> [    2.154564] nouveau: DRM-master:00000000:00000080: init failed with -22
> [    2.154574] nouveau 57000000.gpu: DRM-master: Device allocation failed: -22
> [    2.162905] nouveau: probe of 57000000.gpu failed with error -22
> 
> #regzbot introduced: 2541626cfb79
> 
> Thanks,
> 
> Diogo Ivo
> 
> 

#regzbot poke
