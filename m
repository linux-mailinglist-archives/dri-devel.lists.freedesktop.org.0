Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C67402366
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 08:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B201289CF6;
	Tue,  7 Sep 2021 06:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A45B8931D
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 06:27:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2200A61106
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 06:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630996027;
 bh=zOKAGEEeYPoZOmuWy2ba8WiUQT1xGEa1Qq9RwBNo+kM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mUYjqLRT3NG4eVtCimPFb26CTyAGTOKn8pELWdNtd0FoKsixb5CRFQIru78Dw1Bx2
 Xb6f88NV5r4H/eT06DnwUbtvpaY/ZvLn2+KabBL6ekHAX0rnQab0b7g28nscPskPvQ
 ambYdZm93nxevp0Nb+ebcQEpUlVsbZr0lntBrcL2Bcsjj9Adq5pJRW5B6RNiS4AeeJ
 nlvwlDY8naMlvp0bgbHo4lU6hpRo4346xr2wNzjGJdfoiqDJ4dwVB4Zf6FdnULOmtf
 O0G7iENS7ja4+Lsg9pMYmARwKIZnzygHWu4JzJUV0w7a+cYniUwE2RlTgtUUTZyh4i
 8djvOVHFRVmmw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1F43560FC3; Tue,  7 Sep 2021 06:27:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 07 Sep 2021 06:27:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@jeromec.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-WukPxJK2Ml@https.bugzilla.kernel.org/>
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

--- Comment #54 from Jerome C (me@jeromec.com) ---
Hi James,

After 900 ( 600 on LLVM, 300 on GCC ) susp/resu using kernel 5.14.1 compile=
d by
LLVM 12.0.1 ( LLVM\_IAS is unset during compiling ) and again by GCC 11.1.0,
there no crash on resume, awesome. It usually fails between 1-150 susp/resu

BRING ON THE RYZEN 6000 SERIES APU

Thanks

Jerome





\-------- Original Message --------
On 7 Sep 2021, 03:00, < bugzilla-daemon@bugzilla.kernel.org> wrote:

>
>
>
>
> [https://bugzilla.kernel.org/show\_bug.cgi?id=3D211277][https_bugzilla.ke=
rnel.org_show_bug.cgi_id_211277]
>
> \--- Comment \#52 from James Zhu (jamesz@amd.com) ---
> Created attachment 298691
> \--> https://bugzilla.kernel.org/attachment.cgi?id=3D298691&action=3Dedit
> Fix for S3 hung issue
>
> Hi Jerome and kolAflash,
>
> I think iommu device init is put at wrong place during the resume. I atta=
che
> a
> patch. Please confirm if it works.
> Thanks!
> James
>
> \--
> You may reply to this email to add a comment.
>
> You are receiving this mail because:
> You are on the CC list for the bug.


[https_bugzilla.kernel.org_show_bug.cgi_id_211277]:
https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
