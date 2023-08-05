Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9CB4770DA9
	for <lists+dri-devel@lfdr.de>; Sat,  5 Aug 2023 06:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E56910E0A4;
	Sat,  5 Aug 2023 04:12:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5206910E0A4
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 04:12:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73B0A60919
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 04:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB700C433CA
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Aug 2023 04:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691208753;
 bh=Qn4K0lG78uwHedUhz4QXuIjchQDN658+Bz+NuDaZRRA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VVpCECuXh3jvgOfZIxAz5d/ta5jii/twxolCG2CKhunWZq+wsuVper9RNX1U11B5k
 ox6myv8OJ99bviBKzCcAC2rKuy0eZMFRNWjCdbUrkaXECalr7Arttd6f8LW4Nl/7Rd
 vC+TWgn8V0d51wK5iaL3A2f1EF11QKy+luuglNhY5P4ITbh0Ci7kUOsaTs15xgPmr/
 Pp3Drsh596QP+dFTOSJMcHz7gilUfhR4M8VzdxKjh0iVTkj65MtYnJvjpBQfIt4nc+
 BsnUDE4gfIs9Ox54Df/OZ8Zk5uMuxais/pL4a96lFm9HT6Mhz/T7q1t1WIOLaqT/WL
 7TRDzdMUOczag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AB9BEC53BD1; Sat,  5 Aug 2023 04:12:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208611] amdgpu crash on sharing image memory between Vulkan and
 OpenGL
Date: Sat, 05 Aug 2023 04:12:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yalterz@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-208611-2300-Xfn6MonaHA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208611-2300@https.bugzilla.kernel.org/>
References: <bug-208611-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D208611

Ivan Molodetskikh (yalterz@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #3 from Ivan Molodetskikh (yalterz@gmail.com) ---
This was resolved in mesa; forgot to close this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
