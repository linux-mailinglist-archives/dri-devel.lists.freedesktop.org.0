Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8FFC70861
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 18:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7282B10E1EC;
	Wed, 19 Nov 2025 17:49:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="TrA8ZFro";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0109210E1EC
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 17:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1763574564;
 bh=0pCFD5KvzUtit4qot1VdPXe6ibLJK2CITkuwqA5TScg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=TrA8ZFroebQvyS5jU9CL/zRGJhsEpJo8D4mLi2orYcd3pgwklhxlmTC+IyC7Y8sJ0
 3FGQ1lfHcOg9+mFQT8Ty4/GEsAQSk9Pdi4llNmPp7nFd/y1RsiJLYFyetKugjJVh8W
 WOf7oKthWTrw7Uh9Q33s9BG/An5JOo9inkqcvRP4tGC1+qPXVrYG4BJ/qTDzt5/h+m
 NRFBPNTJEHMeZGwzYNgQc+C4h4+YlLqZF5X4ygz3L37hqoTnNhgFrnTrSMpEfXB32Y
 RxmZ33hDjpTksYZd4go/C4sRALybMV5mCH5t8/6298ffbhMNfYGPp5fV3A+5yoiQwK
 b8bxS41uNLgSA==
Received: from [192.168.1.90] (unknown [82.79.138.145])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C85FB17E0FFA;
 Wed, 19 Nov 2025 18:49:23 +0100 (CET)
Message-ID: <485c4a78-c20b-492a-8c27-07ef63323735@collabora.com>
Date: Wed, 19 Nov 2025 19:49:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] drm/bridge: dw-hdmi-qp: Add support for missing HPD
To: Chris Morgan <macromorgan@hotmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: Chris Morgan <macroalpha82@gmail.com>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 conor+dt@kernel.org, rfoss@kernel.org, tzimmermann@suse.de, jonas@kwiboo.se,
 neil.armstrong@linaro.org, heiko@sntech.de, sebastian.reichel@collabora.com,
 jernej.skrabec@gmail.com, dri-devel@lists.freedesktop.org,
 andrzej.hajda@intel.com, andy.yan@rock-chips.com, krzk+dt@kernel.org,
 robh@kernel.org, Laurent.pinchart@ideasonboard.com
References: <20251113192939.30031-1-macroalpha82@gmail.com>
 <20251113192939.30031-3-macroalpha82@gmail.com>
 <avdnpwnxs6cql7eyckdt37szpcf5ztgxlc7juwu6tqj5xxu56a@nrwljig2p67i>
 <SN6PR1901MB46548ED8D4BA1184E0EA7DC3A5D6A@SN6PR1901MB4654.namprd19.prod.outlook.com>
 <hgwfztkwk4qgvefwo2cdedzas3rzlhx6yek6dgldkgaq2jskvw@exxqujjpa6bl>
 <SN6PR1901MB46542ED12EF34220E3119460A5D7A@SN6PR1901MB4654.namprd19.prod.outlook.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <SN6PR1901MB46542ED12EF34220E3119460A5D7A@SN6PR1901MB4654.namprd19.prod.outlook.com>
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

On 11/19/25 6:24 PM, Chris Morgan wrote:
> On Wed, Nov 19, 2025 at 10:02:23AM +0100, Maxime Ripard wrote:
>> On Tue, Nov 18, 2025 at 02:36:09PM -0600, Chris Morgan wrote:
>>> On Tue, Nov 18, 2025 at 09:46:04AM +0100, Maxime Ripard wrote:
>>>> Hi,
>>>>
>>>> On Thu, Nov 13, 2025 at 01:29:38PM -0600, Chris Morgan wrote:
>>>>> From: Chris Morgan <macromorgan@hotmail.com>
>>>>>
>>>>> Add support for the dw-hdmi-qp driver to handle devices with missing
>>>>> HPD pins.
>>>>>
>>>>> Since in this situation we are now polling for the EDID data via i2c
>>>>> change the error message to a debug message when we are unable to
>>>>> complete an i2c read, as a disconnected device would otherwise fill
>>>>> dmesg with i2c read errors.
>>>>>
>>>>> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>>>>
>>>> You must also disable any mode using the scrambler when there's no
>>>> hotplug interrupt available.
>>>
>>> Is there a simple way to do that? I'm not seeing any references to
>>> scrambling in the current driver.
>>>
>>> Should I just limit the rate to HDMI14_MAX_TMDSCLK (340000000)  under
>>> dw_hdmi_qp_bridge_tmds_char_rate_valid() if using EDID polling? A
>>> document I found online from Synopsys [1] claims that scrambling is
>>> used by default at rates above 340 (if I'm reading it right) and used
>>> opportunistically at rates below 340.
>>
>> Yep, that's what you should be testing for :)
>>
>> Maxime
> 
> Thanks, though now that I dig into it I'm a bit more confused on the
> best way forward. It looks like for today the driver is hard-limited
> to HDMI14_MAX_TMDSCLK because scrambling isn't supported. I'm assuming
> it will be at some point, suggesting that we *will* need this in the
> future. Is it sufficient to just add a comment there noting we need
> to check, or should I add a check there (that does nothing today)
> to ensure when we do support faster rates we are ready?

I plan to work on upstreaming the scrambling support soon.  Adding a TODO
comment would be enough for me to take care of the rest, but I'll still need
your help to get that tested, though. :-)

Cristian
