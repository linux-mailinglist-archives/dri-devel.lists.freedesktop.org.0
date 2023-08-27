Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF320789B93
	for <lists+dri-devel@lfdr.de>; Sun, 27 Aug 2023 08:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A998510E048;
	Sun, 27 Aug 2023 06:44:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829A910E048
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Aug 2023 06:44:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBB7761FD0
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Aug 2023 06:44:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 26AACC433C7
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Aug 2023 06:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693118684;
 bh=+OjUwv7NLTeTfXtWkD0yd3S21JlBgK+A4wcJ7r7TxyI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mGaKhouzCFkwEb42C4/MDFTf9ILRs40OVGEAUo3nJDelNdQ3kvqGYUgk4jiFxK/rA
 ppYNwzIYJz/pzcRkkRRSO6Dl3pWytnGA3E5WBM6Mw+7KhoVv31j0EjJ6Kq90rGbksP
 qg5Yj1IjQS5q8ZGzR9FvkOX+9FVpWaJpbNs5Gzrvx2q6bbcNkSXV/1YzlnJUDoqboT
 vrG8CAlHytgHr/PZV1PiQ6E/YeFsa/Y+tG08LgMPLRQ68xCbyaikB4R757efnjwGSB
 npKv9oC47/2/IeD1j8jPV75zb71wXGPaLdGSfuEzjSaRD+TQjxd2edG54hdEIGiAP7
 hXO15hr6VT3vQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 12DB3C53BD4; Sun, 27 Aug 2023 06:44:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Sun, 27 Aug 2023 06:44:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217664-2300-rcEWsvnjgU@https.bugzilla.kernel.org/>
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

--- Comment #38 from popus_czy_to_ty (penteljapan@o2.pl) ---
Created attachment 304948
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304948&action=3Dedit
test nr 2

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
