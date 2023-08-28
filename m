Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF7D78BA39
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 23:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5170D10E0DA;
	Mon, 28 Aug 2023 21:26:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C82410E0DA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 21:26:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8360B61CB1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 21:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E97E2C433CB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 21:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693257974;
 bh=oU8q9X60B/seLTxiq2GV7TYomC+Khhm16WfHeMDgj5c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hpdBc3g6JxST0xAn9WFY5sB7farS0C8y+oTHexcvVu0e+EMzh/3jXPfrYgO51l22q
 xxw+3efLAQOyTGr/AmZnt2Dv76fSHj9hTGogHRuzAhThYILpN/GI8J6eB4D1PVV0Da
 QEB1achKiDOmZMtn0RjofehAom/plixldoxT2IejdyXW5XnXMvaXvHcV54qpVz+yDu
 acNg7OGuF2DJQRLTkLBUJWF8nCS6DQe+/VXbkddzoM0M6G504Hpv4IL0llRiEPnHqU
 0/cLzB8H8z5C4J8zz+unhiSGTxhsXA89J1tfikqCid5cAY0n736FIqRHvA5hq7qC+1
 PlHTCzM5coSnA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CB57CC53BD4; Mon, 28 Aug 2023 21:26:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Mon, 28 Aug 2023 21:26:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-gOCkLz7r01@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #44 from popus_czy_to_ty (penteljapan@o2.pl) ---
SAMSUNG MZVLB512HBJQ-00000 512,1 GB (came in bundle (as laptop)
Samsung SSD 860 EVO 250GB 250,0 GB -sata (added just for linux)
i will reply after to you other questions later if i can.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
