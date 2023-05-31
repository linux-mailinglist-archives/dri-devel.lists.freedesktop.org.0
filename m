Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5235A718787
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 18:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F2F10E4FA;
	Wed, 31 May 2023 16:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B2FC10E4FB
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 16:36:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7E87E632C8
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 16:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E1FC7C433D2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 16:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685550966;
 bh=dkWvQr4f0wSFQuQ5DPVbYASQLEWPazEOTEK9Am4mjZk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oa+ZUurmgIr+FD/bFN2OSRBo0xJKY8pYAW+6+SRL6gzV4mjREAQpXjrzeu0XBtrbk
 cufuIAeCmFM4HM48/s7dbAm5dcR264SJA6gdHvlgz1ssTSRQDJ1SCD3yul0iVoyvAU
 YPPXLqlrG8eAt51JGGwS5FEEnkKS5SwlyGxQtam79Kh8TWRcvGFyYs/UBHoO7N99lQ
 WTFfg4x28kZ+IeaAdxGJcXvDQpuza7jAjoj70qWGoGgdKuXjOxi5o35pZf/FEAv17H
 ggjbwSgtbdcFdPthIxuc8VZpXiR5dFylWmXQ7kfrOZ+UpzL4I6ACs5ZaQ7Q63GZg6H
 11K7QWRVKyqiw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CD660C43143; Wed, 31 May 2023 16:36:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217514] [amdgpu] system doesn't boot after linux-firmware
 2023-05-23 ffe1a41e
Date: Wed, 31 May 2023 16:36:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rly@hotmail.hu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217514-2300-nIvs1kGhNT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217514-2300@https.bugzilla.kernel.org/>
References: <bug-217514-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217514

--- Comment #1 from rLy (rly@hotmail.hu) ---
Created attachment 304362
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304362&action=3Dedit
amdgpu_error

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
