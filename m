Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE3E7009BD
	for <lists+dri-devel@lfdr.de>; Fri, 12 May 2023 16:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C5910E6C5;
	Fri, 12 May 2023 14:01:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F1B10E6C7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 14:01:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D64E65625
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 14:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9B56AC433EF
 for <dri-devel@lists.freedesktop.org>; Fri, 12 May 2023 14:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683900082;
 bh=4OoFsD67/DKPhU0lRHyHFU7f/2le+uDn6Qwjbg6YY3k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rfxsW7d6Fb6mtpdAIfImjn/SjSSoDWttIySJmIHdu1nIL/haiMV0/Wt1FA+WGZn37
 HJ7trC3ouW6AeDsy4Mqatf/Ir/QgjhQ5DFG/ud85BKDZbT5hl/TFZJN08TwuoFrQ2w
 R5roK5jhAqyChp9+jye+C1qmiwsv1yVIrFc+GP/p7IihlFYFccmMdk73qch2F0Nu4x
 aaOyzX14UN+unzUWfAcUx8RTlSFgEtgjm8aVelwzUvcaH2nxqhuBQ8/8Z0LEQiZqK5
 BakqTHScmX83ogrEmvkXzQHe0TAIefhH8xSIe+fc83k2q3B/Q32huyPN4BI7A/6t9U
 aaI22t8lczfcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 853B0C43144; Fri, 12 May 2023 14:01:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217432] AMDGPU crash on shutdown
Date: Fri, 12 May 2023 14:01:22 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217432-2300-pkfriPhWOF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217432-2300@https.bugzilla.kernel.org/>
References: <bug-217432-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217432

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
The patch was cc'ed to stable as well, so it should land there soon.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
