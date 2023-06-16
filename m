Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38F1B733395
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 16:30:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7389810E641;
	Fri, 16 Jun 2023 14:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
 by gabe.freedesktop.org (Postfix) with ESMTP id EBC7C10E641
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 14:30:35 +0000 (UTC)
Received: from loongson.cn (unknown [10.20.42.43])
 by gateway (Coremail) with SMTP id _____8BxKuoKcoxktQEGAA--.12822S3;
 Fri, 16 Jun 2023 22:30:34 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxG8oJcoxk614dAA--.8835S3; 
 Fri, 16 Jun 2023 22:30:34 +0800 (CST)
Message-ID: <8cd7c335-5592-66b5-fda4-2744d9bca1cd@loongson.cn>
Date: Fri, 16 Jun 2023 22:30:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 00/14] drm/ast: Refactor the device-detection code
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-1-tzimmermann@suse.de>
Content-Language: en-US
From: Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <20230616140739.32042-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf8CxG8oJcoxk614dAA--.8835S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW7Ary3ZrW8uw47uF1rJFWkAFc_yoW8Kr4Dpa
 y5JaySyrs5J3y2qF4fGw45ZFyfJan3Jw40qrnaqw1S934jvw1v9rn5Ka15uasrGFyfAFyj
 vFyIqrWrGr1UA3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
 sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
 0xBIdaVrnRJUUUv2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
 IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
 e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
 0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
 xVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
 Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE
 14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1c
 AE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
 rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtw
 CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x02
 67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
 0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8w0
 eJUUUUU==
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/6/16 21:52, Thomas Zimmermann wrote:
> Ast's code for detecting the device type and features is convoluted.
> It mixes up several state fields, chip types and sub-models. Rework
> the driver into somehting more understandable.
"somehting" -> "something"
> Patches 1 fixes a long-standing bug. The affected code has never
> worked correctly.
>
> Patches 2 to 8 make various changes to the init code, or remove dead
> and duplicated code paths.
>
> Patch 9 introduces chip generations. Until now, ast used the value
> of enum ast_chip to represent a certain set of related modes, and
> also used the enum to represent individal models. This makes the
> driver code hard to understand in certain places. The patch encodes
> a chip generation in each model enum and converts the driver to use
> it.
>
> Patches 10 to 12 replace duplicated model checks with the correct
> enum value. Detection of wide-screen functionality and the transmitter
> chip can then be moved into individual functions in patch 13.
>
> Patch 14 merges the detection of the silicon revision and the chip
> model into s single function.
's' -> 'a'
>   Both need to be done in the same place
> and affect each other.
>
> Tested on AST1100 and AST2300.
>
> Thomas Zimmermann (14):
>    drm/ast: Fix DRAM init on AST2200
>    drm/ast: Remove vga2_clone field
>    drm/ast: Implement register helpers in ast_drv.h
>    drm/ast: Remove dead else branch in POST code
>    drm/ast: Remove device POSTing and config from chip detection
>    drm/ast: Set PCI config before accessing I/O registers
>    drm/ast: Enable and unlock device access early during init
>    drm/ast: Set up release action right after enabling MMIO
>    drm/ast: Distinguish among chip generations
>    drm/ast: Detect AST 1300 model
>    drm/ast: Detect AST 1400 model
>    drm/ast: Detect AST 2510 model
>    drm/ast: Move widescreen- and tx-chip detection into separate helpers
>    drm/ast: Merge config and chip detection
>
>   drivers/gpu/drm/ast/ast_dp501.c |   6 +-
>   drivers/gpu/drm/ast/ast_drv.h   |  97 +++++++---
>   drivers/gpu/drm/ast/ast_main.c  | 320 +++++++++++++++++++-------------
>   drivers/gpu/drm/ast/ast_mm.c    |   2 -
>   drivers/gpu/drm/ast/ast_mode.c  |  35 ++--
>   drivers/gpu/drm/ast/ast_post.c  |  74 ++------
>   6 files changed, 294 insertions(+), 240 deletions(-)
>
-- 
Jingfeng

