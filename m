Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2189443B1B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 02:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AD57399F;
	Wed,  3 Nov 2021 01:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC497399F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 01:46:20 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4CB6A61101
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 01:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635903980;
 bh=aEJHp9NrFfJEzYQBGn+2uU4g9IMAMM1RepcvVVkxJ78=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=omYeFNIXDzHBWG0I4EoLF8C+4qFtaSP9XVUt5qZXFiHID9RdyOhDWT8/xH7L3AQkN
 B0kzsXQn+WDQlIojkVeiEgTpZ4ZVgFkxMDCk85JqRi8NZTfUqPHalsMrvpWYq7oUHk
 RsrNhcsLe8xsLtQRl3OprBJAADUHnbXbT+ENy9wmPGhqnjBUD+VCTfVI5aZePJQMrF
 Iw9c78r6bxUuZBylDQR4nz1j9akPwcmA5kx0M+oV9qQKIKFnuM654f4bTaS2PCrrdc
 wnVvzDEghY4RdQZrfXwAJ8LO/H1GHAMWSWt+Z9GFZkHNatLEq/ovG0x+Dq2FJEIiHE
 5lxA4Q05D4H9Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4523660F48; Wed,  3 Nov 2021 01:46:20 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214859] drm-amdgpu-init-iommu~fd-device-init.patch introduce bug
Date: Wed, 03 Nov 2021 01:46:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-214859-2300-jhDvEmMtbr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214859-2300@https.bugzilla.kernel.org/>
References: <bug-214859-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214859

James Zhu (jamesz@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jamesz@amd.com

--- Comment #5 from James Zhu (jamesz@amd.com) ---
Created attachment 299413
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299413&action=3Dedit
patch to fix

Suggest to upgrade to 5.15rc7 and apply this patch, then make a test.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
