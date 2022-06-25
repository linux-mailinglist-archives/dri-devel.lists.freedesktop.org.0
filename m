Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC1555ADA5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 01:54:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A096210E2E5;
	Sat, 25 Jun 2022 23:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DA010E2E5
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:54:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 416A9B80CFC
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:54:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6FFEC3411C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656201278;
 bh=SI9jS2YVyJy5aeItZrpncRHcKn/UMI9kZ1QTnnpYrJE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EX9giTaA/u8sQydR1a70yLeQuHoYca0e+OHYD55FyRg3NgPKFY7X+7mRhk+oaLAEE
 uAY8yzcvL7bNyY24Y7AoqFe79C1knNMelWJQKOnhKQnQRHT8NLY3JnzSqdMgT+hcw4
 bsbrJbSKkcLKW9SO9m2Pbs6OO/JKx3RmInzjUEzvxMuOsyeYOEEg1rZ2AGQBljbXeD
 YXa0hadCf1vgMqReEnn0jwqRKo2ht9ATJ+fSa47xb3hwj+HPUovMbyeNh/q1nFmpv9
 enANdTq4rYI423hXOtfSGaFb2uHqBzgUuIprBqGd0eRZk5nz4x7zYZilipQtNy+fOw
 4CNKnx5I1IlJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D6048CAC6E2; Sat, 25 Jun 2022 23:54:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216173] amdgpu [gfxhub] page fault (src_id:0 ring:173 vmid:1
 pasid:32769, for process Xorg pid 2994 thread Xorg:cs0 pid 3237)
Date: Sat, 25 Jun 2022 23:54:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: witold.baryluk+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216173-2300-3I6GVzzrzu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216173-2300@https.bugzilla.kernel.org/>
References: <bug-216173-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216173

--- Comment #4 from Witold Baryluk (witold.baryluk+kernel@gmail.com) ---
Created attachment 301274
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301274&action=3Dedit
dpkg-l.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
