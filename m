Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E25C4AACC8
	for <lists+dri-devel@lfdr.de>; Sat,  5 Feb 2022 22:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD11110F699;
	Sat,  5 Feb 2022 21:59:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CA410F699
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 21:59:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 27C0AB80D51
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 21:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E39F5C340F7
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Feb 2022 21:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644098369;
 bh=wKiZjJbCE2IS3FSESPs2zFR8HYGGT1eteBTjL5rcivQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mQFZHIuZzdkS+z0cAIVXW7dwj+hLjw5T2ahbBkKm2GSF0Q87JtwyMkrTK9bvu1obL
 /ni47ifOjYWYomSUGBcUN9QQDWp+Ma54BCITSAifwmhSYXBhXX1OTz8Yfbqwj2t44W
 z2IICTP6gHxx9zCDRZUxQ/bdBnHgd3IZl0NYubHlkawm6wE4SftmNVuq0XIoO2lHii
 ehGDzgygxrg431nPNpN6kPeHLfZpdWVVpqw5LL5QUxE9NNNN+Trv1fUYwCmHSzh1d2
 oHNnLW/t8UeaU3GIok9uzi+ra+0eHlbiS2PYbsqKQ6sV4PyxvkgWYNxfJ1EPEurfmH
 /oQp0UDXWpeqg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D24C4C05FD6; Sat,  5 Feb 2022 21:59:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201539] AMDGPU R9 390 automatic fan speed control in Linux
 4.19/4.20/5.0
Date: Sat, 05 Feb 2022 21:59:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: codebugs@yandex.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-201539-2300-iItZHdbjJF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201539-2300@https.bugzilla.kernel.org/>
References: <bug-201539-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201539

codebugs (codebugs@yandex.ru) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |codebugs@yandex.ru

--- Comment #76 from codebugs (codebugs@yandex.ru) ---
The later 390 series cards (Grenada Pro) were also affected by an inability=
 to
set the correct fan speeds in 5.4.0. Because the cards would not run their =
fans
greater than 20% of their max RPMs under load, it did destroy at least one =
390
when it ran without proper cooling at 105 C for an extended period of time.

This patch saved the other R390 card in the other machine. Thank you.

As of 5.11, it still reports temp1_crit and temp1_crit_hyst as 04000000 and
-273.15.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
