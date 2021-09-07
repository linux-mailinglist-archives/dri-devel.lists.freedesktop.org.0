Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 120424021DC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 04:00:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E94C89BF3;
	Tue,  7 Sep 2021 02:00:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C289F89BF3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 02:00:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 86C6B610F8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 02:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630980011;
 bh=GFqo7crKpU2VheNCzN/6+Q9NIaXRrJN6z6Xtjopa26M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bhCS+tjnRXKpiE0EGpktCb3optx01qf2v5jcnntdBkBy7vCjza5wA/ZNqR3AGFvrC
 GUhO9CEYlW1nZqk6Ucas91309jpEN84IuRBqJkGh89PyUHK2ckDuTcbj3dNHs5Y6UG
 5MxAiFOrIKeLsxmwzPYIZWyBaUOxQQn1CHymwTzyAXM7dDGmj+ghsNCwVmH73Ic703
 1czvPzs5/bVrpr+H5QYeH4uemQ1kK+3zTX0hXqsi/7/RYsIdy+5F859QSw9IVxXT1o
 bstGZP/xFPHoMbIdOM0Ku9bqQRAfziJlkC3Xf5ZoICAvrkZ1NKNQrEeYPcFbDDXLBL
 W57kgA8MYAIEw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 81F5E60F91; Tue,  7 Sep 2021 02:00:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 07 Sep 2021 02:00:10 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211277-2300-jim7YpldKg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #52 from James Zhu (jamesz@amd.com) ---
Created attachment 298691
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298691&action=3Dedit
Fix for S3 hung issue

Hi Jerome and kolAflash,

I think iommu device init is put at wrong place during the resume. I attach=
e a
patch. Please confirm if it works.
Thanks!
James

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
