Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C81B55342D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 16:08:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B05A10E292;
	Tue, 21 Jun 2022 14:08:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF01110E354
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 14:08:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97846B81815
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 14:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B967C341CA
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 14:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655820496;
 bh=NRGPX55V/ZEi9712/OWwxDcF6wWrtKZ5/Mn7wCCp+ws=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mkx+9u8UNMOWxnqdBO4xewxB7y2yhfbxTyM6ENbjNmin1GXAK7TrGfdTmmBUl069N
 W6cGAb+4B1OGZ1IeqQPdcorK9aq1+8+H4Uml+DvchdisS17HnlrICVtfoGKqzyb43W
 ivXPsJ/UoP6NU5QbxIdiUYA2LCFhYELKVaYqwoqyXEeYmQEdtB1aDxt7Xu6xrByrks
 ZXcIMzohh4s3a7CV1pwec2LAQF+4eIY4Jh4XsyRtGIk+qwFPySTI5Ix+LgleNif1o4
 skEkYNLBtzW6mx2TYCMneUQEs3uOVNy8kwOFfZmjZFATqbVmlrcmv9F9s+ea2qApgs
 1ucsL96L4pRzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 445AECC13B4; Tue, 21 Jun 2022 14:08:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Tue, 21 Jun 2022 14:08:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216119-2300-rUYPOpKk1O@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #13 from Alex Deucher (alexdeucher@gmail.com) ---
Created attachment 301243
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301243&action=3Dedit
patch 1/4

Can you try this patch set instead?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
