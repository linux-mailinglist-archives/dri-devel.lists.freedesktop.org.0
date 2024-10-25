Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF379B0A00
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 18:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99F510EB1D;
	Fri, 25 Oct 2024 16:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.net header.i=wahrenst@gmx.net header.b="ZMJmMjN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB9DB10EB1D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 16:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
 s=s31663417; t=1729873873; x=1730478673; i=wahrenst@gmx.net;
 bh=4MN8P4bigjksvsaoFokM+Ro679++T70W9dM/zPCekWQ=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=ZMJmMjN3hPaEkomlsdr0fWvqWvdIj5o0Pwd2KYZmc78rP35NrR4XE2ysPpGjqcYg
 Jvm2KYFLXMs4A94b/VR6gk47Y8lDRwNeXFocnBNFTTQq5LHySNkMHZJxX2Imqv9bk
 ln4Y6H+E51qk4OledovX4mNY3nhyuDb56mPQvhJli6qFs523HE9sb0fNK3dujIFPA
 yAMh2BqbFO8d3to2hPutUTsGMITTbdj6RKNeXIir27Gnvf5KYj/r4QHh0ulN9cSDT
 2xw0SKhmnX8PSe7yqxykwttS3YLP0VB4l0S7xYVVHlXcuFaik/tUkhVdA9o0UbGO4
 /Xhlp5LMynyqrzyOLw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MWzjt-1tNt4y2Nk9-00OpFP; Fri, 25
 Oct 2024 18:31:13 +0200
Message-ID: <0804b147-5048-4d2d-b1a2-0e5a7db2b892@gmx.net>
Date: Fri, 25 Oct 2024 18:31:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vc4: HDMI Sink doesn't support RGB, something's wrong.
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, DRI Development <dri-devel@lists.freedesktop.org>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <CAPY8ntDAMq_oTM+ua0pcFroTiWkDyhXSj++oGxOq+ODajm8++Q@mail.gmail.com>
 <3f35403e-f42f-4936-9297-68b56818aeee@gmx.net>
 <20241014-warm-savvy-wrasse-ed984e@houat>
 <CAPY8ntAFzT4uBT47kDnDjEcSZXLonV-n_ixZ6L1_LAcfQPwS8Q@mail.gmail.com>
 <17f8f497-1238-4555-824b-b5a3fb699a98@gmx.net>
 <CAPY8ntBegA_L58s30F4FSO+=q78Xt5XA4kvYq38zAvsgR2DSrQ@mail.gmail.com>
 <6465bac6-9841-4f38-b9e1-48e236ada910@gmx.net>
 <CAPY8ntCzg-2vCuX0uaRD1kK5=qhH79hmtvQc=g44bD5iGwi7_w@mail.gmail.com>
 <20241017-kickass-agile-boa-dd5cd3@houat>
 <974f9525-76da-4b3a-ba94-6ac68fc542be@gmx.net>
 <20241017-icy-speedy-okapi-bebdfa@houat>
 <9957cd8b-cd6d-4fbd-a78f-d25814b68e1e@gmx.net>
 <CAPY8ntA+adGy3kkDnGUd1REpMc0f5zQD-9HPDTQfd6KUaUSfNw@mail.gmail.com>
 <5799c03b-19d6-4791-9fef-1538ecd9a4be@gmx.net>
 <CAPY8ntAxjGKBKPbpH0UzG1b4H478MNXAcgGi+F4c2f5zOzigxQ@mail.gmail.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <CAPY8ntAxjGKBKPbpH0UzG1b4H478MNXAcgGi+F4c2f5zOzigxQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:59tWRYBpxJ9GAqAETjpApY5HhCDai4ZcdG/D1UgsSx6hZ5X/+bD
 Id+Fy9pNHBNCxNk8jZPXwdfwbjiTn4oRaUmBHLSEyQVKFkMKYxdAtJCMIycAoEJs21zQn5U
 JKfUJjXO5CW8h8OA2geAWffiftXMGQa8fnjU/UNstEOUyf4/e4o73+PgX2wqioFW6YG6GNg
 zrHU5OW/yqPuOqnFVbNXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:TSLh1F3IjE4=;3rfqIPsK18XUkrFH6doHGs5WBds
 NZkut4IdQ+Fn2JPn3WHRExPDWXrPKnoqXPOvJ+q5BWYT2sun5L4NITTj1B6jujg5l9TWZzViJ
 Aag6pH7n30odxW++dbfmf6xQyFyrUZU4LXd2EuYgT27Owc72xbecEoyUrvDEIwOPxmsi7sNbV
 Ck/B/UTdgdFUDJaG4DaPXw944+y4TBjHl739gIpQFNthSgsEyjiDdC62Hj2Upu5CQm4ugGy8B
 aHCe4bGV27jR011qgDSpszlsDVUXJNj2GNQSbtLImIGBcPRuWvrIjXfSkIXFa4y6pAewsLxOk
 cQOmBG9mIqIq1snw+f9BaB6EQy9phFxwazVDVqAsdtkUGCvHLUU6C5eGOSHUKN6P4YavDsFJO
 U9E+FNb9Z+EQePVPIDFFw40MCYfoHRTDMxycSFnT0cLc5blBSTi9L3ez4/6m+cG2YD1WtIosR
 JXNGVaI4dhDdr/w7WkEwNnlggzCxPOot7LTh0MrAmVcjuj4K3h2UYfkCn9aWuulaLF6x7go6H
 ePt/8Om0WdqKigk1gOHxqEws6wtn4d0W4SeDeQJC1WPqLVJ6uL9Sa/LmHIVhRWBMedfnpi9Im
 TcW1DQ6ynGINrSJMpx9NDAOUKw9pCspzhCI9187v9RiEOfMAQEBYxMFcBYYqkR95SjWvJMYwy
 R9oT6g1KMxqG9lbDYXDmKixZehhJrYfw79p5RcfogZAtjzalhm6NmVs4tEkgO1jHwzf4L2D3e
 9jR3kwWI/SNS0aEAbQo/d1NAp6HlPYwap8dMTBkMuQeKa4Ha6RbVnSfoKdGhtsn7TCATOSwjN
 vC9ZNiBJNCVJlknAfzadgxRA==
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

Hi Dave,

Am 25.10.24 um 16:38 schrieb Dave Stevenson:
> Hi Stefan
>
> On Fri, 25 Oct 2024 at 14:36, Stefan Wahren <wahrenst@gmx.net> wrote:
...
> Based on that log I think your force_turbo=3D1 is a red-herring, or at
> least needs further investigation.
>
> Is this on a 3B, or 3B+?
Definitely a 3B+ from the year 2017 (mainline devicetree)
>
> Snippets from your log as we resume:
>
> [  216.797764] PM: suspend exit
> [  216.800473] lan78xx 1-1.1.1:1.0 eth0: Link is Down
AFAIK only the 3B+ has a Microchip LAN7800
> [  216.804503] vc4-drm soc:gpu:
> [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
> [  216.804584] vc4-drm soc:gpu:
> [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
> status updated from connected to disconnected
> [  216.804648] vc4-drm soc:gpu:
> [drm:drm_helper_probe_single_connector_modes] [CONNECTOR:33:HDMI-A-1]
> disconnected
> - So hotplug has signalled disconnected
> ...
> [  216.816990] vc4-drm soc:gpu: [drm:drm_mode_setcrtc] [CONNECTOR:33:HDM=
I-A-1]
> [  216.817079] vc4-drm soc:gpu:
> [drm:drm_atomic_helper_connector_hdmi_check] Trying with a 8 bpc
> output
> [  216.817107] vc4-drm soc:gpu:
> [drm:drm_atomic_helper_connector_hdmi_check] Trying RGB output format
> [  216.817166] vc4-drm soc:gpu:
> [drm:drm_atomic_helper_connector_hdmi_check] RGB Format, checking the
> constraints.
> [  216.817186] vc4-drm soc:gpu: [drm] HDMI Sink doesn't support RGB,
> something's wrong.
> - This is correct as the output is disconnected
> ...
> [  227.075847] vc4-drm soc:gpu: [drm:update_display_info.part.0]
> [CONNECTOR:33:HDMI-A-1] HDMI: DVI dual 0, max TMDS clock 0 kHz
> [  227.075912] vc4-drm soc:gpu: [drm:update_display_info.part.0]
> [CONNECTOR:33:HDMI-A-1] ELD monitor HP ZR2440w
> [  227.075942] vc4-drm soc:gpu: [drm:update_display_info.part.0]
> [CONNECTOR:33:HDMI-A-1] HDMI: latency present 0 0, video latency 0 0,
> audio latency 0 0
> [  227.075971] vc4-drm soc:gpu: [drm:update_display_info.part.0]
> [CONNECTOR:33:HDMI-A-1] ELD size 36, SAD count 1
> [  227.076014] vc4-drm soc:gpu: [drm:output_poll_execute]
> [CONNECTOR:33:HDMI-A-1] status updated from disconnected to connected
> [  227.076040] vc4-drm soc:gpu: [drm:output_poll_execute]
> [CONNECTOR:33:HDMI-A-1] epoch counter 3 -> 4
> [  227.076072] vc4-drm soc:gpu: [drm:drm_sysfs_hotplug_event]
> generating hotplug event
> [  227.076170] vc4-drm soc:gpu: [drm:drm_client_dev_hotplug] fbdev: ret=
=3D0
> - We now get a connect again.
>
> The 10 second interval is why I'm suspecting you're on a 3B - we have
> no interrupts for the GPIO used there (expgpio 4), whereas we do on
> 3B+ (gpio 28). The poll period is 10seconds in the absence of
> interrupts.
gpiochip0 - 54 lines:
 =C2=A0=C2=A0 =C2=A0line=C2=A0=C2=A0 0:=C2=A0=C2=A0=C2=A0=C2=A0 "ID_SDA"=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unused=C2=A0=C2=A0 input=C2=A0 active=
-high
 =C2=A0=C2=A0 =C2=A0line=C2=A0=C2=A0 1:=C2=A0=C2=A0=C2=A0=C2=A0 "ID_SCL"=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unused=C2=A0=C2=A0 input=C2=A0 active=
-high
 =C2=A0=C2=A0 =C2=A0line=C2=A0=C2=A0 2:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "SDA1"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unused=C2=A0=C2=A0 input=C2=
=A0 active-high
 =C2=A0=C2=A0 =C2=A0line=C2=A0=C2=A0 3:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "SCL1"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unused=C2=A0=C2=A0 input=C2=
=A0 active-high
...
 =C2=A0=C2=A0 =C2=A0line=C2=A0 27:=C2=A0=C2=A0=C2=A0=C2=A0 "GPIO27"=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unused=C2=A0=C2=A0 input=C2=A0 active-high
 =C2=A0=C2=A0 =C2=A0line=C2=A0 28: "HDMI_HPD_N"=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 "hpd"=C2=A0=C2=A0 input=C2=A0=C2=A0 active-low [used]
 =C2=A0=C2=A0 =C2=A0line=C2=A0 29: "STATUS_LED_G" "ACT" output active-high=
 [used]
 =C2=A0=C2=A0 =C2=A0line=C2=A0 30:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "CT=
S0"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unused=C2=A0=C2=A0 input=C2=A0 act=
ive-high


Sorry, I missed a possible important information. The Raspberry Pi 3B+
is not directly connected to the display. There is a passive Logilink
HDMI switch in between.
> On that suspend you were suspended for 16 seconds. Previous suspends
> were for 9 and 12 seconds.
I waited 20 seconds multiple times with and without force_hdmi and
wasn't able to reproduce it more reliable. But I agree this not a prove.

Maybe this is caused by the HDMI switch. At the end this is not
critical. My only concern was that this is an in suspend/resume handling.

I will try need to investigate this ...Thanks for your help. Stefan
> I suspect your monitor goes to sleep at around 15 seconds and is doing
> things to hotplug at that point.
> We've seen it on a couple of monitors here, and with Wayfire or labwc
> it can wake the display back up again. We haven't come up with a good
> solution to that one yet other than just ignoring hotplug.
>
>    Dave

