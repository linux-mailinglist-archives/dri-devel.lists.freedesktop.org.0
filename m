Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CDC63C9F83
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 15:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD5C6E852;
	Thu, 15 Jul 2021 13:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA8A6E852
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 13:31:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0335B613C4
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 13:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626355864;
 bh=c4lfb6bXd3eM+vuGu447ApZDnvzWVf5bF4L5/1jCKss=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=C4WgHWTsQN2JlDKy8y6QfhcOkBjcuRaKxl2UK2MrDGyyun1MQ6qqHbEqcE1hvU69t
 mem+uWdBsE5alYFAj4QW2Fo0AdLx4PakX3tUJAxoKPxGsQgMlkuTKLeX0riuzrTMQ9
 qNhDlY/r9IN26Vga9BgXvKcfyFMUeujYk55b4/7YmAGnF3eZ4dPKdmkUCXggKFww94
 SX/aqXI/hllFmWKh2XbHW9BH0d6LBDSVoNCHfwZV7GKiUoX8zEPhnnpsq/wUiyxv/i
 3PKZ2hbJ2zNVwi0zH3kWq/Vscu1C0D3Yq+JQFmMF96dfrnzz9whQrn9hVy6EzRBimS
 BCnaGiaJ9Tgag==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id F3999612A7; Thu, 15 Jul 2021 13:31:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Thu, 15 Jul 2021 13:31:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213391-2300-pmSOZmfM8S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #34 from Leandro Jacques (lsrzj@yahoo.com) ---
Created attachment 297883
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297883&action=3Dedit
Linux Firmware version info 20210511.7685cf4

Firmware info as of the moment when the system crashed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
