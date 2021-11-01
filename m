Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8FC442106
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 20:44:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B34189A08;
	Mon,  1 Nov 2021 19:44:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 715CD89A08
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 19:44:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3F18F60FC4
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 19:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635795863;
 bh=+bGI3Ye1o9m3nbSX332P4TEbsqwbAdwIQH9v4Jt90/E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fbCSLUlBhrlfo8zVXft5FX56eoTmFNMr4Szc+ByFw1H3pQuoFwV/fbTvwwQA+C+9n
 7hlDGyFu+ynBiU7PzlAFFuo55MFNVvGuUE71ri3+ZZ3H5//Grhy/x01QcI4A8ru8PE
 enVo6YjseHwLDTTx9hbNarqUIe9I2ukNb12GKxISfS7ITTMxKFZLOpi00DYoCAGxEO
 l7iCBzZekit6QbUKMkuNipphmcie0TgcekFlXtppC7l04AgO+Dq2Bmr0/jRX0bVrrU
 5VNrEOisxjal7tvnjxPW4D9vxXA8V5i2Gly3RSLC1qoegD6ZhpLsjjlzyLSMntZB24
 XVc0gMP3biJSg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 363A060FC1; Mon,  1 Nov 2021 19:44:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214859] drm-amdgpu-init-iommu~fd-device-init.patch introduce bug
Date: Mon, 01 Nov 2021 19:44:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: towo@siduction.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version cf_regression
Message-ID: <bug-214859-2300-3HrQx2Dyfo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214859-2300@https.bugzilla.kernel.org/>
References: <bug-214859-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214859

towo@siduction.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.14.15                     |5.14.15, 5.15.0
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
