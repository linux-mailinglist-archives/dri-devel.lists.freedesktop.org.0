Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2DE43B2ED
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 15:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F48589B11;
	Tue, 26 Oct 2021 13:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422D889B11
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 13:09:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 12FFC60FD7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 13:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635253783;
 bh=zVdXD0zijj+UHkKbiOIf/ipYffCEIp1DYW/uvtY350A=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=n6Uwd5onIllxn5nySG6GVLG9smzVxrDjBC3lt8wlIDT0MwDCDlC7cPYKuSPByXu5O
 jTyyMjLhTue9kgxnGWq5dchjKDrrKHNoHV4nA/G24wPNVMmIYWKwmJcMoDZ1xi17LA
 BSNI93bMPyJVyULmMQWL+h7UQ1iNbE2Ue3Ok+Tu3u7KbJO0HFoZz//nYu8G8CjVzMM
 83WauKENA7rUP3hf2RmGNRQbmRHc9b2T8Gzp8hxSwwbJVVRXYgTgtlPnQGyxjsSV97
 /7s7gYQvdVsUQ87LK2yCuLr+SODvI2QMzYCnpa4tHk0CEgknWkR5QvLQ+sUxZx7mQC
 aSFhzI8w+Hgdg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0FA7460FC0; Tue, 26 Oct 2021 13:09:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Tue, 26 Oct 2021 13:09:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211807-2300-ZgLaDR4Si7@https.bugzilla.kernel.org/>
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

--- Comment #13 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to zwerg12 from comment #12)
> As mentioned before, I get the same error with a monitor connected with DP
> to a Lenovo ThinkPad USB-C Dock Gen2. My Laptop has an Intel i7 10510U no
> additional graphics card. I am using Debian testing with the provided ker=
nel.
>=20
>=20
> During this my notebook monitor is blinking.
> This setup worked for around four weeks when suddenly these errors occurr=
ed.


Can you bisect?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
