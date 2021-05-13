Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DFE37F2F6
	for <lists+dri-devel@lfdr.de>; Thu, 13 May 2021 08:26:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A21CA89DB2;
	Thu, 13 May 2021 06:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2595189DB2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 06:26:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D0361611BF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 May 2021 06:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620887209;
 bh=Q93Lqjfq0abB2puGpf+IR+2T3YgJ2pz5L7Hyiyr8Sjk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jTQLhrcKp0Tst5Ny56kVuIMyb9tDuwUw/dhydi3DzIYz2pc/ouRVbbXpgnpGzQDq/
 aLC6G0nGNfcryAMhw97xm8Ok26YpSw7l7Xd5hX3BGJkKVlojG1lqWzIRcJASXSUuWN
 XDLhZMrMZBCMNAXe9LH/qwpIM+/wHseEv6X40KFyLRFGlmZbyvVIt/LvG3K2KFfSap
 dIftsmwiy+V4WqCnhwN67Iko87+DbUcFFdP+w0fhKx7McBR3wqopZN54sbXf4nNaSI
 WvGPSsyttJGfaZfFqFTLiUXxH9GCvik8kbz0xz4QJFNxaeZMrKv+yPiAzfmbczL/jI
 jP9e5/VtUeYRQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C47EC6128B; Thu, 13 May 2021 06:26:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Thu, 13 May 2021 06:26:49 +0000
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
Message-ID: <bug-211277-2300-m0G8yvb5Vu@https.bugzilla.kernel.org/>
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

--- Comment #18 from Jerome C (me@jeromec.com) ---
(In reply to Alex Deucher from comment #17)
> I don't think we've been able to reproduce it.  That said, we did double
> check the programmign sequences and I believe it may be fixed with these
> patches:
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/
> 71efc8701a47aa9e3de74bab06020da81757893f
> https://gitlab.freedesktop.org/agd5f/linux/-/commit/
> a8f768874aaf751738a2e0350bf2e70085f93ace

I've tried these two commits and the issue still there unfortunately

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
