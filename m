Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B102037F13F
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 04:21:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52B656E5D4;
	Thu, 13 May 2021 02:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51076E5D4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 02:20:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3B3B861420
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 02:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620872458;
 bh=ku24oIO2AkN+Q2G6xHsbPuJ+/w5aZzIyH9ABd2Y3WWc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=twEuTHnS3rDHH/vgdvPT4VZiEENqMUpceOizt9KOEmTPrgXieQAEmZd6PDEA5C8kU
 Q1n0Ll6mkaS1Z8Z2gJzQAFPyZWMNblPStpqbMFP2HrCxM9WV+J1u57JIDFrlTDz00b
 Sn95vz/mCNcICRnY7nMKE8/FdSiK4dbImrvZqFbnpog899OGNpVZPLmVHSa1mERLlz
 +vMIMhDkCnTw4flF+pUgAYMxgxmpSafbuEetxsbP6oOhp5Yu2w6/Lm16ZvJoMNs3RN
 s+ncXdVxb/5kxlSMbd5rGydukVZ2sCFo4v1GTkoXvHEVaSFNkou0TvCkkT4PmRLAxR
 wgQfK39tHxQrg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 321A461286; Thu, 13 May 2021 02:20:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Thu, 13 May 2021 02:20:57 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-7MpGkDv41e@https.bugzilla.kernel.org/>
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

--- Comment #17 from Alex Deucher (alexdeucher@gmail.com) ---
I don't think we've been able to reproduce it.  That said, we did double ch=
eck
the programmign sequences and I believe it may be fixed with these patches:
https://gitlab.freedesktop.org/agd5f/linux/-/commit/71efc8701a47aa9e3de74ba=
b06020da81757893f
https://gitlab.freedesktop.org/agd5f/linux/-/commit/a8f768874aaf751738a2e03=
50bf2e70085f93ace

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
