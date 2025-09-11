Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF41B53E1F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 23:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6352A10EB95;
	Thu, 11 Sep 2025 21:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="qt75zUel";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFB4F10E12D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 16:28:29 +0000 (UTC)
Received: from [100.79.161.103] (unknown [4.194.122.162])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9C6502114256;
 Thu, 11 Sep 2025 09:28:25 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9C6502114256
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1757608108;
 bh=quIaHEoArFCMUcQf+paMTNKIBoUq+EvYzrp1oocNIy4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=qt75zUelG7lsCEsZuinBBzU/XjSbc2hjtJXC0bASVLC2SeAfKjEXkckmOh9I9nx7D
 bGeb6XMLfSa/RYpaUmmTSmvUXzQVzXtlPjjMOVMpWhJKLqRFmeZKIRO/nDrLWTDNYI
 vgK/hrRZkO68GWeo8oacIcmC1IIBTR22l+y41yE4=
Message-ID: <ccc6011c-d1bb-48b1-bf35-6fea1b1e8a49@linux.microsoft.com>
Date: Thu, 11 Sep 2025 21:58:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 1/3] fbdev: hyperv_fb: Remove hyperv_fb driver
To: Michael Kelley <mhklinux@outlook.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, "deller@gmx.de" <deller@gmx.de>,
 "arnd@arndb.de" <arnd@arndb.de>, "soci@c64.rulez.org" <soci@c64.rulez.org>,
 "gonzalo.silvalde@gmail.com" <gonzalo.silvalde@gmail.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <E2D7F2119CB4>
 <1757437112-2509-1-git-send-email-ptsm@linux.microsoft.com>
 <8a958fe8-fbba-4bd6-a79d-fd310f08f8d7@suse.de>
 <SN6PR02MB415755A10BD2C9D0E7F847FCD40EA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <SN6PR02MB415755A10BD2C9D0E7F847FCD40EA@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=1.7 tests=ALL_TRUSTED,BAYES_00,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,URIBL_DBL_BLOCKED_OPENDNS,
 URIBL_ZEN_BLOCKED_OPENDNS autolearn=ham autolearn_force=no version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net
X-Mailman-Approved-At: Thu, 11 Sep 2025 21:52:23 +0000
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

Hi Michael,

On 10-09-2025 20:55, Michael Kelley wrote:
> From: Thomas Zimmermann <tzimmermann@suse.de> Sent: Wednesday, September 10, 2025 2:36 AM
>>
>> Hi
>>
>> Am 09.09.25 um 18:58 schrieb Prasanna Kumar T S M:
>>> The Hyper-V DRM driver is available since kernel version 5.14 and
>>> provides full KMS support along with fbdev emulation via the DRM fbdev
>>> helpers. This makes the hyperv_fb driver redundant, remove it.
>>
>> I'm all for removing obsolete drivers. But hyperv_drm likely first needs
>> to merge the patch at
>> https://lore.kernel.org/dri-devel/20250904145806.430568-5-tzimmermann@suse.de/
>> It's been tested and works well. If maintainers from Microsoft have a
>> look at the patch first, we could possibly land it fairly soon.
> 
> Thomas --
> 
> My testing of your v3 patch series for vblank timers ended up getting a
> WARN_ON after about 3 days of usage. See [1]. So I don't think it's 100%
> ready yet.
> 
> But I agree we need your synthetic vblank timer support to address the
> Hyper-V DRM driver performance issue, before removing the Hyper-V
> fbdev driver. (See [2] for a description of the performance issue.)
> 
> Second, isn't it customary to mark a driver as deprecated for a period
> of time, before removing it entirely? I don't see any documentation
> on the deprecation process, but I've seen it done in other cases. If you
> grep through all the kernel Kconfig files, you'll see entries tagged with
> DEPRECATED. Also the driver should be updated to output a deprecated
> message when it loads.

Is deprecating the driver a mandatory step?

> Michael
> 
> [1] https://lore.kernel.org/dri-devel/BN7PR02MB4148E80C13605F6EAD2B0A03D40FA@BN7PR02MB4148.namprd02.prod.outlook.com/
> [2] https://lore.kernel.org/dri-devel/SN6PR02MB415702B00D6D52B0EE962C98D46CA@SN6PR02MB4157.namprd02.prod.outlook.com/
> 
>>
>> Best regards
>> Thomas
>>
>>>
>>> Signed-off-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
>>> ---
>>>    MAINTAINERS                     |    1 -
>>>    drivers/video/fbdev/Kconfig     |    8 -
>>>    drivers/video/fbdev/Makefile    |    1 -
>>>    drivers/video/fbdev/hyperv_fb.c | 1386 -------------------------------
>>>    4 files changed, 1396 deletions(-)
>>>    delete mode 100644 drivers/video/fbdev/hyperv_fb.c
>>>

