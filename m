Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4B77DAB0
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 08:52:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57BB10E2EA;
	Wed, 16 Aug 2023 06:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E74610E2EA
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 06:52:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 73D0E636D8
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 06:52:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D70D2C433C9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 06:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692168755;
 bh=r/r6A9VEbsik3CX4hHjztFvVRd65NzymWAvTxA5u1RY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qVhl6/0Ga5s2giXnqjoMg9Cyz0aSQizGxenvPwEClMXudthloJaXXw1GrU0eftCY6
 iJxiRWr1J8msltEqbo6lOjmaND6QSBrYiCJUcWTmT9E4Sk1NaUrV0IPsTMAvf05s4P
 THlfO1tjCXEJu4O7gR4BjaqRYNcUXYbjbnJ3TOCz57BmknPzjKt/8RPB3/3586Ys/I
 cbO7BmoEbWKQlgejQt13T7pBl+pv/ZBCLDPSpqzqP49KvQQcr4Wa6Ync723l/M73yf
 6eo9xdU6VsVQF3TXb/c5+WD+YB2qBAGddeab5DWa5MEBYF6nMOodHGRFxrdKuvVlBl
 U0z49WfPjTnDQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C1C03C53BCD; Wed, 16 Aug 2023 06:52:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Wed, 16 Aug 2023 06:52:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component rep_platform product
Message-ID: <bug-217664-2300-IqZQLospnn@https.bugzilla.kernel.org/>
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

popus_czy_to_ty (penteljapan@o2.pl) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Video(DRI - non Intel)      |Power-Sleep-Wake
           Hardware|All                         |AMD
            Product|Drivers                     |ACPI

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
