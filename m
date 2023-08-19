Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47881781A93
	for <lists+dri-devel@lfdr.de>; Sat, 19 Aug 2023 19:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF45010E008;
	Sat, 19 Aug 2023 17:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70AE710E008
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 17:04:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1B926191D
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 17:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 070E4C433C9
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Aug 2023 17:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692464644;
 bh=enYzqUV8TLLrFnZREOKnxmxsAYi/5W1wtqOaR/Ka920=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jFRLhM3ox6C9CVOwGgK6/AQSMjTPtXKnR19nxvVfQFV/Yq8nfCAy70YigcNtdaM8O
 NSptWVC/H06dwi6RYJSJMbtvpoJNAwkyN+nknMjDOifW0xBRcGSZzPuiCa8JgxNfKC
 erllP6JRrUjKljyfXy06WBrypASrTacmjm6NzLQuAxur/mp7zemorMzpfYCcD7Qsn6
 OyhWyEMJojxWtgZVMmG8oIlO1O7DnCq+GwL4/LIBGaHHoBDzuo1qqYvwPs98VFMaTz
 FWxw7d6J7x7Rkn032PsmBtrchYFfP345vgE5U0guAANXEngnX5pfl71yebnOXhyprx
 wZVkOeUnswiJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E27BBC53BD3; Sat, 19 Aug 2023 17:04:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Sat, 19 Aug 2023 17:04:03 +0000
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
Message-ID: <bug-217664-2300-a0sIqv5L8y@https.bugzilla.kernel.org/>
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

--- Comment #21 from popus_czy_to_ty (penteljapan@o2.pl) ---
Now on those backup drivers? vesa?
doesnt go to suspend, reacts on mouse clicks(touchpad), and touchpad moveme=
nts,
but not keyboard.
im not good in linux but for some reason tty hangs up i need to run that fr=
om
second tty after disabling amdgpu.
i made video how to it looks like to show it
https://www.youtube.com/watch?v=3DHqxWxdpFVFU

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
