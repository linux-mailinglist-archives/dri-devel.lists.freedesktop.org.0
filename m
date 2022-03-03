Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01744CC455
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 18:49:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E48E10EA83;
	Thu,  3 Mar 2022 17:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A832710EA83
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 17:49:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A93CBB82675
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 17:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ED68C004E1
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646329749;
 bh=MWTwDSAFdB6ZeC1b/FCeBCcEGTqBlCMcm0bHcQNFBcg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pSYhT21pEZjX6PS3040c5FJvajPoLbjCiS8Q1YyTQytk04IB9Sl2rO0MVfYTbfMUJ
 sbDoEmCx7GoAoCi/Mq4xa5hN/aHco0DTMHBsd5t0GBApUUX3FiSvHenhEsDSFlCpCR
 AhLAmwNO3H1uNAvg79YWggOXQjbJb8IXMybugrabe41JiQ3OMM/6s3liLu190AkqHK
 MNA8vKtIlrn5seZG+154+0BKozjVcQBrq1hE/V2LOQwFpEwDZHT+VYpAArjUEXj2VK
 JBN5EQmRPGve6MF+1q1JowfzQYqCRRAFGelr64eKGdlGKUi0tf6kJTXe9MWxJeclk9
 stNHaKWq4eQiw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4ABECC05FCE; Thu,  3 Mar 2022 17:49:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215652] kernel 5.17-rc fail to load radeon DRM "modprobe:
 ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
 parameter (see dmesg)"
Date: Thu, 03 Mar 2022 17:49:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215652-2300-WTVoO3deT8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215652-2300@https.bugzilla.kernel.org/>
References: <bug-215652-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215652

--- Comment #6 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Erhard F. from comment #5)
>=20
> With CONFIG_DRM_RADEON=3Dm radeon does not load and I still get "modprobe:
> ERROR: could not insert 'radeon': Unknown symbol in module, or unknown
> parameter (see dmesg)" trying to load it manually via modprobe -v radeon.

You need to make sure the firmware is in your initrd.  When the kernel load=
s,
it loads from the initrd.  There is no filesystem mounted yet when the rade=
on
driver is loaded so the firmwares need to be in the initrd.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
