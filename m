Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A95663A4B3E
	for <lists+dri-devel@lfdr.de>; Sat, 12 Jun 2021 01:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AD06F3E4;
	Fri, 11 Jun 2021 23:32:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6126F6F3E4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 23:32:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 34AAE613C3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 23:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623454357;
 bh=DvyQStd/Nl42cDwRC4uPBDDEiotKj0SHnX4Hr/vdC54=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=seZ+EQRfK+uDiYVsdAey4P+nebyKK69g++nyIMelo6Z1o9UWa+2N7xUJxSbqZBv7M
 rPzk7TPuc6cFWP7AMOao8Ffwo7n+8MVDSwLqXFYWRM0BmOtB/JiyoAevMIBNd6F9P2
 tatt0dRB22nFdtN036oojDDAcv7OKAtXv4b9F5FuO+OhPtbu6hHGhYRYx4LWSuXhYe
 CJVvv790sAG5ZWRUxk5QqvgVtbTp2uLvng16YYHGa7D6V+1SC5j/Z4XT2JX3N5Rgp7
 4Kl+0xX8AFPPSer9In7fNcKOSIrfspmgtbTQCrGogBJD53WzP1TS+DWTEkATiCHV+N
 CArkY1Eta+YcA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 26FB8611AF; Fri, 11 Jun 2021 23:32:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Fri, 11 Jun 2021 23:32:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: dimitris@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-amYFsY0xSo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #10 from dimitris@gmail.com ---
Seeing the same thing on a T495 running Fedora 33 and Wayland, typically
involving Firefox: https://bugzilla.redhat.com/show_bug.cgi?id=3D1966384

Would it be possible for me to try that patch?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
