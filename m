Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8384FBA7E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 13:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6031410E23A;
	Mon, 11 Apr 2022 11:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 309 seconds by postgrey-1.36 at gabe;
 Mon, 11 Apr 2022 11:06:15 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC0910E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 11:06:15 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.94]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N6sWd-1o22ho2xCx-018I52; Mon, 11 Apr 2022 13:00:59 +0200
Message-ID: <16571256-de30-db4e-6eea-268b0ef00103@i2se.com>
Date: Mon, 11 Apr 2022 13:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: vc4: Couldn't stop firmware display driver during boot
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <69c4f25d-7b48-081b-f609-8e1fd5f950cb@i2se.com>
 <df9d739d-7dff-4e2b-d1cd-66a5c5887cab@i2se.com>
 <42f24a68-391a-e6c8-25a7-511e91a5c7f9@i2se.com>
 <20220411073511.l5v7aqwbg6sdedjf@houat>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220411073511.l5v7aqwbg6sdedjf@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:O3DK9dqHik7awro2UrEn5DRvftkl0gQ88HzMn/4EMvLzgkpMlQl
 PrBlWnpqcSw28gBkwERc0Y825yWrg1xDZyjBEqkELO8ER4BFYguio/tDsqeBsHk8gbHVr0o
 Rze3kYXi+71cCESstxTA5MLLni0eNHXbJZ6DPKKXYqnMlZvG7x8BnI4YQAb9JCUX1NboIsr
 ElsdvrqMqSMimQzznVXsQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D5hcTX9sAxw=:9K14kVkmAKmpANVeATBFxm
 vz/saPnAFC5VzY3zWSCB/XncdNuavDq06laLqXQy+gYe17ZJLsyLrulalXyN3P/fP2tVPHBM1
 Wpsli1taxIZe9NSmP4oSzo/D4z8N5J0P/MMDe0S0F84VxFn62UpJ+iAWlX+GpZPGVMN+iJ0jN
 uAscXRt+nsOZT9Wp22Nv3muSm//CX4Tbu7PUwnEh3OkHYEt431vFggnu53zj/t4IsB+3BPbeJ
 HRjmJt23umeJIYdehf0IC7ovIdBjQByEXRfqn60W6yR/+zuGODAkc6W14X2XyfmHs2HKs3+5g
 zk6R48rPhsA7/WVnbtD2eg4VI95VYdJ9rQ7+yhNiW3FwuH87/cWCxaHaHbip94Rg1FAmvtMzM
 H/pkKTXwILdCJcq/K6kryFShrKJcqXQ+bWZ/rZLTzO6WNsrCpyMycqx55lQcJDzhb2CyiXNAT
 nsugrrrBc6qmLATZx8SlvXoK7wvHyTiaTM52U3QI9YsGBqfP4jut9Qg6uqu0Z+flrgsMcSen0
 AHeCEhOhMd6+SHE9+SiTRIlZsSAX9cgcn5zGEH/GvDvzs6VfOPCKWzMW8VROTjQ6hhBhVErUx
 RZ9pQZu35PiBwFJjrviZPApzlvzWmPIyZ1Mp711LF8YaEwP+Fypq2PbkcImKA9chbHsNne9QP
 EA0OAijqxEbF8a9qFKoukvIy0JJoYeWrbhsPecidTq4ziJ8g0Br1X/g3OPEFNgu/yYWp8dhyi
 OHbANPG/G2/LGScc
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

Am 11.04.22 um 09:35 schrieb Maxime Ripard:
> Hi Stefan,
>
> On Sun, Apr 10, 2022 at 02:32:02AM +0200, Stefan Wahren wrote:
>> Am 09.04.22 um 21:25 schrieb Stefan Wahren:
>>> Hi,
>>>
>>> today i tested Linux 5.18-rc1 on my Raspberry Pi 400 connected to my
>>> HDMI display (multi_v7_defconfig + CONFIG_ARM_LPAE, firmware:
>>> 2021-01-08T14:31:16) and i'm getting these strange errors from
>>> raspberrypi-firmware driver / vc4 during boot:
>>>
>>> [   13.094733] fb0: switching to vc4 from simple
>>> [   13.110759] Console: switching to colour dummy device 80x30
>>> [   13.120691] raspberrypi-firmware soc:firmware: Request 0x00030066
>>> returned status 0x80000001
>>> [   13.120715] vc4-drm gpu: [drm] Couldn't stop firmware display driver:
>>> -22
>> This is a new error which was introduced with Linux 5.18-rc1 (c406ad5e4a85
>> "drm/vc4: Notify the firmware when DRM is in charge"). 0x00030066 stands for
>> the new firmware property RPI_FIRMWARE_NOTIFY_DISPLAY_DONE. And i guess the
>> firmware from January 2021 doesn't support it?
> If I remember well, this was added some time in the middle of last year,
> so it wouldn't surprise me that your firmware doesn't support it.
>
> It's not really harmful, but it might still be a good idea to upgrade
> your firmware. The display pipeline has an unflushable FIFO between
> devices and if we don't take special care when disabling all the devices
> in that pipeline, we end up with a shift of one pixel for the rest of
> the system's life.
>
> We have some code to deal with the transition between the firmware and
> the kernel, but we couldn't make it work reliably so we ended up asking
> the firmware instead.
>
> So.. Yeah, it's bad if you want to use the displays output, but it not
> critical either.

I understand. I think it would be nice to give the user a more helpful 
warning how to possible fix this, because we cannot assume that every 
system has the latest firmware.

Also i'm not sure if should give this warning once or on every probing 
attempt.

Best regards
Stefan

>
> Maxime
