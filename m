Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6634F5771FF
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 00:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8059C112948;
	Sat, 16 Jul 2022 22:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1572D112E17
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 22:41:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2D987B80D04
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 22:41:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9FDBC341C8
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 22:41:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658011263;
 bh=aUo/lx4Q7P6e8cUINVXg8qhspz8Lan7GX8OtUAiQN/o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tPTXyhStecOy7XSPS2yVnz99BvTw7K0c6GnC0O3ds2bNtv3D1WM1ntblGMLOgSORt
 2gi8esNOSUH7DEb8ulB4s4Q9YxqHkkJlz3bDdqGsylhILJJskOUIgVS6GDziF1cds8
 UFAVoZxD4uLhsYTX+p9PH+84DerHZrAXsQ2XhEd3XUphmn2w5u2cYdMQknt0gcYv55
 Kaq804OlHQbTH3put7He8bbJ1oED/ECaQaU4AXDEVdy4WL05OPMEo7mht8R0wB1OeQ
 YImg/WKdfCMDrQksGVIixLT5LHZi0ooGz97WMDwqDNpwyC4wM+MStdNRFrPH1jrRg3
 rO3xuAZ1G8gAQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D2ED5CAC6E2; Sat, 16 Jul 2022 22:41:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Sat, 16 Jul 2022 22:41:02 +0000
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
Message-ID: <bug-216119-2300-PELXspWRj7@https.bugzilla.kernel.org/>
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

--- Comment #33 from Harald Judt (h.judt@gmx.at) ---
With "if I reboot the machine" I mean, if I shutdown/reboot it later after
resume, then the shutdown messages get printed that strange way.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
