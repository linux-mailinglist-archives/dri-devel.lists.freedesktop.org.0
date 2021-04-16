Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB1A3625FE
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 18:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0826EB88;
	Fri, 16 Apr 2021 16:50:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02496EB88
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 16:50:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 63BB2613A9
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 16:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618591804;
 bh=U/J3FZ6kYfA/94wYdk0U/GUH/fAAt0BMD2LG3pWd8L4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=owF2M9VSTN/dNfei9vMPl5lLJNYWFqatmkahZKH2hvOusNSAZY/p4p9W9c0erGMmd
 AA0ZdplrvVZYWD2njSVSvIufseaQH/YGpvvCGG0X7jGksvIpjJAgugA7VVh9VQIrG7
 RcAhosJg8qhl1MqdKqtXrQ7qIVGlrCFn+Ug3cpZeZoP92LZhWmH41foIq2d7u4lmEt
 fJsMzF2QxnN9R1KU5X219aGKk5LILEtvdEwXEzIHAERwndB9VYZ4MiBxD0UEC4KsN8
 LyKnkqMS9U+cRQhqXI91h+WxXS/Ni8lKlX1nUnHodpJjtqo2Pj4Uj3O5mlXYyfwHJR
 XU+y4gDyXsk5A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6043861186; Fri, 16 Apr 2021 16:50:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 13170] Macbook 5,2 only boots with acpi=off, or nosmp, or
 maxcpus=1
Date: Fri, 16 Apr 2021 16:50:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mortenvermund@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-13170-2300-ljYd9ic257@https.bugzilla.kernel.org/>
In-Reply-To: <bug-13170-2300@https.bugzilla.kernel.org/>
References: <bug-13170-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=13170

--- Comment #74 from morten vermund (mortenvermund@gmail.com) ---
(In reply to morten vermund from comment #71)
> (In reply to dentament from comment #64)
> > Hi,
> > I boot with 2 cpus, acpi and everything working on ubuntu 10.04 using grub
> > 1.99 compiled following these instructions:
> > https://webonlinegambling.com/
> > and with this grub.cfg:
> > 
> > -----
> > insmod efi_gop
> > menuentry "Ubuntu Linux Lucid 2.6.32-33-generic" {
> >       set root='(hd0,3)'
> >       linux /boot/vmlinuz-2.6.32-33-generic root=/dev/sda3 video=efifb ro
> > splash
> >       initrd /boot/initrd.img-2.6.32-33-generic
> > }
> > -----https://njonlinecasinos.webgarden.com/
> > 
> > But there's still a problem with this method (tried with various versions
> of
> > grub-efi): although it may seem the cpus do frequency switching allright,
> > they actually always work at their minimum speed. See:
> > https://bugs.launchpad.net/ubuntu/+source/linux/+bug/669865

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
