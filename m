Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFB503AA5B6
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 22:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 546076E821;
	Wed, 16 Jun 2021 20:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 050386E821
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 20:55:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B49CA613BD
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 20:55:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623876923;
 bh=t9J4Kyc5AVTcEEBSXMj3mdwZUpxnNnLFyXjZqcj/pz0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=THoy0EAp2RPmoW2V8H8kh3mXC0yAgo8dbZq/u+04/NguR+reXYZxaHFY6EbtXcPY+
 FZxVl0He6/gIrmJ2XgVjav9DHz6oFeKbfjUXkCm7magIA1/nGJ3gSn454QZLnrtEjr
 XMeW72kIJ9Ldyz8yvhLY7JWSC0ZtE5Ux6xp1HwmkJXIrFGbXEsNDdZt/fmb8OrUhcW
 XbcZs9Eymw42OGiD/E5og8mj/9m7QQ/H1l2j3o38M8fYS/7pWuP3VPo16obk65GenJ
 JLDXeFnb/fuIGgG0n0AJofyKzZpls5bFNZigNby6jhP1IUZuhFa5E4RBRaipVNOx+D
 7rFZm59jcZepQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AC92760F53; Wed, 16 Jun 2021 20:55:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Wed, 16 Jun 2021 20:55:22 +0000
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
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-213391-2300-KNMtyw48tw@https.bugzilla.kernel.org/>
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

Leandro Jacques (lsrzj@yahoo.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lsrzj@yahoo.com

--- Comment #17 from Leandro Jacques (lsrzj@yahoo.com) ---
Created attachment 297413
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297413&action=3Dedit
Crash log for kernel 5.12.10

I'm having issues with amdgpu since kernel 5.10. I had to downgrade to 5.4 =
LTS
to get rid of any kind of issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
