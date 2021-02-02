Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 940D730BD19
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 12:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F726E0F2;
	Tue,  2 Feb 2021 11:32:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122AA6E0F2
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 11:32:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8E8EA64E9B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Feb 2021 11:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612265559;
 bh=Oq9Yryf7KLerQu72pe1ND7aD6OdDOVTDaSgNCixX7Qo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BiW4hWS3y8BrJnrKQH3lfEMjW9t2vWruuvF7qJTgfMKErKuYUlfT+GsP2wUFBBM/N
 bwlwvqdC5gwOTzFVyk0+NpCyxvGdnZlyiHIal9kPECDHhGCjj8Di42u63qxC0Sg7yu
 GQAJsbW9dsmUmyAerTbMrCJIYnObtqLly185byLfx9mFpE4vH/WIOewDukKALm7KzC
 Ljt/RpgeLA+cQBvz37+JnTG3XfvWhezhhbjjTOGMVUZmxx8KYWFnQPMEaHe0dx/dRI
 51i9YXuH+GlEzXZHnu6/zmCQZDXpFBftu7EvyT3tU5cUZKKHNnsIfLSt3z/tNBS4Av
 2cRDWOK6gfDxw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8109B6530A; Tue,  2 Feb 2021 11:32:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210263] brightness device returns ENXIO (?) on brightness
 restore at boot, with bootoption "quiet"
Date: Tue, 02 Feb 2021 11:32:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ninelore@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210263-2300-i9aX2Lj9y6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210263-2300@https.bugzilla.kernel.org/>
References: <bug-210263-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=210263

--- Comment #1 from ninelore@protonmail.com ---
Can confirm this with a Ryzen 7 4800H. Any news on this?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
