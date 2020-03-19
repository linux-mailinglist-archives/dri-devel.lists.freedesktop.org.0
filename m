Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6868918B525
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 14:16:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903AE89B45;
	Thu, 19 Mar 2020 13:16:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B987789B45
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 13:16:19 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id r2so2288955otn.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Mar 2020 06:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B8bRYj0MQ1gs0u8bgzGu9YWP1kmaGxm9KhvnBipqq6I=;
 b=Jjp2WmzlgyQ6e7CVq01tspvkOy2G+Q+H9tzlgZoFFc11n7alSMgN49Hg/lTXNsGQuS
 5QgBUP+0nPuqeGWEBQVaf/8XYYA+FRIhlFEIOeyHkefmOSw0ML9WwuJVpvOWDDKtOf22
 RA6XZEuxjcuu7smxTH7ZJ5Yd2oGFJ5vIq4bEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B8bRYj0MQ1gs0u8bgzGu9YWP1kmaGxm9KhvnBipqq6I=;
 b=eLTiLR0Zx5Pn4Snx/EMp7CkM5M1iT5d9/hdUZiXDM5kSaNqYY1MVOwBpXRHxlykaHM
 0Fxo+z2b6nZ5oSIOtgei9XJVYgAkjaF5tBe/emmFPQX5RIFKL2jNOYZ68Gr7EIHjOLDY
 DwoIrikZozsxas9PM0VtqSrq5/zi2uk7s1qR0ZQrUC4vd28CwZpYbld6MRpipdPCLcvy
 7BqhEqmZjS7/HgpwWAxeMVablP9XT24HiAa6MajJLfSjpTYn35e4nWOpo755k3njkJbD
 f6xhJ6AYgsakoif7JOyjhKG6wF9G0lkDGLlXzPPjjuvf+2w4KfbOYD9Yujj/HANjzyqU
 RmsQ==
X-Gm-Message-State: ANhLgQ1Ac6U756V/E93Sc7A5TwAgdO0+ayjpEcar9O44Nwd4fhTwpGxl
 XtZjfhPjuUOr92Ifvc2PLHoTY+H6lC7NSoP+dveUGw==
X-Google-Smtp-Source: ADFU+vuwjJTEZ9km8eun61HeZSCfqm6vbt0soRERitEt5qQeY0cOZ5pWVLct1IFJacXMBUVD9wtyh+uoSG14sqk+xwo=
X-Received: by 2002:a05:6830:1d52:: with SMTP id
 p18mr2357787oth.204.1584623777804; 
 Thu, 19 Mar 2020 06:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <9d86bbe4-70cf-273d-4d61-aec06011d441@redhat.com>
 <20200319120028.56d3427a@eldfell.localdomain>
 <8b9c1aac-3398-ab97-a065-014359d40220@redhat.com>
 <20200319145842.4b7db322@eldfell.localdomain>
In-Reply-To: <20200319145842.4b7db322@eldfell.localdomain>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 19 Mar 2020 14:16:06 +0100
Message-ID: <CAKMK7uHSV427_8PB1T6LNN3w9uqBJkry4xe1U6RXtnQ7HFo69g@mail.gmail.com>
Subject: Re: Atomic KMS API lacks the ability to set cursor hot-spot
 coordinates
To: Pekka Paalanen <ppaalanen@gmail.com>
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?B?Sm9uYXMgw4VkYWhs?= <jadahl@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 1:58 PM Pekka Paalanen <ppaalanen@gmail.com> wrote:
>
> On Thu, 19 Mar 2020 12:49:27 +0100
> Hans de Goede <hdegoede@redhat.com> wrote:
>
> > Hi,
> >
> > On 3/19/20 11:00 AM, Pekka Paalanen wrote:
> > > On Wed, 18 Mar 2020 15:28:02 +0100
> > > Hans de Goede <hdegoede@redhat.com> wrote:
> > >
> > >> ATM the Atomic KMS API lacks the ability to set cursor hot-spot
> > >> coordinates. Mutter (and Weston) have tried to emulate this by shifting
> > >> the coordinates for where to draw the cursor by the hotspot-coordinates
> > >> and always using 0x0 for the hotspot.
> > >>
> > >> But this breaks the so called "seamless mouse mode" for virtual-machines
> > >> and there really is no way to fix this but to allow passing the proper
> > >> hotspot coordinates to the virtual gfx-card.
> > >>
> > >> Seamless-mode consists of 2 parts:
> > >>
> > >> 1) Letting the VM-viewer window-system draw the cursor as it normally
> > >> would draw it.
> > >>
> > >> 2) Giving absolute coordinates of the mouse to the VM by e.g. emulating
> > >> an USB drawing tablet. These coordinates come from translating the
> > >> coordinates where the VM-viewer window-system is drawing the cursor
> > >> to an absolute position using the top left corner of the view as 0x0
> > >> and the bottom right corner as max-abs-x,max-abs-y.
> > >
> > > Hi,
> > >
> > > is the VM-viewer then hiding or autonomously moving what the display
> > > server inside VM has put on the KMS cursor plane?
> >
> > Yes and no, it is not the VM-viewer which is hiding what the
> > display-server inside the VM has put on the KMS cursor plane,
> > the VM-viewer negotiates seamless mouse mode with the hypervisor
> > and then the hypervisor just ignores the cursor-plane except for
> > sending "sprite" changes to the VM-viewer.
>
> Hi,
>
> I don't think I understand what you're saying, but I assume that I was
> right in that the VM cursor plane content will not be shown always
> exactly in the very position the compositor inside the VM puts it.
> Maybe the example further below explain the issue I envision.
>
> > > If so, sounds like hilarity would ensue with Weston.
> > >
> > > Weston does not actually know what a cursor is. Weston will happily put
> > > any arbitrary non-cursor content onto the KMS cursor plane if it happens
> > > to fit. It's just that usually there is a small surface top-most that
> > > ends up on the cursor plane, and that surface accidentally happens to
> > > be a cursor by Wayland protocol.
> > >
> > > It's not difficult to get e.g. weston-simple-shm window to be shown on
> > > the KMS cursor plane: just hide the real cursor from the client.
> > >
> > > No, it's not an oversight. It is called "making maximal use of the
> > > available KMS resources" by using KMS planes as much as possible to
> > > avoid compositing by rendering with Pixman or OpenGL.
> >
> > Yes it sounds like this will break with Weston, note that it already
> > is broken in Weston, if you run e.g. Fedora 32 beta + its Weston
> > package inside a VirtualBox VM then start gnome-terminal (so
> > that you get a caret cursor instead of the default one) and try to
> > select text. This will result in the wrong text being displayed
> > because Weston does not relay cursor hotspot info to the GPU,
> > also see:
> > https://gitlab.gnome.org/GNOME/mutter/issues/1094
> >
> > Where the symptoms of this are described in more detail
> > (they are identical for Weston and mutter).
>
> Right, that's the problem with the hotspot.
>
> > Fixing this will require the discussed KMS atomic API changes
> > and also changes on the Weston and mutter side to pass through
> > the hotspot info.
>
> The problem I am referring to is that to the user looking at the
> VM-viewer, suddenly an arbitrary application window (e.g.
> weston-simple-shm) starts to act as if it was the cursor, when there is
> no real cursor shown. You have a random window unexpectedly moving
> around, as if you had started dragging it around with your mouse.
>
> The only way to fix that is to stop Weston from putting non-cursor
> content on the cursor plane.
>
> It sounds like your VM-viewer makes the assumption that the pointer
> input device it delivers to the VM is the one that will control the KMS
> cursor plane position inside the VM. Is that right?
>
> What if the desktop inside the VM is controlled by a remote, e.g. VNC?
> Then the input events to the VM are completely unrelated to the
> expected motion of the cursor. Do you just tell the users to stop using
> the seamless mode in that case?
>
> What if display servers stop using the cursor plane completely, because
> people may hit a case where a VM-viewer makes the wrong assumption about
> which input device is associated to which cursor plane inside the VM?

Hm that sounds like we should have an additional flag with atomic that
enables/disables the hotspot functionality. Then compositors can
decide what they want to do with that thing.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
