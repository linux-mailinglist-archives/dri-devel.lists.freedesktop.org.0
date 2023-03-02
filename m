Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9EF6A7B3D
	for <lists+dri-devel@lfdr.de>; Thu,  2 Mar 2023 07:12:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED75710E03E;
	Thu,  2 Mar 2023 06:12:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E6910E03E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 06:12:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D0526153D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 06:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B26DAC433EF
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Mar 2023 06:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677737539;
 bh=hEatX5K6nL9+UHIAGqYwqpDDSjPrwyIotadBEJDj4gQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dO3MK0IjVT/gaXXABOHJ5bxNJA7Uf0W1XHhtNxgQKiPSrYdQzp5Io1VKJnQTwxJQf
 DoGvAeFfrU4gcStsYoCvP39GI62lfbG8Ts0wrbv0Cr17TeAEDQxNhIJMBNKnPND5fb
 LlcpVe8q636OLB4pu4aDbUkqM2GwPgiAPqja2PxdKgr12mZLuDNxf27cFeF4S7AxYO
 6v5iHwWH02zebUB6pcfdR9DMGbi0+YG5dEaNXdbnCu5hTWo+Zefw7u/QkzAsE405EK
 WsKwWxTjGhhlwCiXQIMOKzQ0lGJR7OQnfBPHB+xB9z0fcScpCUE5F7bLULZBTEzTuM
 WOC4kPb/XiBuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 940DAC43143; Thu,  2 Mar 2023 06:12:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217110] GPU Lockup on Radeon Pitcairn - VAAPI related
Date: Thu, 02 Mar 2023 06:12:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217110-2300-c8t3pBfpfw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217110-2300@https.bugzilla.kernel.org/>
References: <bug-217110-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217110

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Sorry for causing you trouble (I'm just the messenger here), but most of the
core graphic driver developers (just like many other kernel developers) don=
't
really look in this bug tracker; you want to report the issue here instead,=
 as
that's where they expect issues to be reported:

https://gitlab.freedesktop.org/drm/intel/-/wikis/How-to-file-i915-bugs

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
