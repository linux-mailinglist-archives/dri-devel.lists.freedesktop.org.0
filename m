Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270DBB44DFA
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 08:32:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE46C10EB22;
	Fri,  5 Sep 2025 06:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="e6uAehnC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C73FF10EB22
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 06:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1757053958;
 bh=+7T7YDi0eC3wFyrqKUeCl1oFOAZDbzc81FLfZBDTU+k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=e6uAehnCU3Tqg7vgAX2kr5jkq6WsX55n8IXGAc6naznjJwO31ev0KLB4nHeIga/u6
 s/Tw5J83/aamEgYEr9O7VKjAh9gltJ1IcMeZg+n5z3jqlsy7T9p/xGZuDALzsm1Lx/
 sJRg5riQaNwg4JEWscp3bkG13Ema7go57AwL6s9VuebsvlpMUVs/I8bNGNY6LfCB6I
 mYumHDp7L+YBH46ak/A+NsEk8egyxk7fPwNMzKhNQDrNfBlrxcCay25FfBfxxY8Nw3
 W2Ygtj5WKMrphzQO4jV+7AH/Sg+9JSq6xklGpvL8DJkKetA8dF+7Zfzdh7azuq9Oxr
 2nUbBnORDUv9Q==
Received: from [192.168.1.90] (unknown [82.79.138.60])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 64EFA17E0EB8;
 Fri,  5 Sep 2025 08:32:37 +0200 (CEST)
Message-ID: <b8d068ef-d083-4bb1-b34e-b8ddaa62b436@collabora.com>
Date: Fri, 5 Sep 2025 09:32:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <ncmsmxdcvhj4jec6wmqf5abrb7nijx7ac2i33tvvcc2prljez3@uks2cb6aunnx>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <ncmsmxdcvhj4jec6wmqf5abrb7nijx7ac2i33tvvcc2prljez3@uks2cb6aunnx>
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

Hi Dmitry,

On 9/5/25 2:48 AM, Dmitry Baryshkov wrote:
> On Wed, Sep 03, 2025 at 09:50:58PM +0300, Cristian Ciocaltea wrote:
>> The first patch in the series implements the CEC capability of the
>> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
>> This is based on the downstream code, but rewritten on top of the CEC
>> helpers added recently to the DRM HDMI connector framework.
>>
>> The second patch is needed for RK3576 in order to fixup the timer base
>> setup according to the actual reference clock rate, which differs
>> slightly from RK3588.
>>
>> The following three patches setup platform data with the new information
>> expected by the HDMI QP transmitter library, while improving the error
>> handling in the probe path.
>>
>> Please note the CEC helpers were affected by a resource deallocation
>> issue which could crash the kernel and freeze the system under certain
>> test conditions.  This has been already fixed in v6.17-rc1 via commit
>> 19920ab98e17 ("drm/display: hdmi-cec-helper: Fix adapter
>> unregistration").
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> Cristian, I'm sorry for almost off-topic, but as you are working on this
> driver: would it be possible to support HDMI (vendor-specific) and SPD
> InfoFrames in the dw-hdmi-qp driver?

Sure, no worries.  I'll be on leave for the next two weeks, but I can handle
it on my return.

Regards,
Cristian
