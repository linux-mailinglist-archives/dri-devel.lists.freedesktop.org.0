Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F3CB59633B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Aug 2022 21:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA5510FC0D;
	Tue, 16 Aug 2022 19:35:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8187B10FDA8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Aug 2022 19:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N6mMsJ2BCoZ712tXYE1aSGPGNeJ3vya4PzRd0XZ/7z4=; b=mkdC9S+GC1GHSWx19K+4TdMmER
 +j47uiu8lrqvMS5wURYrQe1KY/jjKtcogGtFftBAgONXOmNAHUEtcdni2lmlHFhBJdQgzfLotEXha
 RzXlBd/j7Q4WkgCnDT+shmx64gOtYKWUW11GsVSizEDMn9k6FtAFz/KCbeRIlSQAypwwb26/zvrzw
 iDpciw7w/M/mda8dsgDl4CyavM3ZIvj3a+oesW8ZNNe0PDIF8EYWx+Rz6B5VmqJcyqPtWSD1KfoHs
 8Cb6a4zY6MlPYr5xGh7o7XQSDPTI3GUBIZ2DTdPlWWbASB/a1lz43G96gEpqdNVlRytGBDMguuINE
 oaftHmJQ==;
Received: from [2a01:799:961:d200:cca0:57ac:c55d:a485] (port=58447)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oO2Lb-00029A-Be; Tue, 16 Aug 2022 21:35:31 +0200
Message-ID: <be9b6b71-fa2a-3290-2bce-901342e01981@tronnes.org>
Date: Tue, 16 Aug 2022 21:35:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v1 05/35] drm/connector: Add TV standard property
To: Maxime Ripard <maxime@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v1-0-3d53ae722097@cerno.tech>
 <20220728-rpi-analog-tv-properties-v1-5-3d53ae722097@cerno.tech>
 <9fdecae2-80ad-6212-0522-7dccf9fb57be@tronnes.org>
 <20220816082612.grebxql5ynnfnvfd@houat>
 <ea6ebdda-f779-78af-1ffd-bd86d715077f@tronnes.org>
 <20220816094922.oqhrhefv327zo2ou@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20220816094922.oqhrhefv327zo2ou@houat>
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



Den 16.08.2022 11.49, skrev Maxime Ripard:
> On Tue, Aug 16, 2022 at 11:42:20AM +0200, Noralf Trønnes wrote:
>>
>>
>> Den 16.08.2022 10.26, skrev Maxime Ripard:
>>> Hi,
>>>
>>> On Mon, Aug 08, 2022 at 02:44:56PM +0200, Noralf Trønnes wrote:
>>>> Den 29.07.2022 18.34, skrev Maxime Ripard:
>>>>> The TV mode property has been around for a while now to select and get the
>>>>> current TV mode output on an analog TV connector.
>>>>>
>>>>> Despite that property name being generic, its content isn't and has been
>>>>> driver-specific which makes it hard to build any generic behaviour on top
>>>>> of it, both in kernel and user-space.
>>>>>
>>>>> Let's create a new bitmask tv norm property, that can contain any of the
>>>>> analog TV standards currently supported by kernel drivers. Each driver can
>>>>> then pass in a bitmask of the modes it supports.
>>>>>
>>>>> We'll then be able to phase out the older tv mode property.
>>>>>
>>>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>>>>
>>>>
>>>> Please also update Documentation/gpu/kms-properties.csv
>>>>
>>>> Requirements for adding a new property is found in
>>>> Documentation/gpu/drm-kms.rst
>>>
>>> I knew this was going to be raised at some point, so I'm glad it's that
>>> early :)
>>>
>>> I really don't know what to do there. If we stick by our usual rules,
>>> then we can't have any of that work merged.
>>>
>>> However, I think the status quo is not really satisfactory either.
>>> Indeed, we have a property, that doesn't follow those requirements
>>> either, with a driver-specific content, and that stands in the way of
>>> fixes and further improvements at both the core framework and driver
>>> levels.
>>>
>>> So having that new property still seems like a net improvement at the
>>> driver, framework and uAPI levels, even if it's not entirely following
>>> the requirements we have in place.
>>>
>>> Even more so since, realistically, those kind of interfaces will never
>>> get any new development on the user-space side of things, it's
>>> considered by everyone as legacy.
>>>
>>> This also is something we need to support at some point if we want to
>>> completely deprecate the fbdev drivers and provide decent alternatives
>>> in KMS.
>>>
>>> So yeah, strictly speaking, we would not qualify for our requirements
>>> there. I still think we have a strong case for an exception though.
>>
>> Which requirements would that be? The only one I can see is the
>> documentation and maybe an IGT test.
> 
> This is the one I had in mind
> https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements
> 

Oh right, I had forgotten about that one.

One benefit of having a userspace implementation is that it increases
the chance of widespread adoption having a working implementation to
look at. I don't think the reason tv.mode is not used anywhere (that I
know of) is because the driver picks the enum values resulting in no
standard names. It's a niche thing and way down on the todo list.
nouveau and ch7006 has a tv_norm module parameter which certainly
doesn't help in moving people/projects over to the DRM property
(downstream rpi also has it now).

mpv[1] is a commandline media player that after a quick look might be a
candidate for implementing the property without too much effort.

How do you test the property? I've used modetest but I can only change
to a tv.mode that matches the current display mode. I can't switch from
ntsc to pal for instance.

I have tried changing mode on rpi-5.15 (which I will switch to for the
gud gadget), but I always end up with flip timeouts when changing the value:

$ cat /proc/cpuinfo | grep Model
Model           : Raspberry Pi 4 Model B Rev 1.1
$ uname -a
Linux pi4t 5.15.56-v7l+ #1575 SMP Fri Jul 22 20:29:46 BST 2022 armv7l
GNU/Linux
$ sudo dmesg -C
$ modetest -M vc4 -s 45:720x480i -w 45:mode:1
setting mode 720x480i-29.97Hz on connectors 45, crtc 73
failed to set gamma: Function not implemented

$ dmesg
$ modetest -M vc4 -s 45:720x480i -w 45:mode:0
setting mode 720x480i-29.97Hz on connectors 45, crtc 73
failed to set gamma: Function not implemented

$ dmesg
[   95.193059] [drm:drm_atomic_helper_wait_for_flip_done
[drm_kms_helper]] *ERROR* [CRTC:73:crtc-1] flip_done timed out
[  105.433112] [drm:drm_crtc_commit_wait [drm]] *ERROR* flip_done timed out
[  105.433519] [drm:drm_atomic_helper_wait_for_dependencies
[drm_kms_helper]] *ERROR* [CRTC:73:crtc-1] commit wait timed out
[  115.673095] [drm:drm_crtc_commit_wait [drm]] *ERROR* flip_done timed out
[  115.673498] [drm:drm_atomic_helper_wait_for_dependencies
[drm_kms_helper]] *ERROR* [PLANE:63:plane-1] commit wait timed out
[  125.913106] [drm:drm_crtc_commit_wait [drm]] *ERROR* flip_done timed out
[  125.913510] vc4-drm gpu: [drm] *ERROR* Timed out waiting for commit
[  136.153411] [drm:drm_atomic_helper_wait_for_flip_done
[drm_kms_helper]] *ERROR* [CRTC:73:crtc-1] flip_done timed out

I doesn't help to reload vc4, I have to reboot to get it working again.
I get this when reloading:
[  776.799784] vc4_vec fec13000.vec: Unbalanced pm_runtime_enable!

I know this was working in rpi-5.10 on the Pi Zero (Pi4 tvout using vc4
did not work at all when I tried).


Noralf.

[1] https://mpv.io/
    https://github.com/mpv-player/mpv/blob/master/video/out/drm_common.c
    https://github.com/mpv-player/mpv/blob/master/video/out/drm_atomic.c
