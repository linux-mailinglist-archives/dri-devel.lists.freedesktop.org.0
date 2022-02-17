Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3434BA805
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 19:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B6210E650;
	Thu, 17 Feb 2022 18:19:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297D210E650
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:19:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF5B961870
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 237E2C340EB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 18:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645121992;
 bh=3WOVI/lzoOnf6qu9xG8bo5EeeIjAAnkCgFz+eVGtygA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kTLs/6cvUZIoOueT2kzIUUvF+POnX4MR3QS+fnG+sZim90gSdNsrrzgjra/EIKSwF
 zWKN6wgkiOhXNpgL8s5E73WD0dSwqtvLluia0rbW7vqw3vf+i8zbxGK8vWaJUxzOOR
 GhZm0Aa82Fqludbl54nc6qkEW+6UZgRPhCxm75dzMa+VqXgcGlhSrRN83USb4ZLzD9
 +GAh+2//B8AtNQGS7htAlTY1ozsSh9X/2CWHRNz4g9r7uvjtLKpSwd8sd5tRAXMCEl
 RzzaF8BiHZF1eMiXlr0o+ZGWy32Pr9XTEDtZYaaVjlxO/ZdQ0VDy0Jsz/shSzICkvM
 +wxpTTtMCwvcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1462AC05FD2; Thu, 17 Feb 2022 18:19:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 36522] Caught 16-bit read from uninitialized memory in
 drm_fb_helper_setcmap
Date: Thu, 17 Feb 2022 18:19:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: casteyde.christian@free.fr
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-36522-2300-VThF4v66eb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-36522-2300@https.bugzilla.kernel.org/>
References: <bug-36522-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D36522

Christian Casteyde (casteyde.christian@free.fr) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
