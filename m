Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D7478BAC8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 00:02:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9EB110E0EA;
	Mon, 28 Aug 2023 22:02:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7877D10E0EA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:02:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E8C1162FFD
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 369AEC433A9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 22:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693260149;
 bh=xWEBBiFKV2oxIP7TRASzBJJKw9K6zHFiiFaOuY5EDWo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=T+m3hhKC83gnG9t/6aLb5oRRWA9B8BMoHO/YD0/CKhDvtXNujMrY/JpReleUqkMzJ
 k8U5yEmAhbzYGZCKpMPh0WP08TSCqLzBPK0NgPiu1NgZTEXqHsdnE3FfOIVSXs0HcR
 7Sq23j65KdrgYIakRAWprI+YQZzAL2sUXPWB8qt0tt2RvVTGjYoGy25dIJ1wW42S9J
 XXIZTYB4YGJKxYf/6hrBh/kk2iyq5cQIVDhc7GoZY1cz1WObk9YFpuKnGiSuV0myDx
 J/ap6MVR/+3ja/RgqamfW18PBrOunW/CNVKq///doh98Vciz1Aj7M16ersjrXW2Eos
 H5dsQBlpEvZhA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 22856C4332E; Mon, 28 Aug 2023 22:02:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Mon, 28 Aug 2023 22:02:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: Serial ATA
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component product
Message-ID: <bug-217664-2300-QR61yJBQLg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Power-Sleep-Wake            |Serial ATA
            Product|ACPI                        |IO/Storage

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
