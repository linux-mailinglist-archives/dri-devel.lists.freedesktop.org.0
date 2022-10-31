Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 965FA6137D2
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 14:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A21C10E294;
	Mon, 31 Oct 2022 13:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA5010E294
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 13:23:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4ED59611F6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 13:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B12FDC433D6
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 13:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667222611;
 bh=7RhpLXtPeOftjM8K9sgP6qyeSdO/f5hKBWdreJGT0JE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rPUFr7p7i2KIKSbdRoiEmnf4lgD0J0R9bK2ZNe1TrMlZ8tlv9N33Ng+4Lguz8htta
 AyWgbs4zJ2EBygFqdtbzO4TFUNeMGHMXw/G1I20i3EBE6L/1ZfNTErFANhtMTL+X1D
 QNGQgUr83ukXztjALBnQmkPDvDm30n4rWsBBs4qhDEp8oag3Oy0L+KDAM+se66mjj3
 emXR0TnOX/tuXaXAU+M6KG9G0WNuFDmy+L0oQxKnsR/DFcKdX8oFW1a+PLQB09mKPr
 JIV7wX66vDpN9U1VHT5uZTFBXAq5gkCUMwck6mArA0yI6kn3kv91/uzci8/pffQzDH
 qrhPKg7/veVeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9852CC433E4; Mon, 31 Oct 2022 13:23:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216645] Fence fallback timer expired on ring gfx
Date: Mon, 31 Oct 2022 13:23:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ask4support@email.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.description
Message-ID: <bug-216645-2300-zUH0rzH4Nu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216645-2300@https.bugzilla.kernel.org/>
References: <bug-216645-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216645

Martin =C5=A0u=C5=A1la (ask4support@email.cz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #303109|Kernel log created by the   |Kernel log created by the
        description|script in the menuetry      |script in the menuentry

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
