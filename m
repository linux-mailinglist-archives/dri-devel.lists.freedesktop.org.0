Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D7E412D95
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 05:56:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4956E8F0;
	Tue, 21 Sep 2021 03:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AE76E8F0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 03:56:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 649AC6126A
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 03:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632196569;
 bh=+9aww93/AlNndQ6x/OQyk3ra6quYuWm5ShTfdh+3GZA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=m5Hvx1g8dbo96VbW6xg6awdphrwbNkr3wsXZZPKKN2HbFia9ApVmrLpjwgsaFWn3c
 oMmL0cTUTQw9ZAkfdtfA6sywPbGVJ/apOK/pZGbrHKrkaWzA3fbsC+vYOsGa3YUGvl
 bS0HytG5rIqdXoBAtGfWpCDXcqHstRmRgWF0T3JfRW4y5Yr4X/RA2QgwFq1NUeEGs8
 1bkpwnEPY4eSrNTaBIrSbpyNVls1EEVn/KeJT8We3Dxz5L9lqVwjBmYYIs1F+TNAu8
 DdFT8Y2Gd5HFnbixjbFl9oFlt60sj9OV1N07CjOojGgUo4N+9rV3EqkA+gm+9R53SX
 n+CCxCZmeGO+w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 61D3A60F5C; Tue, 21 Sep 2021 03:56:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 21 Sep 2021 03:56:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youling257@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211277-2300-l0WzAuMc5J@https.bugzilla.kernel.org/>
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

--- Comment #64 from youling257@gmail.com ---
Created attachment 298899
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298899&action=3Dedit
config-5.15.0-rc2-android-x86_64+

CONFIG_HSA_AMD=3Dy

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
