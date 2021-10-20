Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3609434E38
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 16:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6BFA6E2EF;
	Wed, 20 Oct 2021 14:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DDFC6E2EF
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 14:48:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 547F061074
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 14:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741292;
 bh=ZtiF5hMp1j5IKJzxbhpxR0DOQmS+O2YlitT9QIa36Tg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mXI9pvN6iz54ufL0cPCkGI+P5tfZd3oY0P3J9hzkDrFOxvpbSymYb3ttPzSEeStnm
 R5AU9Mrkz5BKz6RUBo/Pd22fwRc3to7i/drxMKBcWlnHnjOi6t5w9dKradaqzdVR71
 nvMI/Em+OXdAsG+H7L2Qs9AtuJvMJKrX7G0oMjCk9Ifxk28lcpyl8BAxQJ8BexDwDW
 /yqM/Do3naBGCCKwkKDptfJswpxriKfHTu/MYxVcITpqG1rQVBQNEeAjrXtdrLt+TN
 XCYEei/h8Is2mq2iwnhfREWfREoBnXJg3l6dmDY4pNT4i0ziyqfvHIdF5Kh8alV2Jw
 KuFauQYaJqAeg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 509B0610F7; Wed, 20 Oct 2021 14:48:12 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Wed, 20 Oct 2021 14:48:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-211425-2300-0iqa5UZymn@https.bugzilla.kernel.org/>
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
     Kernel Version|5.14.6                      |5.14.13

--- Comment #22 from Andreas (icedragon.aw@web.de) ---
Interessting idea with the DP 1.2 support.

I have tested around with disabling the 1.2 DP support on my LCD, but this =
only
decrease the FPS from 60Hz down to 30Hz on 4k scree-size. But also with
disabled DP 1.2 support (of the LCD) and/or with decreasing the screen size=
 to
full-hd only - did not help: the issue is still persistent and is still
reproducible until the latest main-line kernel 5.14.13 (5.14.14 testing in =
the
next days).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
