Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1863F41DC
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 00:10:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8D989E41;
	Sun, 22 Aug 2021 22:10:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A700289E41
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 22:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 617CC6125F
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Aug 2021 22:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629670207;
 bh=sQbOTU0gBNQKdGjbU2RcVtxQRYAcWsqhIersHA65w3s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OqKVODIi5WNzJdAIqlrRFjtORS4YVnHkRjq+nTsM/PxXAHUM+jLV3k3+z0/J+NHIC
 dBilHgBqfo/iY0z3UdSz22wQ/IxUrvaz3XC9OcNhdoQuo3C8LaUEJTni+05EsgIJLJ
 m48G6Y8omuKtlU8ohMBCFsyCIKjNgPs9JYfoUKftmgsIUFHF1x02Ld3cOK9tLkLMth
 cxi3KKayXt9okUcGjEwTghQfwkvJ+LgxbIfcw4m865CMwF63MDm1Ijp+jsjA7zqpip
 V42osUEgHhEyAw3HqRhFDvfRD3aLKzPkV4/Rd+va99RSFu4Wn0FhymDXo1i2rON+Zg
 h2KLI458SyQSA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 592BD60F4D; Sun, 22 Aug 2021 22:10:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214001] [bisected][regression] After commit "drm/ttm:
 Initialize debugfs from ttm_global_init()" kernels without debugfs explicitly
 set to 'allow all' fail to boot
Date: Sun, 22 Aug 2021 22:10:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214001-2300-9b71UxbFZK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214001-2300@https.bugzilla.kernel.org/>
References: <bug-214001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214001

--- Comment #5 from Linux_Chemist (untaintableangel@hotmail.co.uk) ---
I can sense you're a smart cookie, Duncan, I've enjoyed this little tete a
tete.=20

I think this bug has been addressed, it's just not been mentioned yet (see =
the
following into mainline):
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/d=
rivers/gpu?id=3D958f44255058338f4b370d8e4100e1e7d72db0cc

" This changes it so that if creation of TTM's debugfs root directory fails,
then no biggie: keep calm and carry on."

Will test it out as soon as I can and comment/adjust the bug report.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
