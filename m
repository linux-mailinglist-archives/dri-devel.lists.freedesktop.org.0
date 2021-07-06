Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC2A3BDC55
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 19:31:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282256E550;
	Tue,  6 Jul 2021 17:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17FD6E550
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 17:31:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3863861C66
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 17:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625592683;
 bh=Ygwj37nHHNMEsGa3pmkQXtDkb5RJEp00nwiykKvkg/s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WO1B+jWPH0NfMsESKc2p8NZ+PkIg1pB1flvoFLADYHN9fqN+vwK7maADUbhBYcrNz
 XoQyxcUaBAiKDeKeS1dHX3TROA2ZRAL39WWlzS8bB3J4tdZWDFtfA1Y+aFmQpBFT1K
 hDyq2OdJsMtGshw0VEca9Be1bW0i7qe/7B0gyVSpaeTKV/rz3yQ0qUWEn6V9fXRjJR
 5OeMYSfUB9jm2gC1J/rvVdA12rod2E2OIokrLHRa9hP6BlDwqfJkblmWooDCpUE+KS
 cQR5cWyBNloiYqlfG8HUS9J1UU/vPuCjPICiRifTm8QF4vzEBiWP3x4Zdpe0erDQFm
 BbnG7G7wOt6Hw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 351C461221; Tue,  6 Jul 2021 17:31:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Tue, 06 Jul 2021 17:31:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-209457-2300-0poVFv8qNf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209457

--- Comment #33 from Leandro Jacques (lsrzj@yahoo.com) ---
(In reply to Alex Deucher from comment #32)
Sorry for that, but when I had the problem I wasn't paying attention for the
firmware version, I thought it was a kernel problem. I focused on
linux-firmware package only when I saw some people complaining about the sa=
me
issues I was having, but blaming the linux-firmware package. So I saw a post
telling that the latest good linux-firmware that was working well was 20210=
315,
so I downgraded to this version and problem is gone, since the downgrade on
2021-06-22, I locked that package to not be upgraded anymore. I'll try to
updgrade it again and see if the latest solves the problem too, but, by now=
, I
can only guarantee that 20210315 version works without issues.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
