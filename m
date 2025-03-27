Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABC3A72AEE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 08:59:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6238D10E2BA;
	Thu, 27 Mar 2025 07:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C326510E2BA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 07:59:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AB5F961144;
 Thu, 27 Mar 2025 07:59:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B60C4CEDD;
 Thu, 27 Mar 2025 07:59:46 +0000 (UTC)
Message-ID: <984e749e-e5d3-4985-aadc-703b803424f8@xs4all.nl>
Date: Thu, 27 Mar 2025 08:59:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Mar 26 (drivers/media/cec/i2c/tda9950)
To: Randy Dunlap <rdunlap@infradead.org>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-media@vger.kernel.org, Russell King <rmk+kernel@armlinux.org.uk>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20250326165619.58d443f8@canb.auug.org.au>
 <870f6a20-7edc-4115-a700-11c886f181cf@infradead.org>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <870f6a20-7edc-4115-a700-11c886f181cf@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 27/03/2025 01:22, Randy Dunlap wrote:
> 
> 
> On 3/25/25 10:56 PM, Stephen Rothwell wrote:
>> Hi all,
>>
>> Changes since 20250325:
>>
> 
> on x86_64, when CONFIG_I2C=m and
> CONFIG_CEC_NXP_TDA9950=y:
> 
> ld: vmlinux.o: in function `tda9950_write_range':
> tda9950.c:(.text+0x1225126): undefined reference to `i2c_transfer'
> ld: vmlinux.o: in function `tda9950_read':
> tda9950.c:(.text+0x122553f): undefined reference to `i2c_transfer'
> ld: vmlinux.o: in function `tda9950_irq':
> tda9950.c:(.text+0x122573e): undefined reference to `i2c_transfer'
> ld: vmlinux.o: in function `tda9950_driver_init':
> tda9950.c:(.init.text+0x726a3): undefined reference to `i2c_register_driver'
> ld: vmlinux.o: in function `tda9950_driver_exit':
> tda9950.c:(.exit.text+0x54fc): undefined reference to `i2c_del_driver'
> 
> 

Dmitry, two patches were posted fixing this (both effectively identical):

https://patchwork.linuxtv.org/project/linux-media/patch/20250227140301.3062217-1-arnd@kernel.org/
https://patchwork.linuxtv.org/project/linux-media/patch/20250322024914.3622546-1-yuehaibing@huawei.com/

I suspect neither of these was picked up by the drm folks? Since the move of this tda9950
driver from the drm subsystem to the media subsystem went through the drm tree, I can't apply the fix.

Once rc1 is released I can take care of it myself, since then it is part of the media subsystem.

Regards,

	Hans
