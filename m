Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E039C483
	for <lists+dri-devel@lfdr.de>; Sat,  5 Jun 2021 02:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522676E435;
	Sat,  5 Jun 2021 00:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9996A6E435
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 00:38:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A2BCE613D8
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Jun 2021 00:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622853484;
 bh=cAZG9S9zTdSjXLlVb8/aX0uP8gmFFYUycryi+oJNfa8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ekaogpgLKIfjKG1ap6M2RcUc4obAQZSKCRsbLrwXabSWtGTTNiFmuWJoGC1B8Qa8r
 uFpOiG5ybYCGYgeHMUUJMm4chy08wd0dfTwQlfDqFtfDQTHkl3bbItNn2ycWvtg1H5
 m6B+0XjfC8b4kfGdBdjV2uwP8sam0drIwIdeiBr/7Mt0IaMdoLQzS0Tdm3EBHRZ+25
 ruwUnKJa/KkMYz9/Ujqw12ZlC/NhZr9AucqIMt7X9vU8WhFS4wwT993eKctvaJg679
 Lg5uRd4+Ehw8kRfZN3rYhKD6q4rwmv0w7Ox9wYuPKb/tMuymGhTDtcY6avfSJ4hyWG
 3E0jaDib1wiIw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 963B96127B; Sat,  5 Jun 2021 00:38:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Sat, 05 Jun 2021 00:38:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: meep@binary-kitchen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-8s1tgMLPEO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

--- Comment #5 from meep@binary-kitchen.de ---
https://gitlab.freedesktop.org/mesa/mesa/-/issues/4866

seems exactly same Problem, same config as another guy.
seems to be introduced with removing some check from mesa to test size of
drawbuffer against zero.
not yet decided if its a bug to remove this,
or if radeonsi or amdgpu firmware should handle this case.

there are some solutions and quickfixes posted,
you could try them and report back then.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
