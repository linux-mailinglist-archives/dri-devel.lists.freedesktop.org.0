Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4810CFF37B
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 18:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B8B10E13A;
	Wed,  7 Jan 2026 17:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="jnhuDG/3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1141F10E13A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 17:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1767808498;
 bh=FskVu4bMK9X3YY1c0FaKoNF9nvaMiNegDxZbSfSbmrA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jnhuDG/3RzbHLW1cDYXDpDfODx6dx6Z0mYekdHtI7n6ljoYmOpR8UdCzieAdPOkqV
 tWZDw6yi12pV926Ako6rRlA2ep5ppnD6bKo99VWcrCjnGJzLlluGHtGGfu6puAuSrN
 FuPx33eXiiGxXNUiFRKJMVSbgJeTeEh0eDXgWlXK1jIGLP8IFJ7JL5VCT3YitdAXkJ
 j6LXSlvEblONUjRt6BQIOs/1qxupairXBfjIWNgpuuh9+pasqr5JkFkg7H/HILq+Be
 JJN0+7rpNy5fmD1jghz1i8dnQrE/fL7tShPWd+RO3kf0wcoVkWRjU9XFMS1v7wo17H
 R4FYG+jdDqdvA==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F0CC17E13F6;
 Wed,  7 Jan 2026 18:54:57 +0100 (CET)
Message-ID: <0cce5e09-1947-46b4-8ffc-1aa880accc9a@collabora.com>
Date: Wed, 7 Jan 2026 19:54:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/4] Introduce BACKGROUND_COLOR DRM CRTC property
To: Diederik de Haas <diederik@cknow-tech.com>,
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
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
 <DFICN8TKUFBH.1V8WHTIQ5BE2J@cknow-tech.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <DFICN8TKUFBH.1V8WHTIQ5BE2J@cknow-tech.com>
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

Hi Diederik,

On 1/7/26 2:18 PM, Diederik de Haas wrote:
> Hi,
> 
> On Tue Nov 18, 2025 at 12:51 AM CET, Cristian Ciocaltea wrote:
>> Some display controllers can be hardware-configured to present non-black
>> colors for pixels which are not covered by any plane (or are exposed
>> through transparent regions of higher planes).
>> ...
>> The subsequent patches add background color support to VKMS and the VOP2
>> display controller used in the RK3568, RK3576, and RK3588 Rockchip SoC
>> families.
> 
> Cristian provided a helper script which would show a test pattern and
> then iterate through setting Red, Green, Blue background color and then
> set it back to the original value.
> 
> I first tested this on a Rock 5B (RK3588).
> Without this patch set, the background color was Black with every
> iteration. But with this patch set, I did see a Red, Green and Blue
> background color, after which it was set back to Black.
> 
> diederik@rock5b:~$ grep -E "^Changing prop|^Read BACKGROUND_COLOR" bgcol-test-bash-user.log
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
> Changing prop value to: 0xffff00000000ffff
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
> Changing prop value to 0xffffffff00000000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffffffff00000000
> Changing prop value to 0xffff0000ffff0000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff0000ffff0000
> Changing prop value to 0xffff00000000ffff
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
> Changing prop value to: 0xffff000000000000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
> 
> I then did the same test on a Quartz64-B (RK3566) and that too showed a
> Red, Green and Blue background color and then was set back to Black.
> 
> diederik@quartz64b:~$ grep -E "^Changing prop|^Read BACKGROUND_COLOR" bgcol-test-bash-user-q64b.log
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
> Changing prop value to: 0xffff00000000ffff
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
> Changing prop value to 0xffffffff00000000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffffffff00000000
> Changing prop value to 0xffff0000ffff0000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff0000ffff0000
> Changing prop value to 0xffff00000000ffff
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff00000000ffff
> Changing prop value to: 0xffff000000000000
> Read BACKGROUND_COLOR prop (ARGB64): 0xffff000000000000
> 
> So this patch set does what it is supposed to do, so feel free to add:
> 
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>

Thanks for taking the time to test this!

Please note there's a newer revision of the series:

https://lore.kernel.org/all/20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com/

Regards,
Cristian
