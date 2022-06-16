Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAFE54EA34
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 21:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F04F11A5D6;
	Thu, 16 Jun 2022 19:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4AEC11A542
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:35:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6A9E961D57
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB38CC3411B
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 19:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655408118;
 bh=TSckTQoWk3RmQErR78hFSYWdJ3hQruzlDeVBMPc3S7I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=H1Aa1dZheE0dTzvpjjtZhxVTr0FtET8i3vXbBNYRIFKdXABGPCtz+qUgb15CnffGQ
 M4um+46L5NHDYj+KsCxg6O1iwRv6pjM0KJ5TV/ntRCWpIOKpHEdRd4mfd41qCG/XgW
 nO/5ISlZWJ6PAZrq21U43qe3rCYzxh3le0RZEduBvjqt9l7mQk3Rc8WRF39E58oM0t
 NGpyr6yOLl/1HGUbDn76pRcFAmja1T700TpGte0KosOt8UtzfOfntOTtnsagN0OMOK
 YmpzHOKv4cwZQ3DEduQ0bTH8fnjZ5CntnxJGtQLZSjw3GjLQM8oe1tv7F6k9yhkGRf
 4B0fH9bU92sCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B5F85CC13B3; Thu, 16 Jun 2022 19:35:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 16 Jun 2022 19:35:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-6B5Nljhcj8@https.bugzilla.kernel.org/>
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

--- Comment #8 from Alex Deucher (alexdeucher@gmail.com) ---
Can you attach your full dmesg output?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
