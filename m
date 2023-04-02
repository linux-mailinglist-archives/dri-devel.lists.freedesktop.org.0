Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960546D3550
	for <lists+dri-devel@lfdr.de>; Sun,  2 Apr 2023 04:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C7410E236;
	Sun,  2 Apr 2023 02:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE8410E236
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 02:55:40 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D62CD60C6B
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 02:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 415B6C433D2
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Apr 2023 02:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680404139;
 bh=Ps/5fCeu8CJ3xiyGAp+48phMntRn9WeaOz5n6O5XHXU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=j/0MeMCEBMl2bBJJk4p5FqtAGAc1ijSYTgwQj8jBP7yaQhvdadCf/zKE7eiVowVGP
 +3HDGX2Qir34t6EWJkB8Bscm6Feh+6xDCVKYWG6Ar9gxoZ0uAz0sm74xtBouyFOVr+
 cObio61YSD1sk39zbQG7HY1Fxkx4URijo6RZQchJJ6ETXx43ntcMTFXE/t3ur8cSQY
 1/9zob5i8kl3/bEb6osSteciQ3Z0Kqtrn/1pUI8Kk1m4pGgY70lHbm+mXHZQacHdFI
 y2Sz+Ujl5IMBWWN3TXwOWn/sUTyzULuLmStKxzpe+A3ZnKHfc69kEY1QuHrfBtfh+9
 hHDllKFbjtNLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 30469C43143; Sun,  2 Apr 2023 02:55:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217278] ast 0000:03:00.0: PM: **** DPM device timeout ****
 during S4 resuming
Date: Sun, 02 Apr 2023 02:55:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: wendy.wang@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217278-2300-A6rb3v0TPm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217278-2300@https.bugzilla.kernel.org/>
References: <bug-217278-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217278

--- Comment #6 from wendy.wang@intel.com ---
Earlier mainline v6.1 version ast driver also failed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
