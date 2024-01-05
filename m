Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 700EA8252B6
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1E9410E5DE;
	Fri,  5 Jan 2024 11:23:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEEF10E5DE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:23:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 68FF8CE1E43
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:23:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC2CBC433CB
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704453801;
 bh=e8fieXYvEOr3ZdflQZVOfIOny7ogutRv5jDgZSgezzE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tZ9x0m4AknsFG97ug1TGiaEEJ9u6+vrOnEy3M88AlURoUjKh6H3pvOxk5ynXUmnRn
 3qza7fpTxV0n0JmzBAJ/nwufCPoi9igGY1fVbmbxN+pCkR4joNPzuU37eGcl6B7qgU
 NkHQ9yocyh38FlOFhX31nX9Gd1ZEpXiY70dGdwIGThUsoAnhiPOKJjSmyAjvpKbPCC
 R+eiTOuzg86mCJrXMi0T0bklKjKbxJqTsMB3AVJhHm8ScR/t//AEd0FEpDDgALXaup
 +wmwUwlRNK5ZVTEy7RWbGyqAlgLISt5+qxkAcqkcaepbb8Sb01+tQQTYnVrvuwl/mt
 PEmXID+TIBLkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A3B2CC53BCD; Fri,  5 Jan 2024 11:23:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218347] Crash. amdgpu : drm:amdgpu_cs_ioctl : Failed to
 initialize parser -125
Date: Fri, 05 Jan 2024 11:23:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: riksoft@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-218347-2300-tLb7S4AcqR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218347-2300@https.bugzilla.kernel.org/>
References: <bug-218347-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218347

Rik (riksoft@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|Debian 6.1.0-17             |Debian 6.1.0-17 (=3D upstr=
eam
                   |                            |6.1.69-1)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
