Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A39B5466BB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 14:38:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1DFC10E9C8;
	Fri, 10 Jun 2022 12:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55BA010E9C8
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 12:38:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EB683B834E6
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 12:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8BCDC341C0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 12:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654864689;
 bh=OS0vPzH7+KFNXIdRh4Y2gZkbBERv9bVCscCSBhsPA3o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RGZeawFMIBFT+e5bXYTJ8n7AgFC0bdOckL2+BTWw1pL+0RNa2uUS0gMjQhyBejLpF
 CFwCGSN6yAbe0B/YhGelho6weRoHdaWbfEqwNqsOWlLn/+sOOd1gWXiK15+f3ceNCQ
 NWALdNaa3QUFv8woS6TFtm5KR0YuhBQU+YSPs+WGDUt2oLf/rfm7U+Mu4BtqIwAUJk
 Ud/HXWtJZls5O9nM/OBBBIFnlQPGCk1wHNFhZnE61i9YSOptNoh8cnFe/pZQ3cRjii
 bY4gKjUs3vy8F+hjuueiWLCeRMKBa9LvjpOnRW8tc9A1AfBHVjzwy+miZl7BfEtIET
 lBLw7NFi6HC9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8ACEFC05FD5; Fri, 10 Jun 2022 12:38:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210301] *ERROR* IB test failed on gfx (-110) on Ryzen 4750u
Date: Fri, 10 Jun 2022 12:38:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@ramast.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210301-2300-L3WukdRawT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210301-2300@https.bugzilla.kernel.org/>
References: <bug-210301-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210301

ramast (me@ramast.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |me@ramast.me

--- Comment #1 from ramast (me@ramast.me) ---
I had same problem. I found that removing iommu_v2 module from kernel solved
the problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
