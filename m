Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C62444F8F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 08:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB43E6E459;
	Thu,  4 Nov 2021 07:16:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88BF6E459
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 07:16:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7DD54611C0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 07:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636010188;
 bh=Bw70GpI9Rv15SUPCEMf+X3WbJLSamfEEJpMxBaO7k9k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JYx+o/TIZMJeJfBrOdCDm2J+kniHvJI2nv/9thgLMeHriXFUEQJ1N4XcRlzTi7qrE
 mHNRU2ddb+HqmuzNdFQZN9bue5ZEB8CHtunASCzZEOc0oni/y0/YoQ0BMeI2LWDNTN
 n1pP+gcbyGmA2nfvsuPg3MEZGRWMLqdXEM2rn+CKwDaHva65tYaPY8JrrsqSAmJVYS
 O3WWrRxVXx2Z2oNRhC9o9Njp3zvkdHQ0GRD8Mm7lhxhQ9AbVZJvnxLsuGCOrMREXGm
 +vWRZ3ifZ9O3ww6qFesQ/8L2POhHSnn+Ne7gJiCDPZh4EJFoC/y23urQ/gUCOgoBra
 KQBKfjB4vIlPg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7AD3361004; Thu,  4 Nov 2021 07:16:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214029] [bisected] [amdgpu] Several memory leaks in amdgpu and
 ttm
Date: Thu, 04 Nov 2021 07:16:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214029-2300-gMkyzH5Au4@https.bugzilla.kernel.org/>
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

--- Comment #26 from Christian K=C3=B6nig (christian.koenig@amd.com) ---
It most likely won't hurt to have the patch in older kernels as well, yes.

The only possibility I can see is that we then have a double free on older
kernels and that would mean that we need to get back to the drawing board
again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
