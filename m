Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722E234D412
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 17:37:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88FBD6E492;
	Mon, 29 Mar 2021 15:37:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC926E497
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 15:37:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 5006A61969
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 15:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617032224;
 bh=YKJecHSYmByFe1kFkZi0sSJLuMkDEZxtIzbxphtZrT4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cd9rp2zIvOQF4wZnk8iGsuY5P6PevUBSwyt+dvm5ukR9MM3h8wwYxVlOz48yEww6x
 CiWtnFGHgDmXUu3bClSaKSbo0n3EYtuRzGQ+/Uhem7u11PnIRBZuB/yj3tTta3M0Ve
 MS9/xkOOJo6AjvNUyEqDLc7ouDBmnBnAzzMQr9fVckm68vurf6gi8nh4IPUizBhjAD
 0K1xsD5lee/hDarBBV3ZJTpAglhqb0AnsBzglKUtZKqa40nywLC1o2V5Ch3RESm59r
 oAB+/WvHANFF3su953so6pyO1VF+jDFR4IHxegqHZolTRNi1uHp9ZL/vmpvAJhn6tt
 hG5+hjF9Jk08g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3BFFA62AB1; Mon, 29 Mar 2021 15:37:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212469] plymouth animation freezes during shutdown
Date: Mon, 29 Mar 2021 15:37:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: amirgi73@criptext.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-212469-2300-f2yC9mgxWZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212469-2300@https.bugzilla.kernel.org/>
References: <bug-212469-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212469

Amir (amirgi73@criptext.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.11.6                      |5.11.10

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
