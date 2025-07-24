Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EB5B111D7
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 21:41:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2894F10E223;
	Thu, 24 Jul 2025 19:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=felixrichter.tech header.i=@felixrichter.tech header.b="AfxgLGNl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dijkstra.felixrichter.tech (dijkstra.felixrichter.tech
 [37.120.184.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A7310E223;
 Thu, 24 Jul 2025 19:41:08 +0000 (UTC)
Received: from [10.130.10.2] (unknown [10.130.10.2])
 by dijkstra.felixrichter.tech (Postfix) with ESMTPSA id B53011A30B9;
 Thu, 24 Jul 2025 21:42:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=felixrichter.tech;
 s=20210926; t=1753386126;
 bh=jPcKOYRYVvQX2L/QtYS0YzxpKvQAYJULvoetNMAdv0w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=AfxgLGNl6tESiyj6WW8Yuy05Sf6Gf7pVTmnr4HVfF64exTQwFwhGkywsliGPyF1Ud
 3cuNgQ3qk/1XU8k5aY0Vpw0Kni8JCXH/n9ThQWxPYK0E+0iCbf/3iIRJBCEEeRf3A6
 eueDHZ4MzqvlILty4VYMRoJPejpkhei5g1aMyrmU=
Content-Type: multipart/alternative;
 boundary="------------30c514Pv90YWWNMzzHtQ4bcS"
Message-ID: <706fb4e2-8b5b-46fc-b640-b304b224a259@felixrichter.tech>
Date: Thu, 24 Jul 2025 21:41:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: DDC I2C Display Freezing for internal displays
To: Alex Deucher <alexdeucher@gmail.com>
Cc: Mario Limonciello <superm1@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Linux regressions mailing list <regressions@lists.linux.dev>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jonas@3j14.de, seanpaul@chromium.org
References: <0863bc3e-7364-4572-bb72-fc85657cbad7@felixrichter.tech>
 <d9706fe0-7965-457d-830e-19f9aafee855@felixrichter.tech>
 <1c64c181-4e96-4274-975b-454f7207af92@kernel.org>
 <5f63ae37-793e-4e34-a8ab-1845121fcd7e@felixrichter.tech>
 <79d7b8a1-b472-4f32-a724-1f2303fb2cab@kernel.org>
 <19229f06-9062-492b-90fd-b6c931e29146@felixrichter.tech>
 <CADnq5_Mpsd_68T3uKqdXzHSzm4dWcHamYJZMNpPNZFHBp=DORQ@mail.gmail.com>
Content-Language: en-US
From: Felix Richter <judge@felixrichter.tech>
Autocrypt: addr=judge@felixrichter.tech; keydata=
 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
In-Reply-To: <CADnq5_Mpsd_68T3uKqdXzHSzm4dWcHamYJZMNpPNZFHBp=DORQ@mail.gmail.com>
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

This is a multi-part message in MIME format.
--------------30c514Pv90YWWNMzzHtQ4bcS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/20/25 17:45, Alex Deucher wrote:
> DP (and all of its variants, eDP, USB-C thunderbolt) doesn't actually
> use i2c directly.  It's aux; you can do i2c over aux, but in the case
> of MST, it's more like a network for displays so naively messing with
> i2c buses from userspace won't do what you expect.  For MST, you have
> a single set of i2c/aux pins for the connector which may have several
> monitors on the other end.
> DP is a two way communications channel.  You may have the driver
> training a link or communicating with other devices on the DP network
> (MST hubs, monitors, etc.).  You can also get requests from the
> monitor to the driver via hpd interrupts.  Many of these processes do
> not do well if interrupted.
>
> Alex
>

I get that this is a part of a very complicated protocol. I am still 
irritated that the points you mention are relevant from the perspective 
of userspace. From my perspective there is no expectation that the 
kernel should just interrupt ongoing procedures when I access an i2c 
link. I am happy to wait for the kernel to schedule the operation for 
when it is convenient. After all the point of abstraction is not having 
to worry about the layers underneath. And if the drm device exposes an 
i2c device that I access it is the job of the drm driver to handle how 
and when that transmission takes place.

Also I would like to point out that the bug I am experiencing does not 
materialize in case of any external displays attached via an MST hub. It 
happens with the internal display even when nothing is attached. The 
point about MST Hubs is only relevant because those i2c interface can 
not be matched via udev to the corresponding display. Though the can be 
matched when reading edid from the device. Those interfaces then work 
just fine when I use ddc to read/set monitor inputs. So those points do 
not seem to really be relevant in case of the screen freezing trigger.

Anyway that is just my thoughts on the matter. I'll look into writing a 
workaround to maybe avoid some i2c devices that could be problematic.

And there still might be a relation to the other screen freezing issues.

Felix
--------------30c514Pv90YWWNMzzHtQ4bcS
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <div class="moz-cite-prefix"><font face="monospace">On 7/20/25
        17:45, Alex Deucher wrote:</font><span
      style="white-space: pre-wrap">
</span></div>
    <blockquote type="cite"
cite="mid:CADnq5_Mpsd_68T3uKqdXzHSzm4dWcHamYJZMNpPNZFHBp=DORQ@mail.gmail.com">
      <pre wrap="" class="moz-quote-pre">
DP (and all of its variants, eDP, USB-C thunderbolt) doesn't actually
use i2c directly.  It's aux; you can do i2c over aux, but in the case
of MST, it's more like a network for displays so naively messing with
i2c buses from userspace won't do what you expect.  For MST, you have
a single set of i2c/aux pins for the connector which may have several
monitors on the other end.</pre>
      <pre wrap="" class="moz-quote-pre">
DP is a two way communications channel.  You may have the driver
training a link or communicating with other devices on the DP network
(MST hubs, monitors, etc.).  You can also get requests from the
monitor to the driver via hpd interrupts.  Many of these processes do
not do well if interrupted.

Alex

</pre>
    </blockquote>
    <br>
    <font face="monospace">I get that this is a part of a very
      complicated protocol. I am still irritated that the points you
      mention are relevant from the perspective of userspace. From my
      perspective there is no expectation that the kernel should just
      interrupt ongoing procedures when I access an i2c link. I am happy
      to wait for the kernel to schedule the operation for when it is
      convenient. After all the point of abstraction is not having to
      worry about the layers underneath. And if the drm device exposes
      an i2c device that I access it is the job of the drm driver to
      handle how and when that transmission takes place. <br>
      <br>
      Also I would like to point out that the bug I am experiencing does
      not materialize in case of any external displays attached via an
      MST hub. It happens with the internal display even when nothing is
      attached. The point about MST Hubs is only relevant because those
      i2c interface can not be matched via udev to the corresponding
      display. Though the can be matched when reading edid from the
      device. Those interfaces then work just fine when I use ddc to
      read/set monitor inputs. So those points do not seem to really be
      relevant in case of the screen freezing trigger.<br>
      <br>
      Anyway that is just my thoughts on the matter. I'll look into
      writing a workaround to maybe avoid some i2c devices that could be
      problematic.<br>
      <br>
      And there still might be a relation to the other screen freezing
      issues.<br>
      <br>
      Felix</font>
  </body>
</html>

--------------30c514Pv90YWWNMzzHtQ4bcS--
