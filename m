Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0BE3F9E07
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 19:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21D1E6E99B;
	Fri, 27 Aug 2021 17:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADEF86E99B
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 17:27:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 83D7A60EB3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 17:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630085272;
 bh=S4qQZkODFi6Ka7hemtRSw3cWq2c9GWnConFwJs9WTYM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JL1fRFZD74oy2pEj2P15J7wTYQaPn9G9XZh/2uuDynEaBfbpKUUY0uWbL2JEsy0SX
 Oeyt48GQMQZrGwXtA6cCfRw4xa7h2ofxluw5qaAwq2xRBXSOQ6QdJwDXBubyJ6FxVP
 ASOWzmxVuaLmsjRduHTdsqOFPfgLYvZ0BjYLhKUNRXHQXQSAvmv8IvDXcBtphRkNde
 MJe7N/taOL77llyn0eyb5ocPVZZiphVsIJ1GTo1YmCiam4R5lsaWtnvasFEMHrz+mj
 TQ2qIZ4XrkIbJbxUxhvTGWz1heiNWNfDef8JfbDgnvecU9y1EpH44SEVqa3uhX5JaX
 kq+zJ9/kTkKqQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 798E860EE5; Fri, 27 Aug 2021 17:27:52 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214197] [Asus G713QY] RX6800M not usable after exiting Vulkan
 application
Date: Fri, 27 Aug 2021 17:27:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214197-2300-IphaTwnLDG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214197-2300@https.bugzilla.kernel.org/>
References: <bug-214197-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214197

--- Comment #2 from Alex Deucher (alexdeucher@gmail.com) ---
Does this patch fix the issue?
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D202ead5a3c589b0594a75cb99f080174f6851fed

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
