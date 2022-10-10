Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 846EB5FA210
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 18:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5296610E67A;
	Mon, 10 Oct 2022 16:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2128110E67A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 16:39:13 +0000 (UTC)
Received: from [192.168.1.138] ([37.4.248.18]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MOAmt-1oX9G03DkP-00Obdf; Mon, 10 Oct 2022 18:39:01 +0200
Message-ID: <23f7a57a-c89d-27be-c563-b9f8f6d5df5e@i2se.com>
Date: Mon, 10 Oct 2022 18:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH 0/2] drm/vc4: hdmi: Fixes for the RaspberryPi 0-3 stalls
To: Maxime Ripard <maxime@cerno.tech>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>
References: <20220929-rpi-pi3-unplugged-fixes-v1-0-cd22e962296c@cerno.tech>
 <20221010085058.dvf4o6tsr55kmw7f@houat>
Content-Language: en-US
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20221010085058.dvf4o6tsr55kmw7f@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:PEfgnRnSKoVjUSfLXj8qP1aHVKsUooymuT3lJDLWTsZZyF5y51f
 kTPS8xCy66A6XNEY/iEDsjXxGluWPu+Didq/S+nrOe0EhApZhPTatgUxw36ojFrRsQGnHo9
 mfHSAhjlwBowiOeXD6QexP6fxdNm7f1T8FcZZu0GLKcMva3OhxGe0/IT2sqdjLFINi0Kr9J
 kxhKDqBYKUfd8WrPcAZcQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:uleICE/LoB8=:OeCnbhmSA32RG9TSZeWzuQ
 0qlEb6trtCPYp072+jh12qE3jq2bFqyIRAqz4nOfU9hJ6+dQ8y9WDRUhVvbdXBWHQICJxAVD3
 Gd3CUEvc6eTwNMntEIoq01B0iiEDqag4NA2O4EFGp+1gIZoiQtqTw7icJFF1HPvyTWZUC8HLn
 Wgi35WLUgRrNxMTnRgjboXwTqjBvvzu08svV/X2YzkpuNGEA+xEzOlfybneLp+u8kbJ940pdd
 snnQ/S/kFOf5B+QCRDX1G9kGG/3tfs8CESeUf+vDCFBgRYhM7Z6oKeGdzylw534oiCaLE319h
 Engyy9GXRlskFIFtCdlpGLvhGAjEHfGz0D19y0hYw9l+Labx1Mx+VZQsS0HikzkJEnpW7mole
 Z3xQ+VXtnyFgQJDhlDKAq7DKXAxV3Qf53Ez2dlzfNH/D5wPbtv7Z1S3yjp3ZghQHxX+Gcatcj
 xIY5b2ml2zBMthOrlv3xzMdBwfPQG0tPJH5olAPOIiLc9E4dvD1qIa0PkT1f26ln9s0t8bo1e
 KIr2svK9vFU76iBG7gpYpeOzmoN8No803+xSaZxHrEsL+74z32FZBpETZlHkkQH+z487TlMfC
 ObiW4izHw+OgUI5cHbEtbktOsgxKCJ7K2DDfZBSZJUZx54soxYuwIMq1MeB3fPFA3E0lRF/BN
 QGDRbTz4uLOHMUj2qop3EC8d8FxFbAEDrCbWLFp5TId6NkUVOgGtfEbT1cKiHYBg4st9sUArk
 9598c8peIpEt0/HYXHwlzWosbvFxUk8yN622Q4T3PF6dEvoanZobtkamHO9h+rvW0BjYgjYNy
 qyTW6gG
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
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.10.22 um 10:50 schrieb Maxime Ripard:
> Hi Mark, Stefan,
>
> On Thu, Sep 29, 2022 at 11:21:16AM +0200, Maxime Ripard wrote:
>> Here's a series addressing the current bug that has been reported for the
>> RaspberryPi3, where booting without an HDMI monitor attached and with vc4
>> compiled as a module will lead to a stuck system when the module is loaded.
>>
>> This is due to the HSM clock not being initialized by anyone, and thus not
>> being functional once we start accessing the HDMI registers.
>>
>> The first patch will fix this, and the second will make sure we avoid that
>> situation entirely in the future. This has been tested with 5.19.12. Earlier
>> versions might need a backport of 88110a9f6209 ("clk: bcm2835: fix
>> bcm2835_clock_choose_div").
> Could you test/review this?

Looks good to me:

Tested-by: Stefan Wahren <stefan.wahren@i2se.com>

>
> Thanks
> Maxime
