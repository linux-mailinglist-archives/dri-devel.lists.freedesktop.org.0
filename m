Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3212B186F8E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Mar 2020 17:04:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E116E432;
	Mon, 16 Mar 2020 16:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825EB6E462
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 16:04:25 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id z65so22695328ede.0
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Mar 2020 09:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=R0RpgBy6YG2hHlldZBfrskephzxPvYh4Y4G/mDFzT9Q=;
 b=g6bHyQ6jD29Qm0zk88i4B4OuJoRPCkh7TSYGuCQL+rLyd5thyEQTWcCzy9fTMXhWPo
 0oYSl2p3b5xaKcoP6UUVBALARQNYtTO7aQZM1tWcl0f+UAdN8NVpRCxnD65llJ7y7WFa
 RabsB629q3y+Bv1SlOtCLv5YN4KUtcMhy+lJ7FvWPu2IOSryBGN0tWwa03HmlJ/KDVlE
 IbpoQKs6gLeKqG459Ej4Xy2XJIHvik6wrZrAmT6fX0Bw4Zs7DqQdEu4nv3+YT8S1m8M+
 qyNcYgm876BSZM3YYi+s26gZ9suYiUy7p7dNivRF6l8tEcpeN8JZYgCnSLBNbMR5FHDs
 b7iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=R0RpgBy6YG2hHlldZBfrskephzxPvYh4Y4G/mDFzT9Q=;
 b=a2NuvEBAb+AQH7/DKTKApw+NdVvo9Zw8rCULysJAoRB03izo/DSJjDEYv4rw6Cck25
 RXqqoAs/roin8CDZHzSSzJFyImUMjikcotUjygVL3yvZZxteWBBptPrSHKo9eOYFBuqI
 vtkr3Wb6GECMEjvV7nJ+NHAmaJwnlLb0tFpJniYj+QuuTGpiRjl0/weAw++NPeQM8PY8
 7AJnl0Bl6BC5GMN54k5SW/1VW4WjIjAQZCrHfg1V14u+ZWxVLq01Y7NilHR9EJkbGQaW
 febEs2WLUi12eHBb0F5t5/aodmUsQmmaC8BZM/4ytAShYI9WFfAxaxKVor04+LbAiqmz
 d/GA==
X-Gm-Message-State: ANhLgQ31ZgLY13S18/bhuPjSuaE4LkgSLAmgFUgCAdbqx8n/aUnJfABE
 Ud7/eVvCqvrGIS1VsydCuqmeZ0YIlLfNVfo5FwT6xw==
X-Google-Smtp-Source: ADFU+vskGVugVeBsQFVCQ9+ZzYiueB+aT7W0P7y2bJnjSMeY3cBEw57ecZ/MejMLCQHrVDk4Wh8kaybsledR7Z2DRZk=
X-Received: by 2002:a17:906:484:: with SMTP id f4mr1706361eja.61.1584374663787; 
 Mon, 16 Mar 2020 09:04:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAOFGe94jy2VYDPbkMW8ZuNdAeM+HS8sM1OAYFGd9JKc1V7PVOQ@mail.gmail.com>
 <CAOFGe97LnmEHVoitgKdo+hbw9rYacofkzkt3pPcQSaw9BaKyaA@mail.gmail.com>
 <33d1749d876a83416c44671efcb37c74f87d1bd4.camel@ndufresne.ca>
 <20200316102034.GA30883@pendragon.ideasonboard.com>
 <CAO1ALz=us11a8=M6MWGdLwXakeR3Ltd=iyAN4G5-GkvNXctGeA@mail.gmail.com>
 <CAPj87rPnk6181unams0vBT3ZpdNY=gMM5iFf=E5iPuj=eG28yQ@mail.gmail.com>
 <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
In-Reply-To: <CAO1ALzmghMQo31noEBW_0gVzJp=BZrNaNtXE+86TR0hR86Y1Jw@mail.gmail.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 16 Mar 2020 11:04:12 -0500
Message-ID: <CAOFGe94crnBBvjfP=0W3awUrxu+ZZG1_Q3bO03ti6jBckgTf_g@mail.gmail.com>
Subject: Re: Plumbing explicit synchronization through the Linux ecosystem
To: Tomek Bury <tomek.bury@gmail.com>
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
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 "wayland-devel @ lists . freedesktop . org"
 <wayland-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 ML mesa-dev <mesa-dev@lists.freedesktop.org>,
 Discussion of the development of and with GStreamer
 <gstreamer-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 10:33 AM Tomek Bury <tomek.bury@gmail.com> wrote:
>
> > GL and GLES are not relevant. What is relevant is EGL, which defines
> > interfaces to make things work on the native platform.
> Yes and no. This is what EGL spec says about sharing a texture between contexts:
>
> "OpenGL and OpenGL ES makes no attempt to synchronize access to
> texture objects. If a texture object is bound to more than one
> context, then it is up to the programmer to ensure that the contents
> of the object are not being changed via one context while another
> context is using the texture object for rendering. The results of
> changing a texture object while another context is using it are
> undefined."
>
> There are similar statements with regards to the lack of
> synchronisation guarantees for EGL images or between GL and native
> rendering, etc. But the main thing here is that EGL and Vulkan differ
> significantly. The eglSwapBuffers() is expected to post an unspecified
> "back buffer" to the display system using some internal driver magic.
> EGL driver is then expected to obtain another back buffer at some
> unspecified point in the future. Vulkan on the other hand is very
> specific and explicit. The vkQueuePresentKHR() is expected to post a
> specific vkImage with an explicit set of set of semaphores. Another
> image is obtained through vkAcquireNextImageKHR() and it's the
> application's decision whether it wants a fence, a semaphore, both or
> none with the acquired buffer. The implicit synchronisation doesn't
> mix well with Vulkan drivers and requires a lot of extra plumbing  in
> the WSI code.

Yes, and that (the Vulkan issues in particular) is what I'm trying to
fix. :-)  (among other things...)  Assuming the kernel patch I linked
to, your usermode driver could stuff fences in the dma-buf without
having that be part of your kernel driver.  This assumes, of course,
that your kernel driver supports sync_file.

> > If you are using EGL_WL_bind_wayland_display, then one of the things
> > it is explicitly allowed/expected to do is to create a Wayland
> > protocol interface between client and compositor, which can be used to
> > pass buffer handles and metadata in a platform-specific way. Adding
> > synchronisation is also possible.
> Only one-way synchronisation is possible with this mechanism. There's
> a standard protocol for recycling buffers - wl_buffer_release() so
> buffer hand-over from the compositor to client remains unsynchronised
>
> - see below.
>
> > > The most troublesome part was Wayland buffer release mechanism, as it only involves a CPU signalling over Wayland IPC, without any 3D driver involvement. The choices were: explicit synchronisation extension or a buffer copy in the compositor (i.e. compositor textures from the copy, so the client can re-write the original), or some implicit synchronisation in kernel space (but that wasn't an option in Broadcom driver).
> >
> > You can add your own explicit synchronisation extension.
> I could but that requires implementing in in the driver and in a
> number of compositors, therefore a standard extension
> zwp_linux_explicit_synchronization_v1 is much better choice here than
> a custom one.

I think you may be missing what Daniel is saying.  Wayland allows you
to do basically anything you want within your client and server-side
EGL implementations.  That could include the server-side EGL sending
an event with a fence every single time a flush operation happens in
the server-side GL/GLES implementation. (Could be glFlush, glFinish,
eglSwapBuffers, or other things).  Since wayland protocol events are
ordered, the client-side EGL implementation would get the most recent
flush event before it got the wl_buffer::release.  I fully agree that
it's rather cumbersome though.

> > In every cross-process and cross-subsystem usecase, synchronisation is
> > obviously required. The two options for this are to implement kernel
> > support for implicit synchronisation (as everyone else has done),
> That would require major changes in driver architecture or a 2nd
> mechanisms doing the same thing but in kernel space - both are
> non-starters.
>
> > or implement generic support for explicit synchronisation (as we have
> > been working on with implementations inside Weston and Exosphere at
> > least),
> The zwp_linux_explicit_synchronization_v1 is a good step forward. I'm
> using this extension as a main synchronisation mechanism in EGL and
> Vulkan driver whenever available. I remember that Gustavo Padovan was
> working on explicit sync support in the display system some time ago.
> I hope it got merged into kernel by now, but I don't know to what
> extend it's actually being used.

It is supported by KMS/atomic.  Legacy KMS, however, does not support it.

> > or implement private support for explicit synchronisation,
> If everything else fails, that would be the last resort scenario, but
> far from ideal and very costly in terms of implementation and
> maintenance as it would require maintaining custom patches for various
> 3rd party components or littering them with multiple custom explicit
> synchronisation schemes.

If you want to see explicit synchronization everywhere, I would very
much like to see more developers driving its adoption.  I implemented
support in the Intel Vulkan driver last week:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4169

Hopefully, that will provide some motivation for other compositors
(kwin, gnome-shell, etc.) because they now have a real user of it in
an upstream driver for a major desktop platform and not just a few
weston examples.  However, someone is going to have to drive the
actual development in those compositors.  I'd be very happy if more
people got involved, :-)

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
