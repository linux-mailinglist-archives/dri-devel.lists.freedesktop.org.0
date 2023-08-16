Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B318177E863
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 20:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05A410E3A2;
	Wed, 16 Aug 2023 18:12:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 764E010E3A2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 18:12:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E60F766B55
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 18:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55CFFC433C8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 18:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692209533;
 bh=t2tmGRkzaO0IvivVTlTyOpQjH3pQYs5sBuMS+9d+QEY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PYGYRcIleHu0FYZflL7PNRAjDVYo8+f8KD2MGR4NUH3+0eUXV5KT/giMXeQSSspgo
 AC5fZNyD4XSit/YlPwFDT14hKSEZ8bSYtwwoj7kZ2M1J6ca3Hl+k8JehCy4hQj37lJ
 E5BISWje09BOdKHSZWpnEUqpUQbFjST14G5PpG6Ql/NYpmRI2SGeUTZe/iIXqmBsaV
 kVBXi2PmjqBzr2HoXDNBZYYbmhMQFtGE4WB58quHdtWqgpn9SL+YHf7u2XF5hQdVUn
 PLXHjwmAjnS36seWm+oMYqpM08lMYbBd2XCx0JcLKW1xyo0B6tyQdkDrpmez2WRHiN
 iTU8pCYjYRXlw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 38C7AC53BD3; Wed, 16 Aug 2023 18:12:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Wed, 16 Aug 2023 18:12:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-VeVaGVtb1N@https.bugzilla.kernel.org/>
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

--- Comment #13 from Alex Deucher (alexdeucher@gmail.com) ---
Are any of the external display connectors driven by the APU?  If so, do an=
y of
those work correctly on resume?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
