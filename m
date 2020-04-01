Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A6019A6ED
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 10:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B8E6E040;
	Wed,  1 Apr 2020 08:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50E316E040
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 08:14:40 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id n20so19620385lfl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 01:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=6FpBlEbywpYAX9Wf8DfqRDpVk4osNS3gO9FQI4grr1o=;
 b=UovPayUt+09vPbxOjsRQcZwsA8CpIeF3m0JFJK26ShWoG39lJlSiITXwcO7XXsVjsg
 gBotNDqGJGEXICp7oFWkHalmyQfCnteSoA/W/3wN2joPZGgODSSARFqvZj8TLIbd7b9W
 vgDri84ITajEYxg2q5UgLJXnQWtoJbNGlGnqR/3yNXPlM7pnA9bLEyAfZQ3yy8QxmvPS
 wXsYArqyYgUIfLDB3Pxx0x65uetVIBsLJBGCNAb85LdDQ4RcoqqqZNRskvIWtq5Tm16u
 lkPSA4AJoEWGpx9tZ7ryQQjSwV9SMDmdnYUXsKM6DJmOm0nQ3TTtn0CLHKW19ULpJgiq
 2A2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=6FpBlEbywpYAX9Wf8DfqRDpVk4osNS3gO9FQI4grr1o=;
 b=F/3bzjvp9qgzce2YCGfscR3xd/O2yMhEPI5WJCAk50zzBpTSxP3mR2chSLqS9IQSUT
 34L28ijWePpQzENEswXRUs+naKYCtPxWJAstrOl9JOmzk1IvqHnexoibMZn1efKdczt8
 vwlC87zHKAEzlBJV6/1SxCpybU8IvrDpj9gilPez9ooVqSXgaGGJSC2+e+JvanNmLjpG
 kYo04FsPVtovbN7OqCrURQ33SL6kp7YfcS1hxnVS1uRpj9SjGlPY7HvZFTGvKxoG6GPY
 OBOqIUc7LQiFndwFIffoMd6zU1zI6S2FLY2zOZPFnNZv0lGxxW9oZeBqjsiqH1kjPIr7
 MmFw==
X-Gm-Message-State: AGi0Pua2GufOPCWdvLczPHdpzI5H+WIYLeJWHtllE3084fowHiDZkcZx
 CO572/OXfpOjat67k4LTWiI=
X-Google-Smtp-Source: APiQypJYCFrq7qVffDzRhHTx84qUqy/MGLzGiaxcAs6fRA0iIzdAt6hgYJIPVOxdauPWp4qFK9PT4A==
X-Received: by 2002:a19:4f01:: with SMTP id d1mr14457872lfb.182.1585728878400; 
 Wed, 01 Apr 2020 01:14:38 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j22sm1032766lfg.96.2020.04.01.01.14.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 01:14:38 -0700 (PDT)
Date: Wed, 1 Apr 2020 11:14:34 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Daniel Dadap <ddadap@nvidia.com>
Subject: Re: How to handle disconnection of eDP panels due to dynamic
 display mux switches
Message-ID: <20200401111434.4cbd998b@eldfell.localdomain>
In-Reply-To: <0b49427d-325b-d248-1b9b-421af6ecb8f9@nvidia.com>
References: <956fd624-e1f5-e2a0-90de-9a5f2934547d@nvidia.com>
 <874ku5ho77.fsf@intel.com>
 <0b49427d-325b-d248-1b9b-421af6ecb8f9@nvidia.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============1446559794=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1446559794==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ZWBs3JjdIJo7wlnrLxqbbrh"; protocol="application/pgp-signature"

--Sig_/ZWBs3JjdIJo7wlnrLxqbbrh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 31 Mar 2020 20:59:39 -0500
Daniel Dadap <ddadap@nvidia.com> wrote:

> On 3/30/20 10:11 AM, Jani Nikula wrote:
> > On Fri, 27 Mar 2020, Daniel Dadap <ddadap@nvidia.com> wrote: =20
> >> A number of hybrid GPU notebook computer designs with dual (integrated
> >> plus discrete) GPUs are equipped with multiplexers (muxes) that allow
> >> display panels to be driven by either the integrated GPU or the discre=
te
> >> GPU. Typically, this is a selection that can be made at boot time as a
> >> menu option in the system firmware's setup screen, and the mux selecti=
on
> >> stays fixed for as long as the system is running and persists across
> >> reboots until it is explicitly changed. However, some muxed hybrid GPU
> >> systems have dynamically switchable muxes which can be switched while
> >> the system is running.
> >>
> >> NVIDIA is exploring the possibility of taking advantage of dynamically
> >> switchable muxes to enhance the experience of using a hybrid GPU syste=
m.
> >> For example, on a system configured for PRIME render offloading, it may
> >> be possible to keep the discrete GPU powered down and use the integrat=
ed
> >> GPU for rendering and displaying the desktop when no applications are
> >> using the discrete GPU, and dynamically switch the panel to be driven
> >> directly by the discrete GPU when render-offloading a fullscreen
> >> application.
> >>
> >> We have been conducting some experiments on systems with dynamic muxes,
> >> and have found some limitations that would need to be addressed in ord=
er
> >> to support use cases like the one suggested above:
> >>
> >> * In at least the i915 DRM-KMS driver, and likely in other DRM-KMS
> >> drivers as well, eDP panels are assumed to be always connected. This
> >> assumption is broken when the panel is muxed away, which can cause
> >> problems. A typical symptom is i915 repeatedly attempting to retrain t=
he
> >> link, severely impacting system performance and printing messages like
> >> the following every five seconds or so:
> >>
> >> [drm:intel_dp_start_link_train [i915]] *ERROR* failed to enable link
> >> training
> >> [drm] Reducing the compressed framebuffer size. This may lead to less
> >> power savings than a non-reduced-size. Try to increase stolen memory
> >> size if available in BIOS.
> >>
> >> This symptom might occur if something causes the DRM-KMS driver to pro=
be
> >> the display while it's muxed away, for example a modeset or DPMS state
> >> change.
> >>
> >> * When switching the mux back to a GPU that was previously driving a
> >> mode, it is necessary to at the very least retrain DP links to restore
> >> the previously displayed image. In a proof of concept I have been
> >> experimenting with, I am able to accomplish this from userspace by
> >> triggering DPMS off and then back on again; however, it would be good =
to
> >> have an in-kernel API to request that an output owned by a DRM-KMS
> >> driver be refreshed to resume driving a mode on a disconnected and
> >> reconnected display. This API would need to be accessible from outside
> >> of the DRM-KMS driver handling the output. One reason it would be good
> >> to do this within the kernel, rather than rely on e.g. DPMS operations
> >> in the xf86-video-modesetting driver, is that it would be useful for
> >> restoring the console if X crashes or is forcefully killed while the m=
ux
> >> is switched to a GPU other than the one which drives the console.
> >>
> >> Basically, we'd like to be able to do the following:
> >>
> >> 1) Communicate to a DRM-KMS driver that an output is disconnected and
> >> can't be used. Ideally, DRI clients such as X should still see the
> >> output as being connected, so user applications don't need to keep tra=
ck
> >> of the change. =20
> > I think everything will be much easier if you provide a way for
> > userspace to control the muxing using the KMS API, and not lie to the
> > userspace about what's going on.
> >
> > You're not actually saying what component you think should control the
> > muxing.
> >
> > Why should the drivers keep telling the userspace the output is
> > connected when it's not? Obviously the userspace should also switch to
> > using a different output on a different GPU, right? Or are you planning
> > some proprietary behind the scenes hack for discrete? =20
>=20
>=20
> The desire to lie to userspace is driven mainly by trying to avoid=20
> interactions from desktop environments / window managers reacting to the=
=20
> display going away. Many desktops will do things like try to migrate=20
> windows in response to a change in the current display configuration,=20
> and updating all of them to avoid doing so when a display appears to=20
> disappear from one GPU and reappear on another GPU seems harder than=20
> allowing userspace to believe that nothing has changed. I wouldn't mind=20
> if e.g. X drivers were in on the lie, and the lie boundary shifts to=20
> RandR, but it would be nice to avoid having to deal with the fallout of=20
> desktop environments handling displays apparently vanishing and=20
> re-appearing.

Hi,

I love the general idea of using the mux to optimize hardware usage,
but I really do not like the initial software design proposal.

I'm afraid that lying is going to lead to a disaster eventually, instead of
needing to fix a more obvious shortcoming in a simpler way today - or
rather, implementing a new feature taking advantage of the new
capabilities. Lying would lock the whole graphics stack to the single
design you thought of today, stopping any novel ways of using the
feature from appearing later.

Bypassing the desktop or the display server is practically always the
wrong design, whether it is this, color management, or whatever.

> The particular use case we're envisioning here is as follows:
>=20
> * GPU A drives an X protocol screen which hosts a desktop session.
> Applications are rendered on GPU A by default. The mux is switched to=20
> GPU A by default.
> * GPU B drives a GPU screen that can be used as a PRIME render offload=20
> source. Applications rendered on GPU B can run in windows presented by=20
> GPU A via PRIME render offloading.
> * If an application rendered on GPU B and presented on GPU A becomes=20
> fullscreen, the mux can switch to GPU B and GPU B can present the=20
> application directly for as long as the application remains in the=20
> foreground and fullscreen.
> * The mux switches back to GPU A and the application presents via GPU A=20
> and render offloading if it transitions to a window or another window=20
> occludes it.

I do not see how you could ever pull that off without patching all
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
server *does* need to know before-hand is exactly which connectors the
mux affects.

So yeah, I am implying that having any side-band to access to the mux
directly, bypassing the running display server, is a bad idea. Just
like we do not allow non-DRM-master programs to set modes via KMS while
a display server has DRM-master thinking it is controlling the displays.

If it is useful for Xorg to lie to the X11 RandR clients, then ok, I
don't care about that. That's up to Xorg. RandR itself is already a
kind of a side-band for setting modes and whatnot behind the X11
desktop environment's back. Wayland architecture does not have that
problem, and I don't want that problem to appear either.

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

[1] https://gitlab.gnome.org/GNOME/mutter/-/issues/348

> I think DRI3 render offload works a bit differently, but hopefully the=20
> high-level concept is somewhat applicable to that framework as well.
>=20
> As for what should be controlling the muxing, I suppose that depends on=20
> what you mean by controlling:
>=20
> If you mean controlling the mux device itself, that should be a platform=
=20
> driver that offers an API to execute the mux switch itself. The existing=
=20
> vga-switcheroo framework would be a natural fit, but it would need some=20
> substantial changes in order to support this sort of use case. I've=20
> described some of the challenges we've observed so far in my response to=
=20
> Daniel Vetter.
>=20
> If you mean what should drive the policy of when automatic mux switches=20
> occur, it would have to be something that is aware of what at least one=20
> of the GPUs is displaying. It could be one of the GPU drivers, or a=20
> client of the GPU drivers, e.g. X11 or a Wayland compositor.
>=20
> For the proof of concept experiments we are currently conducting, both=20
> of these roles are currently performed by components of the NVIDIA=20
> proprietary GPU stack, but the functionality could be moved to another=20
> component (e.g. vga-switcheroo, X11, server-side GLVND, ???) if the=20
> necessary functionality becomes supported in the future.
>=20
>=20
> > BR,
> > Jani.
> > =20
> >> 2) Request that a mode that was previously driven on a disconnected
> >> output be driven again upon reconnection.
> >>
> >> If APIs to do the above are already available, I wasn't able to find
> >> information about them. These could be handled as separate APIs, e.g.,
> >> one to set connected/disconnected state and another to restore an
> >> output, or as a single API, e.g., signal a disconnect or reconnect,
> >> leaving it up to the driver receiving the signal to set the appropriate
> >> internal state and restore the reconnected output. Another possibility
> >> would be an API to disable and enable individual outputs from outside =
of
> >> the DRM-KMS driver that owns them. I'm curious to hear the thoughts of
> >> the DRM subsystem maintainers and contributors on what the best approa=
ch
> >> to this would be.
> >>
> >> _______________________________________________
> >> dri-devel mailing list
> >> dri-devel@lists.freedesktop.org
> >> https://lists.freedesktop.org/mailman/listinfo/dri-devel =20
> > --
> > Jani Nikula, Intel Open Source Graphics Center =20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel


--Sig_/ZWBs3JjdIJo7wlnrLxqbbrh
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl6ETWoACgkQI1/ltBGq
qqcAZA//VhAg9GyvLQ6b35bTcbjQrgN4JgVLjfI9WzCvjY2+SRjHxi5HgwbN6Ehx
DrXfF9OxShGNU7t9Ggik5zdGzKOgexCaKEZ9Krqj5nhkN58sI+kwMQnf2n3BPhkF
JW1fCNrqnWXTiTJNMlgAq9fqo9QWwqWxXpXRCyliw5omZk3278d0Y/YM0pFQW6Do
0z0we0pWO8m6AJQusQ7JOjQlr9WBu/8RE4D4JmdNMCjkN1ELAYH5W0L66i4fyzNa
FZpxm0sVbmVmn3kkLuzwA18ZqwH3J3wrCrkJlzveerwxdsYzYIiuRyGy2SI3e3Q7
78krP1NSnxGgPYBXnD8r6Np20I+MossMCmOW9leUh4uqqzSMFH9CGQM4VenTq1u/
oPlQtW45sffO2GHKrdBZwpIKHIOM0Z9HYR3frOhlgjXXLIE2iZR6ISDtz+aVAUPM
LTPDD1JTqOieuLYzkT29HZ+VspTQhE+41Gx8Ave7c1JShxK7816964tp3hvRy6By
lPYVE4hVCHKP1coqDDf6X5oRXYilYe6vLoYDsoClXITNrqruepEv7qzSJdjtW+3s
56r8hXq4MgqE1FDfIf5++WfDnVq3RgaGB2ZWIwcgRWWFT1+Ed8lpzKmqI9nkJowN
MLF5dhjV+AL40fUorRWVxZiz6VxCqmDRdjTW8V0rXB128ftRXic=
=iTRi
-----END PGP SIGNATURE-----

--Sig_/ZWBs3JjdIJo7wlnrLxqbbrh--

--===============1446559794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1446559794==--
