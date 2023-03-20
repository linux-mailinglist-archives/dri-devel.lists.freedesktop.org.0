Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAA26C1009
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 11:59:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F5F10E348;
	Mon, 20 Mar 2023 10:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from frasgout11.his.huawei.com (frasgout11.his.huawei.com
 [14.137.139.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC0B10E348
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 10:59:52 +0000 (UTC)
Received: from mail02.huawei.com (unknown [172.18.147.227])
 by frasgout11.his.huawei.com (SkyGuard) with ESMTP id 4PgBNT54T8z9xrt2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:50:49 +0800 (CST)
Received: from [10.48.148.162] (unknown [10.48.148.162])
 by APP1 (Coremail) with SMTP id LxC2BwDnbwuRPBhkLjq0AQ--.48194S2;
 Mon, 20 Mar 2023 11:59:37 +0100 (CET)
Message-ID: <20c0416b-90f7-7fa3-5f32-a44400817f4d@huaweicloud.com>
Date: Mon, 20 Mar 2023 11:59:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/prime: Fix documentation of
 drm_gem_prime_fd_to_handle()
To: Simon Ser <contact@emersion.fr>
References: <20230224120931.1024-1-petrtesarik@huaweicloud.com>
 <GLe6vWnaxm8W1VD0ltNz62HDAhn5b1rgraCJchuToDl-vb5m9gsGl2ml2xeTQfRwlWlTQXvqOUzYiSgz1GmOk76Jag5VR7Pzwm0iM-86igQ=@emersion.fr>
Content-Language: en-US
From: Petr Tesarik <petrtesarik@huaweicloud.com>
In-Reply-To: <GLe6vWnaxm8W1VD0ltNz62HDAhn5b1rgraCJchuToDl-vb5m9gsGl2ml2xeTQfRwlWlTQXvqOUzYiSgz1GmOk76Jag5VR7Pzwm0iM-86igQ=@emersion.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: LxC2BwDnbwuRPBhkLjq0AQ--.48194S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUY47kC6x804xWl14x267AKxVW8JVW5JwAF
 c2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII
 0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xv
 wVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjc
 xK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr
 0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY
 04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0D
 MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvf
 C2KfnxnUUI43ZEXa7IU1zuWJUUUUU==
X-CM-SenderInfo: hshw23xhvd2x3n6k3tpzhluzxrxghudrp/
X-CFilter-Loop: Reflected
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, petr@tesarici.cz,
 roberto.sassu@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2/25/2023 12:08 PM, Simon Ser wrote:
> Reviewed-by: Simon Ser <contact@emersion.fr>

Hi Simon,

so how about taking this one? I can't see it in git yet (but maybe I'm looking at the wrong branch).

Petr T


