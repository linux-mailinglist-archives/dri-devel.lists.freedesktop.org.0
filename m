Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE99619A592
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 08:46:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD506E8D8;
	Wed,  1 Apr 2020 06:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0526E8D8
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 06:46:46 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id l22so21232143oii.12
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 23:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MM/pkEQ0qd3t8BaqLI58Pzx0iN49ajzySpjGsXbkRXM=;
 b=MRYRuWPXPblWZ8Ag2d9xi6+ZUjC/XAL2SAoLeo4QmQ3LQsVbsHpZGYD0fIEm20uoym
 /nOVPgYkCOCa19YOZ98TC02TWrKf3gVZvMs8ZxhCd10z8+VJJC5dC8t2zDqOQaWR17UF
 qRAJny4EKE9xzwoeGiM3IVO7mTq04TsAm6Ggs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MM/pkEQ0qd3t8BaqLI58Pzx0iN49ajzySpjGsXbkRXM=;
 b=OuaeNy5hFrXDqsOfF+sXKTxYiQDtL56ZNNiiPqb+onC0tr+YsfGedLBfA6E8+63x7q
 wigGdBxwSVBrusByL+dyxHGEFTcIZMGUsyqVzePEWpb7coEeODvLK5TXDJRQkwbxhZMy
 w3YJep+9l/3sbyuXbddP+P/Y/uiuMFLLr7tuliFF4fBJzWXUqc6lOgpc1bby3dKkZBP0
 RdWU/aHZloj4NRHZUgFIXL9P/OygZIO6KpQnLbqVL8Qkj40L0CBXYzmnqzjTMPhPHnJw
 vK43824x9lg+P0TSzxbbK7cz/ZHj5HynEQ1twMi9Kp5NgdlTilgHv+xPtvsiAHTc82Vh
 czYg==
X-Gm-Message-State: AGi0PuaYirfA0dKkfDaBy/p2z+hQ1jyofdv+HkSWmWZuuDjZ109w8Z7l
 qI52S53haI945+bZSEM3vC+eLFAaaUfQD/zpYS/tKQ==
X-Google-Smtp-Source: APiQypKVcWf9BCj7POi/ebES/e0gAEts2+15T9t/l4kNE7BuXB6bXPegz/9U4sx97hgs5l8+UbrqFOZCvwwQt7hIkMo=
X-Received: by 2002:aca:aac1:: with SMTP id t184mr1817008oie.14.1585723605647; 
 Tue, 31 Mar 2020 23:46:45 -0700 (PDT)
MIME-Version: 1.0
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <CAKMK7uF8cX9ie5DPCNkCr1CCWqFjXBbsW7+Ode3ioM64spMojw@mail.gmail.com>
 <3057b60b-4526-2d52-b551-d4769fe97c7b@nvidia.com>
In-Reply-To: <3057b60b-4526-2d52-b551-d4769fe97c7b@nvidia.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 1 Apr 2020 08:46:34 +0200
Message-ID: <CAKMK7uGbNpjS3YruzF9KjFneMDzdYBHWD_ehnQKPjd+UBmc=OA@mail.gmail.com>
Subject: Re: How to handle disconnection of eDP panels due to dynamic display
 mux switches
To: Daniel Dadap <ddadap@nvidia.com>
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 1, 2020 at 3:58 AM Daniel Dadap <ddadap@nvidia.com> wrote:
> On 3/31/20 2:32 AM, Daniel Vetter wrote:
> > Since I see no mention of this anywhere in your mail ... have you
> > tried looking at drivers/gpu/vga/vga_switcheroo.c? This also supports
> > switching of just outputs, not just the old optimus way of switching
> > out the entire gpu and having to disable the other one.
>
>
> We did look into vga-switcheroo while developing our PoC, but found it
> insufficient for supporting the use case we had in mind in its current
> form. Among the limitations we observed were that it didn't seem to be
> possible to switch with output-level granularity, only with gpu-level
> granularity, with the whole switched-away-to GPU being powered down.
> Your description suggests that this is indeed possible, but if that's
> the case, then the mechanism for doing so isn't obvious in what I can
> see of the API from the kernel source code, even in the drm-next tree.
> Do you have pointers to documentation on how the per-output switching is
> supposed to work?

I think the per-output switch isn't support (yet), but otherwise there
should be two modes:
- power switch mode, other gpu has to be offlined. This also means
switching needs to wait until all the clients are shut down.
- output switching only. That seems to be roughly what you want,
except you want to switch more than just the integrated panel. I think
all models thus far simply wired all external outputs to the dgpu
always.

I primarily asked about vgaswitcheroo since you didn't mention it at all.

> Other limitations of vga-switcheroo included:
>
> * The can_switch() callbacks for all current vga-switcheroo-capable GPU
> drivers don't seem to allow for a switch to occur while there are active
> KMS clients. This has the effect of making it so that non-deferred
> switches can only be initiated under the same circumstances that
> deferred switches wait for.
> * It's only possible to address one mux device. Some systems have
> separate muxes for internal and external displays. From what I could see
> in existing vga-switcheroo mux handlers, it seems that multi-muxed
> systems just switch all of the muxes simultaneously, which makes sense
> for the all-or-nothing "power down the GPU not in use" approach, but
> might not be desirable for fine-grained output-level switching.
> * On some systems, it's possible to put the panel into a self-refresh
> mode before switching the mux and exit self-refresh mode after
> switching, to hide any glitches that might otherwise appear while
> transitioning. Additional handler callbacks for pre-switch and
> post-switch operations would be useful.
>
> If vga-switcheroo could be updated to address these limitatons, then it
> could make sense to handle the display disconnect/connect notifications
> and display refreshing as part of a vga_switcheroo client driver's
> set_gpu_state() callback (or a finer-grained per-output callback);
> however, it also seems that it should be possible to implement APIs
> within the DRM subsystem to accomplish the desired functionality
> independently of current or future vga-switcheroo design.

vgaswitcheroo was written by Dave Airlie, doesn't get much more
"within the gpu subsystem". I think we should look into extending
vgaswitcheroo instead of inventing a completely new uapi. If we go
with a simplified use-case of
- only integrated panel switches
- external output on the dgpu
then that should match existing systems, so you get support on at
least some desktops for free. Plus no headaches about userspace we
need for merging new uapi. Once we have that (for your mux, and I
guess with i915+nouveau all working) then we can look into how to
extend it, or give the same underlying stuff an interface that's not
in debugfs :-)

Also for your seamless switching with self-refresh this could be
implemented without new userspace, greatly simplifying everything.

Cheers, Daniel

> > There's some rough corners (like the uapi doesn't exist, it's in
> > debugfs), and the locking has an inversion problem (I have ideas), but
> > generally what you want exists already.
> > -Daniel
> >
> > On Mon, Mar 30, 2020 at 9:12 AM Daniel Dadap <ddadap@nvidia.com> wrote:
> >> A number of hybrid GPU notebook computer designs with dual (integrated
> >> plus discrete) GPUs are equipped with multiplexers (muxes) that allow
> >> display panels to be driven by either the integrated GPU or the discrete
> >> GPU. Typically, this is a selection that can be made at boot time as a
> >> menu option in the system firmware's setup screen, and the mux selection
> >> stays fixed for as long as the system is running and persists across
> >> reboots until it is explicitly changed. However, some muxed hybrid GPU
> >> systems have dynamically switchable muxes which can be switched while
> >> the system is running.
> >>
> >> NVIDIA is exploring the possibility of taking advantage of dynamically
> >> switchable muxes to enhance the experience of using a hybrid GPU system.
> >> For example, on a system configured for PRIME render offloading, it may
> >> be possible to keep the discrete GPU powered down and use the integrated
> >> GPU for rendering and displaying the desktop when no applications are
> >> using the discrete GPU, and dynamically switch the panel to be driven
> >> directly by the discrete GPU when render-offloading a fullscreen
> >> application.
> >>
> >> We have been conducting some experiments on systems with dynamic muxes,
> >> and have found some limitations that would need to be addressed in order
> >> to support use cases like the one suggested above:
> >>
> >> * In at least the i915 DRM-KMS driver, and likely in other DRM-KMS
> >> drivers as well, eDP panels are assumed to be always connected. This
> >> assumption is broken when the panel is muxed away, which can cause
> >> problems. A typical symptom is i915 repeatedly attempting to retrain the
> >> link, severely impacting system performance and printing messages like
> >> the following every five seconds or so:
> >>
> >> [drm:intel_dp_start_link_train [i915]] *ERROR* failed to enable link
> >> training
> >> [drm] Reducing the compressed framebuffer size. This may lead to less
> >> power savings than a non-reduced-size. Try to increase stolen memory
> >> size if available in BIOS.
> >>
> >> This symptom might occur if something causes the DRM-KMS driver to probe
> >> the display while it's muxed away, for example a modeset or DPMS state
> >> change.
> >>
> >> * When switching the mux back to a GPU that was previously driving a
> >> mode, it is necessary to at the very least retrain DP links to restore
> >> the previously displayed image. In a proof of concept I have been
> >> experimenting with, I am able to accomplish this from userspace by
> >> triggering DPMS off and then back on again; however, it would be good to
> >> have an in-kernel API to request that an output owned by a DRM-KMS
> >> driver be refreshed to resume driving a mode on a disconnected and
> >> reconnected display. This API would need to be accessible from outside
> >> of the DRM-KMS driver handling the output. One reason it would be good
> >> to do this within the kernel, rather than rely on e.g. DPMS operations
> >> in the xf86-video-modesetting driver, is that it would be useful for
> >> restoring the console if X crashes or is forcefully killed while the mux
> >> is switched to a GPU other than the one which drives the console.
> >>
> >> Basically, we'd like to be able to do the following:
> >>
> >> 1) Communicate to a DRM-KMS driver that an output is disconnected and
> >> can't be used. Ideally, DRI clients such as X should still see the
> >> output as being connected, so user applications don't need to keep track
> >> of the change.
> >> 2) Request that a mode that was previously driven on a disconnected
> >> output be driven again upon reconnection.
> >>
> >> If APIs to do the above are already available, I wasn't able to find
> >> information about them. These could be handled as separate APIs, e.g.,
> >> one to set connected/disconnected state and another to restore an
> >> output, or as a single API, e.g., signal a disconnect or reconnect,
> >> leaving it up to the driver receiving the signal to set the appropriate
> >> internal state and restore the reconnected output. Another possibility
> >> would be an API to disable and enable individual outputs from outside of
> >> the DRM-KMS driver that owns them. I'm curious to hear the thoughts of
> >> the DRM subsystem maintainers and contributors on what the best approach
> >> to this would be.
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > +41 (0) 79 365 57 48 - http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
