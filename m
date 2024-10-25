Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DF39B06C9
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 17:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B67A010E2BD;
	Fri, 25 Oct 2024 15:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eczGVC/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278A710E2BD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 15:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/BzxFH2ZzCndTZzsEVJpCcLisyAzacFj+HW6WN0x7KA=; b=eczGVC/BQmyJuRvutiOFIKpYQV
 F2WGCOXqyXdeuEVyRhmqyuqf0bMIiwi385UW1/+GQIJP9GKsXb4Svs0ANl9Uc48CUjBuAg+XOrBpj
 Mesl9O1Wz8Vup+RSbiCmk1ueHOInxrk0X1yymO7CH9OXOCKFRID7haJuhwoCmuXy2H0g/+Pu2P/2K
 alSTtq4cGTAiFdkrEQmQX5qX8I/d5xhta7B4+p6zyVQhWdIwfU/++6QqerPlOxwiD9akeDW5A3lOP
 SZkRXgpKZEJelunIpMEZq0+uwvCzvL0pZkpECz2K2GGbjFKsiif3pYztiCn0+Fe5HvK/1S2YPLBiW
 oFrOgFog==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t4Lq0-00F4PS-Cs; Fri, 25 Oct 2024 17:02:52 +0200
Message-ID: <9bda38f1-4221-4b3b-bbd6-cf972120bdf3@igalia.com>
Date: Fri, 25 Oct 2024 12:01:56 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Stefan Wahren <wahrenst@gmx.net>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <c657d3e9-e4fb-4dac-a611-45655511e500@gmx.net>
 <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
 <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
 <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 14/10/24 18:16, Stefan Wahren wrote:
> 
> Am 14.10.24 um 12:54 schrieb Dave Stevenson:
>> On Mon, 14 Oct 2024 at 10:04, Maxime Ripard <mripard@kernel.org> wrote:
>>> Hi,
>>>
>>> On Sun, Oct 13, 2024 at 09:57:58PM GMT, Stefan Wahren wrote:
>>>> Am 13.10.24 um 21:11 schrieb Dave Stevenson:
>>>>> Hi Stefan.
>>>>>
>>>>> On Sun, 13 Oct 2024, 18:19 Stefan Wahren, <wahrenst@gmx.net> wrote:
>>>>>
>>>>>      Hi,
>>>>>
>>>>>      i recently switch for my suspend2idle tests from Raspberry Pi 
>>>>> Bullseye
>>>>>      to Bookworm. After that testing suspend2idle shows a new warning
>>>>>      which i
>>>>>      never saw before:
>>>>>
>>>>>      HDMI Sink doesn't support RGB, something's wrong.
>>>>>
>>>>>
>>>>> Can you provide the edid of your display please?
> ...
>>>>
>>>>
>>>> The failure is coming from sink_supports_format_bpc()[1], but the flag
>>>> for DRM_COLOR_FORMAT_RGB444 should have been set from
>>>> update_display_info()[2] parsing the EDID.
>>>>
>>>> Loading that EDID in via drm.edid_firmware has given me a console at
>>>> 1920x1200@60 without any issues, so I'm a little confused as to what
>>>> is going on.
> Since this warning only occurs on resume and not during normal boot, i
> would assume there is no issue with EDID. Maybe the flag get lost. I
> should have mention that X11 doesn't recover in this case and the
> display stays black.

The same warning appeared to me when running a kernel built on top of
drm-misc-next on a RPi 4B+. But, in my case, it happened during normal
boot.

The warning showed non-stop and it only stopped appearing when I
switched displays. In the first case (when the warning was happening), I
was using a USB video capture device to get the HDMI output. Then, I
switched to a real display and the warning stopped showing.

Best Regards,
- Maíra

>>>>
>>>>    Dave
>>>>
>>>> [1] 
>>>> https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/gpu/drm/display/drm_hdmi_state_helper.c#L130
>>>> [2] 
>>>> https://elixir.bootlin.com/linux/v6.12-rc2/source/drivers/gpu/drm/drm_edid.c#L6669
> 
