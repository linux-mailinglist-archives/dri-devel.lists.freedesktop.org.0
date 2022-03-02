Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C639F4CA7AF
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 15:12:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9301D10EAA0;
	Wed,  2 Mar 2022 14:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9847210EAA0
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 14:12:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EF33561216
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 14:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 613C2C340F2
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 14:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646230338;
 bh=qCXK3MvhQU1huOyZVa9Og/ylE782qMyD4FDI6mhZCfc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=n9LWD+oDQrJeYSa+o9BS/vMG0mNoiOluX3tNGnyO4/REO4p5xifry5KjCk7JvrnJ7
 bdBQX/trgEuDdi/2Qt4d6kx9nBql1VxFOHOrRa8lNFhnuPj+/zzK9I3inQhMzXo/hY
 dM22e23Y35ikVq9YvB2zJgFG9oo44QOkocFGVfJU7/oHep44j1Gs2OQw8u5cphNG2c
 8aU6z6Ayb/YaoXKmV2B1YKt9g07yjCnodzpO+K027uBE1wFxpipKEiLiaL0/hSf73B
 +dLMgwImhvkbwaWPDIhEjL9rsSX39brLHE9Blf9xNsxek7dp3+ziM7bSsfIBnabMSx
 tR6TJQP6MaBHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4DEDCC05FD5; Wed,  2 Mar 2022 14:12:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215648] amdgpu: Changing monitor configuration
 (plug/unplug/wake from DPMS) causes kernel panic
Date: Wed, 02 Mar 2022 14:12:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pr_kernel@tum.fail
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215648-2300-NgLq4cPYtC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215648-2300@https.bugzilla.kernel.org/>
References: <bug-215648-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215648

--- Comment #5 from Philipp Riederer (pr_kernel@tum.fail) ---
Hey,

Thank you for working on this!

I added the dmesg as attachment to the bug. Please note that this is from t=
he
working kernel (commit 94ba5b0fb52d6dbf1f200351876a839afb74aedd) as that is=
 the
one I have running now. If it helps, I can also provide the messages from a
non-working kernel later.

Cheers,
Philipp

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
