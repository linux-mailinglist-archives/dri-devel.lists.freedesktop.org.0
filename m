Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63626504E02
	for <lists+dri-devel@lfdr.de>; Mon, 18 Apr 2022 10:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E9110EDB1;
	Mon, 18 Apr 2022 08:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CA3410EDB1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 08:51:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BD149B80E12
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 08:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70026C385A7
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 08:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650271911;
 bh=RjYuzpf7UvV6jh0hSkINZfaPa/8cWHSmsNHx4WLNuwk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fhyV1d3Cmm7kC4DW7QadkMiWAOWrJt2jJoihleI6h8qAFug5ggXXPtLKKPWlXWQgw
 DcW7YHx2tRlBX/Dc4iR5tZ86X5USciMEjXv82/eJ6L4nAqtc6QR3Nij0KqyzN67NTI
 afpn7FJSrutXEX2BVIoL7F0FSIrkxIQRVb3prhQQ9uDRRTJT9OU9oI4lSO96stKW7c
 36xDS2afxrA50Ud7uJB1KhrWFWKNlgK68Cd9JYxeAfECY2Yhk3fEP5IzwnSE7y0j4R
 uOR1qSn3GLsNtrPJXriNJS769DzXdk1AalPg9bDt8txI3GYoK0IBVWWB9hwycpIWPe
 NSW3ASRbt99Eg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4C827C05FD0; Mon, 18 Apr 2022 08:51:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212635] nouveau 0000:04:00.0: fifo: fault 00 [READ] at
 0000000000380000 engine 00 [GR] client 14 [HUB/SCC] reason 02 [PTE] on
 channel 5 [007fabf000 X[570]]
Date: Mon, 18 Apr 2022 08:51:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212635-2300-1n6W0HFAND@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212635-2300@https.bugzilla.kernel.org/>
References: <bug-212635-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212635

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Sold the hardware, no longer able to test.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
