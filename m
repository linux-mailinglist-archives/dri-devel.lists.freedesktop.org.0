Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EC940D460
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 10:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76D506EAD3;
	Thu, 16 Sep 2021 08:20:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C971C6EAD3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:20:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9D9D16113E
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 08:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631780424;
 bh=OQN0fLpENf96i1/HFDgiJEKkExWxZIOK1Z8v7n0083Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SXGeGvoBosAfi4P+69A6Q+YAii7PcNCkOfGYDmbkZHjAXKzloYX9c9fODtHXrwtgr
 rcbXPmtYpE11fCi9a1SSbPO02zVyZiyjgKA5HSBG/yuQFEfat8rstnw06eNwJMy4CC
 nxhTOWWQqDMsMgZf0Tefhp4KGi+FggySI2VTEwpHGb1b6LgIVf74g7KxpJWAToq6k2
 C5b8dQS6Kk9+Cq7M5kZChi6HYxbaRM7TXia9xbTWDCZh3E8PzrScO9UFBqJZJj6J4V
 ONuudH+N6asJQ6FCKuM0hzgzeZlOfS/buiZXLgFfOpotoRLvRa0mr9VUH8WJpIfEW6
 hqJ7E3yDONAjQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 92E8E610CA; Thu, 16 Sep 2021 08:20:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214427] Amdgpu hangs kernel on boot trying init debugfs
Date: Thu, 16 Sep 2021 08:20:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: inferrna@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214427-2300-e8Emr2hElL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214427-2300@https.bugzilla.kernel.org/>
References: <bug-214427-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214427

--- Comment #2 from Ilia (inferrna@gmail.com) ---
Also my GPU is Polaris RX460 (ASUS ROG 4Gb) flashed with bios from RX560. P=
ast
3 years all was working good.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
