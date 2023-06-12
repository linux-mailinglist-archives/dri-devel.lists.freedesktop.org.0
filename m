Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D14C72C82F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 16:23:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4560910E11D;
	Mon, 12 Jun 2023 14:23:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id BFD0910E08F;
 Mon, 12 Jun 2023 14:23:27 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8DxyOlcKodk_NcDAA--.8330S3;
 Mon, 12 Jun 2023 22:23:24 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxReRcKodkH2IWAA--.64643S3; 
 Mon, 12 Jun 2023 22:23:24 +0800 (CST)
Message-ID: <bb6fde7f-d5b5-b790-74e2-b2ec359d4d06@loongson.cn>
Date: Mon, 12 Jun 2023 22:23:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 0/8] drm/etnaviv: add pci device driver support
To: Sui Jingfeng <15330273260@189.cn>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>
References: <20230607105551.568639-1-15330273260@189.cn>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230607105551.568639-1-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxReRcKodkH2IWAA--.64643S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Cw18Wr45ZFWkCw1xuw1fKrX_yoW8tr47pF
 47JFyYkry8ZrW7K347AFs8JF93G3WxWF9Yk3srt3sI9w45ZFyjvryDKF45Jr9xXr1fAr42
 qr1akr13WF15ArXCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUvYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v2
 6F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc
 02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAF
 wI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4
 CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG
 67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI
 IYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E
 14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJV
 W8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07URa0PU
 UUUU=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,


Humble ping ?


On 2023/6/7 18:55, Sui Jingfeng wrote:
> From: Sui Jingfeng <suijingfeng@loongson.cn>
>
> There is a Vivante GC1000 (v5037) in LS2K1000 and LS7A1000, this GPU is a
> PCI device, and it has 2D and 3D cores in the same core. Thus, this patch
> set is trying to add PCI device driver support to etnaviv.
>
> v6:
> 	* Fix build issue on system without CONFIG_PCI enabled
> v7:
> 	* Add a separate patch for the platform driver rearrangement (Bjorn)
> 	* Switch to runtime check if the GPU is dma coherent or not (Lucas)
> 	* Add ETNAVIV_PARAM_GPU_COHERENT to allow userspace to query (Lucas)
> 	* Remove etnaviv_gpu.no_clk member (Lucas)
> 	* Various Typos and coding style fixed (Bjorn)
>
> v8:
> 	* Fix typos and remove unnecessary header included (Bjorn).
> 	* Add a dedicated function to create the virtual master platform
> 	  device.
>
> Sui Jingfeng (8):
>    drm/etnaviv: add a dedicated function to register an irq handler
>    drm/etnaviv: add a dedicated function to get various clocks
>    drm/etnaviv: add dedicated functions to create and destroy platform
>      devices
>    drm/etnaviv: add helpers for private data construction and destruction
>    drm/etnaviv: allow bypass component framework
>    drm/etnaviv: add driver support for the PCI devices
>    drm/etnaviv: add support for the dma coherent device
>    drm/etnaviv: add a dedicated function to create the virtual master
>
>   drivers/gpu/drm/etnaviv/Kconfig             |  10 +
>   drivers/gpu/drm/etnaviv/Makefile            |   2 +
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 257 ++++++++++++++------
>   drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  10 +
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  22 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |   7 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c       | 168 ++++++++-----
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.h       |   9 +
>   drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c   |  75 ++++++
>   drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h   |   9 +
>   include/uapi/drm/etnaviv_drm.h              |   1 +
>   11 files changed, 440 insertions(+), 130 deletions(-)
>   create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
>   create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
>
-- 
Jingfeng

