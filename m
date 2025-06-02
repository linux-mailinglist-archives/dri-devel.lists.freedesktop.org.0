Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0101ACBB51
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 21:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1914110E57A;
	Mon,  2 Jun 2025 19:05:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SheC2g+u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 436AC10E57A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 19:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1748891133;
 bh=0NYtTbP1HSWkGbnvo38VTx4WuMvckK9ozNXBRY28QmQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SheC2g+uVRrbErzrTXgZVudJ7skP9s4+9W/pQWgQwgS2IFPJUihNDTte+Bu4TtK4R
 rX6HNYgFKpUMxrxLnXfJxxJ0buy01z0Z0Y9NWl7UbAFnFTwcILOPPBxRJ2plvWfm8c
 bCBe/Pc2cwIbV21I+8kOW9e1WFeaFRCAVd8KYUy2UhKYvXXxppreMkd8iZeu/M90iy
 IKgeLDBH0F4X8PNxSW3v1jsT+/NnxQKQlTi/aYlj0Xe+ZCjLClfkOfUnnFv9qt6BJ4
 GohKVqOA6UI+nWW8PJXpbK2S4J2ZVN0IAo5Qc1Tektolv+CncW5wdY2jRX1iDdCA9B
 wQTTwdPW/cCLg==
Received: from [192.168.1.90] (unknown [188.24.155.2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0E45D17E0FD4;
 Mon,  2 Jun 2025 21:05:33 +0200 (CEST)
Message-ID: <2ab7d13d-1d2e-40e2-ad91-d310fdbba0c0@collabora.com>
Date: Mon, 2 Jun 2025 22:05:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/19] drm/connector: hdmi: Allow using the YUV420
 output format
To: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>
References: <20250527-hdmi-conn-yuv-v5-0-74c9c4a8ac0c@collabora.com>
 <174885511345.447765.15117962049678380491.b4-ty@kernel.org>
 <20250602-invisible-goose-of-triumph-ad6e5e@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250602-invisible-goose-of-triumph-ad6e5e@houat>
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

On 6/2/25 12:09 PM, Maxime Ripard wrote:
> On Mon, Jun 02, 2025 at 11:05:16AM +0200, Maxime Ripard wrote:
>> On Tue, 27 May 2025 15:11:08 +0300, Cristian Ciocaltea wrote:
>>> Provide the basic support to enable using YUV420 as an RGB fallback when
>>> computing the best output format and color depth.
>>>
>>>
>>
>> Applied to misc/kernel.git (drm-misc-next).
> 
> Also, thanks for your persistence on this, I'm glad to see this queued up :)

Awesome, thank you as well for your support!

As previously discussed, I'll prepare another series for the general EDEADLK
handling and probably a few more (unrelated) items I had on my TODOs list.

Cristian
