Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5233543F6D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 00:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5034610EBA4;
	Wed,  8 Jun 2022 22:48:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D9B610EBA4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 22:48:02 +0000 (UTC)
Received: from [192.168.1.107] ([37.4.249.155]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M8hph-1o3DC72Giv-004j1s; Thu, 09 Jun 2022 00:47:54 +0200
Message-ID: <3648b281-c6b0-a91c-2a4f-ddbee6988b3f@i2se.com>
Date: Thu, 9 Jun 2022 00:47:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: drm/vc4: module dysfunctional on Raspberry Pi 3B as of 5.18.0
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Peter Robinson <pbrobinson@gmail.com>
References: <75eec8af-66fd-bbaa-9aea-4cdf634bf2c8@arcor.de>
 <CALeDE9MzaG0vGfwMrZVArCWpNT94=vTakoM71qykBkVbeL1QmQ@mail.gmail.com>
 <20220608143605.x4arwudst3nqeg7b@houat>
From: Stefan Wahren <stefan.wahren@i2se.com>
In-Reply-To: <20220608143605.x4arwudst3nqeg7b@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ULA8F17jYvWsxDzEwDb2Ynekdx6HllgRvh/6A4gXafPYeqWdvTC
 2AF4EQWfvm5IKiB+ov07fbgEmjywyKR515XxV+7TYy8lDkLBReCrYoVnSPRHu9YvlUOYjgu
 JriuKMgymPw110gPLHUHpcjJbjnpTglx5DsdPDkEE5fexD714G9l/x8Ih06dABb60TBHVKq
 vaNhO7TY8w45e44W2EYSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ve5bv1O/7Xc=:0WYwot6Jx99Om53soARtGP
 IsyMEg84VFRSwcaesBZAyqOIKh+QlfsCzw4VM36jLOekXKwCww0Y/G+em9uvbu71ujF03ySiT
 goxjvTsfq2SlCGrzRVUIHtl+FI+j0j4WIl/vPTjI48219J5Mm7sslIfMRjTFwt/AT0mkvufxH
 D0vUPGmJHFkiWtFhw9HXl4goVt+tTUs3EpjahTotkWNvYzfMkVbcJaW9QWkNQvaF6k/WxJzzT
 f2lfHXonSEf6Xm/kwuRhzBpc1qZJbNuO+C5ZfNiyplfAstokw174VNCV2tp13e7QJqnrnWFXR
 VjHzAKZRJzG4ct3wPLrMC8D9cBO9ZRhYvqx8y86QN2Bn+dtkT8jk4Uh1whQM/TWtZjLLCDv+v
 OVat/X9LL7kvYHW5CC3UGd3NNCtHPlMCklrV18o4ieCvmeJzL9XDcvQixceuMQ/bKIsBuSFIo
 pUljwB0jYZEGusUwJ6hWpZzcK/swsB1WcEx0jz/ku4kEYSQmcHExD0YIHUFWn2vzalmY/UPE3
 Xq82KIdpZGkaJl0R+8FscBcaQU7PRGBz53KthiAHDb5J1BHpfB4uSSUJ7cVGqm+swmGXDgKHw
 vGcTwwi/gZ7Tqa8XPUx0jftS9iyCPLi3skP+x85DjSmPsXpf6q6Tq5MNx2BYx7b5KnuNXv8SS
 mPlPaIBZ3bCgSMT9rXREqBVP0UU6tV8Cjq4vq6VBnh/Qn/I9heoHRW/cS3+OUtIp7LDq0Y6fF
 gDxaFn60qv5M/uqHQUfqLM+MIlqWIReZW8crMTk8BOQQu5gaaU2V2z8iFAs=
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
Cc: Peter Mattern <pmattern@arcor.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 08.06.22 um 16:36 schrieb Maxime Ripard:
> Hi Peter(s)
>
> On Wed, Jun 08, 2022 at 02:10:19PM +0100, Peter Robinson wrote:
>> Hi Peter,
>>
>> Adding Stefan and Maxime
>>
>>> As of Linux 5.18.0, module vc4 apparently isn't working on Raspberry Pi
>>> 3B any more.
>>>
>>> If a monitor is attached to the device, the boot messages show up as
>>> usual, but right when KMS starts, the screen turns black. Similarly, the
>>> screen also turns black when the module is blacklisted at boot time and
>>> loaded from the running system.
>>> The problem looks quite similar to the one posted some months ago in [1].
> If I understand you properly, it results in a blank screen if the
> monitor is connected, but the system is still responsive?
>
> If so, it's a very different problem than the link you provided, since
> it was occurring when no monitor was connected and resulted in a total
> system hang.
>
>>> Unfortunately, looking through systemd's journal didn't seem to yield
>>> any real hint. Nevertheless, the results from grepping vc4 are
>> I'm seeing the same issue with vc4 on a RPi3 on 5.18.1 on Fedora so
>> can confirm the regression. Maxime would know what might be up here?

i assume you are using the downstream DTB?


Please provide the version/date of the GPU firmware?

> I tested on 5.18 on my 3B and it works well. Could you paste your kernel
> configuration and config.txt somewhere?
>
>>> → 5.17.1
>>>   > kernel: vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
>>>   > kernel: rc rc0: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0
>>>   > kernel: input: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0/input0
>>>   > kernel: vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops
>>> [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops
>>> [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops
>>> [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
>>>   > kernel: fb0: switching to vc4 from simple
>>>   > kernel: [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
>>>   > kernel: vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
>>>   > systemd-logind[338]: Watching system buttons on /dev/input/event0 (vc4)
>>> → 5.18.0
>>>   > kernel: fb0: switching to vc4 from simple
>>>   > kernel: vc4-drm soc:gpu: bound 3f400000.hvs (ops vc4_hvs_ops [vc4])
>>>   > kernel: rc rc0: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0
>>>   > kernel: input: vc4 as /devices/platform/soc/3f902000.hdmi/rc/rc0/input0
>>>   > kernel: vc4-drm soc:gpu: bound 3f902000.hdmi (ops vc4_hdmi_ops [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3f806000.vec (ops vc4_vec_ops [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3f004000.txp (ops vc4_txp_ops [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3f206000.pixelvalve (ops vc4_crtc_ops
>>> [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3f207000.pixelvalve (ops vc4_crtc_ops
>>> [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3f807000.pixelvalve (ops vc4_crtc_ops
>>> [vc4])
>>>   > kernel: vc4-drm soc:gpu: bound 3fc00000.v3d (ops vc4_v3d_ops [vc4])
>>>   > kernel: [drm] Initialized vc4 0.0.0 20140616 for soc:gpu on minor 0
>>>   > kernel: vc4-drm soc:gpu: [drm] fb0: vc4drmfb frame buffer device
>>>   > systemd-logind[337]: Watching system buttons on /dev/input/event0 (vc4)
> Yeah, it doesn't look that different.
>
> Maxime
