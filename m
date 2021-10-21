Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F0435BD7
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 09:37:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6466EB97;
	Thu, 21 Oct 2021 07:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949E66EB97
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:37:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 62033611C7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 07:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634801834;
 bh=zi469HUr7y7Zl2phuW8r4Sz3Z0P9zsBCL742d+GR/qY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dqmfFgiL4VFOo4XTcFoCpWk6iCXjzgze6OSJVnFvkimLO6NKwcqfW99bjrapMtK/1
 MrWGQJ8Nh+eBDhT55+Y57FzhDP3Ma6ALA2uGp0YlW9sL2HSh9XkbqiDDVtiH5WnHBi
 zx+g0AtQZoALJAdN8XQOpXxrDQliaRimgZ1HlPP9udn6VZEJkKXBHvbEIqGivrd9VL
 elPONmlZNkigZpYnlVzp0GH7oDGuxR/LWN6OpieMeS6xpaRsjhTsmCECYAIuIpgcHb
 pwX1yPzdpBMWofnG+Z21vFbWV6ZM2sPGrkyxvfoSZtmk9evG2ERqqn+tzTHlAxdkk7
 1u9MZslScGjyg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5E88260E8C; Thu, 21 Oct 2021 07:37:14 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Thu, 21 Oct 2021 07:37:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214029-2300-f2Uva8IBKH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214029-2300@https.bugzilla.kernel.org/>
References: <bug-214029-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214029

--- Comment #20 from Erhard F. (erhard_f@mailbox.org) ---
(In reply to Christian K=C3=B6nig from comment #19)
> Created attachment 299277 [details]
> Potential fix
Fixes the leak as it does in bug #214447. Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
