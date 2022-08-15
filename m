Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E7F592B8E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 12:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E4C3B37F6;
	Mon, 15 Aug 2022 10:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 104AEAEEA1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 10:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vh4WP5c9FJ0MbLK61vY6yRT/SQaaMEr8RbbREz+rZ1g=; b=b1TJYcymPjKnvyimmR5TjK81Mu
 VqbuVBHbCfn54WGnqn0VB7piwq8YS9MKHNpYBPPOvVgVgp2zlJtU9MFGi7NrC9Be70mYyrw+TW1EW
 cNVYeWCOkfSvyulTlCiQT9jnM28OmqhwKChxRrhWHa812xj2Du4i5eaMDXWJDocyjv1ikGAs+wYcB
 XQ4Z6Yh28waRpNDKXpQZisudD5+cFUqFL8m9SLmx+AKeDFVXUCU0neZoELSCxtN5DM7H077grQe+s
 zywFm7UJLVQ7ZJpq4rQVY2XG4QCDYe/PczZS6fBvKKfGIJWQ+oB40qpMJNvxKx2PZqV93BUmiJ1d+
 2i/+GCAA==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=52543)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oNXe0-00013Y-A2; Mon, 15 Aug 2022 12:48:28 +0200
Message-ID: <53216533-d0d6-90d5-b9d1-c7d935867a54@tronnes.org>
Date: Mon, 15 Aug 2022 12:48:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 03/35] drm/atomic: Add TV subconnector property to
 get/set_property
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-3-3d53ae722097@cerno.tech>
 <6e47ce2d-25c7-7254-703d-2a1d3bb64373@tronnes.org>
 <20220815073546.4isrl7o3bt5g23pk@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220815073546.4isrl7o3bt5g23pk@houat>
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
Cc: Emma Anholt <emma@anholt.net>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-sunxi@lists.linux.dev,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 15.08.2022 09.35, skrev Maxime Ripard:
> Hi Noralf,
> 
> Thanks for your review
> 
> On Mon, Aug 08, 2022 at 02:30:42PM +0200, Noralf Trønnes wrote:
>> Den 29.07.2022 18.34, skrev Maxime Ripard:
>>> The subconnector property was created by drm_mode_create_tv_properties(),
>>> but wasn't exposed to the userspace through the generic
>>> atomic_get/set_property implementation, and wasn't stored in any generic
>>> state structure.
>>>
>>> Let's solve this.
>>>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>
>> I just realised that this and the select_subconnector property isn't
>> used by any drivers. Do you plan to use them? Maybe they don't need to
>> be wired up at all.
> 
> I'm not sure really
> 
> It's true that the subconnector and select_subconnector fields in the TV
> connector state aren't used by any driver, but the ch7006 and nouveau
> will update the property content through a call to
> drm_object_property_set_value
> 
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/i2c/ch7006_drv.c#L217
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/nouveau/dispnv04/tvnv17.c#L185
> 
> I think it could still be useful to report it in the connector state, if
> only for consistency?
> 

Yeah maybe.

I just realised that I have support in the GUD protocol for these
properties so any future devices that rely on them them will need this
patch, so I'm now suddenly in favor of this :)

Noralf.
