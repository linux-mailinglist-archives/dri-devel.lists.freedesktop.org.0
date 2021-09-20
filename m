Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E6F411615
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 15:52:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474C26E4F4;
	Mon, 20 Sep 2021 13:52:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F256E503
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 13:52:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6F7E260F26
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 13:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632145931;
 bh=Ib5+1g5U0ldoaV2KV5APrEie4/8k3cbErslO2qO/ql4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Un1YhcfxGQWteE55Xgg/Sr+5FEOedLrceWVcyMsQQcKsyvduB3Js9K6BvRuVGNSMb
 MJlgjH1tBd9X3q9AmyxOB6QedwKaS762EJc0+5hJAbXwvU4ftRlFclBQdqgrjyzZH9
 DCTK8CPTi49g7s/eO/fZHbLQCT2Gln3xnzbqHsQ6lX8tfC8eq397tc8FLQB9H9qKHS
 k+H6GTybyyZlqjdu7tHm6JypnU8zfu6yUppOcwsre7FLb2jFDx4JVijp8ty38WR4h1
 g1TVBZqczYHWEnoklsClAma5Z4ARy4z03HS3LowkWuWd1a99w1gtT1iBsWax/dWkNs
 Y4SQoFyL0rG5w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6652C60F50; Mon, 20 Sep 2021 13:52:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214413] Kernel oops on boot for amdgpu (in
 si_dpm_set_power_state)
Date: Mon, 20 Sep 2021 13:52:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214413-2300-ydzGfp4oZ2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214413-2300@https.bugzilla.kernel.org/>
References: <bug-214413-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214413

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #5 from Alex Deucher (alexdeucher@gmail.com) ---
Can provide the info requested in:
https://gitlab.freedesktop.org/drm/amd/-/issues/1698#note_1066944

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
