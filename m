Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2A331717
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 20:18:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 744676E86E;
	Mon,  8 Mar 2021 19:18:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 635C36E86E
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 19:18:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1CBC365296
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Mar 2021 19:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615231086;
 bh=8H/u8qASmJbdqWHeFKl8jew9K3AMp2StmPeX5JRn+VI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sBD8U81oPw5JEsjidqUU9nm+iD/YzeK0lhQ0CCGkAHuv/mS7YluMjEQpWeVxqCJAm
 HL7/saxvVIETRT9eI+4Ay61sKQ9m9G6ARPvHlXd33E46EZKpHwWalWMtxseYXs68/Y
 WSoYu5cheiWCr7LBJOnkLUTjbEFNJhWH2cVCWJ6ljxt4s5HFvL4qdzfsDsfBYM9hv2
 a5wPBvJg0U8Voe39/a64oxxHui0UtBVxcr44AsZHfjD5VTwUc4oJl1RyXGTowxRuZz
 7W01uMqePagdNaXaKOnz/YickDNqPk6RYBtIIyjdEQH/wTAwoKdjGWQEXBRD2uO+IY
 LChfej6anNmKQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 013006018E; Mon,  8 Mar 2021 19:18:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212137] kernel NULL pointer dereference, black screen when
 using two graphics cards
Date: Mon, 08 Mar 2021 19:18:05 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212137-2300-JqiaHAsZ1H@https.bugzilla.kernel.org/>
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

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
Should be fixed with this patch:
https://patchwork.freedesktop.org/patch/423250/

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
