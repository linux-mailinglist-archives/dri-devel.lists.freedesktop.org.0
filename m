Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DA93FFF97
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 14:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B767B6E87E;
	Fri,  3 Sep 2021 12:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E77A6E87E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:12:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 42915610E9
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630671136;
 bh=e9tF45wFwpo9DgF6jo88ze2NaAn8TxkRW4qR28fcjUY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=C2XUy6UDSzQWN4iXwfxLhB18ycHckTCs+vGl4KgiDYTANUHmhEW68bUG7iL5p/yUQ
 Cougp40qyoakQ3WB5AUcNBOQr/bW79QFqzgyxBN8M8AHLVnQiER/YnhkRsi6cJDeii
 S+eyPDCthHs3HM+nd8eLdzXytEg+u4Rel8WF1w8ItvtyS9znkcYlOqlfhERd+YEMcy
 V0Vw4+lNj5y08/rf6PDOKUUeubRMqA6JHgILfplir8tNxF0J9wWPsVI2AU7dsP02c+
 IcR25QWLNtaSxO1QOAl95VqX/+i8O1NEebc1iiLPDlAWtaCtilyF/IkXHCeudgrKQH
 MnUJEfovUM3NQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3F9B1603E1; Fri,  3 Sep 2021 12:12:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Fri, 03 Sep 2021 12:12:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ted437@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211277-2300-eLErcabQ9W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

Anthony Rabbito (ted437@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ted437@gmail.com

--- Comment #48 from Anthony Rabbito (ted437@gmail.com) ---
I'm also facing consistent wake up from screen saver crashes on a Radeon VI=
I.
This became more appearant 5.14.0-rc7 and has made it's way to 5.14.0. After
the screens blank waking up from sleep typically leaves artifacts on one
screen, another screen will be forozen, and a third screen allows to unlock=
 out
of SDDM. I will attach kernel logs of a trace while this happens. Please le=
t me
know if I can assist in anyway.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
