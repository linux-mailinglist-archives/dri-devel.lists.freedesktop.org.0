Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB1C442102
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 20:42:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115AD895C3;
	Mon,  1 Nov 2021 19:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986F488549
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 19:42:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 71C3261053
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 19:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635795748;
 bh=+LkQbPx+/oQQr0xM3097UnUZLE5HROk+axMEqOhSnhQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SBPtw8HEp8Hgf08RDxyXjfDXNTAFiNCqKghxWZCJTzyCo0BO9iTwA1ciFy8niLMLQ
 7liubnfFXMNPOuo4IiKUOtboU9fLSF8prFGl6ltSyEa7s/z1/QgzEjLcy5qiYBuXlm
 qmkDNiXCCBsx6EZA+/kYB8wJiI0r2vAq/CDapF7OTqTZjYsdDcaAwxW4aMpLa7Ikhv
 3rzlytld1j7GWYihXhcEL+hg71EOSq4IGa7IYi3C+b3SqEfNOffz4U/PPgCXtoFMbj
 FzldDAKCCQmuuFHtd6802UD8PAXsjgLWrf2uJ1vYt6lkxoS2v6Ictb/FsjZivOhVKb
 XscFGAqdNyoYg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 674FF60FC1; Mon,  1 Nov 2021 19:42:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214859] drm-amdgpu-init-iommu~fd-device-init.patch introduce bug
Date: Mon, 01 Nov 2021 19:42:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: towo@siduction.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214859-2300-ZtaWVwrUkS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214859-2300@https.bugzilla.kernel.org/>
References: <bug-214859-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214859

--- Comment #2 from towo@siduction.org ---
The relevant commit is 714d9e4574d54596973ee3b0624ee4a16264d700

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
