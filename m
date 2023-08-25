Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F1F787F89
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 08:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3710510E0EC;
	Fri, 25 Aug 2023 06:06:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D693210E0EC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:06:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C7C7763185
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:06:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B27CDC433CC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692943588;
 bh=iSslF6aHCTQg+pIrQJ/dHW2mq1MfvL2fKkabfrE4MTk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cclocrGCVaMcR7NWQbVKh7iZXSrTP9izUVM1ILqXlWeBnKdXX7TJUxka+9nNE0Rpu
 5MABKQyxBpHjpzQvkSjOVFW0GPfRVccfU49Q0xPfXA31KwXLwEiNgXm5MVErvefT5k
 c2rByQ8JmpIDEFG1GD2mEdw1Clp62/M6eL2pQ+SB/bCjlZbJVSwttjjvEnyQ54z2B/
 iSSNDf55mZBYYdldBZ9GJuy3ipg4+cu+IxEg4vkIkWUBvvrB0pWSC69vPQu87/RnXA
 Jp//4S6x0Xoxodj7yoMmq7/5nI0iHxG2hWmaIxYEN84018sI+OkRxWvcYgt3RtFFrD
 9G5FcxW7fyoeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A2463C53BD4; Fri, 25 Aug 2023 06:06:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Fri, 25 Aug 2023 06:06:28 +0000
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
Message-ID: <bug-217664-2300-YaVlIbRFaL@https.bugzilla.kernel.org/>
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

--- Comment #29 from popus_czy_to_ty (penteljapan@o2.pl) ---
Created attachment 304936
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304936&action=3Dedit
kernel 6.4.11 install

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
