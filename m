Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE168C5B1A
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 20:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CDBD10E19F;
	Tue, 14 May 2024 18:35:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RAHbhfly";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CBDC10E19F
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 18:35:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 11D65CE1265
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 18:35:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D2E2AC4AF0D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 18:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715711714;
 bh=BQ9hWPz0gZ0FXQPGwYpm2T5QAUMMd1LvMCXkLHTOSEw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RAHbhflyr38V7AEudrHWVYfVYh4iyLREmvYHA5UPTUFsBfnbnWJTvM3v0r73UqXYI
 kAWQ6Xh2S2jTaubMcxX26fvWTxXAtHn8GYvcntD1GY575MoWaQOCHtv64DPBfS3Yro
 02xBdBjfeGSybgjy8HnZE2ew+ZI6WynBEHzj4W4Dbbr8waRiKh0VBuvmcZXCpjs4xr
 vjR7NgxpPTB5iYpdBPRp3OXAhkerf5Kr0r540n0S/MIV5plAtd2JgLkrTC7xckjbcO
 FUsRSlTm69G4BTR+i9XP6R8zi9D3Qw7/Qdo3CXrAB/MzjQ1bWJWFFtg6JzKks8KFT0
 E+ibUVYCr1RzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C082BC53BB8; Tue, 14 May 2024 18:35:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210467] amdgpu Vega 3 lock MCLK on 1200mhz
Date: Tue, 14 May 2024 18:35:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jothiprasath2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-210467-2300-wSd0wO7ccF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210467-2300@https.bugzilla.kernel.org/>
References: <bug-210467-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210467

Jothi Prasath (jothiprasath2@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jothiprasath2@gmail.com

--- Comment #12 from Jothi Prasath (jothiprasath2@gmail.com) ---
I face this same issue.
I am using ryzen 5 5500u with vega7=20
kernel version: 6.8.9

cat /sys/class/drm/card1/device/pp_dpm_mclk
0: 400Mhz
1: 800Mhz
2: 1200Mhz *
3: 1333Mhz

the mclk is always sticking to 1200Mhz

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
