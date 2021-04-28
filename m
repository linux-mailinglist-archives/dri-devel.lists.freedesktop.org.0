Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5536D810
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 15:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7E16EB36;
	Wed, 28 Apr 2021 13:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B209B6EB36
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:10:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 6B23960241
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 13:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619615444;
 bh=rhQoWUo0U7zqcLy5347RNMd7YjdUFhabGvFHFuBaiHM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VNyCa3PQFQ9X043tifEkJOYXCXebumik1St8AM4DLYiGoHVs9EUI+TdRAK2ZO2txu
 tan3Frefqq/U5SqVcJcL2VCsLXeaPcTZPGCETe1IumF/f+lhkvyszglJWuNP0V+dww
 qlha6qRZVy9UUI8olebpxtWjDLQ9NmNM3Ss6zZEUIs3EpFSR4ZfWdnDjKYRNSf8DWb
 8uJz/qi2k3BCC9/NCtunF/F9Tld6KV5+mXTsEC4BqBOcXGDkbHMK8SNNslv4oyshra
 RuTDqzbco3M1epgBRg/477sz81eyxz4sxWKlCItoGu1TgmLzZucaGvcjE4z4aASGz5
 1UIesPsYOD8qQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6990561288; Wed, 28 Apr 2021 13:10:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212871] AMD Radeon Pro VEGA 20 (Aka Vega12) - Glitch and freeze
 on any kernel and/or distro.
Date: Wed, 28 Apr 2021 13:10:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212871-2300-jhpw3qIcRQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212871-2300@https.bugzilla.kernel.org/>
References: <bug-212871-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212871

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
Note that you don't need to file two bugs.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
