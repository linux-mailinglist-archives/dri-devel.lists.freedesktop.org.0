Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F5ABB0B0FE
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 19:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0381A10E055;
	Sat, 19 Jul 2025 17:02:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=felixrichter.tech header.i=@felixrichter.tech header.b="Dn1+S9+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dijkstra.felixrichter.tech (dijkstra.felixrichter.tech
 [37.120.184.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E63210E055;
 Sat, 19 Jul 2025 17:02:34 +0000 (UTC)
Received: from [10.130.10.1] (unknown [10.130.10.1])
 by dijkstra.felixrichter.tech (Postfix) with ESMTPSA id 4158A1A30C1;
 Sat, 19 Jul 2025 19:03:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=felixrichter.tech;
 s=20210926; t=1752944598;
 bh=H83MShKAd/oyxO7riTCnrTaBgzS9cMCO2sU8P39Gq7Q=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Dn1+S9+i2TTcF3EdclYiAu6MoREY+2bNoN6WBH2vJ5xY5wwK57PYjwrScS3kvT8oU
 vcmS3ag1MvhqeuMrXzdXzHY/pwXmwdOARZhpW+SDhx5T8FazvmUzDv4R3F1GNk5Gti
 c3fCUaeXUlBd2Xsoi2PAlRYL2XMawxLnqC80YYoM=
Message-ID: <19229f06-9062-492b-90fd-b6c931e29146@felixrichter.tech>
Date: Sat, 19 Jul 2025 19:02:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: DDC I2C Display Freezing for internal displays
To: Mario Limonciello <superm1@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jonas@3j14.de, seanpaul@chromium.org
References: <0863bc3e-7364-4572-bb72-fc85657cbad7@felixrichter.tech>
 <d9706fe0-7965-457d-830e-19f9aafee855@felixrichter.tech>
 <1c64c181-4e96-4274-975b-454f7207af92@kernel.org>
 <5f63ae37-793e-4e34-a8ab-1845121fcd7e@felixrichter.tech>
 <79d7b8a1-b472-4f32-a724-1f2303fb2cab@kernel.org>
Content-Language: en-US
From: Felix Richter <judge@felixrichter.tech>
Autocrypt: addr=judge@felixrichter.tech; keydata=
 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
In-Reply-To: <79d7b8a1-b472-4f32-a724-1f2303fb2cab@kernel.org>
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

On 7/19/25 14:23, Mario Limonciello wrote:
>
> On 7/19/25 5:10 AM, Felix Richter wrote:
>> Thanks for the reply.
>>
>> I am aware that i can read and `edid` via sysfs from the drm device. 
>> I did not know about `drm_info` but from a quick look at it I don't 
>> think it provides the information I need.
>>
>> The problem is not that I need more information about the attached 
>> display. The problem is that there is not enough information about 
>> the what `i2c` device corresponds to which monitors ddc channel. 
>> Relying on udev hierarchies is not sufficient, because in many cases 
>> the relevant i2c device has no parent drm output device. So when I 
>> have no information about the i2c device I need to get more 
>> information by reading from it. Then I know more and can map the 
>> device to the correct display. I am happy to change the approach if 
>> there is a simpler way for me to get this information.
>
> ❯ ls -alh /sys/class/drm/*/ddc
Nice, I will consider adding that information to the logic for matching 
i2c devices to displays. But I do have to tell you that still is not 
sufficient in every case. It probably works for all direct interfaces 
that are always present on the device. But it fails to match i2c ddc 
channels when monitors are attached via a docking station using USB-C. 
Those monitors will not even show up in the command you provided. This 
again leads me to having to probe the i2c device directly anyway.

> I get where you're coming from, but there are cases that are 
> ultimately impossible to prevent when it comes to "long", or 
> "frequent" sequences and responding to interrupts. There are lots of 
> examples like this in the kernel that if you break what a driver is 
> doing with a device from a userspace interface you get to pick up the 
> pieces.
>
> I'll give you two examples:
>
> 1) You can access R/W PCI config data.
> /sys/bus/pci/devices/*/config
>
> You can break power management state machines, bus mastering, really 
> anything a device driver can do from a userspace application.  For 
> example if I had a userspace app that did something like this:
>
> dd if=/dev/zero of=/sys/bus/pci/devices/${BDF}/config bs=1 count=4096
>
> and it broke how can the kernel do anything about it?
>
> 2) There was a case that fwupd was doing something very similar to you 
> with a "probe" but with the DP aux character device.  It was trying to 
> detect devices with updates and would fight specifically with link 
> training.  The outcome was non-functional devices.  The workaround 
> currently employed is that fwupd will wait a few seconds (5 or 10, I 
> forget) and then do the probe to avoid that fight.  This doesn't solve 
> things though because there are pulse interrupts that could still come 
> at any time. The DP spec has response requirements for these.
>
> We talked about it at the display next hackfest this year and the 
> decision was this information that fwupd was needing should be pushed 
> into the kernel (let fwupd probe a sysfs file that gets cached data 
> the driver fetched).
>
I get that you can not protect against every case of malicious use. I am 
not sure that my example qualifies as that extreme though. I am only 
trying to read some data, that is in no way comparable to actively 
changing values.
>
>> People have been experiencing similar screen freezing issues randomly 
>> on this drm issue thread: https://gitlab.freedesktop.org/drm/amd/-/ 
>> issues/4141#note_3016182> > This example highlights an issue that can 
>> be triggered reliably with a
>> very similar effect. It may not be the same issue, but they may be 
>> related.
>
> Yeah; I'm aware of this thread and agree it's an issue with similar 
> symptoms.

At the very least I hope that my example code for triggering a similar 
issue can help figure out what is going on there ;)
