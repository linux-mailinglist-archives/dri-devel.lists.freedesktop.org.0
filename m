Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD9654EA51
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9880710E431;
	Thu, 16 Jun 2022 19:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D837210E431
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:47:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4BDFBB825C8
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C085C3411F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655408828;
 bh=lY/50/W/jvOgRkrSk60WIUqtLn+abLGqWxGt6tqwo/0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nM5hX0fLenjUFGwHi4yuFjLJvVjtP0D3f7QdRa6aXpzfyjWr4mMOBSwzD+KAcBoat
 Axq+bx2mHAw8FDRs3ogKR3Ktw674cJrq6cyo0JLsx0Rh69S0CPlcsrzflEJln40/S6
 zD0QdsediyT2jMZHeRMW9spV7rr/rJqFkxH2jGj/A7pOF9Or6214iWpNz4uIxxEuhn
 Q2pEdcBNU4CB/T/x+YYxPwVSLzQA3UcGd2XoOA+ilGGS/xHYiTNxFneCYIkKwjvVdh
 Lk+914U1rtbgFScNYjsKY5tdyLMhCJ7TiRWIfdzu20O8CBt/BK45xLOItT7VXDbitE
 WCBTD7aiCuHkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F0EC7C05FD6; Thu, 16 Jun 2022 19:47:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 16 Jun 2022 19:47:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216119-2300-2gI9ZbYNVm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #9 from Harald Judt (h.judt@gmx.at) ---
Created attachment 301189
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301189&action=3Dedit
dmesg.out

Here is the dmesg out from my linux-5.18.3 right after boot (that version is
with the reverted patch). If you need something more specific or the dmesg =
from
another version, please tell me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
