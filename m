Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA3972A8B4
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 05:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F9910E124;
	Sat, 10 Jun 2023 03:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1768010E124
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 03:17:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7DADD61D9E
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 03:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C7D99C433D2
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 03:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686367022;
 bh=S0sV8XKTtLsy+ZQLqsvg6NOo7QwMKRCOti0WJ7rAw8E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=W4+0xzLEOqyvJ4VeCZyndvBHGI8iKo3lAFawCS2acyKEX2UM8bL9PBTeyeBuqhn7H
 aEEd0BiUSrWWmfmz1PYS/0ye21HLTHD7k7pfgIT8EkMHL6Mt7fc+wlAIF0jIfYcFYM
 bqgHWZkCnbpHrNq4acMXk7EPVirnc8hRNrDhBq6sor3vuafla7NtqVxB87/HjV8yRI
 di2boWVpmcGT4KQwwxcp1aoYRiKRS31VIXufJmi5hc322kX9GS4oMrvm1WEkDtDBWE
 6ohvjRR3HcI8ygqQ7Iw0/TOK+1FxUfV4H9EvvnXseM1pyJl5ka4lqUpt6Gc9Qk6kDG
 luxI1vvQUeavQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AEA53C43141; Sat, 10 Jun 2023 03:17:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217537] [AMDGPU] RDNA Freesync problem with CVT-Reduced display
 profile
Date: Sat, 10 Jun 2023 03:17:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: contato-myghi63@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-217537-2300-DiKmsu2QQI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217537-2300@https.bugzilla.kernel.org/>
References: <bug-217537-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217537

Paulo Marcos de Souza Arruda do Nascimento (contato-myghi63@protonmail.com)=
 changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.3.6

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
