Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A739C93778
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 04:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF8F10E00D;
	Sat, 29 Nov 2025 03:49:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="c6wopmKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m49209.qiye.163.com (mail-m49209.qiye.163.com
 [45.254.49.209])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752C710E00D
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Nov 2025 03:49:07 +0000 (UTC)
Received: from [172.16.12.51] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTP id 2b55618e9;
 Sat, 29 Nov 2025 11:49:04 +0800 (GMT+08:00)
Message-ID: <b8819463-cc61-432f-b451-db90e3b43884@rock-chips.com>
Date: Sat, 29 Nov 2025 11:49:02 +0800
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
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <4a6443b8-d440-4921-8a43-7c20e4e265e7@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-HM-Tid: 0a9acdba840603abkunm9c46392384a375
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUkYGVZLHUtMGENOHUMaQx5WFRQJFh
 oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
 hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=c6wopmKfyDolnWvTPbit1XwhT08o5Zv0zULgsSyfi3Dtja0iCKDqH/xnbF1hx6RFjSTJpTdEctw/YQHhePCcrQm3DKxTlc5yPAHJ4ctqKHwnrEfyUVuXlDxAW7ZadraHBa0nth1c8d++0Qk4IkaaHKrzQPiIXlP8mSNwPjdkqpc=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1; 
 bh=Rv0oPloj8Gtj1ksfFZ9mxS7fwxH945KByum30N5q1wA=;
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

Hello Cristian, 

On 11/28/2025 5:44 PM, Cristian Ciocaltea wrote:
> The precision was something I initially looked into for CRC verification, in the
> context of the related IGT test.  But since I've added the VKMS support, I think
> we should not worry about that anymore. 
> 
> Moreover, as already pointed out in [1], only RK3576 supports CRC generation at
> display controller level, and that is not particularly useful because it doesn't

I believe you can get the CRTC CRC on the RK3576, even when only the 
background is visible and all plane is disabled. Feel free to let me
know if you run into any issues :)

> take the background color into account.  Therefore I had to capture the frame
> CRCs at DisplayPort AUX channel level, by using the USB-C DP AltMode capable

Oh that sounds interesting! I'm not sure how complex it would be to
implement.

> port of my RK3588-based board.  However, that solution is not yet available
> upstream, as it requires further work for cleanup and improving the overall
> USB-C reliability. 
> 
> Hence I'll move on with your suggestion and switch to the simple bit-shifting
> approach for the next revision.

-- 
Best, 
Chaoyi
