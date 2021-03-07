Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A68B933044E
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 20:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D8A899C7;
	Sun,  7 Mar 2021 19:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 009DB8987A
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 19:37:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 36F636503E
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Mar 2021 19:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615145835;
 bh=SOQXzqVuhQDJUzx0bFJ09SFjS9jEOyDWRRgbmoI0y6A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lt9Qla1oQpqVFw+kZ92aw+GBSlukwX302UtCflpjrKXZ6CUq8ErLOluUMvzGN+YQx
 E/+5fY3sErzwuc5jvFZeEqJsy7gQOshHtrVs8RIUoPueT65NZL+/bHlcjSp2I2aPZv
 HzwzEBmjp2ifnZRQXX+r4nGXEJdveYHtXIqN/ZZmQYSDgJAuAFxdVg6qmlk87106h8
 GrO6yjW7xDDTkBquV7DBxS+RZSapEicWxAr5IUgu82oTvNmjLX6CGp+EG5rMfUXFXp
 fpIvhwaDIljgAL/yWBoxfKyP4xo7nVITIGgkb4CNtjqM/VdDL08j7gMQwj7HpirI2d
 HEPT9gMb9j2tw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2974465349; Sun,  7 Mar 2021 19:37:15 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212109] Analogix ANX6345 bridge fails to initialize after suspend
Date: Sun, 07 Mar 2021 19:37:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jaron@kent-dobias.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212109-2300-n2C3UhcDhS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212109-2300@https.bugzilla.kernel.org/>
References: <bug-212109-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212109

--- Comment #1 from Jaron Kent-Dobias (jaron@kent-dobias.com) ---
Created attachment 295707
  --> https://bugzilla.kernel.org/attachment.cgi?id=295707&action=edit
dmesg log ending immediately after bug in question

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
