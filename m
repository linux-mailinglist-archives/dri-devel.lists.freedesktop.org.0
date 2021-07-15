Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 207BC3C9F7C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 15:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F576E853;
	Thu, 15 Jul 2021 13:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4401C6E853
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 13:29:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B4F40613C9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 13:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626355784;
 bh=Q83V1wcj5HgSaizOaFwgtVXJfYwWZb6TyIpWVDTqSCU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aAKut2xFYpDWP27kVB3q/k/FVMOeXoR1ibcGrDco39sHOXGHvK/o26SgxkUj4+83c
 yvw6edPG+afROzt/jyJiwGbPQVADXmlUW2jNxijucpAXx9eaFSvkX3LykESy2b+mGp
 hAt/Yi7Mx1igkAUsv1xkWhASCGk3qi3HhkMY5YCyquwIE+mMaVdFUC3eRWWbTwddVW
 rrmv1Mf6YN3Im6Ldqq/TkjhKWfziE7BzIkim9sKe9H17YUTfzgJ448TNIbVycKYvRV
 nI29UZM4J2KHxDhHpJSDsNoTRzqoDoENVuY5zFHij+WQ0ioMiH4BA66UabEodlz2Em
 U7ypIFAlAJYcQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B13346128E; Thu, 15 Jul 2021 13:29:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Thu, 15 Jul 2021 13:29:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213391-2300-bUVFu5lnJd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #33 from Leandro Jacques (lsrzj@yahoo.com) ---
Created attachment 297881
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297881&action=3Dedit
Kernel crash log for linux firmware version 20210511.7685cf4

amdgpu kernel crash log when the problem ocurred, with the exact same messa=
ge
telling about page fault.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
