Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038F5411255
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 11:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DF066E454;
	Mon, 20 Sep 2021 09:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7461E6E454
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:55:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3F6ED60240
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 09:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632131702;
 bh=Gdy1z3juV7wnE2X8Y7cS4kBQjLyCDqXie+0hmoC/DVw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JpEZp+mVrD9m/xpJS/EWRTOJgjKJFoGdhDQQOgF1kbfpdYEJgtkjbj/NUmCIQS/CX
 pQH2y8BFkM4A3gnz7BTgyjDVJHCT7HBOW6U4u5yCed3MQAHUVxv+S6ZAP0CMLzG9dw
 teR8BN1uMm1V4wQ8xS2qZkNibYfivVejZnvrZ0E+Ionp/iUoMG34ZiBApyBU2ijZ1t
 ayXyVr31j5AIizIZxsX1cJLAmFzhlnJF1JFdBkRnm07T3iDXYzzPsZ8U8pfFeTrFRr
 apLC4mmva1FAaDhFHWJSX9+HZ34t270iJBiXhd2HvonV5GcwoIAGV2sF/Mgmaj+ZaB
 IbLH3ixuCrCew==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3604D60F41; Mon, 20 Sep 2021 09:55:02 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214413] Kernel oops on boot for amdgpu (in
 si_dpm_set_power_state)
Date: Mon, 20 Sep 2021 09:55:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpiazza@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214413-2300-LcVePG0ILr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214413-2300@https.bugzilla.kernel.org/>
References: <bug-214413-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214413

--- Comment #3 from Marco Piazza (mpiazza@gmail.com) ---
Created attachment 298885
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298885&action=3Dedit
Patch to revert ATPX/ATCS global structures

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
