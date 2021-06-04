Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B0339C28E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 23:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9283F6F527;
	Fri,  4 Jun 2021 21:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 594D76F527
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 21:37:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 280C861406
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 21:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622842639;
 bh=zm6nUIddZflUj4gbeTh0Onf/3xUrexUbv5zl6V7p1jo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WxMynocrLk1BqtWbtc/5y1/rXlh7smWZI4GxNCgdRWqLY/BDOUU2VLBql2lHJlIBC
 tWlvJSlN/Y0glJ/SNa1zqhEYVfDgVYQxNaDCN43VJUz46YyUuSS/XAsjWm5CZ2+Nn3
 TicWjZKaHMu9SieYatQAIF6W1RtxDwmAPMB5EoOS4rS2QEI/t8gfh4lu4BG2yPwa04
 YdHB+CpH3MSfsl72ZgP6I0upAkvS6nzoIZ0QToDIZnZ/qAt9/C8+LZD+2KYdeD5e1B
 Q1U4lW4uTizlqHfKmAT2CQLfCATwGuBi/qFrb8Ap3ogHjz1Zvn0kGfrJPA2uBVqYAf
 5tJgta4+/Iq6g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1AC4B6127B; Fri,  4 Jun 2021 21:37:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Fri, 04 Jun 2021 21:37:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tgayoso@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213145-2300-Bg3iSNE8mJ@https.bugzilla.kernel.org/>
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

--- Comment #4 from Tomas Gayoso (tgayoso@gmail.com) ---
Created attachment 297161
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297161&action=3Dedit
5.10.42 dmesg output with crash aftrer reset

Bug is still present on 5.10.42. Locking and crashing X after driver fails =
to
reset. Attaching dmesg output.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
