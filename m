Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AC54DAF8B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 13:22:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DB510E031;
	Wed, 16 Mar 2022 12:22:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE50D10E031
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Mar 2022 12:22:19 +0000 (UTC)
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id 6501EAC0316;
 Wed, 16 Mar 2022 20:22:17 +0800 (CST)
Content-Type: multipart/alternative;
 boundary="------------9q14EmKiRE4WLHnqkhzebsjM"
Message-ID: <f9d57503-1ac6-61c6-5fda-1a78b6e7270a@rock-chips.com>
Date: Wed, 16 Mar 2022 20:22:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 22/24] drm: rockchip: Add VOP2 driver
Content-Language: en-US
To: Sascha Hauer <s.hauer@pengutronix.de>
References: <20220311083323.887372-1-s.hauer@pengutronix.de>
 <20220311083323.887372-23-s.hauer@pengutronix.de>
 <9ec29d9b-8197-98fb-c612-5c842e4212c4@rock-chips.com>
 <20220316074001.GP405@pengutronix.de>
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20220316074001.GP405@pengutronix.de>
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUlKS0tKN1dZLVlBSVdZDwkaFQgSH1lBWRlDSk9WS0lDHU9JTU
 waHx0eVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktDSUNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Kxg6NTo5MT4DKywOLQhPKhkO
 MihPCxVVSlVKTU9MT0hISEhDS0pNVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSkhPTko3Bg++
X-HM-Tid: 0a7f92adcb89b039kuuu6501eac0316
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
Cc: devicetree@vger.kernel.org,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 Michael Riesch <michael.riesch@wolfvision.net>, kernel@pengutronix.de,
 Peter Geis <pgwipeout@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------9q14EmKiRE4WLHnqkhzebsjM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Sascha and Daniel:

On 3/16/22 15:40, Sascha Hauer wrote:
> On Tue, Mar 15, 2022 at 02:46:35PM +0800, Andy Yan wrote:
>> Hi Sascha:
>>
>> On 3/11/22 16:33, Sascha Hauer wrote:
>>> From: Andy Yan<andy.yan@rock-chips.com>
>>>
>>> The VOP2 unit is found on Rockchip SoCs beginning with rk3566/rk3568.
>>> It replaces the VOP unit found in the older Rockchip SoCs.
>>>
>>> This driver has been derived from the downstream Rockchip Kernel and
>>> heavily modified:
>>>
>>> - All nonstandard DRM properties have been removed
>>> - dropped struct vop2_plane_state and pass around less data between
>>>     functions
>>> - Dropped all DRM_FORMAT_* not known on upstream
>>> - rework register access to get rid of excessively used macros
>>> - Drop all waiting for framesyncs
>>>
>>> The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
>>> board. Overlay support is tested with the modetest utility. AFBC support
>>> on the cluster windows is tested with weston-simple-dmabuf-egl on
>>> weston using the (yet to be upstreamed) panfrost driver support.
>> Do we need some modification to test AFBC by weston-simple-dma-egl ?
> By default weston-simple-dma-egl uses DRM_FORMAT_XRGB8888 which in the
> panfrost driver ends up as PIPE_FORMAT_B8G8R8_UNORM and
> panfrost_afbc_format() returns PIPE_FORMAT_NONE for that. Change the
> format to DRM_FORMAT_ABGR8888 using weston-simple-dma-egl -f 0x34324241.
> This ends up as PIPE_FORMAT_R8G8B8A8_UNORM in panfrost_afbc_format()
> which is a supported format.
>
I also try weston-simple-dmabuf-egl -f 0x34324241 command,

but I got this output log from weston[0]:

Layer 5 (pos 0x50000000):
View 0 (role xdg_toplevel, PID 375, surface ID 3, top-level window 
'simple-dmabuf-egl' of org.freedesktop.weston.
simple-dmabuf-egl, 0xaaaad08275e0):
position: (871, 174) -> (1127, 430)
[not opaque]
outputs: 0 (HDMI-A-1) (primary)
dmabuf buffer
format: 0x34324241 ABGR8888
modifier: ARM_BLOCK_SIZE=16x16,MODE=YTR|SPARSE (0x800000000000051)
Layer 6 (pos 0x2):
View 0 (role (null), PID 372, surface ID 18, background for output 
HDMI-A-1, 0xaaaad0863520):
position: (0, 0) -> (1920, 1080)
[fully opaque]
outputs: 0 (HDMI-A-1) (primary)
[buffer not available]
[repaint] preparing state for output HDMI-A-1 (0)
[repaint] trying planes-only build state
[view] evaluating view 0xaaaad083b0f0 for output HDMI-A-1 (0)
[view] not assigning view 0xaaaad083b0f0 to plane (no buffer available)
[view] failing state generation: placing view 0xaaaad083b0f0 to renderer 
not allowed
[repaint] could not build planes-only state, trying mixed
[state] using renderer FB ID 73 for mixed mode for output HDMI-A-1 (0)
[state] scanout will use for zpos 0
[view] evaluating view 0xaaaad083b0f0 for output HDMI-A-1 (0)
[view] not assigning view 0xaaaad083b0f0 to plane (no buffer available)
[view] view 0xaaaad083b0f0 will be placed on the renderer
[view] evaluating view 0xaaaad08275e0 for output HDMI-A-1 (0)
[plane] started with zpos 18446744073709551615
[view] view 0xaaaad08275e0 will be placed on the renderer
[view] evaluating view 0xaaaad0863520 for output HDMI-A-1 (0)
[view] not assigning view 0xaaaad0863520 to plane (no buffer available)
[view] not assigning view 0xaaaad0863520 to plane (occluded by renderer 
views)

[view] view 0xaaaad0863520 will be placed on the renderer


 From the log we can find that Layer5 view 0(0xaaaad08275e0) is the afbc 
view rendered by Panfrost.

But it at last put on a render not a afbc window of vop  "view] view 
0xaaaad083b0f0 will be placed on the renderer "

The output message from sys/kernel/debug/dri/state can also provide that 
only non-AFBC window smart0-win0 is used.

It seems that it failed in  weston drm_output_prepare_plane_view.

Maybe I need a deeper dig.

[0] https://pastebin.com/8CfiP7u1

>> I have a buildroot system with weston-10.0.9 and mesa 21.3.5.
>>
>> After launch weston, I run weston-simple-dmabuf-egl, but from the output
>>
>> of sys/kernel/debug/dri/0/state, the weston is still use Smart0-win0, which
>> is
>>
>> a non-AFBC window.
>>
>> Do i need to modify the vop2 driver to set one Cluster window as primary
>> plane?
> I never used a Cluster window as primary plane.
>
> Sascha
>
--------------9q14EmKiRE4WLHnqkhzebsjM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Sascha and Daniel:<br>
    </p>
    <div class="moz-cite-prefix">On 3/16/22 15:40, Sascha Hauer wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220316074001.GP405@pengutronix.de">
      <pre class="moz-quote-pre" wrap="">On Tue, Mar 15, 2022 at 02:46:35PM +0800, Andy Yan wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Sascha:

On 3/11/22 16:33, Sascha Hauer wrote:
</pre>
        <blockquote type="cite">
          <pre class="moz-quote-pre" wrap="">From: Andy Yan <a class="moz-txt-link-rfc2396E" href="mailto:andy.yan@rock-chips.com">&lt;andy.yan@rock-chips.com&gt;</a>

The VOP2 unit is found on Rockchip SoCs beginning with rk3566/rk3568.
It replaces the VOP unit found in the older Rockchip SoCs.

This driver has been derived from the downstream Rockchip Kernel and
heavily modified:

- All nonstandard DRM properties have been removed
- dropped struct vop2_plane_state and pass around less data between
   functions
- Dropped all DRM_FORMAT_* not known on upstream
- rework register access to get rid of excessively used macros
- Drop all waiting for framesyncs

The driver is tested with HDMI and MIPI-DSI display on a RK3568-EVB
board. Overlay support is tested with the modetest utility. AFBC support
on the cluster windows is tested with weston-simple-dmabuf-egl on
weston using the (yet to be upstreamed) panfrost driver support.
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
Do we need some modification to test AFBC by weston-simple-dma-egl ?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
By default weston-simple-dma-egl uses DRM_FORMAT_XRGB8888 which in the
panfrost driver ends up as PIPE_FORMAT_B8G8R8_UNORM and
panfrost_afbc_format() returns PIPE_FORMAT_NONE for that. Change the
format to DRM_FORMAT_ABGR8888 using weston-simple-dma-egl -f 0x34324241.
This ends up as PIPE_FORMAT_R8G8B8A8_UNORM in panfrost_afbc_format()
which is a supported format.

</pre>
    </blockquote>
    <p>I also try weston-simple-dmabuf-egl -f 0x34324241 command,</p>
    <p>but I got this output log from weston[0]:</p>
    <div class="de1">Layer 5 (pos 0x50000000):
    </div>
    <div class="de1"> View 0 (role xdg_toplevel, PID 375, surface ID 3,
      top-level window 'simple-dmabuf-egl' of org.freedesktop.weston.
    </div>
    <div class="de1">simple-dmabuf-egl, 0xaaaad08275e0):
    </div>
    <div class="de1"> position: (871, 174) -&gt; (1127, 430)
    </div>
    <div class="de1"> [not opaque]
    </div>
    <div class="de1"> outputs: 0 (HDMI-A-1) (primary)
    </div>
    <div class="de1"> dmabuf buffer
    </div>
    <div class="de1"> format: 0x34324241 ABGR8888
    </div>
    <div class="de1"> modifier: ARM_BLOCK_SIZE=16x16,MODE=YTR|SPARSE
      (0x800000000000051)
    </div>
    <div class="de1"> </div>
    <div class="de1">Layer 6 (pos 0x2):
    </div>
    <div class="de1"> View 0 (role (null), PID 372, surface ID 18,
      background for output HDMI-A-1, 0xaaaad0863520):
    </div>
    <div class="de1"> position: (0, 0) -&gt; (1920, 1080)
    </div>
    <div class="de1"> [fully opaque]
    </div>
    <div class="de1"> outputs: 0 (HDMI-A-1) (primary)
    </div>
    <div class="de1"> [buffer not available]
    </div>
    <div class="de1"> </div>
    <div class="de1"> [repaint] preparing state for output HDMI-A-1 (0)
    </div>
    <div class="de1"> [repaint] trying planes-only build state
    </div>
    <div class="de1"> [view] evaluating view 0xaaaad083b0f0 for output
      HDMI-A-1 (0)
    </div>
    <div class="de1"> [view] not assigning view 0xaaaad083b0f0 to plane
      (no buffer available)
    </div>
    <div class="de1"> [view] failing state generation: placing view
      0xaaaad083b0f0 to renderer not allowed
    </div>
    <div class="de1"> [repaint] could not build planes-only state,
      trying mixed
    </div>
    <div class="de1"> [state] using renderer FB ID 73 for mixed mode for
      output HDMI-A-1 (0)
    </div>
    <div class="de1"> [state] scanout will use for zpos 0
    </div>
    <div class="de1"> [view] evaluating view 0xaaaad083b0f0 for output
      HDMI-A-1 (0)
    </div>
    <div class="de1"> [view] not assigning view 0xaaaad083b0f0 to plane
      (no buffer available)
    </div>
    <div class="de1"> [view] view 0xaaaad083b0f0 will be placed on the
      renderer
    </div>
    <div class="de1"> [view] evaluating view 0xaaaad08275e0 for output
      HDMI-A-1 (0)
    </div>
    <div class="de1"> [plane] started with zpos 18446744073709551615
    </div>
    <div class="de1"> [view] view 0xaaaad08275e0 will be placed on the
      renderer
    </div>
    <div class="de1"> [view] evaluating view 0xaaaad0863520 for output
      HDMI-A-1 (0)
    </div>
    <div class="de1"> [view] not assigning view 0xaaaad0863520 to plane
      (no buffer available)
    </div>
    <div class="de1"> [view] not assigning view 0xaaaad0863520 to plane
      (occluded by renderer views)
    </div>
    <p> [view] view 0xaaaad0863520 will be placed on the renderer</p>
    <p><br>
    </p>
    <p>From the log we can find that Layer5 view 0(0xaaaad08275e0) is
      the afbc view rendered by Panfrost.</p>
    <p>But it at last put on a render not a afbc window of vop  "view]
      view 0xaaaad083b0f0 will be placed on the renderer
      "</p>
    <p>The output message from sys/kernel/debug/dri/state can also
      provide that only non-AFBC window smart0-win0 is used.</p>
    <p>It seems that it failed in  weston drm_output_prepare_plane_view.</p>
    <p>Maybe I need a deeper dig.<br>
    </p>
    <p>[0] <a class="moz-txt-link-freetext" href="https://pastebin.com/8CfiP7u1">https://pastebin.com/8CfiP7u1</a><br>
    </p>
    <blockquote type="cite"
      cite="mid:20220316074001.GP405@pengutronix.de">
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
I have a buildroot system with weston-10.0.9 and mesa 21.3.5.

After launch weston, I run weston-simple-dmabuf-egl, but from the output

of sys/kernel/debug/dri/0/state, the weston is still use Smart0-win0, which
is

a non-AFBC window.

Do i need to modify the vop2 driver to set one Cluster window as primary
plane?
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
I never used a Cluster window as primary plane.

Sascha

</pre>
    </blockquote>
  </body>
</html>

--------------9q14EmKiRE4WLHnqkhzebsjM--
