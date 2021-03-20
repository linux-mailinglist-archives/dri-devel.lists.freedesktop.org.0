Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DD15342B77
	for <lists+dri-devel@lfdr.de>; Sat, 20 Mar 2021 11:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A3386EB50;
	Sat, 20 Mar 2021 10:02:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA9E6EB50
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 10:02:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EA1B6619B0
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Mar 2021 10:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616234551;
 bh=4PFqNTgDJuxtnLK5c2k7S3QjaTpEvWU6htVTIpZZ6fg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Mt9mRp51QUd3lakh/UAepUIFwjQAezPdUU2KPCpDCL01lzC3MU3pql00aL8XL9fEt
 TABxCBoWYBT9ROqNZ5i3CDC1/sofrAUcB0+h/8lUHLjDASQOyIF+fsp7LYHXWwydg2
 COnP/CZx1sKmP/zN11MQCjtN/3zgooaRkFSE3pa+50VlDHqA9CKwi9HFo/4J3ka7a+
 s1GR2zR6Wwotb3f7zwpEt9UtYMbvDp50h9JlbhsDElveOgvYj+dB/a47FN1DdUH4F3
 Bsf2xLaH20gdAo0g+Kd6hVihTG7j6Ao44j3pl10n9a4pJDnTbYZTZDHZsTKrB5stmf
 eRqd+BZYCVaLA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DF63B62A61; Sat, 20 Mar 2021 10:02:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212259] Entire graphics stack locks up when running SteamVR and
 sometimes Sway; is sometimes unrecoverable
Date: Sat, 20 Mar 2021 10:02:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: happysmash27@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-212259-2300-Q4Njp2ex5n@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212259-2300@https.bugzilla.kernel.org/>
References: <bug-212259-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212259

happysmash27@protonmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |happysmash27@protonmail.com

--- Comment #2 from happysmash27@protonmail.com ---
Created attachment 295961
  --> https://bugzilla.kernel.org/attachment.cgi?id=295961&action=edit
Full dmesg 2021-03-12

This is on the AMD Radeon RX 480. Updating Mesa does not help at all; it's
already on the latest stable release, and the last time I was on the -git tree
SteamVR failed to start entirely. I have attached the full dmesg to this
comment; if you would like, I can also attach several more dmesg's from when
similar bugs occurred.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
