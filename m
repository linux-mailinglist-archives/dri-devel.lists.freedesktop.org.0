Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC404326D59
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 15:02:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B4BD6E0DC;
	Sat, 27 Feb 2021 14:02:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7446E0DC
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 14:02:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7541B64E09
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 14:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614434522;
 bh=Y7tYUqPLPxO6RQTsiIzH+xrfwGy6/2PH5IKHhRcMZRg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jLq0/4tPsEX7zlSLCZ5TCKUQGK/Nz2q1469vDeFe8nATMVIfXvURbRSD1mMYCNN8P
 Hfrd4m/S1pXO7iK961lR7QIlv0ddnFSJOBKQ1jpEbDuLppXIYa8Nq5N2GNHNo7O/KY
 YkIkIRLNifDNcMB2ymY8LuN71XXtV9yMSSDMYbEcIOPD8w380En22Oyt/ipU18OLk2
 moJWmzW3ADE+bZ47PS1KhVzVeMZZOzbdOGfmZW4GOThwhbr0tU3xz3o53DsRHn8XdD
 ffRXPXFraJllZ8UeaE+pVllUM+EypugXmNFjvmdRf9l0nQVKuArXJ4+mpUKQrFDp52
 t2lZWpUjEiLaA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6585D61490; Sat, 27 Feb 2021 14:02:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211981] AMDGPU: without cable attached videocard shuts down and
 does not wake up again,
 log prints "[drm] Cannot find any crtc or sizes"
Date: Sat, 27 Feb 2021 14:02:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: raulvior.bcn@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-211981-2300-Odr8pFxXi9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211981-2300@https.bugzilla.kernel.org/>
References: <bug-211981-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211981

raul (raulvior.bcn@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|AMDGPU: without cable       |AMDGPU: without cable
                   |attached videocard shuts    |attached videocard shuts
                   |down and does wake up       |down and does not wake up
                   |again, log prints "[drm]    |again, log prints "[drm]
                   |Cannot find any crtc or     |Cannot find any crtc or
                   |sizes"                      |sizes"

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
