Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE88786C9A
	for <lists+dri-devel@lfdr.de>; Thu, 24 Aug 2023 12:13:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D2B10E00F;
	Thu, 24 Aug 2023 10:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B252810E00F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 10:13:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0FE2A64C44
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 10:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78024C433C9
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Aug 2023 10:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692872031;
 bh=QJojsf5tUmNp/TcJcoxk5obN4HA5SmG/PWOBVS2K/cI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=f3FEiuW4dcBt4tFV7EHMOH2nmN9rfl6xOwbUfbBpkCZN7Hof99YBVW+o9gZLpctjT
 XPnY/9p7k6PU/3QkWyWwHrjuRjniMCbePLwEpeTL7oojjEjKfW8svuxFN1ZMJMZZzS
 rxWPkON9wslUQDTSOC88o+q5ace+aScElj1LNf14DKyGOEHi8TBcU+5gp/VxvBCO3g
 ps5SwYOo516HxTqAi++4h7gDYi7VEUsJ9DRVZ+UJ52SGapuySfyg7FZ0Xls9H2XB5z
 TBpkVH6ZbmOLf3Zg+/jKRunPW6IGwBmLVc3NJk3eQisI4eQgY/C4x+32RVeWxocfX8
 uJtsgtLr+/e0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 66D00C53BCD; Thu, 24 Aug 2023 10:13:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Thu, 24 Aug 2023 10:13:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-uhjqyNjg3H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #27 from popus_czy_to_ty (penteljapan@o2.pl) ---
@alex, as i renember it was remote shell accessible from suspending (on
LLVMPIPE) [rest banned], but it didnt go deep sleep anyway as far i renembe=
r(?)

@mario

formatted 3x with changing filesystem between to make sure is all erased, g=
rub
now rebuilided correctly from scratch. Freshly installed Kubuntu 23.04.

https://www.youtube.com/watch?v=3Dd8z1gjoIoUk  symptom is exactly same as on
kernel 6.2.xxx, maybe few more complains in console.

https://mega.nz/file/OoBmED6L#6Tw4c1kwsUirYXK_XQ7pw6vtLyghrho8MMyB5rzmYYw -=
 ppa
install
https://mega.nz/file/3gRwgDyD#trmYYtnvYSP8z03U4Ggr3BvKFG-KFMOjhJvGnowBjFU -
kern log
https://mega.nz/file/X8gjCZJB#go4CsVkVdbtQNAlWcgEhshci8SGSe4bjYqeDyBQESLg  -
journalctrl (be aware huge spam batch)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
