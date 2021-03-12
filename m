Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C59F033974E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 20:18:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF3E6E029;
	Fri, 12 Mar 2021 19:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD926E029
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 19:18:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D1E4264F3F
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 19:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615576730;
 bh=1iMwN9Pdc3nf71ZgxB/CyQ8EvN6TZi+dK11r6HYmUKI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LGqmLgBL6YCH31QBryeAZvsRfsIFV0agBLyogyyK2yVqGfi/Fh137+AQLaJ4Jl9Kd
 fiicp07nkV5myA31QmI+D8FNcIzwfEZlcJzABItBtXRbuglAgh1atnaBljj3lBaKd+
 bROdQr680jwHzl4CPj5RFSlDCde/HpGNhLCoNn78yEd/v1SqFsT0DT0zHFedN/vhJe
 ivMkL3+A3pGbHKgagy9f8O698dR8U606Hb/ajhYTvThxTDLTT94gowhMXdiS7LMc1X
 GSztQktKUyeRjaqLdNQubBCCETpcYc/jyBp5f+lGzC+wrFttf7OxDnhBqajDbuwVWt
 faHBOSqlgcA9g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C360265369; Fri, 12 Mar 2021 19:18:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212255] WARNING: at arch/x86/kernel/fpu/core.c:129
 kernel_fpu_begin_mask
Date: Fri, 12 Mar 2021 19:18:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: info@felicetufo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212255-2300-Qh0BLKm34n@https.bugzilla.kernel.org/>
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

--- Comment #2 from Felice Tufo (info@felicetufo.com) ---
Thanks Alex,
it seems that Linus merged those patches (just today) for the next -rc release,
am I right?
If so, I'll do a quick test and let you know as soon as Ubuntu team will
release the next mainline kernel (usually just 1 or 2 days after -rc is out).

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
