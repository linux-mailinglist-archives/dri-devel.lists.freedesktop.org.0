Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2DB304F22
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 03:11:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208086E4DE;
	Wed, 27 Jan 2021 02:11:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35DC26E4DE
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 02:11:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 05E0364D95
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 02:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611713491;
 bh=8q6zRds6XtZGZ/3m2bkHJ5197vMZpL0qcrw+AjD5wjs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dn+vQL19OaEnwdTWv1DVIM/5BbI9JGGNgn58upjaUC/bngve97zLAY2J8JceOH7f9
 YSWBSkpnhV02IFOIJMLzP5dbTMmwS7yaPML7d92+TgYchx+Tj/6EEET7OV2lf8Otnl
 yYBXwOXj2Uu3sh0NrxMH+TesFHQbiWvWtzAbsKKnaVCur93vHp9/9pb09SKAfY2bdc
 uKOENgkHbeHfLX6e79DW97O1pj+3O8Lfpr8udQtnJbypQLOEq8p7NClrO0uJdfS3AD
 HECGPKrnr0p+Jtn0iif3FU357BEWD8iYkJWdGeIOPC1nxqISnWDtBrdBhDiQEammS2
 HxmBjc9byVgGg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id F255B652D1; Wed, 27 Jan 2021 02:11:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Wed, 27 Jan 2021 02:11:30 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-211277-2300-fqdBDSbJKm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=211277

--- Comment #5 from Jerome C (me@jeromec.com) ---
Created attachment 294879
  --> https://bugzilla.kernel.org/attachment.cgi?id=294879&action=edit
Kernel log

Unfortunately it crashed again although I've noticed it's been crashing a lot
less (4-5 days) since I set kernel parameter "init_on_free=0".

I've attached a kernel log for 5.10.10

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
