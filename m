Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AF54A7015
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 12:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6CC10E5BE;
	Wed,  2 Feb 2022 11:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC75C10E5BE
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:39:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2819AB8309C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:39:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF5F7C340F6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 11:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643801962;
 bh=d8q1rgvSr3rMR2yK2Su7RuaQR2hhnKTc3J+pdfWESeQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZRfQz/wV+LAMSfQkNeTW7yr9JJm0WI3qeeC8RGuwVSUo9rClbqnJHpYLhf+aekxvD
 m8EQpmKniiqhdaLR8KKaM3KJE/8NdIjRrhYl2r+Nc+dlklt9jDWsnhnpRiPOaqIxxA
 y7IchrH/RhI9kChVkgNozJjQ2M4lKM+7cJO6jHyQsOHn+9ssL2WTXy7V6YCX4cxcBI
 UZ+kCFJvrtrHanBZRRp4TCj5Uhk+66gDaMq/4jEXSNqwJLQxhZ6QV6f4y1yixa/qTo
 noOmeeikHOOH2rxCmQaz8WcWWoCqMCN1o+XcLm4aT6GhUQvXX1kOJScW7vKLCzL8ca
 lTA/NpSQYzDsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CFBA5C05FCE; Wed,  2 Feb 2022 11:39:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Wed, 02 Feb 2022 11:39:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: kernelorg@digininja.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201957-2300-MJGnMtULrz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

Jon (kernelorg@digininja.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kernelorg@digininja.net

--- Comment #61 from Jon (kernelorg@digininja.net) ---
Chiming in as another victim of:
[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed to initialize parser -125!

Radeon RX 6700 XT (NAVY_FLOUNDER, DRM 3.42.0, 5.15.15-76051515-generic, LLVM
12.0.1)
AMD Ryzen 9 5900X=20
Ubuntu Mate
Mesa 21.2.2

Haven't attempted the amdgpu.dpm=3D0 workaround because the side effects of=
 it
appear to be bad.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
