Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 127F234BBDA
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 12:02:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A6E589CD7;
	Sun, 28 Mar 2021 10:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3997D89CD7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 10:02:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 180DF6197C
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 10:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616925738;
 bh=a5B17P70DhcI+B0ZaNasckDD5uVQAh6ICaWXgqCU0J4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pdUlxJ2XYxcWpC7tRYPLciPrykYRrNG4+Kl2eDaYFntnE8aVj+s2tLyYiSRelyTvY
 yEZ2KQamY5lUrze0u9jrrezqbfWBQta00sl5Yy7LOvH2nALxkSRXZuVMhxJHaprfpC
 0lUkBlrd2QtwTpvbCLHSBGLVc639/M+8UHz6G+M4oIjY8HgN2W4dodCUhuGG5UcxHH
 d4aGf5vGXnFVliLe3aw0MPxyn9G+BPfg+Q4Oeu4393hR++wxhEilGU6GdJM4hBYOU7
 TWsg8dP0kF8oaEEbgVXdCbNcpWSVCBLNFi3eBx2mvIB+sKSK/qTdJp93I/1xZcu1Jm
 YQYeSEqatM+Ww==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1337D62AD2; Sun, 28 Mar 2021 10:02:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212449] DDC requires amdgpu.dc=0, HDMI sound requires
 amdgpu.dc=1. Make them work together!
Date: Sun, 28 Mar 2021 10:02:17 +0000
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
Message-ID: <bug-212449-2300-vmmSqj78RO@https.bugzilla.kernel.org/>
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

--- Comment #3 from Vyacheslav Dikonov (sdiconov@mail.ru) ---
Created attachment 296103
  --> https://bugzilla.kernel.org/attachment.cgi?id=296103&action=edit
dc=0, hw_i2c=0, DDC works no sound

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
