Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DAB409D8F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 21:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70A976E239;
	Mon, 13 Sep 2021 19:58:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DFF96E239
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 19:58:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4E74C61108
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Sep 2021 19:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631563129;
 bh=ggW5w0LHH3GKQL2WNtoNwSUNtmmGygF9UhnTNG0DClk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BS7POugkgVj3xPvdTqwlDqxcYZf4dlkuBiWXWzqhOW6AvTL/GVpv2j6bDuzaENvT1
 cPuIIA25YzHjU1xmjo65p8fhCDOUVlKpfj5KEwBj2MW+RnpVIzolJnWYyc/hpJIR+u
 r8ZK+6M4LXr5UB6uoZNnA8Fsx93j2R7+rpgrFgBzS+wgYkl08FCbkk+r07NkotN4NE
 BLCcOwiZyqOTrng0gfS4oHajmWFivZyCnvB18w8CZxqdJu3UyWNJN6CrT6u+rZEMRX
 ehE3xaHHwlyL27EA09oZLI6FwTqtf6IUQu6r2CY5aTA2V/3q5ACqMcsf43yThV1AZX
 ixZqi5yjOKfLQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4B18760F6B; Mon, 13 Sep 2021 19:58:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [NAVI] Several memory leaks in amdgpu and ttm
Date: Mon, 13 Sep 2021 19:58:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214029-2300-1rB1R2a5Bs@https.bugzilla.kernel.org/>
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

--- Comment #9 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298785
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298785&action=3Dedit
kernel dmesg (kernel 5.15-rc1, AMD FX-8370)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
