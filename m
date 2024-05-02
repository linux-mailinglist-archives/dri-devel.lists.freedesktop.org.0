Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8834A8BA31E
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 00:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674791126F2;
	Thu,  2 May 2024 22:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="NhCrLKdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id 90BBF1126F6;
 Thu,  2 May 2024 22:26:38 +0000 (UTC)
Received: from [100.64.232.195] (unknown [20.29.225.195])
 by linux.microsoft.com (Postfix) with ESMTPSA id 518C5206B4FD;
 Thu,  2 May 2024 15:26:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 518C5206B4FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1714688797;
 bh=NzMrFwSnELsNTouka86zwY4xBu0HDKLPheXHNRlf/UY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NhCrLKdI/ZqOMxIi0x/9IcKVE1fu8SJgV6IOu9yOzA4/X9AoPavE5e5S65Ugw3uBC
 sulaSRBperkkDcIDt2jCnwInTZEDOTYmaUAyGGeCvlgfS23LBxyBkoeXTUrIdi6qwD
 4F+b4DUgYEKEoHW556opdVdEoci1DJoGsON85j90=
Message-ID: <076e0a0d-ad26-490e-9784-300ed52637ca@linux.microsoft.com>
Date: Thu, 2 May 2024 15:26:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 12/12] fbdev/viafb: Make I2C terminology more inclusive
To: Thomas Zimmermann <tzimmermann@suse.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Helge Deller <deller@gmx.de>,
 "open list:VIA UNICHROME(PRO)/CHROME9 FRAMEBUFFER DRIVER"
 <linux-fbdev@vger.kernel.org>,
 "open list:FRAMEBUFFER LAYER" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-gfx@lists.freedesktop.org>,
 "open list:INTEL DRM DISPLAY FOR XE AND I915 DRIVERS"
 <intel-xe@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
 "open list:BTTV VIDEO4LINUX DRIVER" <linux-media@vger.kernel.org>
References: <20240430173812.1423757-1-eahariha@linux.microsoft.com>
 <20240430173812.1423757-13-eahariha@linux.microsoft.com>
 <271ad513-0ea1-45df-ba0f-51582474ff34@suse.de>
Content-Language: en-CA
From: Easwar Hariharan <eahariha@linux.microsoft.com>
In-Reply-To: <271ad513-0ea1-45df-ba0f-51582474ff34@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 5/2/2024 3:46 AM, Thomas Zimmermann wrote:
> 
> 
> Am 30.04.24 um 19:38 schrieb Easwar Hariharan:
>> I2C v7, SMBus 3.2, and I3C 1.1.1 specifications have replaced "master/slave"
>> with more appropriate terms. Inspired by and following on to Wolfram's
>> series to fix drivers/i2c/[1], fix the terminology for users of
>> I2C_ALGOBIT bitbanging interface, now that the approved verbiage exists
>> in the specification.
>>
>> Compile tested, no functionality changes intended
>>
>> [1]: https://lore.kernel.org/all/20240322132619.6389-1-wsa+renesas@sang-engineering.com/
>>
>> Signed-off-by: Easwar Hariharan <eahariha@linux.microsoft.com>
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 

Thanks for the ack! I had been addressing feedback as I got it on the v0 series, and it seems
I missed out on updating viafb and smscufx to spec-compliant controller/target terminology like
the v0->v1 changelog calls out before posting v1.

For smscufx, I feel phrasing the following line (as an example)

> -/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, host, 
> +/* sets up I2C Controller for 100 Kbps, std. speed, 7-bit addr, *controller*, 

would actually impact readability negatively, so I propose to leave smscufx as is.

For viafb, I propose making it compliant with the spec using the controller/target terminology and
posting a v2 respin (which I can send out as soon as you say) and ask you to review again.

What do you think?

Thanks,
Easwar

>> ---
>>   drivers/video/fbdev/via/chip.h    |  8 ++++----
>>   drivers/video/fbdev/via/dvi.c     | 24 ++++++++++++------------
>>   drivers/video/fbdev/via/lcd.c     |  6 +++---
>>   drivers/video/fbdev/via/via_aux.h |  2 +-
>>   drivers/video/fbdev/via/via_i2c.c | 12 ++++++------
>>   drivers/video/fbdev/via/vt1636.c  |  6 +++---
>>   6 files changed, 29 insertions(+), 29 deletions(-)
>>

<snip>
