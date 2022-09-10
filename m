Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 665715B474E
	for <lists+dri-devel@lfdr.de>; Sat, 10 Sep 2022 17:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78BB10E1F0;
	Sat, 10 Sep 2022 15:34:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0710210E1F0;
 Sat, 10 Sep 2022 15:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202112;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z+umsEgE+0BVdH31f6mmvIugV/Oo08OxjxooJr5Ldk0=; b=oOkKlFJg/widSzLx1kmtByViA7
 iOPPJVXzhj9kBu4SsHbdIuC8ZvEUEWVuF7wtWK9NY1wDz3/5meiB92klu0LVN4Bm3K6+oo2Rbflxi
 xuhDbB9wgCuLMFKmNs4ZX3jsa8mX2XqIiqnuyGGBl4H6OSaQkIj1E6xZyyLBmYZurLWb31WizyZN+
 O1jWvr/yubX+SzsqQLAKgCgR+wLUiayc0HOm6lizgh1Gaac2vu0rqaQKPtH1p4tEG0/zz8AByiMgj
 D4a4FsKWEWTK3jJgeBqj7gHvccozD0WQKEeJ7+NlQMxDBWJ/bcK/RIwj9La/k/u+OIFQRI7btv70F
 1Ec0jrnA==;
Received: from [2a01:799:961:d200:4519:292a:25da:963a] (port=63245)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1oX2Uo-0006Kf-1D; Sat, 10 Sep 2022 17:34:14 +0200
Message-ID: <03d5a161-9bc9-3d04-acda-2e5ca5a19d71@tronnes.org>
Date: Sat, 10 Sep 2022 17:34:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 00/41] drm: Analog TV Improvements
To: Stefan Wahren <stefan.wahren@i2se.com>, Maxime Ripard
 <maxime@cerno.tech>, Dom Cobley <dom@raspberrypi.com>
References: <20220728-rpi-analog-tv-properties-v2-0-459522d653a7@cerno.tech>
 <24e09a29-6d04-3b1e-63ce-cd3c31d350e2@tronnes.org>
 <020d44e6-884b-a817-8265-3461638cac71@tronnes.org>
 <20220905145729.ln675jko3aw6sgzs@houat>
 <965de5c0-bc6a-7210-c946-b916ae2219fc@i2se.com>
 <eb06337b-d501-3ca7-0e50-eda3aec75683@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <eb06337b-d501-3ca7-0e50-eda3aec75683@tronnes.org>
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 07.09.2022 18.44, skrev Noralf Trønnes:
> 
> 
> Den 07.09.2022 12.36, skrev Stefan Wahren:
>> Hi Maxime,
>>
>> Am 05.09.22 um 16:57 schrieb Maxime Ripard:
>>> On Fri, Sep 02, 2022 at 01:28:16PM +0200, Noralf Trønnes wrote:
>>>>
>>>> Den 01.09.2022 21.35, skrev Noralf Trønnes:
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
>>>>> So when I got this on my 64-bit build:
>>>>>
>>>>> [  166.702171] SError Interrupt on CPU1, code 0x00000000bf000002 --
>>>>> SError
>>>>> [  166.702187] CPU: 1 PID: 8 Comm: kworker/u8:0 Tainted: G        W
>>>>>      5.19.0-rc6-00096-gba7973977976-dirty #1
>>>>> [  166.702200] Hardware name: Raspberry Pi 4 Model B Rev 1.1 (DT)
>>>>> [  166.702206] Workqueue: events_freezable_power_
>>>>> thermal_zone_device_check
>>>>> [  166.702231] pstate: 200000c5 (nzCv daIF -PAN -UAO -TCO -DIT -SSBS
>>>>> BTYPE=--)
>>>>> [  166.702242] pc : regmap_mmio_read32le+0x10/0x28
>>>>> [  166.702261] lr : regmap_mmio_read+0x44/0x70
>>>>> ...
>>>>> [  166.702606]  bcm2711_get_temp+0x58/0xb0 [bcm2711_thermal]
>>>>>
>>>>> I wondered if that reg read was stalled due to a clock being stopped.
>>>>>
>>>>> Lo and behold, disabling runtime pm and keeping the vec clock running
>>>>> all the time fixed it[1].
>>>>>
>>>>> I don't know what the problem is, but at least I can now test this
>>>>> patchset.
>>>>>
>>>>> [1] https://gist.github.com/notro/23b984e7fa05cfbda2db50a421cac065
>>>>>
>>>> It turns out I didn't have to disable runtime pm:
>>>> https://gist.github.com/notro/0adcfcb12460b54e54458afe11dc8ea2
>>> If the bcm2711_thermal IP needs that clock to be enabled, it should grab
>>> a reference itself, but it looks like even the device tree binding
>>> doesn't ask for one.
>> The missing clock in the device tree binding is expected, because
>> despite of the code there is not much information about the BCM2711
>> clock tree. But i'm skeptical that the AVS IP actually needs the VEC
>> clock, i think it's more likely that the VEC clock parent is changed and
>> that cause this issue. I could take care of the bcm2711 binding & driver
>> if i know which clock is really necessary.
> 
> Seems you're right, keeping the parent always enabled is enough:
> 
> 	clk_prepare_enable(clk_get_parent(vec->clock)); // pllc_per
> 
> I tried enabling just the grandparent clock as well, but that didn't help.
> 
> Without the clock hack it seems the hang occurs when switching between
> NTSC and PAL, at most I've been able to do that 4-5 times before it hangs.
> 
> For a while it looked like fbdev/fbcon had a play in this, but then I
> realised that it just gave me a NTSC mode to start from and to go back
> to when qutting modetest.
> 

I've looked some more into this problem and I see that downstream is
using a firmware clock for vec:

clk: Move vec clock to clk-raspberrypi
https://github.com/raspberrypi/linux/pull/4639

If I do the same my problem goes away.

It's interesting to note that on downstream 5.10.103-v7l+ #1530,
pllc_per is enabled even if tvout is not enabled:

$ sudo cat /sys/kernel/debug/clk/pllc_per/regdump
cm = 0x00000000
a2w = 0x00000004 (disable bit(8) is not set)

It's when mainline vc4_vec disables this vec parent clock that the crash
occurs.

Sidenote: Another downstream fw clock change with a vec reference[1]:


Another issue not related to the clock crash problem:

I assumed that unloading the vc4 module would release the clocks, but
this didn't happen.

When I looked at it I remembered that there's a catch in the DRM unplug
machinery when it comes to unloading a driver and the DRM disable hooks.

static void vc4_drm_unbind(struct device *dev)
{
	struct drm_device *drm = dev_get_drvdata(dev);

	drm_dev_unplug(drm);
	drm_atomic_helper_shutdown(drm);
}

Here the drm_device is first marked as unplugged and then the pipeline
is disabled. Since vc4_vec_encoder_disable() is protected by
drm_dev_enter() the VEC is not disabled, clocks are not released and PM
is left on.

In the drivers that I have written where the hardware is not expected to
have gone away on device unbind (SPI), I've just left out the
drm_dev_enter() check in the disable hook.

Noralf.

[1] https://github.com/raspberrypi/linux/pull/4706
