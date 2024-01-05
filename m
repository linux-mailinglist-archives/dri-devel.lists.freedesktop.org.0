Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC25282529D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD3010E5B8;
	Fri,  5 Jan 2024 11:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D782110E5D2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:15:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2B7A861A6C
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C588DC433C9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704453326;
 bh=Hcazbb6Y0FmA49dQ3MwUN0bIfNtHn6cQLaogPsVX/Ds=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mF0NAZGN4ylI5nO7V91ZfEI1gh3M3UQA7BK8rXDckoofJm0eHs9Cih+rje373noR6
 P0FoaJQslbYLbWOyK8jiNtlm9mU8cuR+UAOvIvwsX5Qq7ODabeZfCqUNaOvAaTo1/q
 gmmQiqNIlX1SaSbVANXU9uVwM2wakmY08m4tA8bmuzu5C5wtvpB6MO8KwibrdGpJn7
 +EQHsv07HN9ZeS3wO72/pxGGpz9YpdlW79pSCqJOXANPaB5DoqRb+wzhcGLGLec3Sz
 kyR/mPdtLtYrTK6Qnu5ak5dx017OEgMZtPXYmcIzjd0ACJ9ED3kVXuZ1BG2q3KDVqx
 f3rPXRS6wbCWw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B05EDC53BC6; Fri,  5 Jan 2024 11:15:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218347] Crash. amdgpu : drm:amdgpu_cs_ioctl : Failed to
 initialize parser -125
Date: Fri, 05 Jan 2024 11:15:26 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218347-2300-eDz5w81ZQg@https.bugzilla.kernel.org/>
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

--- Comment #1 from Rik (riksoft@gmail.com) ---
Created attachment 305678
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305678&action=3Dedit
systemctl

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
