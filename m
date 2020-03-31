Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F54C198CFA
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 424876E558;
	Tue, 31 Mar 2020 07:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8306E558
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 07:32:55 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id a49so21011743otc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8UUDf4P4I0YYKAHtbPa6viyVvFcq6Rz5CJC5PoibdyU=;
 b=hU/W6odRdFsyMiowo3/qL3cYgFuv8n40RG2iuZ2MIo8uXzDVOmorQD+wplBTwZh7Wg
 Ixfpe7QI5QIxT5VdYCgkBzkFkYwfXCbS4t0S+Ef5tkIcJYN8mC4k631kM7mEQBoUXqD9
 tMjeHBne8/taaHM/aZDnM6mWS00He9cf6990w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8UUDf4P4I0YYKAHtbPa6viyVvFcq6Rz5CJC5PoibdyU=;
 b=ohV1f9hWr4fObMV7lEQPwm2viMKoWZmSr3wuqsIVegcmCq2mcnTEytCW7brqO6pwxH
 0Cr+cllqO6k3+9CHRtZoDrXZJAUCi1cAREBapsD6vRWXl/bf2F3WfaJxj6l1iiiLOFFZ
 53CsArFvfISNV+Olcmca0ePXDiivY7Q/FWvBSJ0nAc5qm7SfJTBC8192/o8P3xetawCT
 CtIu+RloLxQAGBSNznmHTsBWmKzgr4TaidyWLBiHjHCA9F8+lcU2tcwjMzOB5SpVvPK+
 9t7ISyOkSLJqBbEAOqcJZ4O4CPGH8O0TSxlEDvWaBo0DZxNnjJE95WpWP3qSzf8KGsG7
 hrvg==
X-Gm-Message-State: ANhLgQ0uToaX0SH2O7x9ySxsW62NQ1egyCJ7S0uHW5Qsv8fa/irHFcqw
 JxTUOplQVTJgxA50ziUoMWH6m1W6IVfmcSbS9BEm3w==
X-Google-Smtp-Source: ADFU+vvnMmTqCYhfZwD7CZdyHhUuF79XyAOH9IAvUd4bggpE/6K3++Gp9HbCYLTNsmFE3kS2Z1cD9MaAayibm8qjhcU=
X-Received: by 2002:a9d:6e8f:: with SMTP id a15mr7933944otr.188.1585639974637; 
 Tue, 31 Mar 2020 00:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
In-Reply-To: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Tue, 31 Mar 2020 09:32:43 +0200
Message-ID: <CAKMK7uF8cX9ie5DPCNkCr1CCWqFjXBbsW7+Ode3ioM64spMojw@mail.gmail.com>
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

Since I see no mention of this anywhere in your mail ... have you
tried looking at drivers/gpu/vga/vga_switcheroo.c? This also supports
switching of just outputs, not just the old optimus way of switching
out the entire gpu and having to disable the other one.

There's some rough corners (like the uapi doesn't exist, it's in
debugfs), and the locking has an inversion problem (I have ideas), but
generally what you want exists already.
-Daniel

On Mon, Mar 30, 2020 at 9:12 AM Daniel Dadap <ddadap@nvidia.com> wrote:
>
> A number of hybrid GPU notebook computer designs with dual (integrated
> plus discrete) GPUs are equipped with multiplexers (muxes) that allow
> display panels to be driven by either the integrated GPU or the discrete
> GPU. Typically, this is a selection that can be made at boot time as a
> menu option in the system firmware's setup screen, and the mux selection
> stays fixed for as long as the system is running and persists across
> reboots until it is explicitly changed. However, some muxed hybrid GPU
> systems have dynamically switchable muxes which can be switched while
> the system is running.
>
> NVIDIA is exploring the possibility of taking advantage of dynamically
> switchable muxes to enhance the experience of using a hybrid GPU system.
> For example, on a system configured for PRIME render offloading, it may
> be possible to keep the discrete GPU powered down and use the integrated
> GPU for rendering and displaying the desktop when no applications are
> using the discrete GPU, and dynamically switch the panel to be driven
> directly by the discrete GPU when render-offloading a fullscreen
> application.
>
> We have been conducting some experiments on systems with dynamic muxes,
> and have found some limitations that would need to be addressed in order
> to support use cases like the one suggested above:
>
> * In at least the i915 DRM-KMS driver, and likely in other DRM-KMS
> drivers as well, eDP panels are assumed to be always connected. This
> assumption is broken when the panel is muxed away, which can cause
> problems. A typical symptom is i915 repeatedly attempting to retrain the
> link, severely impacting system performance and printing messages like
> the following every five seconds or so:
>
> [drm:intel_dp_start_link_train [i915]] *ERROR* failed to enable link
> training
> [drm] Reducing the compressed framebuffer size. This may lead to less
> power savings than a non-reduced-size. Try to increase stolen memory
> size if available in BIOS.
>
> This symptom might occur if something causes the DRM-KMS driver to probe
> the display while it's muxed away, for example a modeset or DPMS state
> change.
>
> * When switching the mux back to a GPU that was previously driving a
> mode, it is necessary to at the very least retrain DP links to restore
> the previously displayed image. In a proof of concept I have been
> experimenting with, I am able to accomplish this from userspace by
> triggering DPMS off and then back on again; however, it would be good to
> have an in-kernel API to request that an output owned by a DRM-KMS
> driver be refreshed to resume driving a mode on a disconnected and
> reconnected display. This API would need to be accessible from outside
> of the DRM-KMS driver handling the output. One reason it would be good
> to do this within the kernel, rather than rely on e.g. DPMS operations
> in the xf86-video-modesetting driver, is that it would be useful for
> restoring the console if X crashes or is forcefully killed while the mux
> is switched to a GPU other than the one which drives the console.
>
> Basically, we'd like to be able to do the following:
>
> 1) Communicate to a DRM-KMS driver that an output is disconnected and
> can't be used. Ideally, DRI clients such as X should still see the
> output as being connected, so user applications don't need to keep track
> of the change.
> 2) Request that a mode that was previously driven on a disconnected
> output be driven again upon reconnection.
>
> If APIs to do the above are already available, I wasn't able to find
> information about them. These could be handled as separate APIs, e.g.,
> one to set connected/disconnected state and another to restore an
> output, or as a single API, e.g., signal a disconnect or reconnect,
> leaving it up to the driver receiving the signal to set the appropriate
> internal state and restore the reconnected output. Another possibility
> would be an API to disable and enable individual outputs from outside of
> the DRM-KMS driver that owns them. I'm curious to hear the thoughts of
> the DRM subsystem maintainers and contributors on what the best approach
> to this would be.
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
