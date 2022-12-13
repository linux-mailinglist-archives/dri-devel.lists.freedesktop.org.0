Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A138D64BE69
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 22:29:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CEC10E070;
	Tue, 13 Dec 2022 21:29:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 313D110E070
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 21:29:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A5B7AB815D1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 21:29:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 474B3C433EF
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 21:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670966948;
 bh=GxkmHGd6rfDc1qJbD6ciY9JtlmJ1qQ4ApvyOCgnbLyU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UrJAgY8BQbifRQ20coUaHB5M77UrOpr3s3j4X0vN6u7b8DVFl4XKjA3JHMRAlsWYX
 2AiW8BmTDS01lIb2pWxnDIF04wuVlgybeLxvIm2zdVkFx8Hvtdx9Yn4Ig1BgWponI0
 FSPNlUHIo6VZaiE6eOTwprvK0IPWfZDI0/0tY+TWUNGJsmiC4+7LL8xuWDmYqVWKvD
 899TQ2D4YWjyPM7aPY9rtrOEQabn0vAtdQOfeNJNla0p6DW5A2NY8El+he1bjt0t8f
 JB36rGOjVhAcX3XPOV9pKnCVWWXVxo2sAleKnjV2STsk0tPPLuWlaDd4JDvdqResCl
 ShbePLss42JGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 30EB7C43143; Tue, 13 Dec 2022 21:29:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216805] external monitor not working since 6.1 (amdgpu:
 update_mst_stream_alloc_table, regression from 6.0))
Date: Tue, 13 Dec 2022 21:29:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: rep_platform
Message-ID: <bug-216805-2300-bGLYMb4KOU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216805-2300@https.bugzilla.kernel.org/>
References: <bug-216805-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216805

kolAflash (kolAflash@kolahilft.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Hardware|All                         |AMD

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
