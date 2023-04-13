Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076016E0A61
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 11:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6507910EA98;
	Thu, 13 Apr 2023 09:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CA910EA98
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 09:39:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DC2063CF8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 09:39:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6357C433AA
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 09:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681378775;
 bh=mz7BBC7gmhcJjBcoxlcmSiVkEgZCM6lGSkkbdoABt5s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mOttee9+1SV8OXMHsNIHrTyKmwEFmK1yrjHPGcOorx1vEAzwq2e8FlwU3LuunE1pN
 6CzsyhmduvQdAvJABlHJ5oaJ2EWXnYeMftfYwFyyK5JY4BKQi9VAYVaMDrTpVwgTPP
 fRaLM77rBTMVKDGQgCSHUtsttu9TW3xdYkXCnNO4IElpWEHwr73TkgZGNQ8FdGOrc9
 pIubFZ68U3tvUuX81LCLnuWRNFFSojYKvV/P8B3mbpjRH/MKjUa8jJLSGz0X5b7x1t
 zI4lMvC5T57kYHJ99rk/nBDt8Ouuk1zjDNSMedTj0Go2Bx/Q9bkOg70Gai0PjCuMsD
 Jbze9K6F/Jseg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B7B9EC43141; Thu, 13 Apr 2023 09:39:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201497] [amdgpu]: '*ERROR* No EDID read' is back in 4.19
Date: Thu, 13 Apr 2023 09:39:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erenoglu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201497-2300-xA4NeaXqbH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201497-2300@https.bugzilla.kernel.org/>
References: <bug-201497-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D201497

--- Comment #27 from Emre (erenoglu@gmail.com) ---
This makes my docked laptop almost unusable :( Once it suspends the display=
s,
there's no coming back. I'd need to undock, and hope it recovers. After
undocking, re-docking the USB-C hub does not help, external displays mostly
dont come back. Needs reboot :(

I wonder if there's a way to change severity/importance of this bug, I'm
worried that nobody looks at it as it's tagged 4.19 and 5.x while it exists=
 in
the latest version of kernel. This effects usability big time.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
