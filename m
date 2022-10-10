Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A54CE5FA357
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 20:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D1F510E454;
	Mon, 10 Oct 2022 18:24:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6C310E454
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 18:24:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 249F9CE139C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 18:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4F67C43144
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 18:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665426270;
 bh=dOFqOLvwMRY5J7qAfyytUbuX1nykxz0wFs3Z9AhlbCo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bfpBzvFhc6+fw+wyu7poVhXGL2pAsUYTU7um64wFyxB+nFsQoICMP68dU7SNxsFRd
 KFUmRFSs69x5bgT1Dp6jfZTzid8Gz1DB7o0NsAkW6vpvkEo+SpTk/o3Qmez9ZNMMK8
 1izkzvb/UbEHHhIAsyBZgV2hRpfYeJmgSQyPCmznIZfYhpacXfRMF0DxbkUSIIRzbD
 rjdNdTPoWa6tJlIbganPl5Zh+fUb4XsfoGeBh3wbIuY2RlWQD5GKeQ8lr5Pl3uJwc6
 WJg0ZvzbANxpsdFllKFViQRhJei/gmS259eCalxWE+T8oz2GPwGkibmAe0mSUhlB+0
 wrAkmZhP+pXqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 96E04C433EA; Mon, 10 Oct 2022 18:24:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Mon, 10 Oct 2022 18:24:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: vyoepdeygrbbsivo@stefan.wf
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-fk0dnaOPGl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

--- Comment #24 from rv1sr (vyoepdeygrbbsivo@stefan.wf) ---
Do you guys by any chance use KWin?

Had experienced this exact issue on a daily basis (kernel 5.19 + amdgpu),
especially while running Firefox or Vivaldi.

After setting the following environment variable in /etc/environment two we=
eks
ago, the issue no longer persists.

KWIN_DRM_NO_DIRECT_SCANOUT=3D1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
