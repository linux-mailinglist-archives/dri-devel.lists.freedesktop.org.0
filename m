Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 616CD39C29A
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 23:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B156E40B;
	Fri,  4 Jun 2021 21:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CCDB6E40B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 21:38:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0366A613EC
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 21:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622842705;
 bh=DqEM4FLRjhG0TzYhtAvo1TFJUjF0h6cyCfUgkgtxauc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aOrduVRLQojFMVnyI+75i7HF7B5nOcEFv9PrT+GmowNWuIIW3rq6l2JSudYgdDIpM
 dovtGp37/TtjZgodHzUQeykbC+di9ZKY4K+vnby/as58QcMLgGXJvRJDsaUH7K4Tny
 Omca4YJabqZiFbpRUbG1uz6WlnQJT7q1wXcMaJvRTuS2u3zHOAg9eswnaHL9XRRha0
 E4nhfb5N7t86Yz69wgpusSc+96vjuLEH0eOJ+sy6VbG46wMsupZYyUz5aRMIlAzy4p
 yy5env7y3fFLEqmlgPzy8ybF/fN0kK1vMLsMlQRw7dSVXuW0c3lsn5R8nOj9Af6GAG
 LOcsyiVQEfmSg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id ED3F56124C; Fri,  4 Jun 2021 21:38:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Fri, 04 Jun 2021 21:38:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tgayoso@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-213145-2300-nc2q1uPy65@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

Tomas Gayoso (tgayoso@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.10.37 and 5.10.38         |5.10.37 until 5.10.42

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
