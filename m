Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6855455BC84
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 02:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 092F210E4CB;
	Tue, 28 Jun 2022 00:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59AE110E4CB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 00:05:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AAC54B81A1F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 00:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 77E1BC341CD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 00:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656374698;
 bh=MP/2zSNUmoUCJ7WkpCcl/ZE5YmMv8EqxJByb6FFMORQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QfePrBxLH9givbDB2d5J/zvUPRZIs+mMJx4lhcVgO9fwkOdxTDQCOCwnKWMPKvnnY
 UmiutuwdQFN1FPJKfc5kYONAkBBECwTlzWDWp8inI2Ao/Bm5u9iqqwbULA9bTnzReb
 L9GwiYwI5ywUShHMok5Q5DrCUdakHlmwnTcSPPGFEvYd9aDkGs0+hefs9lxQ1h+E+v
 bEWU1kEY9G9qh/cj9x74rRdh6CuQH1DKcipIiN0gZPjTzD2i7DEEqwgXUM2BqR8Nhv
 dRO0vKuB5Xw18FW/OBEGva3R7+cNnQTQzPU3yKIMBRwYmrK4kcXFfuVG+MqmqISLfv
 8Nm0c4VL2T7XQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5C48DCAC6E2; Tue, 28 Jun 2022 00:04:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Tue, 28 Jun 2022 00:04:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216143-2300-HHHJRWhCiJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

--- Comment #6 from Erhard F. (erhard_f@mailbox.org) ---
It does not apply on top of 5.18.7 nor on top of 5.19-rc4.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
