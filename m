Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1711D7B3815
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 18:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E61AC10E13E;
	Fri, 29 Sep 2023 16:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003C710E13E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 16:44:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 42F5161E4F
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 16:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E92C6C433C8
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 16:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696005886;
 bh=BQHxYDzOAMvPGWcota/W761q47x0hVfVip61t+ZLeEI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nQLQOP/8p2q+lr6TnVEf2EEB4jDFiAHQ/AptESysyI4EBzhQ2T7bbNhGHWIiVccrj
 nOF5jVDEidNlE5Wn0hYiDf5YdS7u45EKQ/UhKAEHB/Kg5wuo3yJFDWV9C7Mj/K3cHi
 mwjVGQT7TGndJIXfxWep+65rtC6AYNXHipE0gvY5RGTHPzlnGhYzdqLaITg7vDCGJG
 ozm3Bxcn2HdJ/pq0NwFiOJxwc93iA/XwX6L3UbzZuVRhky/AQ9kJ0N3R1leO+h+YWG
 s4BXM9aqux5iA2Zm0J9pEehXNYhdaywKurg+7RimYPDXNIKRGShIOdP4zGno0jITae
 aqk6YH0TtURrQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CA37CC53BD0; Fri, 29 Sep 2023 16:44:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216806] [Raven Ridge] console disappears after framebuffer
 device loads
Date: Fri, 29 Sep 2023 16:44:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vinibali1@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216806-2300-RJDL8ih36S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216806-2300@https.bugzilla.kernel.org/>
References: <bug-216806-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216806

--- Comment #5 from Balazs Vinarz (vinibali1@gmail.com) ---
The latest 6.5.5-arch1-1 kernel just turned the display into a full white
screen with high brightness.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
