Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86A1F3B2A06
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 10:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF256EA8A;
	Thu, 24 Jun 2021 08:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB0A6EA8A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 08:09:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 73E2E613EC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 08:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624522178;
 bh=acy1iNOgwbSA570cyVCWRzLiiKHZL2GOaSB0qZQOeyc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CGAWxuRnWtHgkMFnlrjt4/OjSEcBRdUjKDAfcSBhT0YCN5a9rL1KISOF2+VPTCfZR
 ZnT7l0Ml5A/sUviMfd5cbalv87gLdubUxXE9xlaTKr0M7D1gt8cnMuvqxSMgVcXeIJ
 4/XLPev//dzCoVR63UCCfLPc6UugGMtByJyDcFPInxjLdZeselZSGY92qAIZfoWW9i
 6PXjkee/KAHcG3nVhK+88unQN4ZGgiGIvsXrEK0kpq5bv3qzm6Y4bF/cyh9sG5lGki
 U19YvCNAQONWBwx4dSf+b73t8Xi3BHkJKsp8w6bgnXOoDIsM1wjkUBY9TZE2X63Czd
 CwjVb3N6rxjUg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 706C96112E; Thu, 24 Jun 2021 08:09:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212469] plymouth animation freezes during shutdown
Date: Thu, 24 Jun 2021 08:09:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: popov895@ukr.net
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212469-2300-wN6fpXALZq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212469-2300@https.bugzilla.kernel.org/>
References: <bug-212469-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212469

popov895 (popov895@ukr.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |popov895@ukr.net

--- Comment #7 from popov895 (popov895@ukr.net) ---
I still don't understand, is it a kernel or plymouth issue? If it's a kernel
issue, which version fixes it?

> Installing plymouth built from git, resolves the issue!
What version it was?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
