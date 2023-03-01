Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7A36A6EA5
	for <lists+dri-devel@lfdr.de>; Wed,  1 Mar 2023 15:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FB910E0DC;
	Wed,  1 Mar 2023 14:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B95A10E0DC
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Mar 2023 14:43:40 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8CxMk6XZP9jCOQGAA--.7453S3;
 Wed, 01 Mar 2023 22:43:35 +0800 (CST)
Received: from [10.20.42.133] (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cxf+SRZP9jwSxEAA--.20716S3; 
 Wed, 01 Mar 2023 22:43:29 +0800 (CST)
Message-ID: <cfd87ccf-bf75-2ce5-7393-920a643c0747@loongson.cn>
Date: Wed, 1 Mar 2023 22:43:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v6 1/2] drm: add kms driver for loongson display controller
To: kernel test robot <lkp@intel.com>, suijingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20230301072306.572685-1-15330273260@189.cn>
 <202303012148.S6ymQNI9-lkp@intel.com>
Content-Language: en-US
From: Sui jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <202303012148.S6ymQNI9-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxf+SRZP9jwSxEAA--.20716S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKr4fuFWkJw45Zw1xGrWxWFg_yoWxuw48pa
 n8AFyjyrZ5Jr4xXa4DJFy8C3WagwnxW3sF9Fy3CwnIkFWjy34YgFs2kryakw4DJFsrKay7
 Kr93GFn0gF17A3DanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bq8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
 w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
 I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
 jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
 AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCa
 FVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
 IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
 42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
 IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
 aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcbAwUUUUU
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
Cc: Li Yi <liyi@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/3/1 21:30, kernel test robot wrote:
> Hi suijingfeng,
>
> Thank you for the patch! Perhaps something to improve:
>
> [auto build test WARNING on drm-misc/drm-misc-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/suijingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230301-153240
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20230301072306.572685-1-15330273260%40189.cn
> patch subject: [PATCH v6 1/2] drm: add kms driver for loongson display controller
> config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230301/202303012148.S6ymQNI9-lkp@intel.com/config)
> compiler: mips-linux-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/125bbfe8c188e62159ecd4d143246d36b1801f79
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review suijingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230301-153240
>          git checkout 125bbfe8c188e62159ecd4d143246d36b1801f79
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/gpu/drm/loongson/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303012148.S6ymQNI9-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     drivers/gpu/drm/loongson/lsdc_plane.c: In function 'lsdc_update_primary_plane':
>>> drivers/gpu/drm/loongson/lsdc_plane.c:95:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>        95 |         if (IS_ERR((void *)bo_offset)) {
>           |                    ^

Loongson 3a4000 is a 64 bit cpu,  on 64 bit platform sizeof (void *) == 
sizeof (u64) = 8 bytes.


I complie drm-time  with following command:

1) on loongarch

|make -j$(nproc) ARCH=loongarch CROSS_COMPILE=loongarch64-linux-gnu- W=1|

2) On mips64el

|make -j$(nproc) ARCH=mips CROSS_COMPILE=mips64el-linux-gnuabi64- W=1|


It report no warnings. I think this test robot compile this driver with 
32 bit machine environment.


> --
>     In file included from include/linux/printk.h:566,
>                      from include/asm-generic/bug.h:22,
>                      from arch/mips/include/asm/bug.h:42,
>                      from include/linux/bug.h:5,
>                      from include/linux/thread_info.h:13,
>                      from include/asm-generic/preempt.h:5,
>                      from ./arch/mips/include/generated/asm/preempt.h:1,
>                      from include/linux/preempt.h:78,
>                      from include/linux/spinlock.h:56,
>                      from include/linux/kref.h:16,
>                      from include/drm/drm_device.h:5,
>                      from include/drm/drm_drv.h:35,
>                      from drivers/gpu/drm/loongson/lsdc_ttm.c:3:
>     drivers/gpu/drm/loongson/lsdc_ttm.c: In function 'lsdc_dumb_create':
>>> drivers/gpu/drm/loongson/lsdc_ttm.c:378:23: warning: format '%lu' expects argument of type 'long unsigned int', but argument 5 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
>       378 |         drm_dbg(ddev, "pitch: %lu, height: %u\n", pitch, args->height);
>           |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~  ~~~~~
>           |                                                   |
>           |                                                   size_t {aka unsigned int}
>     include/linux/dynamic_debug.h:223:29: note: in definition of macro '__dynamic_func_call_cls'
>       223 |                 func(&id, ##__VA_ARGS__);                       \
>           |                             ^~~~~~~~~~~
>     include/drm/drm_print.h:413:9: note: in expansion of macro '_dynamic_func_call_cls'
>       413 |         _dynamic_func_call_cls(cat, fmt, __drm_dev_dbg,         \
>           |         ^~~~~~~~~~~~~~~~~~~~~~
>     include/drm/drm_print.h:492:9: note: in expansion of macro 'drm_dev_dbg'
>       492 |         drm_dev_dbg((drm) ? (drm)->dev : NULL, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>           |         ^~~~~~~~~~~
>     include/drm/drm_print.h:510:33: note: in expansion of macro 'drm_dbg_driver'
>       510 | #define drm_dbg(drm, fmt, ...)  drm_dbg_driver(drm, fmt, ##__VA_ARGS__)
>           |                                 ^~~~~~~~~~~~~~
>     drivers/gpu/drm/loongson/lsdc_ttm.c:378:9: note: in expansion of macro 'drm_dbg'
>       378 |         drm_dbg(ddev, "pitch: %lu, height: %u\n", pitch, args->height);
>           |         ^~~~~~~
>     drivers/gpu/drm/loongson/lsdc_ttm.c:378:33: note: format string is defined here
>       378 |         drm_dbg(ddev, "pitch: %lu, height: %u\n", pitch, args->height);
>           |                               ~~^
>           |                                 |
>           |                                 long unsigned int
>           |                               %u
>
here is the same reason, on 64 bit machine, sizeof (long unsigned int) 
== sizeof (size_t) == 8.

> vim +95 drivers/gpu/drm/loongson/lsdc_plane.c
>
>      77	
>      78	static void lsdc_update_primary_plane(struct drm_plane *plane,
>      79					      struct drm_atomic_state *state)
>      80	{
>      81		struct drm_device *ddev = plane->dev;
>      82		struct lsdc_device *ldev = to_lsdc(ddev);
>      83		struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>      84		struct drm_crtc *crtc = new_plane_state->crtc;
>      85		struct drm_framebuffer *fb = new_plane_state->fb;
>      86		struct ttm_buffer_object *tbo = to_ttm_bo(fb->obj[0]);
>      87		unsigned int pipe = drm_crtc_index(crtc);
>      88		unsigned int fb_offset = lsdc_get_fb_offset(fb, new_plane_state, 0);
>      89		u64 bo_offset = lsdc_bo_gpu_offset(tbo);
>      90		u64 fb_addr = ldev->vram_base + bo_offset + fb_offset;
>      91		u32 stride = fb->pitches[0];
>      92		u32 cfg;
>      93		u32 lo, hi;
>      94	
>    > 95		if (IS_ERR((void *)bo_offset)) {
>      96			drm_warn(ddev, "bo not pinned, should not happen\n");
>      97			return;
>      98		}
>      99	
>     100		/* 40-bit width physical address bus */
>     101		lo = fb_addr & 0xFFFFFFFF;
>     102		hi = (fb_addr >> 32) & 0xFF;
>     103	
>     104		cfg = lsdc_crtc_rreg32(ldev, LSDC_CRTC0_CFG_REG, pipe);
>     105		if (cfg & CFG_FB_IN_USING) {
>     106			drm_dbg(ddev, "CRTC-%u(FB1) is in using\n", pipe);
>     107			lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB1_LO_ADDR_REG, pipe, lo);
>     108			lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB1_HI_ADDR_REG, pipe, hi);
>     109		} else {
>     110			drm_dbg(ddev, "CRTC-%u(FB0) is in using\n", pipe);
>     111			lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB0_LO_ADDR_REG, pipe, lo);
>     112			lsdc_crtc_wreg32(ldev, LSDC_CRTC0_FB0_HI_ADDR_REG, pipe, hi);
>     113		}
>     114	
>     115		drm_dbg(ddev, "CRTC-%u scanout from 0x%llx\n", pipe, fb_addr);
>     116	
>     117		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_STRIDE_REG, pipe, stride);
>     118	
>     119		cfg &= ~CFG_PIX_FMT_MASK;
>     120		cfg |= LSDC_PF_XRGB8888;
>     121	
>     122		lsdc_crtc_wreg32(ldev, LSDC_CRTC0_CFG_REG, pipe, cfg);
>     123	}
>     124	
>
Ok, will fixed at next version.

