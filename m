Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F23445C205
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 14:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 567BC6E90D;
	Wed, 24 Nov 2021 13:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F846E90D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 13:22:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4C25961288
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 13:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637760128;
 bh=li0JPkoMkVEzYwuBN91+0W2zSpnyu1XrYq7A3Xc8UuI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NIKD51HY5DiNFOzbKkU0JcNj4joo29wr8BfJ04ygWgm4M0n2Y1NIAlAerxmPlEX+9
 mS/u5mJIt+hsP6PhLhpUd/M9TBOIQ4m1ShlJEMnz97kOFBdFH8evcuKOtWEe4jV92g
 b2hxtv6LfGI1bo+z7HTr8UPmZ+90uxR8nl+beuQ20LY5+ShO5hHcBGVJX2iGrdixgl
 bfl7eePYa4G+nRMxfayORxItVm7BumELZLcOCIT79eMhD2pnrjxi7xYJlXmAC7CXG7
 Qk9jSz1eS3CYR1RLqIWuzFFEQ/OtHdsPASB47mNQC5bOlCfiKjW4eZhS6+PBKlDZe3
 pT37RFO2TFYsw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 476F060F37; Wed, 24 Nov 2021 13:22:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Wed, 24 Nov 2021 13:22:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: mail@chatty.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-PDwjSGerSP@https.bugzilla.kernel.org/>
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

Chatty (mail@chatty.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mail@chatty.de

--- Comment #17 from Chatty (mail@chatty.de) ---
My setup: MS Surface Book 2 + AOC U2879G6 via Surface Dock via DisplayPort
Tested kernels: 5.10.0 / 5.15.3 / 5.16.0-rc1

When connecting I get random results of:
* monitor remains black
* monitor exhibits 1080p@60 as max resolution
* monitor exhibits 1440p@60 as max resolution
* monitor exhibits 2160p@30 as max resolution
* monitor exhibits 2160p@30 as max resolution <=3D=3D desired

On boot of 5.16.0-rc1 its initialized with:
> i915 0000:00:02.0: [drm] Finished loading DMC firmware
> i915/kbl_dmc_ver1_04.bin (v1.4)
> [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on minor 0

In the first case I see following dmesg output (black monitor):
> i915 0000:00:02.0: [drm] *ERROR* mstb 0000000009cd3ca6 port 1: DPCD read =
on
> addr 0x4b0 for 1 bytes NAKed

In the last case I see following dmesg output (despite monitor working):
> i915 0000:00:02.0: [drm] *ERROR* mstb 00000000f4b4c9f1 port 1: DPCD read =
on
> addr 0x4b0 for 1 bytes NAKed
> i915 0000:00:02.0: [drm] *ERROR* mstb 00000000f4b4c9f1 port 1: DPCD read =
on
> addr 0x4b0 for 1 bytes NAKed
> i915 0000:00:02.0: [drm] *ERROR* mstb 00000000f4b4c9f1 port 1: DPCD read =
on
> addr 0x4b0 for 1 bytes NAKed
> i915 0000:00:02.0: [drm] *ERROR* mstb 00000000f4b4c9f1 port 1: DPCD read =
on
> addr 0x4b0 for 1 bytes NAKed
> i915 0000:00:02.0: [drm] *ERROR* mstb 00000000f4b4c9f1 port 1: DPCD read =
on
> addr 0x4b0 for 1 bytes NAKed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
