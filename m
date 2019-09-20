Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9C5B9890
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 22:40:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA7A6FDD2;
	Fri, 20 Sep 2019 20:40:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E789F6FD7F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 19:44:55 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l21so8211904lje.4
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 12:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=oKf/CYOiRu2ANLbY4b9D1sG3HUhmx59TkFGpd1M49so=;
 b=inbaWs9gW5WOqv8iaIyE3N9TNAYSX0o5JcjnA+SrYmFyQDiTtZYurEXX+KRngOafZW
 o/iFVSqihNLDJ8fMC/eM1hSmFinj77h+0KlXB5IcPJ5UNo5K/E+mVeLtmy7RuZOCCRIw
 y9+0BHO9pwUD5RfzE1+XQ3C+FsUNwTH6FZQVpI78UaFWjNrnbWAA6LmDdH5DuYPAX4vx
 HCxTr//zPXo32Fps2jKwzJva3f2VGkvknXfpi2RbKstOIojNx76dG8jaI5cN4/RsK9cO
 3ZkAve0xIZW9CCLdjMTQTKJi5oi5o3hr0dr/G77ZjIOtqvz3j2TKrK9IBjczmfqoiy7M
 XLyQ==
X-Gm-Message-State: APjAAAU6L5cO2iXSCJtD0vKKLOyOT3Er6ovYRYmLLDoEzqaemXN2omk+
 YDf2xPcrNKlzB0lWZqEr4Jm/aKg7u1Q=
X-Google-Smtp-Source: APXvYqwe5T/76C3/CdnSHVyFbD8Gt+Yoee5cwaeawqypeVGECvTOittvK1uVch5ERFCUyj4J5DbbLA==
X-Received: by 2002:a2e:9a0c:: with SMTP id o12mr6103421lji.204.1569008693470; 
 Fri, 20 Sep 2019 12:44:53 -0700 (PDT)
Received: from pc-sasha.localdomain ([95.47.123.158])
 by smtp.gmail.com with ESMTPSA id t1sm651554lji.101.2019.09.20.12.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 12:44:52 -0700 (PDT)
Date: Fri, 20 Sep 2019 22:44:50 +0300
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
To: dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: Kernel panic during drm/nouveau init 5.3.0-rc7-next-20190903
Message-ID: <20190920194450.GA3970@pc-sasha.localdomain>
References: <20190907090534.GB1712@pc-sasha.localdomain>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190907090534.GB1712@pc-sasha.localdomain>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Approved-At: Fri, 20 Sep 2019 20:39:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=oKf/CYOiRu2ANLbY4b9D1sG3HUhmx59TkFGpd1M49so=;
 b=Il1BN/ZMw7a64r2hMAU9H+DkBFqFRq1F7Yx5qe60boIAtaR6bC6tfVdZkmaT6PmEMS
 a7+HafNRkm8Q44KzEBZSewg0d3H9EJ9J64fjvGcGl5ccSd+MUzU2B1xExItAAj6/0mfk
 NfeNAs1ShZp8JCAZHxyYzJCwBvqaf/UeTdS0k4vsdt+WGZis2hRbR2QUQmNavdYOuYsg
 m2ShEt1KynYHLe9VQVm28u3c3ieJHpEjkhO6Dfkac0GWvADJmIawcHNTbzqcvKvV/ao2
 xqT1mviUGxdlYgmVw8zUZjJ1+khB6MBiky4Fs5ehjsMCj+598avDAnWQHD/b7OjjHLft
 +Gvg==
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
Cc: airlied@linux.ie, sean@poorly.run, mripard@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Sep 07, 2019 at 12:05:34PM +0300, Alexander Kapshuk wrote:
> To Whom It May Concern
> 
> Every kernel I have built since 5.3.0-rc2-next-20190730 and up to
> 5.3.0-rc7-next-20190903 has resulted in the kernel panic described below.
> 
> The panic occurs early on in the boot process, so no records of it get
> written on disk. I resourted to taking photos and videos to get the info
> for debugging.
> 
> [Kernel panic]
> Code: 00 48 83 bb f0 00 00 00 00 74 16 48 83 c3 18 b9 17 00 00 00 31 c0 48 89 df f3 48 ab 5b 41 5c 5d c3 4c 89 a3 f0 00 00 00 eb e1 <0f> 0b 0f 1f 40 00 55 48 89 e5 41 54 49 89 d4 53 48 89 f3 e8 7e ff
> 
> Kernel panic - Not syncing: Attempted to kill init! exitcode=0x0000000b.
> 
> Top of call stack:
> __drm_fb_helper_initial_config_and_unlock
> drm_fb_helper_initial_config
> 
> <scripts/decodecode <~/tmp/panic_code.txt
> Code: 00 48 83 bb f0 00 00 00 00 74 16 48 83 c3 18 b9 17 00 00 00 31 c0 48 89 df f3 48 ab 5b 41 5c 5d c3 4c 89 a3 f0 00 00 00 eb e1 <0f> 0b 0f 1f 40 00 55 48 89 e5 41 54 49 89 d4 53 48 89 f3 e8 7e ff
> All code
> ========
>    0:	00 48 83             	add    %cl,-0x7d(%rax)
>    3:	bb f0 00 00 00       	mov    $0xf0,%ebx
>    8:	00 74 16 48          	add    %dh,0x48(%rsi,%rdx,1)
>    c:	83 c3 18             	add    $0x18,%ebx
>    f:	b9 17 00 00 00       	mov    $0x17,%ecx
>   14:	31 c0                	xor    %eax,%eax
>   16:	48 89 df             	mov    %rbx,%rdi
>   19:	f3 48 ab             	rep stos %rax,%es:(%rdi)
>   1c:	5b                   	pop    %rbx
>   1d:	41 5c                	pop    %r12
>   1f:	5d                   	pop    %rbp
>   20:	c3                   	retq   
>   21:	4c 89 a3 f0 00 00 00 	mov    %r12,0xf0(%rbx)
>   28:	eb e1                	jmp    0xb
>   2a:*	0f 0b                	ud2    		<-- trapping instruction
>   2c:	0f 1f 40 00          	nopl   0x0(%rax)
>   30:	55                   	push   %rbp
>   31:	48 89 e5             	mov    %rsp,%rbp
>   34:	41 54                	push   %r12
>   36:	49 89 d4             	mov    %rdx,%r12
>   39:	53                   	push   %rbx
>   3a:	48 89 f3             	mov    %rsi,%rbx
>   3d:	e8                   	.byte 0xe8
>   3e:	7e ff                	jle    0x3f
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	0f 0b                	ud2    
>    2:	0f 1f 40 00          	nopl   0x0(%rax)
>    6:	55                   	push   %rbp
>    7:	48 89 e5             	mov    %rsp,%rbp
>    a:	41 54                	push   %r12
>    c:	49 89 d4             	mov    %rdx,%r12
>    f:	53                   	push   %rbx
>   10:	48 89 f3             	mov    %rsi,%rbx
>   13:	e8                   	.byte 0xe8
>   14:	7e ff                	jle    0x15
> 
> The panic occurs after the 'Driver supports precise vblank timestamp
> query.' line gets printed to console:
> [    2.858970] Linux agpgart interface v0.103
> [    2.859308] nouveau 0000:01:00.0: NVIDIA G84 (084300a2)
> [    2.968950] nouveau 0000:01:00.0: bios: version 60.84.68.00.19
> [    2.989923] nouveau 0000:01:00.0: bios: M0203T not found
> [    2.990010] nouveau 0000:01:00.0: bios: M0203E not matched!
> [    2.990096] nouveau 0000:01:00.0: fb: 512 MiB DDR2
> [    3.062362] [TTM] Zone  kernel: Available graphics memory: 2015014 KiB
> [    3.062494] [TTM] Initializing pool allocator
> [    3.062581] [TTM] Initializing DMA pool allocator
> [    3.062683] nouveau 0000:01:00.0: DRM: VRAM: 512 MiB
> [    3.062769] nouveau 0000:01:00.0: DRM: GART: 1048576 MiB
> [    3.062859] nouveau 0000:01:00.0: DRM: TMDS table version 2.0
> [    3.062944] nouveau 0000:01:00.0: DRM: DCB version 4.0
> [    3.063030] nouveau 0000:01:00.0: DRM: DCB outp 00: 02000300 00000028
> [    3.063117] nouveau 0000:01:00.0: DRM: DCB outp 01: 01000302 00000030
> [    3.063203] nouveau 0000:01:00.0: DRM: DCB outp 02: 04011310 00000028
> [    3.063290] nouveau 0000:01:00.0: DRM: DCB outp 03: 02011312 00c000b0
> [    3.063377] nouveau 0000:01:00.0: DRM: DCB conn 00: 1030
> [    3.063462] nouveau 0000:01:00.0: DRM: DCB conn 01: 2130
> [    3.065982] nouveau 0000:01:00.0: DRM: MM: using CRYPT for buffer copies
> [    3.066622] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
> [    3.066754] [drm] Driver supports precise vblank timestamp query.
> 
> I was not able to capture the value of RIP for this crash.
> 
> With drm_kms_helper.fbdev_emulation=0 enabled, as documented in
> the commentary to function drm_fb_helper_initial_config defined in
> drivers/gpu/drm/drm_fb_helper.c, I get the following output:
> 
> RIP: 0010: _raw_spin_lock+0x7/0x20
> Code: ba ff 00 00 00 f0 0f b1 17 75 01 c3 55 48 89 e5 e8 23 a2 6d ff 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 90 31 c0 ba 01 00 00 00 <f0> 0f b1 17 75 01 c3 55 89 c6 40 89 e5 e8 e7 8f 6d ff 5d c3 0f 1f
> 
> <scripts/decodecode <~/tmp/panic_code.txt
> Code: ba ff 00 00 00 f0 0f b1 17 75 01 c3 55 48 89 e5 e8 23 a2 6d ff 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 90 31 c0 ba 01 00 00 00 <f0> 0f b1 17 75 01 c3 55 89 c6 40 89 e5 e8 e7 8f 6d ff 5d c3 0f 1f
> All code
> ========
>    0:	ba ff 00 00 00       	mov    $0xff,%edx
>    5:	f0 0f b1 17          	lock cmpxchg %edx,(%rdi)
>    9:	75 01                	jne    0xc
>    b:	c3                   	retq   
>    c:	55                   	push   %rbp
>    d:	48 89 e5             	mov    %rsp,%rbp
>   10:	e8 23 a2 6d ff       	callq  0xffffffffff6da238
>   15:	5d                   	pop    %rbp
>   16:	c3                   	retq   
>   17:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
>   1e:	00 00 00 00 
>   22:	90                   	nop
>   23:	31 c0                	xor    %eax,%eax
>   25:	ba 01 00 00 00       	mov    $0x1,%edx
>   2a:*	f0 0f b1 17          	lock cmpxchg %edx,(%rdi)		<-- trapping instruction
>   2e:	75 01                	jne    0x31
>   30:	c3                   	retq   
>   31:	55                   	push   %rbp
>   32:	89 c6                	mov    %eax,%esi
>   34:	40 89 e5             	rex mov %esp,%ebp
>   37:	e8 e7 8f 6d ff       	callq  0xffffffffff6d9023
>   3c:	5d                   	pop    %rbp
>   3d:	c3                   	retq   
>   3e:	0f                   	.byte 0xf
>   3f:	1f                   	(bad)  
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	f0 0f b1 17          	lock cmpxchg %edx,(%rdi)
>    4:	75 01                	jne    0x7
>    6:	c3                   	retq   
>    7:	55                   	push   %rbp
>    8:	89 c6                	mov    %eax,%esi
>    a:	40 89 e5             	rex mov %esp,%ebp
>    d:	e8 e7 8f 6d ff       	callq  0xffffffffff6d8ff9
>   12:	5d                   	pop    %rbp
>   13:	c3                   	retq   
>   14:	0f                   	.byte 0xf
>   15:	1f                   	(bad)  
> 
> (gdb) list *(_raw_spin_lock+0x7)
> 0xffffffff81a13b27 is in _raw_spin_lock (./arch/x86/include/asm/atomic.h:200).
> 195	}
> 196	
> 197	#define arch_atomic_try_cmpxchg arch_atomic_try_cmpxchg
> 198	static __always_inline bool arch_atomic_try_cmpxchg(atomic_t *v, int *old, int new)
> 199	{
> 200		return try_cmpxchg(&v->counter, old, new);
> 201	}
> 202	
> 203	static inline int arch_atomic_xchg(atomic_t *v, int new)
> 204	{
> 
> (gdb) disassemble _raw_spin_lock+0x7
> Dump of assembler code for function _raw_spin_lock:
>    0xffffffff81a13b20 <+0>:	xor    %eax,%eax
>    0xffffffff81a13b22 <+2>:	mov    $0x1,%edx
>    0xffffffff81a13b27 <+7>:	lock cmpxchg %edx,(%rdi)
>    0xffffffff81a13b2b <+11>:	jne    0xffffffff81a13b2e <_raw_spin_lock+14>
>    0xffffffff81a13b2d <+13>:	retq   
>    0xffffffff81a13b2e <+14>:	push   %rbp
>    0xffffffff81a13b2f <+15>:	mov    %eax,%esi
>    0xffffffff81a13b31 <+17>:	mov    %rsp,%rbp
>    0xffffffff81a13b34 <+20>:	callq  0xffffffff810ecb20 <queued_spin_lock_slowpath>
>    0xffffffff81a13b39 <+25>:	pop    %rbp
>    0xffffffff81a13b3a <+26>:	retq   
> End of assembler dump.
> 
> Any pointers on how to proceed with this would be appreciated.

'Git bisect' has identified the following commits as being 'bad'.

b96f3e7c8069b749a40ca3a33c97835d57dd45d2 is the first bad commit
commit b96f3e7c8069b749a40ca3a33c97835d57dd45d2
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Mon Aug 5 16:01:10 2019 +0200

    drm/ttm: use gem vma_node
    
    Drop vma_node from ttm_buffer_object, use the gem struct
    (base.vma_node) instead.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Reviewed-by: Christian König <christian.koenig@amd.com>
    Link: http://patchwork.freedesktop.org/patch/msgid/20190805140119.7337-9-kraxel@redhat.com

 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h | 2 +-
 drivers/gpu/drm/drm_gem_vram_helper.c      | 2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c  | 2 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c      | 2 +-
 drivers/gpu/drm/qxl/qxl_object.h           | 2 +-
 drivers/gpu/drm/radeon/radeon_object.h     | 2 +-
 drivers/gpu/drm/ttm/ttm_bo.c               | 8 ++++----
 drivers/gpu/drm/ttm/ttm_bo_util.c          | 2 +-
 drivers/gpu/drm/ttm/ttm_bo_vm.c            | 9 +++++----
 drivers/gpu/drm/virtio/virtgpu_drv.h       | 2 +-
 drivers/gpu/drm/virtio/virtgpu_prime.c     | 3 ---
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c         | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c    | 4 ++--
 include/drm/ttm/ttm_bo_api.h               | 4 ----
 14 files changed, 21 insertions(+), 27 deletions(-)

I nominated commit '[1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715] drm/ttm:
use gem reservation object' as being 'good' initially, based on the
fact that kernel 5.3.0-rc1-00364-g1e053b10ba60 did boot. But the GUI
applications displayed black artifacts across the screen.

I then edited the git-bisect log file where I nominated
commit 1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715 as being
'bad' and ran 'git bisect replay' on it. This blamed commit
1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715 as the first bad commit.

1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715 is the first bad commit
commit 1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715
Author: Gerd Hoffmann <kraxel@redhat.com>
Date:   Mon Aug 5 16:01:09 2019 +0200

    drm/ttm: use gem reservation object
    
    Drop ttm_resv from ttm_buffer_object, use the gem reservation object
    (base._resv) instead.
    
    Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
    Reviewed-by: Christian König <christian.koenig@amd.com>
    Link: http://patchwork.freedesktop.org/patch/msgid/20190805140119.7337-8-kraxel@redhat.com

 drivers/gpu/drm/ttm/ttm_bo.c      | 39 +++++++++++++++++++++++----------------
 drivers/gpu/drm/ttm/ttm_bo_util.c |  2 +-
 include/drm/ttm/ttm_bo_api.h      |  1 -
 3 files changed, 24 insertions(+), 18 deletions(-)


In the process of bisection, I nominated the following kernels as being
'bad'. They also booted fine, but the xserver would fail to start. I
have attached the error messages generated by xorg.

# kernel boots; Xorg won't start. See Xorg_err.log attached.
5.3.0-rc3-01537-g6a3068065fa4
5.3.0-rc3-00782-gb0383c0653c4
5.3.0-rc1-00391-g54fc01b775fe
5.3.0-rc1-00366-g2e3c9ec4d151
5.3.0-rc1-00365-gb96f3e7c8069

Today, I upgraded the kernel to 5.3.0-next-20190919, which booted fine
with no Xorg regressions to report.

Just wondering if the earlier kernels would not boot for me because of
the changes introduced by the 'bad' commits being perhaps incomplete?

Thanks to all of you for the tips on how proceed with bisection.

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="git-bisect1.txt"

git bisect start
# good: [089cf7f6ecb266b6a4164919a2e69bd2f938374a] Linux 5.3-rc7
git bisect good 089cf7f6ecb266b6a4164919a2e69bd2f938374a
# bad: [35394d031b710e832849fca60d0f53b513f0c390] Add linux-next specific files for 20190904
git bisect bad 35394d031b710e832849fca60d0f53b513f0c390
# good: [493424779be81b03fb4aca89cc05ba95e9fc0c31] Merge remote-tracking branch 'crypto/master'
git bisect good 493424779be81b03fb4aca89cc05ba95e9fc0c31
# bad: [c6ac8cb5b31c965f4e145a2f226e64b37e94a0e2] Merge remote-tracking branch 'tpmdd/next'
git bisect bad c6ac8cb5b31c965f4e145a2f226e64b37e94a0e2
# bad: [6a3068065fa4d6f931a12573d4bda5d85261cee2] drm/amd: Import smuio_11_0 headers for EEPROM access on Vega20
git bisect bad 6a3068065fa4d6f931a12573d4bda5d85261cee2
# bad: [b0383c0653c4bd2d2732c5767ec8fa223b3d6efd] Merge tag 'drm-misc-next-2019-08-08' of git://anongit.freedesktop.org/drm/drm-misc into drm-next
git bisect bad b0383c0653c4bd2d2732c5767ec8fa223b3d6efd
# bad: [54fc01b775fe35fa0889cb3344ed98c72a52d2c1] Revert "drm/vgem: drop DRM_AUTH usage from the driver"
git bisect bad 54fc01b775fe35fa0889cb3344ed98c72a52d2c1
# good: [91328ebe4f6f12eaa7754b4ac01b308cf68538d0] drm/tve200: drop use of drmP.h
git bisect good 91328ebe4f6f12eaa7754b4ac01b308cf68538d0
# good: [2299b52d139138e2ab91d3e835d7d18fdbde803d] drm/via: make via_drv.h self-contained
git bisect good 2299b52d139138e2ab91d3e835d7d18fdbde803d
# good: [93386368a138e2ccc40459af5b05dd2e39bcd3db] Revert "drm/radeon: Provide ddc symlink in connector sysfs directory"
git bisect good 93386368a138e2ccc40459af5b05dd2e39bcd3db
# bad: [2e3c9ec4d151c04d75546dfdc2f85a84ad546eb0] drm/ttm: set both resv and base.resv pointers
git bisect bad 2e3c9ec4d151c04d75546dfdc2f85a84ad546eb0
# good: [b316c92e9a0ea156f91b79840f39a1d964aad55f] drm/bridge/megachips: Drop GPIO header
git bisect good b316c92e9a0ea156f91b79840f39a1d964aad55f
# good: [e0828d54c81cb111ead1a7c47a5ef1b319610a1d] drm/qxl: use embedded gem object
git bisect good e0828d54c81cb111ead1a7c47a5ef1b319610a1d
# good: [f8659be8addd731480037eb44ecb521084ae1d11] drm/nouveau: use embedded gem object
git bisect good f8659be8addd731480037eb44ecb521084ae1d11
# bad: [b96f3e7c8069b749a40ca3a33c97835d57dd45d2] drm/ttm: use gem vma_node
git bisect bad b96f3e7c8069b749a40ca3a33c97835d57dd45d2
# good: [1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715] drm/ttm: use gem reservation object
git bisect good 1e053b10ba60eae6a3f9de64cbc74bdf6cb0e715
# first bad commit: [b96f3e7c8069b749a40ca3a33c97835d57dd45d2] drm/ttm: use gem vma_node

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="Xorg_err.log"

startx output:
Xorg: drmmode_display.c:807: drmmode_crtc_init: Assertion `ret == 0' failed.
xinit: giving up
xinit: unable to connect to X server: Connection refused
xinit: server error

grep EE /var/log/Xorg.0.log
[    32.548] Current Operating System: Linux pc-sasha 5.3.0-rc3-01537-g6a3068065fa4 #4 SMP Sun Sep 15 17:41:39 EEST 2019 x86_64
        (WW) warning, (EE) error, (NI) not implemented, (??) unknown.
[    32.828] (EE) Failed to load module "nv" (module does not exist, 0)
[    32.861] (EE) Failed to load module "fbdev" (module does not exist, 0)
[    32.861] (EE) Failed to load module "vesa" (module does not exist, 0)
[    32.863] (EE) [drm] Failed to open DRM device for (null): -22
[    32.908] (EE)
[    32.908] (EE) Backtrace:
[    32.908] (EE) 0: /usr/lib/Xorg (xorg_backtrace+0x4d) [0x55b0ae7cc69d]
[    32.908] (EE) 1: /usr/lib/Xorg (0x55b0ae71a000+0xa8be8) [0x55b0ae7c2be8]
[    32.908] (EE) 2: /usr/lib/libc.so.6 (0x7f7b8c8f2000+0x3a7e0) [0x7f7b8c92c7e0]
[    32.908] (EE) 3: /usr/lib/libc.so.6 (gsignal+0x145) [0x7f7b8c92c755]
[    32.908] (EE) 4: /usr/lib/libc.so.6 (abort+0x125) [0x7f7b8c917851]
[    32.908] (EE) 5: /usr/lib/libc.so.6 (0x7f7b8c8f2000+0x25727) [0x7f7b8c917727]
[    32.908] (EE) 6: /usr/lib/libc.so.6 (0x7f7b8c8f2000+0x33026) [0x7f7b8c925026]
[    32.908] (EE) 7: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7f7b8b1c9000+0x2a120) [0x7f7b8b1f3120]
[    32.908] (EE) 8: /usr/lib/xorg/modules/drivers/nouveau_drv.so (0x7f7b8b1c9000+0x12f6e) [0x7f7b8b1dbf6e]
[    32.909] (EE) 9: /usr/lib/Xorg (InitOutput+0x13f2) [0x55b0ae7af412]
[    32.909] (EE) 10: /usr/lib/Xorg (0x55b0ae71a000+0x37503) [0x55b0ae751503]
[    32.909] (EE) 11: /usr/lib/libc.so.6 (__libc_start_main+0xf3) [0x7f7b8c918ee3]
[    32.909] (EE) 12: /usr/lib/Xorg (_start+0x2e) [0x55b0ae7523be]
[    32.909] (EE)
[    32.909] (EE)
[    32.909] (EE) Caught signal 6 (Aborted). Server aborting
[    32.909] (EE)
[    32.909] (EE)
[    32.909] (EE) Please also check the log file at "/var/log/Xorg.0.log" for additional information.
[    32.909] (EE)
[    32.912] (EE) Server terminated with error (1). Closing log file.

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--fUYQa+Pmc3FrFX/N--
