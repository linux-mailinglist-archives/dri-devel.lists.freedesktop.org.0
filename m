Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8546334BBF3
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 12:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 124056E188;
	Sun, 28 Mar 2021 10:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1656E162
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 10:07:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 398E761969
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 10:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616926073;
 bh=kYynchJg2a5TvQcX5HmlS65TC8GXLJRQh4Gj4sBocG0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CV2p3abdZVQ751LOemDAF/MkIHK9792CoSR6XU0e/7ASO2LyfHuyBJ9aFJgYIxUNX
 5EATi/dtJ16Fm6x1AVXUP5UMClJG3DTJlOTFCk7Tf+XiWLrPDtJSqFfEv6F5PWYILk
 84aTsefdF5IWIPeEFSk4BzFnbmvxTjoGQHWaO4YMhvG3EqX7L5wR4hAH52Pv7t8hp4
 YH/qPEbKkgvmMp69yOga4prnKSb/KW7DpqFen+wp0ULbI0VfIjBlyT1K08gxqcUtUe
 ezGjR/tHovD59Vj5uZd2k/C/Fad/gm617TWkG/sMK6+GPzTipazRK2x8PgeGZ58yFR
 LIOfsYUeGdYRA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 32A0662AD2; Sun, 28 Mar 2021 10:07:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212449] DDC requires amdgpu.dc=0, HDMI sound requires
 amdgpu.dc=1. Make them work together!
Date: Sun, 28 Mar 2021 10:07:52 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212449-2300-btw0JBIcAo@https.bugzilla.kernel.org/>
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

--- Comment #8 from Vyacheslav Dikonov (sdiconov@mail.ru) ---
Comment on attachment 296109
  --> https://bugzilla.kernel.org/attachment.cgi?id=296109
dc=0, hw_i2c=1, DDC works no sound

DDC FAILS

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
