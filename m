Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CCA73A1DE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 15:32:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A1E510E561;
	Thu, 22 Jun 2023 13:32:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1067D10E561
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 13:32:50 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8AxiMV_TZRkZXEAAA--.774S3;
 Thu, 22 Jun 2023 21:32:48 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Ax8uR+TZRkpSMCAA--.11808S3; 
 Thu, 22 Jun 2023 21:32:46 +0800 (CST)
Message-ID: <d508d47f-87ae-6c51-debf-88a0292b99c8@loongson.cn>
Date: Thu, 22 Jun 2023 21:32:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/mgag200: Fix a warning reported by Fi.CI.SPARSE
To: Jocelyn Falempe <jfalempe@redhat.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Tom Rix <trix@redhat.com>
References: <20230621191139.2291139-1-suijingfeng@loongson.cn>
 <8e7011fe-6757-e89f-c3c5-d5f87cf83766@redhat.com>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <8e7011fe-6757-e89f-c3c5-d5f87cf83766@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Ax8uR+TZRkpSMCAA--.11808S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
 ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
 BjDU0xBIdaVrnRJUUUBEb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
 xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r106r15M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
 j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxV
 AFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x02
 67AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
 ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
 87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0Sjx
 kI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxAqzxv262kKe7AKxVWUXVWUAwCFx2Iq
 xVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r
 18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vI
 r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
 1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4UJVWxJr1lIxAI
 cVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jbVyxUUUUU=
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Ah,  I forgot to check that before send a patch, sorry for the noise  :-)


On 2023/6/22 20:35, Jocelyn Falempe wrote:
> This patch was already sent by Tom Rix last month:
> https://patchwork.freedesktop.org/series/117881/
>
> I can push it to drm-misc-next, if Thomas is ok.
>
That sounds fine.

> Best regards,
>
-- 
Jingfeng

