Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC84E315844
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 22:06:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C03816E890;
	Tue,  9 Feb 2021 21:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 441326E890
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 21:06:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A3E5264E6B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 21:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612904767;
 bh=Bx5DaAUarp90hxKtQP9bsK/WtTD6fGBq/0XDyvB/xAM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eABlSa6D0T7doaTDhxfZPxQxjWnmK2OVUnMfOk4dwOUu6CHeS8Ia3/v7vym1fCjYe
 MdunhQKNCCv+Xp2yxYTekb4ZMb51o6IiwC9CzqyyA7h0KraTI8gNsAvR5rtzxeF7w4
 eccOuP9zyKMrakydngKokvablaonmVf+QYTlbGG2ixD4ESHyPKIXMfLK9nJL9houvB
 zxVAryyk7NOLaATbTDHCnTATQhz3Kv4UG4Ozkv0lDifpn2u+H15SamIdoTC3nyCJz1
 fIhjEAkBs0if+YqN40eU1sL5pwoJDqNdI9dmd6SUAY7JRiBgy9TihKQoBRLf7k463L
 tyitcP+e1eRCA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8FDCE65369; Tue,  9 Feb 2021 21:06:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211425] [drm:atom_op_jump] *ERROR* atombios stuck in loop for
 more than 20secs aborting
Date: Tue, 09 Feb 2021 21:06:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: icedragon.aw@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211425-2300-fwR2VXiKVS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211425-2300@https.bugzilla.kernel.org/>
References: <bug-211425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211425

--- Comment #6 from Andreas (icedragon.aw@web.de) ---
(In reply to Alex Deucher from comment #5)
> If this is a regression can you bisect?
I can try to bisect at next weekend.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
