Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0483400C5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 09:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DDA6E0CA;
	Thu, 18 Mar 2021 08:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F036A6E0CA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 08:21:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 233C164F3B
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616055688;
 bh=K6iLwndZp8aqo6JvsqQu35G4FdzxiJ+utswpP2nC5AQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ULO713bwT+4nuDaW2VKVc1vK4isBcb/+Bw3DvQyb/0SIGvhDiyf95Weuq3mONFfWc
 Bt3vLbgeT60EP4G0fOzhRiGqphE/3dgEBgK2mBF13kE5QKX6vI8iUgz91ONvx8Uf5j
 OET/inqWnljkdIrIgrtTJd5ZmYQlkuddgjPPtCl0q7mzYmj47TYZ3m+AS40qRqfDVI
 DmsBOJbx73OtST7uHeP5k/hlVo62SeKDZwwgubSPFw1pZIzYvK9Bt+2eTNyne/a/Ve
 pKz0WX/d+xjOntnYo2CP3lRokhhAJOPOtrWL8Sd4DOxoXQhRhwp/044byQUpDE649A
 ILkW8QbZVH31Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1281A653CC; Thu, 18 Mar 2021 08:21:28 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212255] WARNING: at arch/x86/kernel/fpu/core.c:129
 kernel_fpu_begin_mask
Date: Thu, 18 Mar 2021 08:21:27 +0000
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
Message-ID: <bug-212255-2300-QysfWNySOA@https.bugzilla.kernel.org/>
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

--- Comment #5 from Felice Tufo (info@felicetufo.com) ---
Tested also on 5.11.7

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
