Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0105B585B49
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 18:30:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24BA910E2CA;
	Sat, 30 Jul 2022 16:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DF2610E2CA
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 16:29:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1B39360E06
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 16:29:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CF47C43141
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jul 2022 16:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659198586;
 bh=MG5oEp0Xq0E39t8tGRGtE0FkFnAhu9ZLY2vWrix37KE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pNUHxkazZs59+pqoDRPyeEDkEWAKAeEBg4EygqIXcmlpKHjpW0TLEu+o9iUDRL22Q
 kyq31GbJwbJSZ6hBAHxSeEOaMmdOfdwmUBgFM4Yc3pclpEtj9PGhIQSj+OMnu/e1GZ
 IhmzR8MxeNTXKB5mNFJ1qagaxV8glKdGEn5f5KOgCYvCgPxhseO9IWC0mCyHIS+OoT
 T8lJsNewQakF3F1t0bfRoShiBqu9DscKuJ9DjOpqgAR5v3onENNAtPUI1smmB4LrC/
 CIsHugGtuAcFFNBhkLSNqzsBqX14i25g5yUQtLxTCB98OY96497gFAH5BZ1+j9KwX4
 2mpJO4DFe2AAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E9E1CC433E9; Sat, 30 Jul 2022 16:29:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Sat, 30 Jul 2022 16:29:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: crptdngl71@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-D6xXEIzMfe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

crptdngl71@gmx.net changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |crptdngl71@gmx.net

--- Comment #22 from crptdngl71@gmx.net ---
I have the same issue. I have found a way to trigger issue quite reliably.

Operating System: Debian GNU/Linux
KDE Plasma Version: 5.25.3
KDE Frameworks Version: 5.94.0
Qt Version: 5.15.4
Kernel Version: 5.18.12-1-siduction-amd64 (64-bit)
Graphics Platform: X11
Processors: 4 =C3=97 Intel=C2=AE Core=E2=84=A2 i7-6600U CPU @ 2.60GHz
Memory: 7.7 GiB of RAM
Graphics Processor: Mesa Intel=C2=AE HD Graphics 520
Manufacturer: Dell Inc.
Product Name: Latitude E7470
I am using an external DELL monitor running @2560x1600 pixel @60Hz via
DisplayPort connection. Notebook lid is closed.
=3D=3D> This system works really stable with no issues for most of time, ap=
art from
the black screen that is described here.

While at first it seemed the issue occurs randomly and more or less seldom,=
 I
finally have found a website that almost always triggers this issue. It occ=
urs
that often now, that it even is not logged in dmesg all times.

Unfortumately, to reproduce the issue, you need to have an account at websi=
te
http://www.spinchat.de (there is an English version as well, if that should
matter to you).

How to replicate issue:
(1) Log into spinchat.
(2) Use spinchat as one would normally do, i.e. create an account if you do=
 not
have one, create user name, log into standard server, enter any chat room, =
open
dialogue window with any chat buddy.

(3) Spinchat rooms have a kind of menu bar with soft buttons at bottom of
screen labelled "Hauptseite" ("Main Site", always visible), and a number of
room names and chat person buddy names. They are simply small rectangular b=
oxes
with another room name, main site access, chat buddy nick name. You can hov=
er
mouse arrow over them and mouse icon will become a hand etc.

(4) BUG, happens with this website always when I use it, sometimes it won't
show, sometimes it shows several times consecutively.
=3D=3D> While in a chat room, hover mouse cursor over menu icon "Hauptseite=
" or
another room name menu icon button, or another chat person menu icon button.
The mouse button changes to a hand and after that screen becomes dark. issue
triggered.
=3D=3D> This does not always happen.
=3D=3D> This happens in many many cases, it happens way too often to say it=
 is
unrelated to black screen issue.
=3D=3D> Sometimes black screen is seen for several seconds until it wakes u=
p,
sometimes it is very briefly.
=3D=3D> Sometimes dmesg gets an extra log entry, mostly it does not after i=
t has
been logged once or a few times.
=3D=3D> Issue is triggered while only hovering mouse over soft menu key but=
tons and
also when actively pressing mouse button over such a soft menu key button.

This really is an annoying error and it has been around for such a long tim=
e I
wonder why it could not yet be fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
