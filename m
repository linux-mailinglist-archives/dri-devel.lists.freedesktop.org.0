Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A393CC2DB
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jul 2021 13:44:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 388C66EA5B;
	Sat, 17 Jul 2021 11:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9546EA5B
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 11:44:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id BB1A1613D0
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jul 2021 11:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626522284;
 bh=gHWHgFND9Vt3RLoi8Ac5yLs/BeBVk9pGMITwf5YhsZk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pOLJtM4FF7KJ3N8SM+KmKyLu6pIjcHPeZjA51mB9yWgv+Fj2FhZpomPILHJOOEI1V
 Lwh3sJ22CzHYS2nl3Cs4mJtsPWevas7WimDgQzur6CBVEq/zxN/ctGtUit2krD8EJ4
 ePceXcG7WC5HvKe6HfStQT+uEGquwGgImXefTN7zPFEDnPF1zhadXTqUNz9jSRFgrr
 IOI6nT+2nB39nPB62ECY1IQPTMBudKP4493uQye/1iodxMAFhY4GVNs3MvBzxGHikr
 3lW/zh1s6JCWv+liNpH79XsyfiThfA7MhQJRaj2CXcRNxFy2dNYtJY+v00xEGPmRo/
 +YRlWKFMesYiA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id B29F3612A6; Sat, 17 Jul 2021 11:44:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213569] Amdgpu temperature reaching dangerous levels
Date: Sat, 17 Jul 2021 11:44:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: martin.tk@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-213569-2300-iepwnGXjGq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213569-2300@https.bugzilla.kernel.org/>
References: <bug-213569-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213569

Martin (martin.tk@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.12, 5.11                  |5.13

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
