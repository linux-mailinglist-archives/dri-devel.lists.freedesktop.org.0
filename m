Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9E64517B0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Nov 2021 23:39:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D318A6E1F6;
	Mon, 15 Nov 2021 22:39:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3726E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 22:39:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5352463212
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Nov 2021 22:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637015974;
 bh=h+12AnJKDOX9tFKomygJKU7OkJgusnd07I5pKtTLLMU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SWjGNIOoSSOhkXDKpZQiq73F68tdnCdjPcZjYuyo79KHyPRrEQFvZKJSKzvyN6rtg
 XTx13KIiI8EM7CaY62x0AvWxtwjyQfgkRkilFbCsnwdJ5EJnEFZgFvV89F2yp4AFFb
 W4W9GZCVCqgNvLqfOCB6t9m/hjn5kU+HWdDb1Jzld7sDbxFuPJFPMWxyFGtADdMTXx
 UcBKzaDBApDq83hN47QZ8yUwQMZ79vKr7el8Gb+R6xZ9PWkxgC4eWej1kZU8NSpeYS
 WGddyC8lbSc8ckP5MVlkHqImkxr7LmIaOa5rXYGmmqQ0Wjrcb3gaQW8ezoyO4+5qNF
 6bDhW9plLPTEg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4B6E860F9D; Mon, 15 Nov 2021 22:39:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215025] [amdgpu] Thinkpad A275 hangs on shutdown / screen does
 not turn on after reboot
Date: Mon, 15 Nov 2021 22:39:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bjo@nord-west.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215025-2300-azqb7NkCM2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215025-2300@https.bugzilla.kernel.org/>
References: <bug-215025-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215025

--- Comment #6 from Bjoern Franke (bjo@nord-west.org) ---
Created attachment 299595
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299595&action=3Dedit
dmesg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
