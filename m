Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B76D5E8D14
	for <lists+dri-devel@lfdr.de>; Sat, 24 Sep 2022 15:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F61B10E179;
	Sat, 24 Sep 2022 13:24:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8BF10E179
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 13:24:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id ED3FDB80944
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 13:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB546C433C1
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Sep 2022 13:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664025885;
 bh=BGjDbPOucb16gMo9rptpBj2Z5nh6hhy9NfJVDba3Azo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=R99lTVUPRq9yCPxw1XgitkzBIs6g3HOkO8W3kA2UxjLIhBPe9hXSuV7B6LMZVG/+c
 QVTodMefeo2SI1XMFEnSlKZPg9epyF8o771Qj4u7muB0WoNh9Tf2yfe8b+TnkIZGqp
 dA6N72sJhrTmDMIyw76ikCIYouSJtpekVynihT13vxPzzEH9W686GIhBZzQouWcWE6
 XlGtjatBVHvpjjYvbdkbttygnVVTQzZVAAl6KXii6s9/HKD2OtQEMUI2nOY8hlu+iF
 2J0xJgT3uAPFn5xT8HmZRbTFxDhGpJzd1A29nLtiNL4rHMTnNvyklifLBCjr9ca6Xy
 NwMZcWDJ4ZNzQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A9A9EC433E7; Sat, 24 Sep 2022 13:24:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216525] amdgpu VM_L2_PROTECTION_FAULT_STATUS:0x00000000
Date: Sat, 24 Sep 2022 13:24:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ionut_n2001@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216525-2300-aHuB84LjR3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216525-2300@https.bugzilla.kernel.org/>
References: <bug-216525-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216525

--- Comment #1 from sander44 (ionut_n2001@yahoo.com) ---
Created attachment 301863
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301863&action=3Dedit
journalctl

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
