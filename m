Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C30928C19
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2024 18:10:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1352510E2A9;
	Fri,  5 Jul 2024 16:10:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aRl+vm5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D5410E2A9
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 16:10:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 9B21CCE3E4D
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 16:10:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0A47C32786
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2024 16:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720195806;
 bh=hGj/19DWsAkx9QQS+TlUndljOX23t4LsWnPxFglJ/sY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aRl+vm5lvuA1/T+SRGRh4DxaUEHwHfvExBZt5cYPYmytmoojNvMIP67/Mwp6nAd5P
 bT5AmtypX8XxbmVYKMZTthTRVJuwlV8qT0sQOPar34m8CvhxNPSTZlE50l1S2Rz7xR
 +gUnIIE71VkTFIdog3+eofeyT0uxsDUN6h48ptJtjPMqQa5RicwhaflCAFY77urdcF
 ZXj7XRx9k2y4GrufqZ1bgKISp3/f41rs/2S3XwKOSCCb9MeXZ8Zn+M4OE9/ldDQJi1
 Pz5NZITfcuOPu8zsJbetmk0vPqSKzCFoxwbtJMcUbkK+WaqUn05/u50/VzQ+USFtBh
 pGO8SN2Jj52DA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A1D74C53B7F; Fri,  5 Jul 2024 16:10:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219007] opening and closing /dev/dri/card0 in a QEMU KVM
 instance will shutdown system, 6.10.0-rc6+
Date: Fri, 05 Jul 2024 16:10:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: colin.i.king@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: rep_platform bug_severity
Message-ID: <bug-219007-2300-VLt9JrvBqh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219007-2300@https.bugzilla.kernel.org/>
References: <bug-219007-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219007

Colin Ian King (colin.i.king@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Hardware|All                         |Intel
           Severity|normal                      |high

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
