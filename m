Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860626BDE8D
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 03:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F37610E02A;
	Fri, 17 Mar 2023 02:19:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 431A110E02A
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 02:19:13 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.133])
 by gateway (Coremail) with SMTP id _____8Ax69kfzhNkZzINAA--.18982S3;
 Fri, 17 Mar 2023 10:19:11 +0800 (CST)
Received: from [10.20.42.133] (unknown [10.20.42.133])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxoOQXzhNk8BADAA--.14729S3; 
 Fri, 17 Mar 2023 10:19:03 +0800 (CST)
Message-ID: <d8c7df2e-b170-7287-437a-b70778c43a3d@loongson.cn>
Date: Fri, 17 Mar 2023 10:19:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 2/2] drm: add kms driver for loongson display controller
To: kernel test robot <lkp@intel.com>, Sui Jingfeng <15330273260@189.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>
References: <20230315211550.2620818-3-15330273260@189.cn>
 <202303161727.8HnBf6cW-lkp@intel.com>
Content-Language: en-US
From: Sui jingfeng <suijingfeng@loongson.cn>
In-Reply-To: <202303161727.8HnBf6cW-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxoOQXzhNk8BADAA--.14729S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxWw4DAFWkZw1UKF4rJr13Jwb_yoWrWryxpa
 1Yka9xKrW8Xr48GaykGa97Ca4aqan5X34UXryUGw15Z3ZFvFWqgr1I9FWY9rsrKFn7KFW2
 yrZ3uF1kWFnrZaDanT9S1TB71UUUUjJqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bqxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
 ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
 87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
 AS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
 s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI
 8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
 IxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
 AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Dl1DUUUUU==
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
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 oe-kbuild-all@lists.linux.dev, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/3/16 17:53, kernel test robot wrote:
> Hi Sui,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on drm-misc/drm-misc-next]
> [also build test WARNING on linus/master v6.3-rc2 next-20230316]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230316-051724
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20230315211550.2620818-3-15330273260%40189.cn
> patch subject: [PATCH v7 2/2] drm: add kms driver for loongson display controller
> config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230316/202303161727.8HnBf6cW-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
> reproduce (this is a W=1 build):
>          wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>          chmod +x ~/bin/make.cross
>          # https://github.com/intel-lab-lkp/linux/commit/ba899dba3475b9612f212e3b1daedc3d9a299458
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Sui-Jingfeng/MAINTAINERS-add-maintainers-for-DRM-LOONGSON-driver/20230316-051724
>          git checkout ba899dba3475b9612f212e3b1daedc3d9a299458
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
>          COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/loongson/
>
> If you fix the issue, kindly add following tag where applicable
> | Reported-by: kernel test robot <lkp@intel.com>
> | Link: https://lore.kernel.org/oe-kbuild-all/202303161727.8HnBf6cW-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>     drivers/gpu/drm/loongson/lsdc_gem.c: In function 'lsdc_show_buffer_object':
>>> drivers/gpu/drm/loongson/lsdc_gem.c:280:51: warning: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' {aka 'unsigned int'} [-Wformat=]
>       280 |                 seq_printf(m, "bo[%04u]: size: %8lukB %s\n",
>           |                                                ~~~^
>           |                                                   |
>           |                                                   long unsigned int
>           |                                                %8u
>       281 |                            i,
>       282 |                            lsdc_bo_size(tbo) >> 10,
>           |                            ~~~~~~~~~~~~~~~~~~~~~~~
>           |                                              |
>           |                                              size_t {aka unsigned int}
>
>
> vim +280 drivers/gpu/drm/loongson/lsdc_gem.c
>
>     264	
>     265	int lsdc_show_buffer_object(struct seq_file *m, void *arg)
>     266	{
>     267	#ifdef CONFIG_DEBUG_FS
>     268		struct drm_info_node *node = (struct drm_info_node *)m->private;
>     269		struct drm_device *ddev = node->minor->dev;
>     270		struct lsdc_device *ldev = to_lsdc(ddev);
>     271		struct lsdc_bo *lbo;
>     272		unsigned int i = 0;
>     273	
>     274		mutex_lock(&ldev->gem.mutex);
>     275	
>     276		list_for_each_entry(lbo, &ldev->gem.objects, list) {
>     277			struct ttm_buffer_object *tbo = &lbo->tbo;
>     278			struct ttm_resource *resource = tbo->resource;
>     279	
>   > 280			seq_printf(m, "bo[%04u]: size: %8lukB %s\n",
>
Hi, this is buffer objects tracking implemented in v7

For example,

[root@fedora 0]# pwd

/sys/kernel/debug/dri/0

[root@fedora 0]# cat chip

I'm in LS7A2000, running on cpu 0xc0, cpu revison: 0x11

[root@fedora 0]# cat bos
bo[0000]: size:     8112kB VRAM
bo[0001]: size:    16208kB VRAM
bo[0002]: size:       16kB VRAM
bo[0003]: size:       16kB VRAM


When using with modesetting driver with shadowfb option enabled.

by default we have only 4 BOs create, the first one is for fbcon,  the 
largest one is  framebuffer of double screen.

another two is hardware cursor bo.  Our system page size is 16KB by default.

