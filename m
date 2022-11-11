Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0232625963
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 12:30:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3D7F10E15F;
	Fri, 11 Nov 2022 11:30:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 424F210E7E3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 11:30:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CB1C7B825CB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 11:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F38FC433B5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 11:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668166218;
 bh=3v3sVAk4Er7+RnLCnWS8fq7/rBGCKEr6wPFmyB8TLQ4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QhAelk8uX5clq7COKNT37atdx0nCh7egEZE2BDB+IB9crro9IuMo0/iEpzIeUBcm8
 VNvjhTtihKGvNg0NrotbD/ug0nGiBhi5vg319+pndunKTEJOsE1NtWTA857jGTIPue
 uVIdlAwlXmiQw2kdl4qsyRAodZE8rA4DhirnR8NwEfHQtwfgcVxSWut3dvDnDOA8Y8
 5jyGvf0/Fs5h5d7Smxw4r2D4M1EupfLwJVpG5hHRYrd/kv1hSUOZvtiPTh4San5ynJ
 1Pw0xX7myIoSX88DTiG9MjMQF6bmWi2Jn1wx5VVKBdPbcbyI2SLZ1OMS5aCfHwtlA1
 /bJ/ieC+TKVng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5C3E2C433EA; Fri, 11 Nov 2022 11:30:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216673] Recurring amdgpu freeze on kernel 6.0.6 only
Date: Fri, 11 Nov 2022 11:30:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: stanislav.modrak@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216673-2300-wSJ8zrRYw2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216673-2300@https.bugzilla.kernel.org/>
References: <bug-216673-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216673

--- Comment #7 from Stanislav Modrak (stanislav.modrak@gmail.com) ---
(In reply to Michele Della Guardia from comment #6)
> Update: downloaded kernel 6.0.8, applied patches found here:
>=20
> https://gitlab.freedesktop.org/drm/amd/-/issues/2113
>=20
> and compiled. That problem seems gone. Hope to find patches applied on ne=
xt
> kernel release.
>=20
> Regards

Thanks! I've also noticed the issue and proposed patches. Waiting for it to=
 be
included in an upcoming release.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
