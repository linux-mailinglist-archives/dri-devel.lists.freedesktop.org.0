Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CB323EF1B6
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 20:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A7B898CC;
	Tue, 17 Aug 2021 18:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7255898CC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 18:21:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 91A3D60EBC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 18:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629224478;
 bh=fTIN4M93OnlVQh49hZHkzUGdXrVzvpd532lBuop8J/A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NlXfRCek+EhBXbK9NehcdMc6yZTjo+oWHpNKPw2soTy9AMfNnUb0hWkbHxilYrjhA
 PLLiVoyBEGRMzvgUJryP1ZtiFv1ECY3bSFpc6rUeMX+93l4mVoSdv/Hbbzj2SbXSyx
 FsM8YSS4tUMKco6EcpDWhVwfR/rLyzM8+bTLmd9ywy/OysJnxvk4SKoPecWYfXTYOi
 6Tu+f/TArpQpNqPEz+nLtp11T5jIYuBw8sVNIb7V/yWUKCJSuqg8PekpLRif7x1bKf
 BY8bMLd3KghjAr4imM9TlxJQwcGPXzUgz6vgU8SE+rUiNM6GnuN0nFwmD8wX+ek1Nh
 ilMcelKHQfOQA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 83CFF610CF; Tue, 17 Aug 2021 18:21:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Tue, 17 Aug 2021 18:21:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-211425-2300-HwnEKU8PLt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211425

Andreas (icedragon.aw@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.13.6                      |5.13.11

--- Comment #19 from Andreas (icedragon.aw@web.de) ---
Still broken - status updated in the bug tracker header to current latest
issued kernel version.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
