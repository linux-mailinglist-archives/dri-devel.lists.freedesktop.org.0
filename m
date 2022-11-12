Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A80F26267A0
	for <lists+dri-devel@lfdr.de>; Sat, 12 Nov 2022 08:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F19610E030;
	Sat, 12 Nov 2022 07:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AABF10E030
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 07:18:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 959B6B80113
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 07:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 441DAC433D7
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Nov 2022 07:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668237503;
 bh=jQ82i1sXCFQDP7fEGHa+nrwrnwVzbBmoA1m8OKAjP+s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lDjPWd4yS1tWCufokSy5cJeSdsEFmAyQSbp9DqGWe7Cv4wUqSfNqXxi3/fMQl7nU0
 s9gqtTn1SvIZn/P30kiAM67bBztRrJrD70gAAXLjReL1AgzFkXVnDV0bVtiY+ffRhp
 SAmx6bigPJFq59QQ+YdnrbhjBYHu90HHL7LmOC/JrksHyPspY/4+q81ejxenpibrh7
 GBHEE83ml53EFJ2bz9Sd8Mz1Eh6Cp18TRfrzwq/4ZDjd1aZUfC298KVYdo6uUih5cP
 Zc3++rf5fJasruns42dVX7GyZ+JpZyL0W+1VktlHaf00WVTL1RBV/y6P2hGoUmBO9j
 R20s/yGY3z1Cw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3382FC433E7; Sat, 12 Nov 2022 07:18:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216684] amdgpu graphics freezing about every 10 seconds in 5.17
 and later
Date: Sat, 12 Nov 2022 07:18:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: memredogan3626@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216684-2300-XImdklfz4c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216684-2300@https.bugzilla.kernel.org/>
References: <bug-216684-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216684

--- Comment #1 from memredogan3626@gmail.com ---
Created attachment 303159
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303159&action=3Dedit
dmesg with lts kernel

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
