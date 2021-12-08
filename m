Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62CF46D061
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 10:53:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E77F6ECBA;
	Wed,  8 Dec 2021 09:53:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986986ECBA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 09:53:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E765BCE2078
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 09:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 253EBC341CB
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 09:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638957222;
 bh=sf8R76LNwy2PPSyurYXWE1D1sfSPxz6O/zBMXv2Jaww=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=da7OpEyBtNcxQleOCCva3jM0MflOflgBQQngrLDrarAqfwW0baRZ1omScA7VfpeWI
 10ql9l0/EH2QF9ZIqtcOfqASUH+e8+ctmTqf1owVN/V68PN0CsGsB5PTig5jNL5IkN
 m12KT0ZBnesVkqsHTvPjRPTkOPKNcMo0Rocry8QMLZ0LI6Ta3QPnukS6VjhyAVm6Lm
 RvgpIsjj4mTxiDcfXU/rg9h8wVzCZriTjWbL5faXvyMG/wkTyVX5arenqhl5ibOOjW
 ebRdnprRWFnXyFRbcAROHUJ0VUF2WO+cpIS30Af0LAyxVz8OpguINH65+n+28M4sef
 xECygIpYoSoYA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 161AD60F9C; Wed,  8 Dec 2021 09:53:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205185] amdgpu compile failure
Date: Wed, 08 Dec 2021 09:53:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: stijn+bugs@linux-ipv6.be
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-205185-2300-96NyNcr5hV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205185-2300@https.bugzilla.kernel.org/>
References: <bug-205185-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205185

Stijn Tintel (stijn+bugs@linux-ipv6.be) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #3 from Stijn Tintel (stijn+bugs@linux-ipv6.be) ---
As more recent kernels don't seem to have DRM_AMD_DC_DSC_SUPPORT anymore, I
don't know how to reproduce this anymore so let's just close it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
