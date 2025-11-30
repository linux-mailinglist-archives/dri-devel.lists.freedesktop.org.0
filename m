Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B52C94AFA
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 04:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24F810E247;
	Sun, 30 Nov 2025 03:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="bH/DhNXZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155110.qiye.163.com (mail-m155110.qiye.163.com
 [101.71.155.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195E110E247
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 03:01:48 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2b6289cd3;
 Sun, 30 Nov 2025 11:01:44 +0800 (GMT+08:00)
Message-ID: <292ed476-2b5a-4b61-97e5-3b8d8a24c324@rock-chips.com>
Date: Sun, 30 Nov 2025 11:01:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
 <20251118-rk3588-bgcolor-v3-4-a2cc909428ea@collabora.com>
 <0ed71b8d-5a2e-4213-bd2f-7ba317d1e4cb@rock-chips.com>
 <4a6443b8-d440-4921-8a43-7c20e4e265e7@collabora.com>
 <b8819463-cc61-432f-b451-db90e3b43884@rock-chips.com>
 <058027df-1b1b-4c46-b8e1-ec53fc809e82@collabora.com>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <058027df-1b1b-4c46-b8e1-ec53fc809e82@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9ad2b589cb03abkunm5eeeb88f8ed4b9
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQhhCGFZIGhoZHk5IGUxJS0tWFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=bH/DhNXZCVB1zKfiCE5dEAYOh7uxtj5ddQ6V4/zaMqiqir/IW+gdaMZh6nW7aqjG/6xmGCvE2YU+2nIotPNCJCa1Ht1KhfqZOJjg3yAQZfQ4OXYOGjiYXLOontJO1/bsw9UI3ZZ2TEQAVMjsmXLMyflFtAQU3vihIOip6TrbuSY=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=HW1WlL6Uj6bnxN8ctCilm30KNiqpcPz8FkdMjNtQbFI=;
 h=date:mime-version:subject:message-id:from;
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

On 11/29/2025 5:50 PM, Cristian Ciocaltea wrote:
> Hi Chaoyi,
> 
> On 11/29/25 5:49 AM, Chaoyi Chen wrote:
>> Hello Cristian, 
>>
>> On 11/28/2025 5:44 PM, Cristian Ciocaltea wrote:
>>> The precision was something I initially looked into for CRC verification, in the
>>> context of the related IGT test.  But since I've added the VKMS support, I think
>>> we should not worry about that anymore. 
>>>
>>> Moreover, as already pointed out in [1], only RK3576 supports CRC generation at
>>> display controller level, and that is not particularly useful because it doesn't
>>
>> I believe you can get the CRTC CRC on the RK3576, even when only the 
>> background is visible and all plane is disabled. Feel free to let me
>> know if you run into any issues :)
> 
> Yes, CRTC CRC works on RK3576 for the planes, but not for the background, i.e.
> the CRC is not updated when setting a different background color.  Unless
> there's a way to change this default behavior, which I'm not aware of. 
> 
> My current understanding is that the background color is applied at a later
> stage in the display pipeline, *after* blending the planes and computing CRC.
> 

Which CRTC are you using? If you're using VP0, you might run into this
problem. Please try VP1 instead.

>>> take the background color into account.  Therefore I had to capture the frame
>>> CRCs at DisplayPort AUX channel level, by using the USB-C DP AltMode capable
>>
>> Oh that sounds interesting! I'm not sure how complex it would be to
>> implement.
> 
> That's already implemented, I plan to submit the patches soon.
> 
>>
>>> port of my RK3588-based board.  However, that solution is not yet available
>>> upstream, as it requires further work for cleanup and improving the overall
>>> USB-C reliability. 
>>>
>>> Hence I'll move on with your suggestion and switch to the simple bit-shifting
>>> approach for the next revision.
>>
> 
> 

-- 
Best, 
Chaoyi
