Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D46AE34BBF4
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 12:09:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E040089ED6;
	Sun, 28 Mar 2021 10:09:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF1189ED6
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 10:09:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5DCB561976
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 10:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616926169;
 bh=Q9c0VXiIlSOALJS5SOgkifzHKWtRLqPLleaeKGoHmJQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qSO4beZYzpPEgSGZHeo7jFILp8b5oXGYLEw9hxFWsGqwIjqM/nrcBdZI6E1CX2h1n
 LEgcDwbD6osgf85JqvI0rENfBbAvjvP2NVrFaqJVHTTRwAPpdRWHEoCeq1z+goMRZw
 t84m6mnt+5L78GJE9TIAB2XMhf3uSTnDAGZxsa1hxcsrKgdNDHYYKb2lrEF3prZ6NW
 AAFSACswYO0Iqg51NfMz3f6E/riwNNAvofL32kPBudNIxo7Rpsl555byj+lxrF4x2b
 paz8TQs6Ch1IOJwfs+nCTOeB1OvfnxC+xsWoAfd+Gon0z4E/xnOx6y3QXL4Oy1D5U7
 0Y9fqW2ZCU2AA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5AEE262AD2; Sun, 28 Mar 2021 10:09:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212449] DDC requires amdgpu.dc=0, HDMI sound requires
 amdgpu.dc=1. Make them work together!
Date: Sun, 28 Mar 2021 10:09:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sdiconov@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212449-2300-urLNtkUl9f@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212449-2300@https.bugzilla.kernel.org/>
References: <bug-212449-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212449

--- Comment #9 from Vyacheslav Dikonov (sdiconov@mail.ru) ---
Created attachment 296111
  --> https://bugzilla.kernel.org/attachment.cgi?id=296111&action=edit
Reference logs from a different computer attached to the same display

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
