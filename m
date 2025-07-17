Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FFFB0952B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 21:48:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D5310E18F;
	Thu, 17 Jul 2025 19:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=felixrichter.tech header.i=@felixrichter.tech header.b="L8/fpp1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 394 seconds by postgrey-1.36 at gabe;
 Thu, 17 Jul 2025 19:48:45 UTC
Received: from dijkstra.felixrichter.tech (dijkstra.felixrichter.tech
 [37.120.184.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1577D10E18F;
 Thu, 17 Jul 2025 19:48:45 +0000 (UTC)
Received: from [10.130.10.2] (unknown [10.130.10.2])
 by dijkstra.felixrichter.tech (Postfix) with ESMTPSA id 6F8031A11D6;
 Thu, 17 Jul 2025 21:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=felixrichter.tech;
 s=20210926; t=1752781370;
 bh=n6mcooRKAcUTwRoNENv+HWwBc0j/2krNOY+yv7YldMU=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To;
 b=L8/fpp1rl+Z0OC9HI4xY8hKMvqPVwl1F8+owEB8GQyA7bsmxvEewmgas1Uy8LJ8uO
 4i+lCKBmXhojv6YN34cQBEMHTk3MNUSgMv62d2+0LKlPIW0/CZVPXNct9NJaxJq4ox
 eV+kQ5j0od1dTcHQKpIHfe8PDKH3DsG1GPo6VXMI=
Message-ID: <d9706fe0-7965-457d-830e-19f9aafee855@felixrichter.tech>
Date: Thu, 17 Jul 2025 21:42:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression: DDC I2C Display Freezing for internal displays
From: Felix Richter <judge@felixrichter.tech>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>
Cc: Linux regressions mailing list <regressions@lists.linux.dev>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, jonas@3j14.de
References: <0863bc3e-7364-4572-bb72-fc85657cbad7@felixrichter.tech>
Content-Language: en-US
Autocrypt: addr=judge@felixrichter.tech; keydata=
 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
In-Reply-To: <0863bc3e-7364-4572-bb72-fc85657cbad7@felixrichter.tech>
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

just tested that this Bug still exists in kernel version 6.16-rc6. The 
example trigger from my previous mail still works triggering screen 
freezing shortly after invocation.

I also learned that setting kernel param `amdgpu.dcdebugmask=0x10` works 
as a workaround.

Kind regards,
Felix Richter

On 4/22/25 21:44, Felix Richter wrote:
> Hi,
>
> it has been quite at while since I first started experiencing this 
> particular bug I am about to describe. Suffice it to say during my 
> Easter holiday I finally had the time to dig into it. It all started 
> with an update of linux LTS from 6.6 to 6.12.
>
> I am a user of the sway tiling window manager and have written a small 
> utility to manage my display configuration across different setups. 
> With the added twist that I wrote some code to determine which monitor 
> inputs is currently in use using the monitor command interface. Anyway 
> the interesting detail here is that, starting with kernel 6.12 I 
> started running into the following problem. With my display management 
> daemon running and attaching my Laptop to an external display my 
> internal display would just freeze with no way to bring it back apart 
> from power cycling the entire device. When my management daemon was 
> not running this would not happen, I would then need to manually 
> configure my display setup. Further investigation into the what is 
> triggering the display freeze lead me into the part of the code where 
> I am enumerating attached displays and am trying to match `i2c` 
> devices to their corresponding display.
>
> To get more specific the procedure is as follows, using udev enumerate 
> all `i2c` busses and filter them base on some heuristics like device 
> name and devices with parent devices drm / graphics device. Sadly this 
> is not quite enough to already match an `i2c` command interface to the 
> corresponding monitor, in many cases it is required to manually read 
> the EDID information via the i2c interface and compare it to the known 
> attached displays to get the match. And this is where the trigger for 
> the display freeze is to be found.
>
> Here is the output when scanning sysfs for my internal laptop display:
> ```
> # ls -al 
> /sys/devices/pci0000:00/0000:00:08.1/0000:04:00.0/drm/card1/card1-eDP-1
> total 0
> drwxr-xr-x  6 root root    0 22. Apr 18:07 .
> drwxr-xr-x 11 root root    0 22. Apr 18:07 ..
> drwxr-xr-x  3 root root    0 22. Apr 18:07 amdgpu_bl1
> -r--r--r--  1 root root 4096 22. Apr 18:07 connector_id
> lrwxrwxrwx  1 root root    0 22. Apr 18:07 ddc -> ../../../i2c-3
> lrwxrwxrwx  1 root root    0 22. Apr 18:07 device -> ../../card1
> -r--r--r--  1 root root 4096 22. Apr 18:07 dpms
> drwxr-xr-x  3 root root    0 22. Apr 18:07 drm_dp_aux0
> -r--r--r--  1 root root    0 22. Apr 18:07 edid
> -r--r--r--  1 root root 4096 22. Apr 18:07 enabled
> drwxr-xr-x  4 root root    0 22. Apr 18:07 i2c-11
> -r--r--r--  1 root root 4096 22. Apr 18:07 modes
> drwxr-xr-x  2 root root    0 22. Apr 18:07 power
> -rw-r--r--  1 root root 4096 22. Apr 18:07 status
> lrwxrwxrwx  1 root root    0 22. Apr 18:07 subsystem -> 
> ../../../../../../../class/drm
> -rw-r--r--  1 root root 4096 22. Apr 18:07 uevent
> ```
>
> As can be seen there are two i2c devices present, i2c-3 (as ddc 
> symlink) and i2c-11. Now from the perspective of udev i2c-11 has the 
> parent set to card1-eDP-1 while i2c-3 has the parent set to the drm 
> device itself. More importantly I can not rule out i2c-3 as a valid 
> command interface because in some cases valid command channels are 
> never assigned to the corresponding display output directly but only 
> live directly on the drm device, this is especially true when monitors 
> are not attached directly but via a docking station. So I do have to 
> look at each i2c device on its own. The freeze is trigged by trying to 
> read edid from i2c-3: This is the code snipped I used to trigger the 
> bug: 
> https://github.com/ju6ge/libmonitor/blob/918b2543eafb96aca29f66debc70fd18fa21ee11/examples/via-i2c-dev.rs 
> (adjusted target i2c interface accordingly). To be absolutely clear 
> this is not the i2c device that is expected to work in every case of 
> trying this with kernel 6.6 to 6.12 I get the following error message: 
> DdcError(CommunicationError(ReceiveError(EIO: I/O error))). That is 
> expected internal laptop displays do not support the command interface 
> in most cases anyway. But what I do not expect to happen is that my 
> Laptop screen freezes! And since this did not happen with kernel 6.6 
> but started happening with 6.12 this seems to be a software issue and 
> with that a regression!
>
> Next I bisected the kernel from 6.6 to 6.12 to determine when this 
> regression was introduced. I attached the full bisect log to the email ;)
>
> The offending commit seems to be:
>
> [58a261bfc96763a851cb48b203ed57da37e157b8] drm/amd/display: use a more 
> lax vblank enable policy for older ASICs
>
> Since this is quite a small commit I validated this by reverting the 
> changes on a newer kernel version (patch attached as well). Testing 
> actually shows that reverting the change resolves the screen freezing 
> behavior for me.
>
> Now I am not deep enough into graphics drivers to claim that just 
> reverting the commit should be considered a valid fix. Just that the 
> change is definitely responsible for the screen freezing now as 
> apposed to before.
>
> So what should be done here? I can validate any other suggested fixes 
> against my setup or provide more information if need be.
>
> Kind regards,
> Felix Richter
>
> #regzbot introduced: v6.6..v6.12

