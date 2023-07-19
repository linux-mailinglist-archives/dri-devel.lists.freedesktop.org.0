Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E8759F6C
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 22:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D51DB10E2DF;
	Wed, 19 Jul 2023 20:16:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7DAC210E2DF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 20:16:35 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8Cx2eqiRLhk0WsHAA--.13817S3;
 Thu, 20 Jul 2023 04:16:34 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dx_yOiRLhkcAs1AA--.39777S3; 
 Thu, 20 Jul 2023 04:16:34 +0800 (CST)
Message-ID: <042abb3d-8963-9c90-ccc5-59c42332f22d@loongson.cn>
Date: Thu, 20 Jul 2023 04:16:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 2/6] PCI/VGA: Deal with PCI VGA compatible devices only
Content-Language: en-US
To: Sui Jingfeng <sui.jingfeng@linux.dev>, Bjorn Helgaas <helgaas@kernel.org>
References: <20230719182617.GA509912@bhelgaas>
 <9a1590bd-5dfc-94ad-645e-a0a499ae5b23@linux.dev>
From: suijingfeng <suijingfeng@loongson.cn>
In-Reply-To: <9a1590bd-5dfc-94ad-645e-a0a499ae5b23@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8Dx_yOiRLhkcAs1AA--.39777S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
 BjDU0xBIdaVrnRJUUUPEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
 xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
 j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
 AFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAF
 wI0_Gr0_Gr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
 1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
 67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0VAS07
 AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCF54CYxVAaw2AFwI0_JF0_Jw1l4c8EcI0Ec7Cj
 xVAaw2AFwI0_JF0_Jw1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_GFv_Wr
 ylx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Xr0_Ar1lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
 87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
 IFyTuYvjxUcCD7UUUUU
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2023/7/20 03:58, Sui Jingfeng wrote:
> On the other hand, even though the lest significant 8 but if 
> pdev->class is really matter.


If the low eight bits of pdev->class is really matters,

maybe we should wait the potential problems became severe.

Currently, it is not obvious.

