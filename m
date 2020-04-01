Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F3A19BC7D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 09:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 706086E9F6;
	Thu,  2 Apr 2020 07:18:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99AA6E98F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 19:14:40 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e84e7ef0000>; Wed, 01 Apr 2020 12:13:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 01 Apr 2020 12:14:40 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 01 Apr 2020 12:14:40 -0700
Received: from [10.20.22.102] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 1 Apr
 2020 19:14:37 +0000
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <874ku5ho77.fsf@intel.com> <0b49427d-325b-d248-1b9b-421af6ecb8f9@nvidia.com>
 <20200401111434.4cbd998b@eldfell.localdomain>
From: Daniel Dadap <ddadap@nvidia.com>
Message-ID: <a7b524a4-39c7-cbdc-bd0b-56fa66184334@nvidia.com>
Date: Wed, 1 Apr 2020 14:15:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200401111434.4cbd998b@eldfell.localdomain>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1585768431; bh=Add7S5/NcxKZwQi5wDFrOJHAjHCxOaWuN2jrinCIJRw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language;
 b=T3rwn/wu/4XDRXXjSwsaEghrXFDK8JJZWJlXZDr5YhjwFhg5rmNL4Tx29TTB/kZM0
 YDgdUbtjuCH8B5MjZ2sTidr+wLzT1S5aKfqHT/GxWO577nVb/pO6tDDA7gC4Jj2BTH
 Zr6tFRYOn1VLFxQbrjZAxEf6cbfI+gJbKINaKz65+IkVXEyOu5Jh0hhUwlTakjzZf3
 N6N+BRhCJVnBD85/9cufPyLuCLGbpCXBt3ZP/wrXRHXL+1yO2ZiDMvu7+ykrywkJXO
 9XlVbXRqED1/ZrtS1VDF0eQNRBDx5H6lKsHY7uN1Aw+1swnHjWBzoa7zELR9cuW8QY
 IzSJjrla/He0w==
X-Mailman-Approved-At: Thu, 02 Apr 2020 07:17:56 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0427000871=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0427000871==
Content-Type: multipart/alternative;
	boundary="------------36EAE6AB1555FBC80880F2F2"
Content-Language: en-US

--------------36EAE6AB1555FBC80880F2F2
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/20 3:14 AM, Pekka Paalanen wrote:
> On Tue, 31 Mar 2020 20:59:39 -0500
> Daniel Dadap<ddadap@nvidia.com>  wrote:
>
>> On 3/30/20 10:11 AM, Jani Nikula wrote:
>>> On Fri, 27 Mar 2020, Daniel Dadap<ddadap@nvidia.com>  wrote:
>>>> A number of hybrid GPU notebook computer designs with dual (integrated
>>>> plus discrete) GPUs are equipped with multiplexers (muxes) that allow
>>>> display panels to be driven by either the integrated GPU or the discrete
>>>> GPU. Typically, this is a selection that can be made at boot time as a
>>>> menu option in the system firmware's setup screen, and the mux selection
>>>> stays fixed for as long as the system is running and persists across
>>>> reboots until it is explicitly changed. However, some muxed hybrid GPU
>>>> systems have dynamically switchable muxes which can be switched while
>>>> the system is running.
>>>>
>>>> NVIDIA is exploring the possibility of taking advantage of dynamically
>>>> switchable muxes to enhance the experience of using a hybrid GPU system.
>>>> For example, on a system configured for PRIME render offloading, it may
>>>> be possible to keep the discrete GPU powered down and use the integrated
>>>> GPU for rendering and displaying the desktop when no applications are
>>>> using the discrete GPU, and dynamically switch the panel to be driven
>>>> directly by the discrete GPU when render-offloading a fullscreen
>>>> application.
>>>>
>>>> We have been conducting some experiments on systems with dynamic muxes,
>>>> and have found some limitations that would need to be addressed in order
>>>> to support use cases like the one suggested above:
>>>>
>>>> * In at least the i915 DRM-KMS driver, and likely in other DRM-KMS
>>>> drivers as well, eDP panels are assumed to be always connected. This
>>>> assumption is broken when the panel is muxed away, which can cause
>>>> problems. A typical symptom is i915 repeatedly attempting to retrain the
>>>> link, severely impacting system performance and printing messages like
>>>> the following every five seconds or so:
>>>>
>>>> [drm:intel_dp_start_link_train [i915]]*ERROR*  failed to enable link
>>>> training
>>>> [drm] Reducing the compressed framebuffer size. This may lead to less
>>>> power savings than a non-reduced-size. Try to increase stolen memory
>>>> size if available in BIOS.
>>>>
>>>> This symptom might occur if something causes the DRM-KMS driver to probe
>>>> the display while it's muxed away, for example a modeset or DPMS state
>>>> change.
>>>>
>>>> * When switching the mux back to a GPU that was previously driving a
>>>> mode, it is necessary to at the very least retrain DP links to restore
>>>> the previously displayed image. In a proof of concept I have been
>>>> experimenting with, I am able to accomplish this from userspace by
>>>> triggering DPMS off and then back on again; however, it would be good to
>>>> have an in-kernel API to request that an output owned by a DRM-KMS
>>>> driver be refreshed to resume driving a mode on a disconnected and
>>>> reconnected display. This API would need to be accessible from outside
>>>> of the DRM-KMS driver handling the output. One reason it would be good
>>>> to do this within the kernel, rather than rely on e.g. DPMS operations
>>>> in the xf86-video-modesetting driver, is that it would be useful for
>>>> restoring the console if X crashes or is forcefully killed while the mux
>>>> is switched to a GPU other than the one which drives the console.
>>>>
>>>> Basically, we'd like to be able to do the following:
>>>>
>>>> 1) Communicate to a DRM-KMS driver that an output is disconnected and
>>>> can't be used. Ideally, DRI clients such as X should still see the
>>>> output as being connected, so user applications don't need to keep track
>>>> of the change.
>>> I think everything will be much easier if you provide a way for
>>> userspace to control the muxing using the KMS API, and not lie to the
>>> userspace about what's going on.
>>>
>>> You're not actually saying what component you think should control the
>>> muxing.
>>>
>>> Why should the drivers keep telling the userspace the output is
>>> connected when it's not? Obviously the userspace should also switch to
>>> using a different output on a different GPU, right? Or are you planning
>>> some proprietary behind the scenes hack for discrete?
>> The desire to lie to userspace is driven mainly by trying to avoid
>> interactions from desktop environments / window managers reacting to the
>> display going away. Many desktops will do things like try to migrate
>> windows in response to a change in the current display configuration,
>> and updating all of them to avoid doing so when a display appears to
>> disappear from one GPU and reappear on another GPU seems harder than
>> allowing userspace to believe that nothing has changed. I wouldn't mind
>> if e.g. X drivers were in on the lie, and the lie boundary shifts to
>> RandR, but it would be nice to avoid having to deal with the fallout of
>> desktop environments handling displays apparently vanishing and
>> re-appearing.
> Hi,
>
> I love the general idea of using the mux to optimize hardware usage,
> but I really do not like the initial software design proposal.
>
> I'm afraid that lying is going to lead to a disaster eventually, instead of
> needing to fix a more obvious shortcoming in a simpler way today - or
> rather, implementing a new feature taking advantage of the new
> capabilities. Lying would lock the whole graphics stack to the single
> design you thought of today, stopping any novel ways of using the
> feature from appearing later.
>
> Bypassing the desktop or the display server is practically always the
> wrong design, whether it is this, color management, or whatever.


That is fair. I regret expressing a lie to userspace as an ideal outcome 
in the initial message, as it's really secondary to the more important 
issues of needing to be able to disconnect the panel at a software level 
within the GPU driver and initiating a retrain when it's reconnected.


>
>> The particular use case we're envisioning here is as follows:
>>
>> * GPU A drives an X protocol screen which hosts a desktop session.
>> Applications are rendered on GPU A by default. The mux is switched to
>> GPU A by default.
>> * GPU B drives a GPU screen that can be used as a PRIME render offload
>> source. Applications rendered on GPU B can run in windows presented by
>> GPU A via PRIME render offloading.
>> * If an application rendered on GPU B and presented on GPU A becomes
>> fullscreen, the mux can switch to GPU B and GPU B can present the
>> application directly for as long as the application remains in the
>> foreground and fullscreen.
>> * The mux switches back to GPU A and the application presents via GPU A
>> and render offloading if it transitions to a window or another window
>> occludes it.
> I do not see how you could ever pull that off without patching all
> display servers to specifically support that use case (think of Wayland
> architecture here). When the mux is switched, the userspace also needs
> to switch posting DRM FBs from DRM KMS device A to DRM KMS device B.
>
> What you describe is totally fine for a Wayland display server to do
> automatically, and in the Wayland architecture there really is no other
> component that could even attempt to do it. In fact, a Wayland
> display server is the only component in the architecture that actually
> needs to do anything about it to make it work. Your use case is a
> perfect fit in the Wayland architecture, if the mux is controlled
> exclusively by the display server and no-one lies.
>
> My suggestion is to just trigger the exact same hotplug actions that
> physically disconnecting a display cable from one card and plugging it
> into another card does already. It's not like that is going to ever
> happen beyond a display server's back, it is the display server itself
> toggling the mux, so it knows to handle it right. What the display
> server*does*  need to know before-hand is exactly which connectors the
> mux affects.


That should be trivial for external displays, and in fact I have 
observed some designs which make the muxed-away from GPU see a hot 
unplug and the muxed-to GPU see a hotplug when mux switching an external 
display; however, since eDP is currently treated as always connected by 
at least i915, we would need to at least make it possible for an eDP 
display to be "unplugged".


> So yeah, I am implying that having any side-band to access to the mux
> directly, bypassing the running display server, is a bad idea. Just
> like we do not allow non-DRM-master programs to set modes via KMS while
> a display server has DRM-master thinking it is controlling the displays.
>
> If it is useful for Xorg to lie to the X11 RandR clients, then ok, I
> don't care about that. That's up to Xorg. RandR itself is already a
> kind of a side-band for setting modes and whatnot behind the X11
> desktop environment's back. Wayland architecture does not have that
> problem, and I don't want that problem to appear either.


Yes, RandR is already  rug that many things are swept under. Using RandR 
as the abstraction point if one is desired makes sense to me.


> This optimization in general, not the mux toggling part, would be
> already extremely useful with eGPUs[1]. Assume you have a game rendering
> on eGPU and a display connected to the eGPU showing the game. A naive
> display server, who has a client rendering on an eGPU, will transfer
> the client frames to the iGPU for composition and then again back to
> the eGPU for display. If the client frame can be shown directly on the
> eGPU display, there is no need to transfer the frame back and forth
> over the bus. So I bet display servers will be gaining that
> optimization logic sooner or later (if they care about the eGPU use
> case), and it does not seem that making the same logic apply to mux
> switching would be too much work on top.
>
>
> Thanks,
> pq
>
> [1]https://gitlab.gnome.org/GNOME/mutter/-/issues/348
>
>> I think DRI3 render offload works a bit differently, but hopefully the
>> high-level concept is somewhat applicable to that framework as well.
>>
>> As for what should be controlling the muxing, I suppose that depends on
>> what you mean by controlling:
>>
>> If you mean controlling the mux device itself, that should be a platform
>> driver that offers an API to execute the mux switch itself. The existing
>> vga-switcheroo framework would be a natural fit, but it would need some
>> substantial changes in order to support this sort of use case. I've
>> described some of the challenges we've observed so far in my response to
>> Daniel Vetter.
>>
>> If you mean what should drive the policy of when automatic mux switches
>> occur, it would have to be something that is aware of what at least one
>> of the GPUs is displaying. It could be one of the GPU drivers, or a
>> client of the GPU drivers, e.g. X11 or a Wayland compositor.
>>
>> For the proof of concept experiments we are currently conducting, both
>> of these roles are currently performed by components of the NVIDIA
>> proprietary GPU stack, but the functionality could be moved to another
>> component (e.g. vga-switcheroo, X11, server-side GLVND, ???) if the
>> necessary functionality becomes supported in the future.
>>
>>
>>> BR,
>>> Jani.
>>>   
>>>> 2) Request that a mode that was previously driven on a disconnected
>>>> output be driven again upon reconnection.
>>>>
>>>> If APIs to do the above are already available, I wasn't able to find
>>>> information about them. These could be handled as separate APIs, e.g.,
>>>> one to set connected/disconnected state and another to restore an
>>>> output, or as a single API, e.g., signal a disconnect or reconnect,
>>>> leaving it up to the driver receiving the signal to set the appropriate
>>>> internal state and restore the reconnected output. Another possibility
>>>> would be an API to disable and enable individual outputs from outside of
>>>> the DRM-KMS driver that owns them. I'm curious to hear the thoughts of
>>>> the DRM subsystem maintainers and contributors on what the best approach
>>>> to this would be.
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel   
>>> --
>>> Jani Nikula, Intel Open Source Graphics Center

--------------36EAE6AB1555FBC80880F2F2
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html;
      charset=windows-1252">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 4/1/20 3:14 AM, Pekka Paalanen
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200401111434.4cbd998b@eldfell.localdomain">
      <pre class="moz-quote-pre" wrap="">On Tue, 31 Mar 2020 20:59:39 -0500
Daniel Dadap <a class="moz-txt-link-rfc2396E" href="mailto:ddadap@nvidia.com" moz-do-not-send="true">&lt;ddadap@nvidia.com&gt;</a> wrote:

</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap="">On 3/30/20 10:11 AM, Jani Nikula wrote:
</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">On Fri, 27 Mar 2020, Daniel Dadap <a class="moz-txt-link-rfc2396E" href="mailto:ddadap@nvidia.com" moz-do-not-send="true">&lt;ddadap@nvidia.com&gt;</a> wrote:  
</pre>
          <blockquote type="cite" style="color: #000000;">
            <pre class="moz-quote-pre" wrap="">A number of hybrid GPU notebook computer designs with dual (integrated
plus discrete) GPUs are equipped with multiplexers (muxes) that allow
display panels to be driven by either the integrated GPU or the discrete
GPU. Typically, this is a selection that can be made at boot time as a
menu option in the system firmware's setup screen, and the mux selection
stays fixed for as long as the system is running and persists across
reboots until it is explicitly changed. However, some muxed hybrid GPU
systems have dynamically switchable muxes which can be switched while
the system is running.

NVIDIA is exploring the possibility of taking advantage of dynamically
switchable muxes to enhance the experience of using a hybrid GPU system.
For example, on a system configured for PRIME render offloading, it may
be possible to keep the discrete GPU powered down and use the integrated
GPU for rendering and displaying the desktop when no applications are
using the discrete GPU, and dynamically switch the panel to be driven
directly by the discrete GPU when render-offloading a fullscreen
application.

We have been conducting some experiments on systems with dynamic muxes,
and have found some limitations that would need to be addressed in order
to support use cases like the one suggested above:

* In at least the i915 DRM-KMS driver, and likely in other DRM-KMS
drivers as well, eDP panels are assumed to be always connected. This
assumption is broken when the panel is muxed away, which can cause
problems. A typical symptom is i915 repeatedly attempting to retrain the
link, severely impacting system performance and printing messages like
the following every five seconds or so:

[drm:intel_dp_start_link_train [i915]] <b class="moz-txt-star"><span class="moz-txt-tag">*</span>ERROR<span class="moz-txt-tag">*</span></b> failed to enable link
training
[drm] Reducing the compressed framebuffer size. This may lead to less
power savings than a non-reduced-size. Try to increase stolen memory
size if available in BIOS.

This symptom might occur if something causes the DRM-KMS driver to probe
the display while it's muxed away, for example a modeset or DPMS state
change.

* When switching the mux back to a GPU that was previously driving a
mode, it is necessary to at the very least retrain DP links to restore
the previously displayed image. In a proof of concept I have been
experimenting with, I am able to accomplish this from userspace by
triggering DPMS off and then back on again; however, it would be good to
have an in-kernel API to request that an output owned by a DRM-KMS
driver be refreshed to resume driving a mode on a disconnected and
reconnected display. This API would need to be accessible from outside
of the DRM-KMS driver handling the output. One reason it would be good
to do this within the kernel, rather than rely on e.g. DPMS operations
in the xf86-video-modesetting driver, is that it would be useful for
restoring the console if X crashes or is forcefully killed while the mux
is switched to a GPU other than the one which drives the console.

Basically, we'd like to be able to do the following:

1) Communicate to a DRM-KMS driver that an output is disconnected and
can't be used. Ideally, DRI clients such as X should still see the
output as being connected, so user applications don't need to keep track
of the change.  
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">I think everything will be much easier if you provide a way for
userspace to control the muxing using the KMS API, and not lie to the
userspace about what's going on.

You're not actually saying what component you think should control the
muxing.

Why should the drivers keep telling the userspace the output is
connected when it's not? Obviously the userspace should also switch to
using a different output on a different GPU, right? Or are you planning
some proprietary behind the scenes hack for discrete?  
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">
The desire to lie to userspace is driven mainly by trying to avoid 
interactions from desktop environments / window managers reacting to the 
display going away. Many desktops will do things like try to migrate 
windows in response to a change in the current display configuration, 
and updating all of them to avoid doing so when a display appears to 
disappear from one GPU and reappear on another GPU seems harder than 
allowing userspace to believe that nothing has changed. I wouldn't mind 
if e.g. X drivers were in on the lie, and the lie boundary shifts to 
RandR, but it would be nice to avoid having to deal with the fallout of 
desktop environments handling displays apparently vanishing and 
re-appearing.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Hi,

I love the general idea of using the mux to optimize hardware usage,
but I really do not like the initial software design proposal.

I'm afraid that lying is going to lead to a disaster eventually, instead of
needing to fix a more obvious shortcoming in a simpler way today - or
rather, implementing a new feature taking advantage of the new
capabilities. Lying would lock the whole graphics stack to the single
design you thought of today, stopping any novel ways of using the
feature from appearing later.

Bypassing the desktop or the display server is practically always the
wrong design, whether it is this, color management, or whatever.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>That is fair. I regret expressing a lie to userspace as an ideal
      outcome in the initial message, as it's really secondary to the
      more important issues of needing to be able to disconnect the
      panel at a software level within the GPU driver and initiating a
      retrain when it's reconnected.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20200401111434.4cbd998b@eldfell.localdomain">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap="">The particular use case we're envisioning here is as follows:

* GPU A drives an X protocol screen which hosts a desktop session.
Applications are rendered on GPU A by default. The mux is switched to 
GPU A by default.
* GPU B drives a GPU screen that can be used as a PRIME render offload 
source. Applications rendered on GPU B can run in windows presented by 
GPU A via PRIME render offloading.
* If an application rendered on GPU B and presented on GPU A becomes 
fullscreen, the mux can switch to GPU B and GPU B can present the 
application directly for as long as the application remains in the 
foreground and fullscreen.
* The mux switches back to GPU A and the application presents via GPU A 
and render offloading if it transitions to a window or another window 
occludes it.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">I do not see how you could ever pull that off without patching all
display servers to specifically support that use case (think of Wayland
architecture here). When the mux is switched, the userspace also needs
to switch posting DRM FBs from DRM KMS device A to DRM KMS device B.

What you describe is totally fine for a Wayland display server to do
automatically, and in the Wayland architecture there really is no other
component that could even attempt to do it. In fact, a Wayland
display server is the only component in the architecture that actually
needs to do anything about it to make it work. Your use case is a
perfect fit in the Wayland architecture, if the mux is controlled
exclusively by the display server and no-one lies.

My suggestion is to just trigger the exact same hotplug actions that
physically disconnecting a display cable from one card and plugging it
into another card does already. It's not like that is going to ever
happen beyond a display server's back, it is the display server itself
toggling the mux, so it knows to handle it right. What the display
server <b class="moz-txt-star"><span class="moz-txt-tag">*</span>does<span class="moz-txt-tag">*</span></b> need to know before-hand is exactly which connectors the
mux affects.
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>That should be trivial for external displays, and in fact I have
      observed some designs which make the muxed-away from GPU see a hot
      unplug and the muxed-to GPU see a hotplug when mux switching an
      external display; however, since eDP is currently treated as
      always connected by at least i915, we would need to at least make
      it possible for an eDP display to be "unplugged".<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20200401111434.4cbd998b@eldfell.localdomain">
      <pre class="moz-quote-pre" wrap="">
So yeah, I am implying that having any side-band to access to the mux
directly, bypassing the running display server, is a bad idea. Just
like we do not allow non-DRM-master programs to set modes via KMS while
a display server has DRM-master thinking it is controlling the displays.

If it is useful for Xorg to lie to the X11 RandR clients, then ok, I
don't care about that. That's up to Xorg. RandR itself is already a
kind of a side-band for setting modes and whatnot behind the X11
desktop environment's back. Wayland architecture does not have that
problem, and I don't want that problem to appear either.
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>Yes, RandR is already  rug that many things are swept under.
      Using RandR as the abstraction point if one is desired makes sense
      to me.<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20200401111434.4cbd998b@eldfell.localdomain">
      <pre class="moz-quote-pre" wrap="">
This optimization in general, not the mux toggling part, would be
already extremely useful with eGPUs[1]. Assume you have a game rendering
on eGPU and a display connected to the eGPU showing the game. A naive
display server, who has a client rendering on an eGPU, will transfer
the client frames to the iGPU for composition and then again back to
the eGPU for display. If the client frame can be shown directly on the
eGPU display, there is no need to transfer the frame back and forth
over the bus. So I bet display servers will be gaining that
optimization logic sooner or later (if they care about the eGPU use
case), and it does not seem that making the same logic apply to mux
switching would be too much work on top.


Thanks,
pq

[1] <a class="moz-txt-link-freetext" href="https://gitlab.gnome.org/GNOME/mutter/-/issues/348" moz-do-not-send="true">https://gitlab.gnome.org/GNOME/mutter/-/issues/348</a>

</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre class="moz-quote-pre" wrap="">I think DRI3 render offload works a bit differently, but hopefully the 
high-level concept is somewhat applicable to that framework as well.

As for what should be controlling the muxing, I suppose that depends on 
what you mean by controlling:

If you mean controlling the mux device itself, that should be a platform 
driver that offers an API to execute the mux switch itself. The existing 
vga-switcheroo framework would be a natural fit, but it would need some 
substantial changes in order to support this sort of use case. I've 
described some of the challenges we've observed so far in my response to 
Daniel Vetter.

If you mean what should drive the policy of when automatic mux switches 
occur, it would have to be something that is aware of what at least one 
of the GPUs is displaying. It could be one of the GPU drivers, or a 
client of the GPU drivers, e.g. X11 or a Wayland compositor.

For the proof of concept experiments we are currently conducting, both 
of these roles are currently performed by components of the NVIDIA 
proprietary GPU stack, but the functionality could be moved to another 
component (e.g. vga-switcheroo, X11, server-side GLVND, ???) if the 
necessary functionality becomes supported in the future.


</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre class="moz-quote-pre" wrap="">BR,
Jani.
 
</pre>
          <blockquote type="cite" style="color: #000000;">
            <pre class="moz-quote-pre" wrap="">2) Request that a mode that was previously driven on a disconnected
output be driven again upon reconnection.

If APIs to do the above are already available, I wasn't able to find
information about them. These could be handled as separate APIs, e.g.,
one to set connected/disconnected state and another to restore an
output, or as a single API, e.g., signal a disconnect or reconnect,
leaving it up to the driver receiving the signal to set the appropriate
internal state and restore the reconnected output. Another possibility
would be an API to disable and enable individual outputs from outside of
the DRM-KMS driver that owns them. I'm curious to hear the thoughts of
the DRM subsystem maintainers and contributors on what the best approach
to this would be.

_______________________________________________
dri-devel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:dri-devel@lists.freedesktop.org" moz-do-not-send="true">dri-devel@lists.freedesktop.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/dri-devel" moz-do-not-send="true">https://lists.freedesktop.org/mailman/listinfo/dri-devel</a>  
</pre>
          </blockquote>
          <pre class="moz-quote-pre" wrap="">--
Jani Nikula, Intel Open Source Graphics Center  
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------36EAE6AB1555FBC80880F2F2--

--===============0427000871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0427000871==--
