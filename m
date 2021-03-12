Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783E4339766
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 20:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F5A6E02D;
	Fri, 12 Mar 2021 19:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E8006E02D
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 19:28:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 074F564F85
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 19:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615577324;
 bh=A9tESBiuJdQ646rxc2DLIV0kQ5U1WCdesgCUcVIlOJ4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=H8Job68hQ4Yf3qCtzGeWOz/xzXtGz/codcih95kW94SHa810xjHxx8pwjJn2RSgs6
 axiJf/Z/xr5pl8V+li8L6BBBLZykFFOeWp6rygDBFl5XqMV+dcCf44WTdac0HiPnTr
 Ipv8VCfxnFWZyiFwc6eQ4AAVLzwLxgbN5SbsKhQPpRc9BuokAHdoPiiNUfyt3Hsj2u
 BYRnCMJ9nbEfsznqIh5NuXloUOJBLusQgLHR/rjQYID0zP6zzE/Y4jl5bvNLnbboNe
 RZQLs+4bidxMTAx6Jno7h/tOhUGAi0h0T726s7PfsbQpS1Yfwcgc806Jj9nzH/fVJv
 2JN+LTS+6rDwQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E77CE65369; Fri, 12 Mar 2021 19:28:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212255] WARNING: at arch/x86/kernel/fpu/core.c:129
 kernel_fpu_begin_mask
Date: Fri, 12 Mar 2021 19:28:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212255-2300-yjoxv9t2GY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212255-2300@https.bugzilla.kernel.org/>
References: <bug-212255-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212255

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Felice Tufo from comment #2)
> Thanks Alex,
> it seems that Linus merged those patches (just today) for the next -rc
> release, am I right?

correct.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
