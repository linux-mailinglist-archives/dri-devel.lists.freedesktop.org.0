Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 657A082EEDB
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 13:22:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD6B10E4AE;
	Tue, 16 Jan 2024 12:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out203-205-221-190.mail.qq.com (out203-205-221-190.mail.qq.com
 [203.205.221.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2BE10E473
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 11:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
 t=1705404451; bh=qE2pCZNdTBOncIRgSNekpfSKvwoP43wL+ZRJ+fXia34=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=i/FQAqnR/XTKjNANN5F+/6K1ZBBFpITMeeySNv0ZYqJl/wwLHz7Hm+RavTjGlJiqO
 e3g25d5zXo1JfKLvBH69f/v4qt6OXDcrvBhPSgqhviXomqZpjMA/o1HteBjxaNJdWT
 ot6pTUe0JKWhEuKWWwyRS6V4NOZVbXD61lm6zzbY=
Received: from [IPV6:2001:da8:c800:d084:c65a:644a:13d7:e72c]
 ([2001:da8:c800:d084:c65a:644a:13d7:e72c])
 by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
 id 6D59F066; Tue, 16 Jan 2024 19:27:21 +0800
X-QQ-mid: xmsmtpt1705404441t766uh7bp
Message-ID: <tencent_D6D106D735062E24A4B191EF5AB04B7BCA05@qq.com>
X-QQ-XMAILINFO: OOyEews/EdUgR9ZSXFk8cl7dDMZMstp06UjNyAubYwncevH1P5nS3fDhLnv1SB
 /9V7R27kOgngYW+4po/jXULxi2xJqwRZq2zX0RTy5a8bwyVrbCuX/AvAxTjAjZJm4O1/YfpWhjU8
 /muJCvhivvZ9aLcDAaiGrhsSSdAyvhASZ6DYEvDvMheoyx7v5zDzYYHbEmFByjxlas89r2Xl07Kd
 sp3DybJ1keaCTPaG/xmpqeRWfBS0jBSRx3Fhhqz7tZyN5D7Y+5h6/r48ifhyJqbSdFvTJpjSWXCi
 0NFwEvL7z21hGaqpN44b89n7dYDEayRC/DLAxeM7yOVeDanS7lh5iRlfeKqfKAf7wBk9EucEZxo4
 JjFbB6bzgxiVA1tI9ymbp/06H9Q6YeQAoEkdCEUHOkwk1WcJFsuWA2hWHcCWjXa3Qfvgg9zmtXhH
 KUN9fA/BC16V6u2ZSTJINNxC0+NoAbPg2wIF/Ks2n7/I8AuRaa5q2g8HfFEufnwFjoXk8R6pO4Ns
 wcLi88gY9UL7CZJlVlUumEXwol+qDyEoW7ecmsypG3R1pjh4Nyom7gJrmlLq5M4PA+UPMAvWVjHz
 MCfQSknT5xHb7Tn5tfqyiXtskVGPbab2lKWmnIQ41rnN74oEiK5cQRDQXeEH7GVmxLfy2fU6sZpi
 M1Ce2pLfksGu/detbng/Y2iZ4Ree3sjfwip2C1+n1coRUjf7RC2pgHf9hIvZqZk3r6nBDarBMK0R
 hRByHbF0mM33dkmGfeseEXPciARA4HjDSmXHCxtSYxDAKD82AlHsREPX8Pk1lIN6kdMJkMytX3E1
 jrwcS5D+Yf2KaQOVi2pDufjHe11RfpMLhubm2Fmfmc7t56wAmFXaz2t+hly2UWoHEiRJAjRXoeSA
 zdWmruhJ1N3Jl6Ezb3Pa5H2V7mQ06vSYmyL3IaKYL6ur8mXVhmKRWz9i/fQY7OAq/Yjyf0vlpA9L
 S8bp8AkP6AP4xBkStuk1bI9Eo3Ef9LmzJ6xApElOE0t/NGmiEADIlSs1vBiIaK6Kha/rd0Tvgk4j
 7qYCvujQ==
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-OQ-MSGID: <36722de1-c077-4633-a30e-b732e6f29321@cyyself.name>
Date: Tue, 16 Jan 2024 19:27:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ttm: only use DMA32 if needed for dummy_read_page
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <tencent_0B319B215E8D487CC082C0DA5E8E46B86B08@qq.com>
 <2b715134-9d63-4de1-94e5-37e180aeefd2@amd.com>
From: Yangyu Chen <cyy@cyyself.name>
In-Reply-To: <2b715134-9d63-4de1-94e5-37e180aeefd2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 16 Jan 2024 12:22:14 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Jiuyang Liu <liu@jiuyang.me>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Yichuan Gao <i@gycis.me>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/16/24 17:45, Christian König wrote:
> Am 16.01.24 um 08:24 schrieb Yangyu Chen:
>> Some platforms may not have any memory in ZONE_DMA32 and use IOMMU to 
>> allow
>> 32-bit-DMA-only device to work. Forcing GFP_DMA32 on dummy_read_page will
>> fail in such platforms. Only use DMA32 when it must to get the bug
>> resolved.
> 
> Well that makes no sense.
> 
> If a platform doesn't have a ZONE_DMA32 then GFP_DMA32 is just ignored 
> as far as I know.
> 

Well, but it only applies when such ISA has no ZONE_DMA32 such as x86-32
without PAE. It does not apply to some ISAs which has ZONE_DMA32 defined
in the kernel but there is no memory below the 4GB address range. It
happens on some RISC-V SoC chips and I know at least two chips have this
issue.


Below is some dmesg from my platform, using such RISC-V without 
ZONE_DMA32 with AMD RX550 GPU:

[    0.000000] Linux version 6.7.0-dirty (cyy@cyy-pc) 
(riscv64-linux-gnu-gcc (Debian 13.2.0-7) 13.2.0, GNU ld (GNU Binutils 
for Debian) 2.41.50.20231227) #12 SMP Tue Jan 16 18:55:13 CST 2024
[    0.000000] Machine model:
[    0.000000] SBI specification v2.0 detected
[    0.000000] SBI implementation ID=0x1 Version=0x10004
[    0.000000] SBI TIME extension detected
[    0.000000] SBI IPI extension detected
[    0.000000] SBI RFENCE extension detected
[    0.000000] efi: UEFI not found.
[    0.000000] OF: reserved mem: 0x0000002000000000..0x000000200003ffff 
(256 KiB) nomap non-reusable mmode_resv1@20,0
[    0.000000] OF: reserved mem: 0x0000002000040000..0x000000200005ffff 
(128 KiB) nomap non-reusable mmode_resv0@20,40000
[    0.000000] Zone ranges:
[    0.000000]   DMA32    empty
[    0.000000]   Normal   [mem 0x0000002000000000-0x00000021ffffffff]

[   35.738619] [drm] amdgpu kernel modesetting enabled.
[   35.743916] [drm] initializing kernel modesetting (POLARIS12 
0x1002:0x699F 0x1043:0x0513 0xC7).
[   35.752671] [drm] register mmio base: 0xA8100000
[   35.763558] [drm] register mmio size: 262144
[   35.768491] [drm] add ip block number 0 <vi_common>
[   35.773403] [drm] add ip block number 1 <gmc_v8_0>
[   35.773407] [drm] add ip block number 2 <tonga_ih>
[   35.773410] [drm] add ip block number 3 <gfx_v8_0>
[   35.773412] [drm] add ip block number 4 <sdma_v3_0>
[   35.773415] [drm] add ip block number 5 <powerplay>
[   35.773418] [drm] add ip block number 6 <dm>
[   35.806668] [drm] add ip block number 7 <uvd_v6_0>
[   35.806671] [drm] add ip block number 8 <vce_v3_0>
[   36.014036] amdgpu 0000:05:00.0: amdgpu: Fetched VBIOS from ROM BAR
[   36.020322] amdgpu: ATOM BIOS: 115-C994PI2-100
[   36.043586] [drm] UVD is enabled in VM mode
[   36.047813] [drm] UVD ENC is enabled in VM mode
[   36.052370] [drm] VCE enabled in VM mode
[   36.052377] amdgpu 0000:05:00.0: amdgpu: Trusted Memory Zone (TMZ) 
feature not supported
[   36.064404] amdgpu 0000:05:00.0: amdgpu: PCIE atomic ops is not supported
[   36.071209] [drm] GPU posting now...
[   36.190029] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, 
fragment size is 9-bit
[   36.199385] amdgpu 0000:05:00.0: amdgpu: VRAM: 4096M 
0x000000F400000000 - 0x000000F4FFFFFFFF (4096M used)
[   36.208978] amdgpu 0000:05:00.0: amdgpu: GART: 256M 
0x000000FF00000000 - 0x000000FF0FFFFFFF
[   36.217345] [drm] Detected VRAM RAM=4096M, BAR=256M
[   36.222226] [drm] RAM width 128bits GDDR5
[   36.226288] warn_alloc: 8 callbacks suppressed
[   36.226290] (udev-worker): page allocation failure: order:0, 
mode:0x104(GFP_DMA32|__GFP_ZERO), nodemask=(null),cpuset=/,mems_allowed=0
[   36.242837] CPU: 3 PID: 165 Comm: (udev-worker) Not tainted 
6.7.0-dirty #12
[   36.249796] Hardware name: (DT)
[   36.254670] Call Trace:
[   36.257113] [<ffffffff80006056>] dump_backtrace+0x1c/0x24
[   36.262513] [<ffffffff8096b860>] show_stack+0x2c/0x38
[   36.267562] [<ffffffff80977f14>] dump_stack_lvl+0x3c/0x54
[   36.272958] [<ffffffff80977f40>] dump_stack+0x14/0x1c
[   36.278006] [<ffffffff8018e66c>] warn_alloc+0xee/0x16c
[   36.283143] [<ffffffff8018f17a>] __alloc_pages+0xa90/0xb40
[   36.288627] [<ffffffff0174f5fe>] ttm_global_init+0x12a/0x1ac [ttm]
[   36.294830] [<ffffffff0174f6b2>] ttm_device_init+0x32/0x158 [ttm]
[   36.300935] [<ffffffff018448bc>] amdgpu_ttm_init+0x7a/0x638 [amdgpu]
[   36.310260] [<ffffffff01b4c8b8>] amdgpu_bo_init+0x76/0x82 [amdgpu]
[   36.319323] [<ffffffff018c2b6e>] gmc_v8_0_sw_init+0x36c/0x652 [amdgpu]
[   36.328710] [<ffffffff018328fa>] amdgpu_device_init+0x1648/0x20fa 
[amdgpu]
[   36.338395] [<ffffffff01834c1a>] amdgpu_driver_load_kms+0x1e/0x158 
[amdgpu]
[   36.348164] [<ffffffff0182b9d4>] amdgpu_pci_probe+0x124/0x46c [amdgpu]
[   36.357543] [<ffffffff804ae3ae>] pci_device_probe+0x7a/0xf0
[   36.363115] [<ffffffff8058cfb6>] really_probe+0x86/0x242
[   36.368427] [<ffffffff8058d1ce>] __driver_probe_device+0x5c/0xda
[   36.374431] [<ffffffff8058d278>] driver_probe_device+0x2c/0xb2
[   36.380260] [<ffffffff8058d3f8>] __driver_attach+0x6c/0x11a
[   36.385829] [<ffffffff8058b14c>] bus_for_each_dev+0x60/0xae
[   36.391398] [<ffffffff8058ca08>] driver_attach+0x1a/0x22
[   36.396707] [<ffffffff8058c368>] bus_add_driver+0xd0/0x1ba
[   36.402189] [<ffffffff8058e046>] driver_register+0x3e/0xd8
[   36.407671] [<ffffffff804ad04a>] __pci_register_driver+0x58/0x62
[   36.413679] [<ffffffff0207e078>] amdgpu_init+0x78/0x1000 [amdgpu]
[   36.422616] [<ffffffff8000212c>] do_one_initcall+0x58/0x19c
[   36.428188] [<ffffffff80086d22>] do_init_module+0x4e/0x1b0
[   36.433672] [<ffffffff80088456>] load_module+0x1374/0x1768
[   36.439155] [<ffffffff80088a10>] init_module_from_file+0x76/0xaa
[   36.445158] [<ffffffff80088c2c>] __riscv_sys_finit_module+0x1cc/0x2ba
[   36.451597] [<ffffffff80978952>] do_trap_ecall_u+0xba/0x12e
[   36.457167] [<ffffffff809819f4>] ret_from_exception+0x0/0x64
[   36.462847] Mem-Info:
[   36.465124] active_anon:41 inactive_anon:4533 isolated_anon:0
                 active_file:12928 inactive_file:24854 isolated_file:0
                 unevictable:0 dirty:176 writeback:0
                 slab_reclaimable:3390 slab_unreclaimable:3922
                 mapped:4609 shmem:333 pagetables:564
                 sec_pagetables:0 bounce:0
                 kernel_misc_reclaimable:0
                 free:1983561 free_pcp:0 free_cma:0
[   36.490913] Node 0 hugepages_total=0 hugepages_free=0 
hugepages_surp=0 hugepages_size=2048kB
[   36.508722] 38077 total pagecache pages
[   36.512560] 0 pages in swap cache
[   36.515875] Free swap  = 0kB
[   36.518757] Total swap = 0kB
[   36.521633] 2097152 pages RAM
[   36.524601] 0 pages HighMem/MovableOnly
[   36.528438] 45269 pages reserved
[   36.531699] [drm:amdgpu_ttm_init [amdgpu]] *ERROR* failed 
initializing buffer object driver(-12).
[   36.543451] [drm:amdgpu_device_init [amdgpu]] *ERROR* sw_init of IP 
block <gmc_v8_0> failed -12
[   36.555011] amdgpu 0000:05:00.0: amdgpu: amdgpu_device_ip_init failed
[   36.561458] amdgpu 0000:05:00.0: amdgpu: Fatal error during GPU init
[   36.567816] amdgpu 0000:05:00.0: amdgpu: amdgpu: finishing device.

> This patch here won't work since the use_dma32 flag is a per device flag 
> which can't be used for the global initialization.
> 
> Otherwise this can randomly fail depending on if a DMA32 device 
> initializes first or after some device with larger addressing 
> capabilities. This configuration is quite common on older motherboards 
> with both integrated and dedicated graphics.
> 
> Regards,
> Christian.
> 

Thanks for your review. However, the bug I mentioned above still needs
to be resolved. I want to submit patch v2 with a different solution that 
tries to allocate with GFP_DMA32 flag, if it fails, then try to allocate 
without GFP_DMA32 flag. Would this solution be acceptable?

Thanks,
Yangyu Chen

>>
>> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
>> ---
>>   drivers/gpu/drm/ttm/ttm_device.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index d48b39132b32..62f16fb72428 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -63,7 +63,7 @@ static void ttm_global_release(void)
>>       mutex_unlock(&ttm_global_mutex);
>>   }
>> -static int ttm_global_init(void)
>> +static int ttm_global_init(bool use_dma32)
>>   {
>>       struct ttm_global *glob = &ttm_glob;
>>       unsigned long num_pages, num_dma32;
>> @@ -95,7 +95,8 @@ static int ttm_global_init(void)
>>       ttm_pool_mgr_init(num_pages);
>>       ttm_tt_mgr_init(num_pages, num_dma32);
>> -    glob->dummy_read_page = alloc_page(__GFP_ZERO | GFP_DMA32);
>> +    glob->dummy_read_page = use_dma32 ? alloc_page(__GFP_ZERO | 
>> GFP_DMA32) :
>> +                        alloc_page(__GFP_ZERO);
>>       if (unlikely(glob->dummy_read_page == NULL)) {
>>           ret = -ENOMEM;
>> @@ -200,7 +201,7 @@ int ttm_device_init(struct ttm_device *bdev, const 
>> struct ttm_device_funcs *func
>>       if (WARN_ON(vma_manager == NULL))
>>           return -EINVAL;
>> -    ret = ttm_global_init();
>> +    ret = ttm_global_init(use_dma32);
>>       if (ret)
>>           return ret;
> 

