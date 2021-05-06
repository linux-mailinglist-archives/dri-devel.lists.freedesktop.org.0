Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59A337534F
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 13:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047836E195;
	Thu,  6 May 2021 11:56:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7A96E18F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 11:56:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 129AF613ED
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 11:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620302191;
 bh=Zw3OOmLQuNrInku+NuITU3WpPzuFcVhOYdMA8gVOTzQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=P6kWk8A7ZWzeu7OfZ7yu/M1DeWuQ2DZ7Wb5vjEBBUPK4Qf9LYvC0O00CaWLvuGu3V
 wKP/V32WwgDdfz0J2DFj5QS5DqkZ+xYKhkEdKXKrrGzNvfpIogWDhJD3CiyJ9yUHwx
 wNbIYEFSCeTjqKE4IhvQeiCxZ0dhkZNyV4RbLXAfXcfuEmz5scq6t0nNIk3pFhGuyq
 Mv03TqP+FM+Sgn1zcHJcVmuf6ymYMUEurzBCwhfW/yIycaleV24MQm8R9dA5NV7ykT
 6indmljH6tOCwspl0UxN3B9aAevgCYF7bIpXl3SPRgvBjhGCN/HU1658dNK9sRIDOI
 Rcpvn/a3kORTA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0B8436129E; Thu,  6 May 2021 11:56:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Thu, 06 May 2021 11:56:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paulo.ulusu@googlemail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203905-2300-3UUia7yyvs@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203905

--- Comment #31 from Paulo Nascimento (paulo.ulusu@googlemail.com) ---
Error messages are:
Mai 03 23:01:37 pn-legion systemd-backlight[861]: Failed to get backlight or
LED device 'backlight:acpi_video1': No such device
Mai 03 23:01:37 pn-legion systemd-backlight[862]: amdgpu_bl1: Failed to wri=
te
system 'brightness' attribute: No such device or address
Mai 03 23:01:37 pn-legion systemd[1]: Failed to start Load/Save Screen
Backlight Brightness of backlight:acpi_video1.

I think it has to do with the NVIDIA device.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
