Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC6864499F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 17:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585FF10E32E;
	Tue,  6 Dec 2022 16:47:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244B410E32E
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:46:59 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0E31BB81ABD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4531C433C1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670345215;
 bh=6QzK8/lAItNB0bs7k5yhN/yFkejhQGqOce+myVo6NgA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ld6OEdlNXxQMYCIdoI/INuWTCHDjv15yoMv2oUnc8osCsot8hdy8s9+nGGPi/oGy5
 FW1EzQ+cX0HH1Rc6QNY+j4I5N2LIepjlkPs+ErYUg37PQYdHAenopKVwbmPMvAPUAI
 Ivheq9bpM1BSCoZkcV9AAq8D34iijWKaD9ZoU6mj1waT+XB1TWithfVDveshRmXqPh
 FMuOkxclqY+9wl7iIN/D0FV7Al16OR10x7DiSRBB1MAZUFk/s6/97F/DQKMigpEzhl
 vpMtu1erqF9zZ2Ow6iMtCPQv9gMMQ+5G95Y0o9E5pOq87969zG/GA+O70HHhL0WEUW
 vnfC940kKkqgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8E752C433E7; Tue,  6 Dec 2022 16:46:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216780] problem of Mesa drawing boxes after resume from suspend
 with Geforce4 420 Go
Date: Tue, 06 Dec 2022 16:46:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: estellnb@elstel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216780-2300-BVUmvm3jfC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216780-2300@https.bugzilla.kernel.org/>
References: <bug-216780-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216780

--- Comment #2 from Elmar Stellnberger (estellnb@elstel.org) ---
Created attachment 303370
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303370&action=3Dedit
after resume from s2ram: the background box of the login screen is not drawn

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
