Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16740D45C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 10:18:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39176EACF;
	Thu, 16 Sep 2021 08:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E7736EACF
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:18:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 42F8361207
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631780285;
 bh=Rhqih0HnVO1qd2rNYMtvbbcljDCKwFJYMBJSa4b1ieY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rjHIeEoDygvnlqms9JkKmUhHBrK6BzbpD+K3+prSW190aJy+MiQYwMZbI/fQuDmJj
 XA9kfB/oKIwEH8js1kCR++AwXQVYs/GRg793HWGP01zetrGxmb527zsiAqwvDwT4vZ
 mui3zLbeOCDG/scQIfFe93WKWytVGEgdwalL9RKRSWgHgT65HPIR5gWGbu/Ge1TItu
 Odv69FAnX6FyWI0BMe6ELeu9cLY7Cw/+e049HDOp/SBpEZmnFcYX039UZ39PV8z0i1
 meSpHZHYmtgEtJM9uXVr0Jw0Kaehl9o+5ja/VAEXKo5Z0V/PuJC4iyJqRx+VYEOFu0
 doiMzRtmdsWqg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3FFF261001; Thu, 16 Sep 2021 08:18:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214427] Amdgpu hangs kernel on boot trying init debugfs
Date: Thu, 16 Sep 2021 08:18:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: inferrna@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214427-2300-XsYI94Qspj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214427-2300@https.bugzilla.kernel.org/>
References: <bug-214427-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214427

--- Comment #1 from Ilia (inferrna@gmail.com) ---
Created attachment 298833
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298833&action=3Dedit
Kernel config

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
