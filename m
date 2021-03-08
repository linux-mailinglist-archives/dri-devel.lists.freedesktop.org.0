Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A1433156F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 19:03:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74A1789FF9;
	Mon,  8 Mar 2021 18:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882BF89FF9
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 18:03:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5F112652A7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 18:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615226609;
 bh=ssDB61+7bKsmaHtoCylkcJDDNFxCAmwhDtyzAAEuDlw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JwX+eRZP4eooaYG4VSUBEmWYiBoG/uNjYegfOAfkBR4sXb31RpPiFWsE0DtBKALfT
 eqVTfSf1p+n9JBI6P4Cg7+BOmutlr/gh8veIH8/A473BnYPF4CUnKjl9opoRY2z8C8
 rjsbcXentoZNJ4htxy2fVdu4DDwFCdpRAO+Fo00RL+g2+j+OhZ3TZcadxGEhGD3zgP
 reFghbxP2ib+ta2N5WCxQ7VOpyliuyKhC7BER5oqN5NUTrWc5h2tg5GHmoIv20gjCq
 SdVC9y1/pFOwVStSvMM3wLM5Xs4UTYIefjG8IuqUvHdWcdPQrS/dbWWOSI/TPQJmZi
 /aoJCYm0A/fww==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 465FD65349; Mon,  8 Mar 2021 18:03:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212137] kernel NULL pointer dereference, black screen when
 using two graphics cards
Date: Mon, 08 Mar 2021 18:03:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-212137-2300-wmrJ1c6E90@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212137-2300@https.bugzilla.kernel.org/>
References: <bug-212137-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212137

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
Likely the same issue as this:
https://www.spinics.net/lists/amd-gfx/msg59207.html

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
