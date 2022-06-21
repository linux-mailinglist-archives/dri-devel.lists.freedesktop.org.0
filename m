Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF89A553E93
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 00:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9012B10EAD9;
	Tue, 21 Jun 2022 22:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D0710EB19
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 22:33:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0ED4DCE1C1D
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 22:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52DADC341C7
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 22:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655850820;
 bh=rPn6jHWt3aaxcS51lV49DKPRxDI5pBHRAtK0uxKe/q8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=j+ieu6Zlc+jE9NUMdU3fLf4FlN9hB9JeC49s0sC3l3rnifvOVbt479J6thltGAJFl
 yjqWsQh/wEdQ32ck3aC6VEMQr7uq6NXFuNJsFLBACQuThGP9Cmql9LFzjx3S97KPdY
 AFo/biDBH0G9Yfj4NIvVe5+ytsy0QWuxNsFCuYgxAuaI4nJvCAzvThaeXgLuipNzKI
 TnJoh6bERV4fEfdfe/cDfkzj67kFYv37twy+Z9Fa9N0uhi9qSwYCji/FjaOoyDwjhQ
 hNRmLwqJSvds+A8oLx+vZJG9evClpXLxCBCcRnHlDfX0QXqd5VPkUn2XIcl+eGN2oa
 VEv3uPdmRFr0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3AB94C05FD2; Tue, 21 Jun 2022 22:33:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Tue, 21 Jun 2022 22:33:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-Ua5PtwXfiH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #17 from Harald Judt (h.judt@gmx.at) ---
Yes, this patch set seems to work fine. Reporting two successful
hibernate/resume cycles with them applied to 5.18.5.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
