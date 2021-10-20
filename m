Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1F14351D9
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 19:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8A76E332;
	Wed, 20 Oct 2021 17:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD776E332
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 17:46:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 592166139F
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 17:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634752012;
 bh=w870fqUuKKXGMa9dDrLKChqQyJinMVJr6Bnz0x1RGBk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=D7HiCQ1vj7/Mr8mzMxyajNGffhUrK8F4FLssziX7SwflII5YZRk7kanjKYwLOxwvH
 owkOySSZFU5O4shcTyQXBX/90QZlLCFpZuIX5TBWlYTh80TLjt0bHk9CaeBuqJzW8F
 sW7YCku+X1PbDkZZOjDTfyM93m3dtBL6oV1TkSbiUZvgE/GN1WIMTpBTUjx+hz+uNs
 LQMJwVjkUwPyU0NQqrG7vq2+dZ5ejZX2SmkwHiCzcKEsQ/OhhYh7nvo8c0/KaLEzqn
 5eEf2nqgM9+rm75ghN1IcpJ4sk7yIFITwWw58j6LQD/Fl2jAjn9mCio8CuwAHTBVoZ
 /qo8hSiPV/1Xw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 55DF760E77; Wed, 20 Oct 2021 17:46:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Wed, 20 Oct 2021 17:46:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214029-2300-23pnsmqomo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

--- Comment #19 from Christian K=C3=B6nig (christian.koenig@amd.com) ---
Created attachment 299277
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299277&action=3Dedit
Potential fix

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
