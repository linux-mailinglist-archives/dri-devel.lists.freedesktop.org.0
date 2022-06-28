Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B563E55BDE8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 05:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2981610FD41;
	Tue, 28 Jun 2022 03:47:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CED0110FD41
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:47:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D5DAB81C0C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 36C2DC341CB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656388036;
 bh=6opq4L6kUxAxotvH3s4lutHMkKifRd0JbflVvw9jK/Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sgB9dhK0a2Z8REkSVtYPt5cq9cfAZrI1gaokGbeLoa3tT2Yn3XBfkKIqLxvqcLFtG
 wqY9j/mK2srZIk6qu7vxyhFCLKp0qNj8z0/mX8wsVz90RRUKxs3xbF8BcQmPlupT2Q
 QF6KQAvdQClsUpZRPmfqfT6VeRCSUy2GLnPJ2Zw4iS053npM59u0kKM8PtoVT/sT+Y
 7UGuGUIPrkt5YLhYfkasZiw+xSirxLaeX+15qoO8ATXNLigs1RNYoPKGLXaevAwx8C
 Kw4g4Fk8huph8/PFLTpmcr1oINxZuhPUmBq8T1ECyv1co2jykbB+uT+Q6ZDbdMntiH
 ciW0cqEX53o3A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1BEF3CC13B1; Tue, 28 Jun 2022 03:47:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216175] PowerColor Radeon Rx 6400 ITX does not work.
Date: Tue, 28 Jun 2022 03:47:15 +0000
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
Message-ID: <bug-216175-2300-B7inFXkxoC@https.bugzilla.kernel.org/>
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

--- Comment #9 from Nobiuki (nobutarounosuke@gmail.com) ---
Created attachment 301295
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301295&action=3Dedit
journal with 4350G and amdgpu.runpm=3D0, 2nd boot.

Next, I kept the hardware setting (RX 6400 was still on but output from Ryz=
en
4350G) and boot. This is the journal.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
