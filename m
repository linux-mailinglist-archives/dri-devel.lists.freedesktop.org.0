Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D99077446BB
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 07:16:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79DC710E530;
	Sat,  1 Jul 2023 05:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7DA10E530
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:16:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5231D60FF8
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:16:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 97C7CC433C8
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 05:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688188579;
 bh=OeGxoZNDBW9lMQxiqic7UTTIWfllJ/xUwUILAH9UwYo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XxWbTIv4pDwT0lmK+r3U0aiL8afT3XzfZIoVh4Bn2gl+4HsmRntMsmck9XsF9sRtp
 u/g+mF36DzXfjPU24brWx+KAyb5LEg/ptRoclZHRVQkQESck65YWyhyRd6F/XAMuJc
 gkjETkfHYD1UEEV4oF2ioe0NKjkoLNJA5Zd6AXeOZUwgFv5ORVJW/+/K3ySxoQr5qD
 92XP/g6HRrPCb7T3SluAaNOVy00t7a+JHESgwwBzxSMX6tvK6vCpZadBu6/zqVXEyf
 XOVnsTpWv1D+Wg0Ul+638U9x/m1HQ/1SFtBDlIaAHR5MR5DGA8Sf2fhZezubijSxHo
 heImpBPWIRGTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8874DC53BC6; Sat,  1 Jul 2023 05:16:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sat, 01 Jul 2023 05:16:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-jcJK2a7Vc6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

--- Comment #55 from MasterCATZ (mastercatz@hotmail.com) ---
https://pastebin.com/FBgyNVrt

https://pastebin.com/Lwqayi9j

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
