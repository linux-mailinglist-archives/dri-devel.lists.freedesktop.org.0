Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE1D4457AA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 17:55:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F2B72EE7;
	Thu,  4 Nov 2021 16:55:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7EE72EE7
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 16:55:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id A145761216
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 16:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636044908;
 bh=CO5v0N1q8xwIok9giBTMwOJLa6LKVyTfwPgkzP8KWDQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=CC3RxZINP96R0hZ9ixF4zo5k5moyDw47a+DokLWv9J+Qf9KvjzQpwGW4qfnTU37A4
 TdO9WxIcAfJuCwXRiSKwvRq09A7+WNdCq/bq5lSsGOclYdtsIQHJxEXAc4CoC3dEcz
 aKFR5sWMfI2uUMO4NI3Ul1rSVDwa1MAmRdmpLnKooN8iZEc8v8Z3q9iFRwwSYsHJZM
 pkJ0IUilInjZW8nobTRq9SATcPsPORTIsUd6G2KEJsqC+/4oKSD/4TEBJOEl/ugvPf
 p9KyIgaUa/v1Jy5bB0eQhdvQAj896oCOaDOnzb/CYdngREOPysNTDH7y5fTa9nJimc
 MGfC9YdrN7Z9A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9DB1161106; Thu,  4 Nov 2021 16:55:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214859] drm-amdgpu-init-iommu~fd-device-init.patch introduce bug
Date: Thu, 04 Nov 2021 16:55:08 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214859-2300-yRri54x1NQ@https.bugzilla.kernel.org/>
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

--- Comment #7 from towo@siduction.org ---
With linux 5.14.17-rc1 and 5.15.1-rc1 the problem is gone.
So i think, that bug is resolved.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
