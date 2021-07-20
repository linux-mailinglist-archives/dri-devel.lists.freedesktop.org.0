Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F833CF978
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 14:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256D789AEA;
	Tue, 20 Jul 2021 12:19:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E070789AEA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 12:19:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4C88961165
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 12:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626783562;
 bh=95v+8uYiVb0r7YCekmShU9E9ej7CcwdVXqWdYu47Qts=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DFd6I674Q/OmbsHqfG7bjgR17BuqGbSL3oCfS4PABSdci487l5hk5E95HbU9eCs32
 yHnrmA8GpP3SfqwJXf+9tidZCV47pTTJ3lvARafU3UBu4UfClpSSuaOqcAxkZXTGmE
 HjjhyBTcbe289hW7qU250elulGYRFVeqV8o51VFDoudYUKZY/E/KL9JMHLsAEI6GRW
 XvtQhQBLaodnzQudQt+4c25y6Wo2Btc/1SoMxlI6VIlbejMCRVAcKlJvmm8BdofA1I
 YNj4LB1c/ZtX2qTUhOn1i3G2Jsdj5+cDbfAtBBK5p2TflXswrl8UGcVPb4dIMgYUyg
 naHoaJBKtySog==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 41E8861261; Tue, 20 Jul 2021 12:19:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Tue, 20 Jul 2021 12:19:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: pavol.harar@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-BzddJGSJWD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

pavol.harar@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pavol.harar@gmail.com

--- Comment #2 from pavol.harar@gmail.com ---
I am experiencing the aforementioned error as well.

[drm:drm_dp_mst_dpcd_read [drm_kms_helper]] *ERROR* mstb 00000000f00db6df p=
ort
0: DPCD read on addr 0x4b0 for 1 bytes NAKed

I have problems connecting my ThinkPad X1 Carbon 7gen to two external DP
monitors via a ThinkPad USB-C gen2 docking station. Linux is not officially
supported for this dock unfortunately. The problem is that the monitors wor=
k,
but seemingly randomly they stop working, either I try to go to Ubuntu sett=
ings
or try to open some program with a keyboard shortcut. The monitors flicker,
then die and I have to reboot. Sometimes just reconnecting the cable works,=
 but
usually not. Sometimes when I connect my phone to the dock the monitors sta=
rt
working again, but most often not. There is a lot of people having these
problems but I have not found any solution. In dmseg only this error appear=
s. I
am to the best of my knowledge up to date with everything, kernel, bios,
firmware etc.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
