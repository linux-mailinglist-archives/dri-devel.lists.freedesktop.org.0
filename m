Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E82E9639ABD
	for <lists+dri-devel@lfdr.de>; Sun, 27 Nov 2022 14:00:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEA510E143;
	Sun, 27 Nov 2022 13:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8117810E143
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 13:00:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AB8AAB80A49
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 13:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7688BC433D6
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Nov 2022 13:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669554023;
 bh=S16sVIV2JnETHxOs+U1ABZZvpjgdddDttJQByU6ATRQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qseK8XMhddkRAtLqZyeJKHKIRZJgzeNeNmlgkpXVdgTmHvTHwT2KUEM2fz9P6uzWB
 1oo1M5MgWG/I35z7zxO2FNh3HINC0Esq1BXYW1+XL8aL6wIYoU/qP8nldl1o00qXyE
 W4BynuABj91SsbzaS1QaFuLiC0lz2J9WaCyJW73viOvMorsdDfAAUx+j5P6giXPqrc
 d05py3/GZCr2KwGIt1Otr46dpn+cQX4pJ15wkby2e5Eh/lBi/7rRIOOrcXUE5dXpYr
 nlLQi6wj2D3rOoYczmZ9N3PqkqnJaXzrsssR276PmfluyhhDVglTpSen9qyuMVzNlo
 5uoQ0XNro4NiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 63B87C433E7; Sun, 27 Nov 2022 13:00:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216745] Kernel 6.1 breaks Thinkpad T14 Gen 2 AMD connection to
 USB-C dock Gen 2 with kernel Null pointer
Date: Sun, 27 Nov 2022 13:00:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ezou@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216745-2300-ZRYsJmMbvI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216745-2300@https.bugzilla.kernel.org/>
References: <bug-216745-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216745

--- Comment #3 from Eric Zou (ezou@outlook.com) ---
Sorry I should have specified that I didn't try 6.1-rc3 so I don't know if =
that
works. I started 6.1 on rc4.

No problem I will try rc-7 today.

I also don't know exactly where to file bug report when I think it is relat=
ed
to DRM. I just "think" it may be DRI(Non intel) but I really don't know
anything about it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
