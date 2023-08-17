Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4640977F8A1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 16:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EADC10E1D7;
	Thu, 17 Aug 2023 14:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86FA10E1D7
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 14:20:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EB6F86176E
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 14:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A72CC433C9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 14:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692282030;
 bh=Gkb5wwtE5HjLlSC8EnC58y+tLNwjT9qTYyQHDt4InQw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VNHIUxxQ0VcB7JKSow9iik8lMp1ZlOcMKndYDwIghZVWQYN8muYxr9B6pA7N2V2v7
 B5FEfqYqX9sMeuRvNJQdSIg/XKgPgwc43VvwlQjqQbv/IiMMPGYE7w2CDxzt7IvEzT
 QmjMhmcRv9jdoLV9/nzf/jlLaql5Nf/CEJC3PLvZqey3+fBMKWfmkyfAf8W+Z5Jon8
 EYlc/GmWn0eJocbCIoywVEqc6x6CHrjKdE7SdezSmyDq8tSWeWBLWdLFCTerSP+at0
 1eotZSamz3kfEMCn+Qc/QyzOOK/1ZzkTIKfeEIhWwl9wx1yFHBRDHpw2zn10huFo6o
 H//DfihXQ5gaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4002CC53BD3; Thu, 17 Aug 2023 14:20:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201847] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at
 000000000a721000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 82 [] on
 channel 4 [00ff85c000 X[3819]]
Date: Thu, 17 Aug 2023 14:20:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: simonfogliato@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201847-2300-Dvu2OBGjdL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201847-2300@https.bugzilla.kernel.org/>
References: <bug-201847-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201847

--- Comment #6 from Simon Fogliato (simonfogliato@gmail.com) ---
I copied my info and created an issue here:

https://gitlab.freedesktop.org/drm/nouveau/-/issues/256

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
