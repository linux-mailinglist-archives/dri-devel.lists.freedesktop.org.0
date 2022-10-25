Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF8D60D194
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 18:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6714810E3F7;
	Tue, 25 Oct 2022 16:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB12C10E3F7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 16:24:57 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0353861A33
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 16:24:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4C9AC433D7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 16:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666715096;
 bh=NRY2m9oYuFAcDluA1qPIUMxqrhxcVCzTyVgxTSZ2DHg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bsHjoOjcSaFNRED3O3ueUPtat+McL0MNXvnK7z34zpzpNgBNCYkmJsKJe3PnMAVDg
 BiijwIUA7JHxVdytobVUU1tP8rj/+da8XxaMGPT3/rK0hgT+8o0Yb5D5fgwfBGcOqW
 JLnrSwdlMmRO0uPAt2jCM/QevOsbV3ariMl1MRs6/JAFTwX61cK9ivZECg4bDOCl71
 gH3kanPFBd5UVzF7y0TBWHoekjCE7c9yRKv8daPE8OnSw3n3Dz4QcvfkjMLid8+4AF
 KhSaowMV2FWQ3rw2FLgR3qDGcZW5PLmR1kW3ucPCoHpq16WKZWKwetOOpxfo0CHIiO
 CXO1Q1oLwP7Ew==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AFCB3C433E7; Tue, 25 Oct 2022 16:24:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216625] [regression] GPU lockup on Radeon R7 Kaveri
Date: Tue, 25 Oct 2022 16:24:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216625-2300-QAxKDEKiuq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216625-2300@https.bugzilla.kernel.org/>
References: <bug-216625-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216625

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Any chance you could bisect?  There have been very few changes to the radeon
kernel driver over the last few years.  I could also be a mesa regression.=
=20
Does upgrading or downgrading mesa help?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
