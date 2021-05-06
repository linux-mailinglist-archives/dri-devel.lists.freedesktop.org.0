Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69536374D71
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 04:20:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C1B6EC90;
	Thu,  6 May 2021 02:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93176EC90
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 02:20:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 931AD613B5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 02:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620267607;
 bh=XegIoX55DSn7Hnf+HI+bpKS7Uvk7hOZFH42vdblthZw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s6pZUW//Bd9FoVDBbtUYmndGMfh56nKA5HeP8AtkZrNxJRUIKPHx7qCUS2ORtOwTr
 ZUTBYmARL7yyQkiakMdvwS0WLmiO56cFqmPgM61nOH/8kMVhwFqg5I7MBmx10bAlud
 G8FgiWkG9+Txu4vLdmbfg3aQWOtxs21OBmU2CizKCfWjC0AL6j8EEwCd5ZBHLcB5ob
 22zaucPESeRVJCoFkPyQhpdtkIH4iUgUOHSRXrKFzQCz2EjoqQRGB7X4B1d2E75u+D
 MSht2t9jQWmBziKgYtEE6J+spI6HkRSvVs0lzU1eNDDsqc+U//9X7fO8S6aHcW0YGj
 Ty1sJ8lhonv+g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 81E5961284; Thu,  6 May 2021 02:20:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212959] [drm:dm_helpers_dp_write_dpcd [amdgpu]] *ERROR* Failed
 to find connector for link!
Date: Thu, 06 May 2021 02:20:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212959-2300-LDoVhvQa6a@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212959-2300@https.bugzilla.kernel.org/>
References: <bug-212959-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212959

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
Please attach the dmesg output for your system.  Other than the error, is t=
he
GPU otherwise working correctly?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
