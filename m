Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045C618872B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 15:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4446E17B;
	Tue, 17 Mar 2020 14:16:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x942.google.com (mail-ua1-x942.google.com
 [IPv6:2607:f8b0:4864:20::942])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3357089F19;
 Mon, 16 Mar 2020 15:33:42 +0000 (UTC)
Received: by mail-ua1-x942.google.com with SMTP id a33so6676000uad.11;
 Mon, 16 Mar 2020 08:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=OOpKdMuO0bDghAl1po0Af4aim/SSjCkrie/0/cp73lU=;
 b=D6F8C/Le+ytFWnA5GJQsHEBX1s5QJUr0lipoYlUvpDIB+X4tHiEePVLO7ijdzAFtWm
 6LSWJOKxcds+uu8EBPDBt+MMxHn4WY2MaLonQj6aG+NLl7wPdMmM8WbUXrntHcq4oREC
 0NisBi1WD/DhCldv5r8ruai4IQ1axDmbuuGTxVgKxKM5slvTB4A4Y4kYZD6gRJjPFhh/
 xkkOtDT3VIXD0eiYFmBIJaZ9o38YGYQN5UjQqYP9/E3L/RLfiaZgR3L6cIfTnLXC3nf4
 C5j5qvcYjRIxT91scOyAAIDfpC/PX4SJAnsZOu5BdvclR0AArEI/N78H4NG8XutqZblv
 C1PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=OOpKdMuO0bDghAl1po0Af4aim/SSjCkrie/0/cp73lU=;
 b=s10NmxChpHl5W0v8w+563XYI5YSld8T2cKSCeXpQmOnbdEoOE4jH8uL24d3yMYel/Y
 40Gb0iIbZ6KXEbfG7xD16QqWeK37jZkCurIAmTJydEuAe41wK66QiRlsRoB3D9j1dex8
 LocpBE+TOFh1y1XJbpXlN6Gn5DEDfXWgXTWn6pH6Qdv4/J8TFPFEdHKZ7KwmTTPOWvLr
 rpBTMK99BBkiMwclVO52EW1Po6JnXKatEOm5aZLbuTp/mcQE3bIFiO5c2hM9dvx7PZxN
 S9ewFHfQ593Og2z8QR4Wvpch+0wYQsfEAZQ3nNi1VP9pqPAXE3LTHucIWBvYDf0iBBVS
 +x+A==
X-Gm-Message-State: ANhLgQ2rhUwIslkKNKd8c+xzdBHeSWD5HLE5rHA+Jc3+tgBiQiyOJEZo
 tRzVLzyV01prYGbyIkMZLwCqUC+M9u2wU5LK4yk=
X-Google-Smtp-Source: ADFU+vtZY6VkseC6FahQXcXk0qPa9D2LLphky1tm/elWDs1+bnJKzR9jG0ocJHUh5/I1L+5gxTJQ/oWJB4D+Lcrdc8g=
X-Received: by 2002:ab0:67:: with SMTP id 94mr427135uai.139.1584372820899;
 Mon, 16 Mar 2020 08:33:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com>
In-Reply-To: <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com>
From: Tomek Bury <tomek.bury@gmail.com>
Date: Mon, 16 Mar 2020 15:33:29 +0000
Message-ID: <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Daniel Stone <daniel@fooishbar.org>
X-Mailman-Approved-At: Tue, 17 Mar 2020 14:16:40 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, xorg-devel <xorg-devel@lists.x.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

> GL and GLES are not relevant. What is relevant is EGL, which defines
> interfaces to make things work on the native platform.
Yes and no. This is what EGL spec says about sharing a texture between contexts:

"OpenGL and OpenGL ES makes no attempt to synchronize access to
texture objects. If a texture object is bound to more than one
context, then it is up to the programmer to ensure that the contents
of the object are not being changed via one context while another
context is using the texture object for rendering. The results of
changing a texture object while another context is using it are
undefined."

There are similar statements with regards to the lack of
synchronisation guarantees for EGL images or between GL and native
rendering, etc. But the main thing here is that EGL and Vulkan differ
significantly. The eglSwapBuffers() is expected to post an unspecified
"back buffer" to the display system using some internal driver magic.
EGL driver is then expected to obtain another back buffer at some
unspecified point in the future. Vulkan on the other hand is very
specific and explicit. The vkQueuePresentKHR() is expected to post a
specific vkImage with an explicit set of set of semaphores. Another
image is obtained through vkAcquireNextImageKHR() and it's the
application's decision whether it wants a fence, a semaphore, both or
none with the acquired buffer. The implicit synchronisation doesn't
mix well with Vulkan drivers and requires a lot of extra plumbing  in
the WSI code.

> If you are using EGL_WL_bind_wayland_display, then one of the things
> it is explicitly allowed/expected to do is to create a Wayland
> protocol interface between client and compositor, which can be used to
> pass buffer handles and metadata in a platform-specific way. Adding
> synchronisation is also possible.
Only one-way synchronisation is possible with this mechanism. There's
a standard protocol for recycling buffers - wl_buffer_release() so
buffer hand-over from the compositor to client remains unsynchronised
- see below.

> > The most troublesome part was Wayland buffer release mechanism, as it only involves a CPU signalling over Wayland IPC, without any 3D driver involvement. The choices were: explicit synchronisation extension or a buffer copy in the compositor (i.e. compositor textures from the copy, so the client can re-write the original), or some implicit synchronisation in kernel space (but that wasn't an option in Broadcom driver).
>
> You can add your own explicit synchronisation extension.
I could but that requires implementing in in the driver and in a
number of compositors, therefore a standard extension
zwp_linux_explicit_synchronization_v1 is much better choice here than
a custom one.

> In every cross-process and cross-subsystem usecase, synchronisation is
> obviously required. The two options for this are to implement kernel
> support for implicit synchronisation (as everyone else has done),
That would require major changes in driver architecture or a 2nd
mechanisms doing the same thing but in kernel space - both are
non-starters.

> or implement generic support for explicit synchronisation (as we have
> been working on with implementations inside Weston and Exosphere at
> least),
The zwp_linux_explicit_synchronization_v1 is a good step forward. I'm
using this extension as a main synchronisation mechanism in EGL and
Vulkan driver whenever available. I remember that Gustavo Padovan was
working on explicit sync support in the display system some time ago.
I hope it got merged into kernel by now, but I don't know to what
extend it's actually being used.

> or implement private support for explicit synchronisation,
If everything else fails, that would be the last resort scenario, but
far from ideal and very costly in terms of implementation and
maintenance as it would require maintaining custom patches for various
3rd party components or littering them with multiple custom explicit
synchronisation schemes.

> or do nothing and then be surprised at the lack of synchronisation.
Thank you, but no, thank you :)

Cheers,
Tomek
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
