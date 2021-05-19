Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8A33891D1
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:47:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C98856EDD6;
	Wed, 19 May 2021 14:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B369B6EDD6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:47:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 857876105A
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 14:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621435637;
 bh=A3wjvb3Xx6pTgC6rMSIwRmttP/zNfAatBee0MoK+Src=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=b9GkjybMPz8tzlMVULPVYHcnQY3oqSE23xuVVOxPAabmq6A7TuBdRmUGRje7NNl7c
 J6F4/W2BIw64ORQBa5/xs5sB9L11XxiDWlNSDxBtIC9RH1jDS5+ZsPfhcXJHLPRUFW
 e00clxkw3CEtdW/spwN3krVM1hKdrTFdp0QWhVrLq5baVlg3/43Q0rqHMNVOiYhIXz
 cNJea+Dv/yGnte27fyJLsCz/G5ZN3iabrICyZunkGK1c95A5sQo97CYjmZ0A/IDtYx
 Z6DXcNOWD/iCupqrtG7+7CpWA57rbBzAVA12l6FA9NsLOB4Qr0Hr/jvZvloQJBg1Wm
 m87WXJ7TBitcg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7F9F46125F; Wed, 19 May 2021 14:47:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Wed, 19 May 2021 14:47:17 +0000
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
Message-ID: <bug-213145-2300-EojxuQCXuT@https.bugzilla.kernel.org/>
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

--- Comment #1 from Tomas Gayoso (tgayoso@gmail.com) ---
Created attachment 296869
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D296869&action=3Dedit
lsmod  output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
