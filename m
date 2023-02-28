Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 328766A6005
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 20:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C0FE10E094;
	Tue, 28 Feb 2023 19:57:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DADA310E094
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 19:57:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3A53EB80DE7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 19:57:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD0D4C4339C
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 19:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677614225;
 bh=Ab+tW9U9zMedzTQVArh+5T/ADKIAjjlIEG51KVMpGeU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gQJSyWDceQ8vABzkZQGwETLU1+EOREYI6r7Y4fnUI8mAYSqAKT22I5lyEd9n1Uhwa
 sLadINvmB4Ki6p1LFK1aZ7RBewJXLz9HLnv2rwAsSVJq5IIpnLwJ3qtJ7CEugokHfa
 ++kbx2oMngP/st8ZFkPOotJ85GTOda/AV4p1z4zLcTdr4YQd1k/CkSKN4ItitLDpcW
 hihzkMCYRPU+j/o3BDVjQ7uiJKULjVyhJstXl+1YtcuayvUDqD8EgU+nA4zuDqVp/M
 0xCt60RhtZgyAPQsUcGu6FPq6KjLQS3WMzUY+bNCkTJKFsHHcuHz0s6w/trwomgFu8
 6hX5EFSOtZ8ag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BE4C2C43144; Tue, 28 Feb 2023 19:57:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215511] Dual monitor with amd 5700 causes system to hang at
 startup.
Date: Tue, 28 Feb 2023 19:57:05 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215511-2300-c5FOaC7iEq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215511-2300@https.bugzilla.kernel.org/>
References: <bug-215511-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215511

--- Comment #11 from Alex Deucher (alexdeucher@gmail.com) ---
Created attachment 303813
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303813&action=3Dedit
possible fix 2/2

Do the two attached patches fix the issue?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
