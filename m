Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4125877F422
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 12:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A528910E421;
	Thu, 17 Aug 2023 10:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DCA310E421
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 10:12:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9AA866191
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 10:12:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C10F1C433CB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Aug 2023 10:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692267157;
 bh=Mq2moMue3n0kkIb1fxj07ZsAVsxpBIeq6xaWSsLt1p4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BocYJB1h9NaPFejl9GHHH2r0G+FFNJ3aR1Heu4hDBToIz9tR+a5GznRUcSothma5Z
 QMPHZD7TB/JuAeOuacF7iKiNb159Gc2Wh9iBEaLFNz2vz1/9XQstXK87oGWt5d9oDP
 K2WzXUgG0MBZt7b1vTxPFp+WyulpPfBJgOjRD2mBR8n8sNXMoYbPjDP8POdTUV2FeV
 AOBq4k2j87fi3Bvc6jI085jv9+3mH8T7xRTHY76Jbw9VnD1Y2v1ZKqcVUtrZJ23dIw
 BvEq1Jf27FTG724c4emiov3ioZHcvoxnXtZysi/3lAnlM1/d4ixNTE9PrkjJxNuOJt
 B1iBsnc4TJyjg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AF647C4332E; Thu, 17 Aug 2023 10:12:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201847] nouveau 0000:01:00.0: fifo: fault 01 [WRITE] at
 000000000a721000 engine 00 [GR] client 0f [GPC0/PROP_0] reason 82 [] on
 channel 4 [00ff85c000 X[3819]]
Date: Thu, 17 Aug 2023 10:12:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-201847-2300-gZeXavORmW@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #5 from Artem S. Tashkinov (aros@gmx.com) ---
Please refile here https://gitlab.freedesktop.org/drm/nouveau/-/issues/

4.19.6 is terribly old and outdated regardless.

Please try at least 4.19.292

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
