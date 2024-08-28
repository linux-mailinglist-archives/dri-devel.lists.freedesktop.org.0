Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FB2962C8D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0510810E35B;
	Wed, 28 Aug 2024 15:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=uniontech.com header.i=@uniontech.com header.b="Yj45Lnl+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 16676 seconds by postgrey-1.36 at gabe;
 Wed, 28 Aug 2024 15:38:50 UTC
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C42F10E35B;
 Wed, 28 Aug 2024 15:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
 s=onoh2408; t=1724859514;
 bh=oVnFuXZSAxbQ3NtiLiMpquUs3FMfEmgMHUpg/XfODWg=;
 h=Message-ID:Date:MIME-Version:Subject:To:From;
 b=Yj45Lnl+kTK3NV+uWm88Y1pkN9bL46RCe4RBqZrz8hdqVp0RreO8Ym2zd61Pi9uDT
 nfGmyNVsjRBwCOobL9hDIhhMleQjj0HuWzMlsBsANDYPjkjGMuAy0bZTDMhHqWnHg6
 RiIUm2XWm5Z6ZW/9V0tipTnx9i8+nvrPdTMZU4iY=
X-QQ-mid: bizesmtp81t1724859480t6l336za
X-QQ-Originating-IP: 0HJh7Yo1Jx8Lr3Nkdfttu+na0dkmiIavMKazTlQ2IrU=
Received: from [10.20.53.89] ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 28 Aug 2024 23:37:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1561753365197894062
Message-ID: <23CC94B2018EE36C+e1d82597-6adf-4bcf-8e63-df788eb81bd0@uniontech.com>
Date: Wed, 28 Aug 2024 23:37:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] amdgpu: disable amdgpu_dpm on THTF-SW831-1W-DS25_MB board
To: Mario Limonciello <mario.limonciello@amd.com>, alexander.deucher@amd.com, 
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, lijo.lazar@amd.com, le.ma@amd.com, Jun.Ma2@amd.com,
 hamza.mahfooz@amd.com, andrealmeid@igalia.com, wenlunpeng@uniontech.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, guanwentao@uniontech.com, zhanjun@uniontech.com
References: <3EA7C2B9E8C4D00A+20240828105938.37674-1-wangyuli@uniontech.com>
 <e3122e5c-a6dd-4228-84ab-04747a3df265@amd.com>
From: WangYuli <wangyuli@uniontech.com>
Autocrypt: addr=wangyuli@uniontech.com; keydata=
 xjMEZoEsiBYJKwYBBAHaRw8BAQdAyDPzcbPnchbIhweThfNK1tg1imM+5kgDBJSKP+nX39DN
 IVdhbmdZdWxpIDx3YW5neXVsaUB1bmlvbnRlY2guY29tPsKJBBMWCAAxFiEEa1GMzYeuKPkg
 qDuvxdofMEb0C+4FAmaBLIgCGwMECwkIBwUVCAkKCwUWAgMBAAAKCRDF2h8wRvQL7g0UAQCH
 3mrGM0HzOaARhBeA/Q3AIVfhS010a0MZmPTRGVfPbwD/SrncJwwPAL4GiLPEC4XssV6FPUAY
 0rA68eNNI9cJLArOOARmgSyJEgorBgEEAZdVAQUBAQdA88W4CTLDD9fKwW9PB5yurCNdWNS7
 VTL0dvPDofBTjFYDAQgHwngEGBYIACAWIQRrUYzNh64o+SCoO6/F2h8wRvQL7gUCZoEsiQIb
 DAAKCRDF2h8wRvQL7sKvAP4mBvm7Zn1OUjFViwkma8IGRGosXAvMUFyOHVcl1RTgFQEAuJkU
 o9ERi7qS/hbUdUgtitI89efbY0TVetgDsyeQiwU=
In-Reply-To: <e3122e5c-a6dd-4228-84ab-04747a3df265@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
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


On 2024/8/28 23:19, Mario Limonciello wrote:
> This is production hardware?

Unfortunately, this device was released quite a while back.
>
> Have you already checked whether a BIOS upgrade for the device could 
> help this issue?


Sadly, there's no BIOS update to address this problem. It seems to be a 
persistent issue across all BIOS versions for this motherboard.

>
> Just to clarify did you guys co-work on this patch, or are you 
> submitting on behalf of wenlunpeng?  It right now shows up as you 
> submitting on behalf of wenlunpeng.  If you co-worked on it you should 
> also use a Co-Developed-by tag.


No, the entirety of this bugfix is attributable to wenlunpeng.

>
> As this is suspected to be a BIOS issue, I would like to better 
> understand if the BIOS upgrade fixes it.  If it does but you would 
> still like a quirk for the system it should include the BIOS version 
> here.
>
>
Unfortunately again. There's not much we as kernel developers can do 
when devices behave unpredictably.

-- 

*WangYuli
*


