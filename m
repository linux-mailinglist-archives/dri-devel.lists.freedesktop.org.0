Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CFB43B2E21
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 13:48:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E03B96EABA;
	Thu, 24 Jun 2021 11:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D67AA6EABA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 11:48:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A3043613DA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 11:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624535295;
 bh=vQnW5/Si8aCLsTB4OHCjlqDOiylc9gKwD7qxM+zIwTg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=r9YQ9Yh5zl+qPeoTOB2dfTAL65mFCrzufhNEdx9ter/JLF7jqgJFC8IZjG6sNzVBX
 8WgIzbWpXoQNnpWhe9Z8+hrN79fAEnN2lz8rsO72CZRxdLlPKYLfbCtT5EVNP7VEDD
 KjCt9E8Yffcw1JiCbXHDxFLl8uuO7ZK4StDYnYzqzEem4srnLRHh3u6rS+BO98U7jP
 pGPRY20EidY6/hMetG5UjxYUtQWa02g3cdmM9dFBkpXmOxQ9u2pjEt2fE9BvAFopa0
 b3lUZqXdjRbldnVXwEfCnPI8vxCHw+nQ8WthIH30NMnbXJ1ze6HjX6mX6Z4Eea24I8
 g6PgPurtAG97A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 95675610A2; Thu, 24 Jun 2021 11:48:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] AMD GPU can no longer enter idle
 state after commit
Date: Thu, 24 Jun 2021 11:48:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213561-2300-L5i1rlcalj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

--- Comment #4 from Linux_Chemist (untaintableangel@hotmail.co.uk) ---
Yes, it seems this commit was also pushed into 5.12.13 so users with similar
hardware (gfx10) may also be experiencing this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
