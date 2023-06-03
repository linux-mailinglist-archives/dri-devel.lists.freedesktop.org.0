Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5982D720FE8
	for <lists+dri-devel@lfdr.de>; Sat,  3 Jun 2023 13:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E6810E239;
	Sat,  3 Jun 2023 11:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D5B310E14E;
 Sat,  3 Jun 2023 11:20:45 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Bx1fAMIntkoewDAA--.8491S3;
 Sat, 03 Jun 2023 19:20:44 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8BxLL4LIntk9DuHAA--.21806S3; 
 Sat, 03 Jun 2023 19:20:43 +0800 (CST)
Message-ID: <af174b6c-3330-c054-23e4-32c41972eb53@loongson.cn>
Date: Sat, 3 Jun 2023 19:20:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 0/7] drm/etnaviv: add pci device driver support
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>, Lucas Stach <l.stach@pengutronix.de>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>
References: <20230603105943.3042766-1-15330273260@189.cn>
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230603105943.3042766-1-15330273260@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxLL4LIntk9DuHAA--.21806S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxuryxtr1UJry7AFW7CF1kuFg_yoW5WrWkpF
 47JFyYyry8ZrW7Kw17AFn8XFyfGa4xWF9Yk3srt3sI9ws0vFyjvry8KFs8Ar9xXr1fJr42
 qr1a9r1fWF13ArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bf8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
 1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
 wVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
 x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4xG64xvF2
 IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4UJVWx
 Jr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0Y40E4IxF1VCIxcxG6Fyj6r
 4UJwCYjI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
 6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
 CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
 0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
 AIcVC2z280aVAFwI0_Gr1j6F4UJwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsG
 vfC2KfnxnUUI43ZEXa7IUeLNVDUUUUU==
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


Sorry for sending duplicated patches.  Please don't get angry by me.

I'm just sending a patch set, which contain 7 patch. The command is as 
following:


git send-email V7/ --to "Lucas Stach <l.stach@pengutronix.de>" --to 
"Christian Gmeiner <christian.gmeiner@gmail.com>" --to "Daniel Vetter 
<daniel@ffwll.ch>" --to "Bjorn Helgaas <bhelgaas@google.com>" --cc 
"linux-kernel@vger.kernel.org" --cc "etnaviv@lists.freedesktop.org" --cc 
"dri-devel@lists.freedesktop.org" --cc "loongson-kernel@lists.loongnix.cn"


After run the above about command with my company's mailbox,  the 
termial report  "Too many commands"

which cause the last few patch of the whole patch set did not get send 
out(get lost).


Then,  I changed to another mail to send the patch with the same 
command, then its works finally.

Please don't get angry by me. Thanks.


On 2023/6/3 18:59, Sui Jingfeng wrote:
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
> Sui Jingfeng (7):
>    drm/etnaviv: add a dedicated function to register an irq handler
>    drm/etnaviv: add a dedicated function to get various clocks
>    drm/etnaviv: add dedicated functions to create and destroy platform
>      devices
>    drm/etnaviv: add helpers for private data construction and destruction
>    drm/etnaviv: allow bypass component framework
>    drm/etnaviv: add driver support for the PCI devices
>    drm/etnaviv: add support for the dma coherent device
>
>   drivers/gpu/drm/etnaviv/Kconfig             |   9 +
>   drivers/gpu/drm/etnaviv/Makefile            |   2 +
>   drivers/gpu/drm/etnaviv/etnaviv_drv.c       | 228 +++++++++++++++-----
>   drivers/gpu/drm/etnaviv/etnaviv_drv.h       |  10 +
>   drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  22 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |   7 +-
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.c       | 170 ++++++++++-----
>   drivers/gpu/drm/etnaviv/etnaviv_gpu.h       |   9 +
>   drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c   |  75 +++++++
>   drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h   |   9 +
>   include/uapi/drm/etnaviv_drm.h              |   1 +
>   11 files changed, 422 insertions(+), 120 deletions(-)
>   create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.c
>   create mode 100644 drivers/gpu/drm/etnaviv/etnaviv_pci_drv.h
>
-- 
Jingfeng

