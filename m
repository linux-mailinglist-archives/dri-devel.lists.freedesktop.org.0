Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED323B0B45
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 19:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE466E869;
	Tue, 22 Jun 2021 17:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE41C6E869
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 17:16:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7E7E561374
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 17:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624382186;
 bh=HZc2VIu/EWo8HQdSfSc31mEoetW1mHJ7ovEZOJue/pI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sW5Hc79PCy0DVJT8Lgmbb06AcBwc5b5gB6kvNFiX3w925E9MfH/zdlL6YCPBGgDvM
 qJf95Rmu7UV0wxb4ZOOHNCBpJHvgYjplrzRbdNW+W0wfh/095AQ/gG+ZZAymM0obTB
 +7ccqJbOFIhDuosQxpnFK1OVfOWyTLj4us1IB8NVw/3w7ULPlGU9UOFUZk2XDovCjP
 lRasm2JYn/Ng8m/D2HM6G8o8D+OZvadQzPbS1hDn5aKqYW2YHRDq0pr7gqnezAjelA
 ajOK1FIuwpXcSFWZopi7ro5eLTR9olRQxShou7srsnXjWXqKF07ddZQl+fxzmwdL1b
 m5SbouwTQ5g5A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7B68F61285; Tue, 22 Jun 2021 17:16:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Tue, 22 Jun 2021 17:16:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-209457-2300-ChalFwPqAq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209457

--- Comment #29 from Leandro Jacques (lsrzj@yahoo.com) ---
Created attachment 297567
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297567&action=3Dedit
Linux Firmware version info

I tried downgrading the kernel to 5.4.123 and it didn't work out, I had the
same  issues. So I downgraded linux-firmware to see if the problem disappea=
rs,
I'm using linux-firmware 20210315

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
