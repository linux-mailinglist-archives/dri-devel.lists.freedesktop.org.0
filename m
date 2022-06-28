Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC84B55BDE3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 05:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9C8810FB91;
	Tue, 28 Jun 2022 03:45:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B608E10FBBB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:45:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5CB13B81C09
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 273A9C341CC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656387905;
 bh=v90ipkTNaEwZ5c+VJMZhaxPpHkgOVQoqfxcOjnbxXvg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QZclXU7c/M91f7c6Buamp4jMSTTPyz/SbBqaAj4ZiMpg8NtoZbqrm44S4zPOC3GdD
 wdAJVOWJI6w2w2H3xYWSJNyhD+LhAXz9O/8lvG84wgKULxSjEuCzFBlKg1tS1Cd1U3
 ClBiFCRqNLfAVtDo+AKrmOv8HXkq/k6SzUA2M8RDBVjlVFj27giaKecV2zA+cMzY3m
 SqUfQioKplFTMViVedJvObGN8nOXSW01bLS1nWUOYh++KKjo1wH3MTKTuvp6MoVm/M
 vvGyt/XCnlQSmKMZOacUYJnRL1l3YgyCEIbE/V8CwUY8sV5v1Z07FWdMSXEfL4oV8z
 5wPD7zT1CRUJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0E695CC13B1; Tue, 28 Jun 2022 03:45:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216175] PowerColor Radeon Rx 6400 ITX does not work.
Date: Tue, 28 Jun 2022 03:45:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: nobutarounosuke@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216175-2300-yz804GMnBc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216175-2300@https.bugzilla.kernel.org/>
References: <bug-216175-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216175

--- Comment #8 from Nobiuki (nobutarounosuke@gmail.com) ---
Created attachment 301294
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301294&action=3Dedit
Journal with 4350G and amdgpu.runpm=3D0

Next, I change my output from RX 6400 to Ryzen 4350G. It frozen after boot.=
 I
could not do soft reset. Thus, I turned off the power supply.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
