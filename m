Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D5A5411753
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 16:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC5DC6E51D;
	Mon, 20 Sep 2021 14:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A4D16E51D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:43:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1389F6112D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 14:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632148989;
 bh=S1iMq2pfqUp3ukMWekueqvphqJY7lhW0nYzkrIsJzyk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pYw1sCS93TLOziqcQvw7piniN/UlF09wm0y519alsO4lk6TlgBp9dTilMjYkyprQy
 ueG4f26bmGU+Xlx2RnIw4IB+0rLI9i1rLTFh21AFgS7QMmxbLHqqCD+JomHIoF0KTb
 lwSvEHquZCyStERGymkfSGbGm+Gu1IWl+VYz0FrlcwI6XBRk4leNRQttiG3/oleb0i
 hB5TM0xiStWrJrkkqNykCOiyt3q2hJeKk28bAw9552vU940l7HowQ/ZHTqDQ/85lAE
 eXLDiJSvqJm5Dt13T00bsIDsaBI47QN0RHBGZRQzmxWXKbZK+zbngsCkyhY27qHPfJ
 w1R9z07L5Ky3Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 108C360F50; Mon, 20 Sep 2021 14:43:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Mon, 20 Sep 2021 14:43:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youling257@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211277-2300-a3PQJBUD8u@https.bugzilla.kernel.org/>
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

--- Comment #60 from youling257@gmail.com ---
Created attachment 298889
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298889&action=3Dedit
dmesg5.15.txt

(In reply to James Zhu from comment #59)
> (In reply to youling257 from comment #58)
> > drm/amdgpu: move iommu_resume before ip init/resume cause suspend to di=
sk
> > resume failed on my amdgpu 3400g.
>=20
> Can you share whole demsg log? Regards! James

when resume failed have to force shutdown, how to output dmesg?
only has boot log dmesg.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
