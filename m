Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCE95411017
	for <lists+dri-devel@lfdr.de>; Mon, 20 Sep 2021 09:31:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 673FC6E3E5;
	Mon, 20 Sep 2021 07:31:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447416E3E5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 07:31:00 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1B11660F25
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Sep 2021 07:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632123060;
 bh=djgHTIKBpuRevsFJFftqIfbXsVLmjQIbc4nkqbtJcJk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BRFhbTlqMWVlEVDXTgewYjnf5tHe+h7lBxV1Omnj5bg90RxpjJgH7Fzkv/ruSixwZ
 4MQAOalzj+rs8dD1G65AGa9yCCxKIGeWFQx4M3/qOrAwNbLi9gJTKN0cdKbhVViNlW
 EAMLwZmHYjE5uMnmft/XWz0nbBVAN9+7ldiMWNLjyTCF3gJM5S8ZZikdGxp4Hwynei
 8q31Arv0o41CcOn0XpFaXTCVlskrvpn108rNA7Q0g+xK2qmFfDirB2p1wX5D3WSE7S
 r9qnBTXrIfWe2SeCpZNf9P9+O57AYy/z3a2yRCbQDqYUhOQGCLYlqZU6wEG3YJjyjQ
 U0UAZ7sdF3yug==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 08CEF60F41; Mon, 20 Sep 2021 07:31:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214413] Kernel oops on boot for amdgpu (in
 si_dpm_set_power_state)
Date: Mon, 20 Sep 2021 07:30:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mpiazza@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214413-2300-jXdgOzvCk6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214413-2300@https.bugzilla.kernel.org/>
References: <bug-214413-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214413

--- Comment #2 from Marco Piazza (mpiazza@gmail.com) ---
It is a regression, without apparent problems.
In fact the laptop start and is working as usual.

I've found a similar bug described here:
https://gitlab.freedesktop.org/drm/amd/-/issues/1698

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
