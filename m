Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B69255B022A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 12:56:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8167A10E579;
	Wed,  7 Sep 2022 10:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FE2110E579;
 Wed,  7 Sep 2022 10:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gfFBxOJICmmqA8f2KuQiBRQs6CbCUqHF+gIu6GKS/YE=; b=krrqg1yCKd+xtRbvYsYmAcLp9g
 kTJV09HIqnu1jNOY2OQfIj7BOCnuRPd3zyB9/JkqUXWv7+7vikHQFy2sYRt/HgvO8GJTc9ctUPFwc
 yi+/WL4BhpTNmDf6hxrA9S1NLCuavfdNOn4a/7QhblCcDz0yEIfV4FtG78OdlD1DFEsDZl/2S999l
 kZCDWbLSSEtG+qx/PW5CnSvPOQic3ra2vMhReX4nUVF5jYKZePMlQ/MfKflVh1jaEjZF5RMMlODbD
 bVzfNRipnNOJf/6Ou3OnFcfdnpOH6VvJhOdv7SlQtFAAWgKkFs3Gjt9D1P3px/jH+rolm+EeSdDiD
 EoaKoAgQ==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=52215)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oVsjI-0000xR-Dw; Wed, 07 Sep 2022 12:56:24 +0200
Message-ID: <d076bdfa-f6a6-9d32-c8bc-5d577fca057a@tronnes.org>
Date: Wed, 7 Sep 2022 12:56:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 00/41] drm: Analog TV Improvements
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <24e09a29-6d04-3b1e-63ce-cd3c31d350e2@tronnes.org>
 <020d44e6-884b-a817-8265-3461638cac71@tronnes.org>
 <20220905145729.ln675jko3aw6sgzs@houat>
 <74c10e51-4034-a284-1a26-b7ba7fe45fbe@tronnes.org>
 <20220907095849.5v72atwuedl5iiva@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220907095849.5v72atwuedl5iiva@houat>
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Emma Anholt <emma@anholt.net>,
 Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-sunxi@lists.linux.dev, Thomas Zimmermann <tzimmermann@suse.de>,
 intel-gfx@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, linux-arm-kernel@lists.infradead.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 07.09.2022 11.58, skrev Maxime Ripard:
> On Mon, Sep 05, 2022 at 05:17:18PM +0200, Noralf Trønnes wrote:
>> Den 05.09.2022 16.57, skrev Maxime Ripard:
>>> On Fri, Sep 02, 2022 at 01:28:16PM +0200, Noralf Trønnes wrote:
>>>>
>>>>
>>>> Den 01.09.2022 21.35, skrev Noralf Trønnes:
>>>>>
>>>>>
>>>>> I have finally found a workaround for my kernel hangs.
>>>>>
>>>>> Dom had a look at my kernel and found that the VideoCore was fine, and
>>>>> he said this:
>>>>>
>>>>>> That suggests cause of lockup was on arm side rather than VC side.
>>>>>>
>>>>>> But it's hard to diagnose further. Once you've had a peripheral not
>>>>>> respond, the AXI bus locks up and no further operations are possible.
>>>>>> Usual causes of this are required clocks being stopped or domains
>>>>>> disabled and then trying to access the hardware.
>>>>>>
>>>>>
>>>>> So when I got this on my 64-bit build:
>>>>>
>>>>> [  166.702171] SError Interrupt on CPU1, code 0x00000000bf000002 -- SError
>>>>> [  166.702187] CPU: 1 PID: 8 Comm: kworker/u8:0 Tainted: G        W
>>>>>     5.19.0-rc6-00096-gba7973977976-dirty #1
>>>>> [  166.702200] Hardware name: Raspberry Pi 4 Model B Rev 1.1 (DT)
>>>>> [  166.702206] Workqueue: events_freezable_power_ thermal_zone_device_check
>>>>> [  166.702231] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS
>>>>> BTYPE=--)
>>>>> [  166.702242] pc : regmap_mmio_read32le+0x10/0x28
>>>>> [  166.702261] lr : regmap_mmio_read+0x44/0x70
>>>>> ...
>>>>> [  166.702606]  bcm2711_get_temp+0x58/0xb0 [bcm2711_thermal]
>>>>>
>>>>> I wondered if that reg read was stalled due to a clock being stopped.
>>>>>
>>>>> Lo and behold, disabling runtime pm and keeping the vec clock running
>>>>> all the time fixed it[1].
>>>>>
>>>>> I don't know what the problem is, but at least I can now test this patchset.
>>>>>
>>>>> [1] https://gist.github.com/notro/23b984e7fa05cfbda2db50a421cac065
>>>>>
>>>>
>>>> It turns out I didn't have to disable runtime pm:
>>>> https://gist.github.com/notro/0adcfcb12460b54e54458afe11dc8ea2
>>>
>>> If the bcm2711_thermal IP needs that clock to be enabled, it should grab
>>> a reference itself, but it looks like even the device tree binding
>>> doesn't ask for one.
>>>
>>
>> The first thing I tried was to unload the bcm2711_thermal module before
>> running modeset and it still hung, so I don't think that's the problem.
> 
> Ack. Just to confirm, is this happening on mainline or on the downstream tree?
> 

It's mainline.

Noralf.
