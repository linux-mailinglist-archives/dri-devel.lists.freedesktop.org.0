Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 540FD4A3353
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jan 2022 03:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4668610E173;
	Sun, 30 Jan 2022 02:39:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5785C10E173
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 02:39:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E9DEBB8284B
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 02:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3D7FC340F2
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Jan 2022 02:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643510343;
 bh=jOXGJ6JiyheB74baWmmwxxMIYwJiZge9Y/kOYx5IG5E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qdTsw4fzZ2lrR05VODPUCXcgwChtl1Kel8vGjaEtCKmpDTdxEUsHI1w8ZB2x2cYQm
 hNuesuRxmihntBNNJOj1oOxDOl9oV7eRDIyNVLaXovgnxXE7FBWfTcENRcqqCFB/2b
 Q5qKZOk3QLXxC3ZVXRE3x5CPaHrj5pE11OAw/gWR70ub/bgExN4idn3V7kmgxPTH8A
 MfCqpNpFrKexURotjYZ7Y54UG8oqrj1U0LT4jLB62/rxcIPzfax0T4wjd2KhO0GZNG
 a5PFMDeAPSGFRs9xMFp3k+hfISkORSfbjbL+pY5yhYxfQapbZ2yOGbUH37WfL2NJTb
 dGLDqRtrLtuSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 92DBFC05FD6; Sun, 30 Jan 2022 02:39:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204611] amdgpu error scheduling IBs when waking from sleep
Date: Sun, 30 Jan 2022 02:39:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thierry.monnier5@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204611-2300-EOVJPQ3Lan@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204611-2300@https.bugzilla.kernel.org/>
References: <bug-204611-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D204611

--- Comment #14 from Thierry (thierry.monnier5@gmail.com) ---
No problem since a long time too. I think it's solve.

Le sam. 29 janv. 2022 =C3=A0 23:59, <bugzilla-daemon@kernel.org> a =C3=A9cr=
it :

> https://bugzilla.kernel.org/show_bug.cgi?id=3D204611
>
> --- Comment #13 from aeon.descriptor@gmail.com ---
> I still have this issue, but I'm using the latest Ubuntu 20.04 patched
> kernels, so I don't know how 'latest' that is.
>
> What kernel versions work?  I could try them out.
>
> On Sat, Jan 29, 2022, 2:55 PM <bugzilla-daemon@kernel.org> wrote:
>
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D204611
> >
> > --- Comment #12 from tones111@hotmail.com ---
> > I haven't seen problems resuming from sleep in some time.  Is anyone
> still
> > experiencing this problem on newer kernels?  If not then I'd like to
> > propose
> > this issue be marked as resolved.
> >
> > --
> > You may reply to this email to add a comment.
> >
> > You are receiving this mail because:
> > You are on the CC list for the bug.
>
> --
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are on the CC list for the bug.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
