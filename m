Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9D055ADA9
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 01:57:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2601E10E3C9;
	Sat, 25 Jun 2022 23:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5681010E3C9
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:57:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C49C660F85
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 05F7CC3411C
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 23:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656201431;
 bh=CcOg+dC42y1pg8ZUHK0okT1nHsI2kZb6RQ5QRpxlbFs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BNAyr7aKSNN/Jozb5KdrtxhsZdXiPLmeECyN51MNXxtxmOAhkLhqUeOQ8mrrtU77G
 dqBBngjgu/ddg137H6xTuPPX6qdd1IOUEeu2KYosyJC4YiZBVHjcakwaClyUbM43Zz
 xAh2tanMV1nHdGQqn9/2XU+OkC12/zkpQge7zo+ZrB2fwxYYHnKMbYP6GksMEM/R5l
 XHDN8LipINf+aOE3hDE/vFfCPJzZvIX5VUC7hgHyrFlRKew5rNJGcCPRKotv/odFQp
 EyK3Et+9o0HMLJpQWrAZSylYBrk2BiyK2Vt+4sBqJjohg6WvB5rR+SnD5Wecn0Y5xf
 sIXwIilPAThKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E8140CAC6E2; Sat, 25 Jun 2022 23:57:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216173] amdgpu [gfxhub] page fault (src_id:0 ring:173 vmid:1
 pasid:32769, for process Xorg pid 2994 thread Xorg:cs0 pid 3237)
Date: Sat, 25 Jun 2022 23:57:10 +0000
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
Message-ID: <bug-216173-2300-8Yk2pAR7sp@https.bugzilla.kernel.org/>
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

--- Comment #6 from Witold Baryluk (witold.baryluk+kernel@gmail.com) ---
Created attachment 301276
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301276&action=3Dedit
inxi-full-systeminfo.txt

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
