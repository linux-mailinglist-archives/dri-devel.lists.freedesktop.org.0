Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E7D3C7482
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 18:29:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17B4B89AB9;
	Tue, 13 Jul 2021 16:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1734689AB9
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 16:29:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DB898611AB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 16:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626193789;
 bh=iNvWYs9VSZw2nTHZQ3buyHZxY9kApB8vnP+UmKMPyYY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=skOLX5RPxUdsPiy8ZThVzixVtjA9yiLFlKxf5tcxE0ZF/P0ur8axRacN8B//Ykjie
 ctHpnFeJuNP5zy6uJ3ALxuKo/KeUxZBRiJkdDXh+mMTSj8yt85/dbtFFkZU+STjagB
 mx/hm4Z81MnB9p7qyJ5iKjpH/EmBqRHRaFyiIWY5ILC+GgtrENOlRey4e4g4LqjErH
 KaOmWX0iQZBjjLKnBiH8NTVjHrZty/JVuz7iFd8Lt8Z63I/ZK7fcijAtsxPpQyAAIG
 zv6kxp8ulgreXiLMxs0enpX1+XKGNTNScFGwKCFoD0WAkSbBeUKwozu3YIASJF6R8i
 I/VGfrl71E03A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D669E61287; Tue, 13 Jul 2021 16:29:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213715] failed to change brightness of HDR panel on AMD
 GREEN_SARDINE through aux
Date: Tue, 13 Jul 2021 16:29:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: mapengyu@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213715-2300-U6OTKOa3SS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213715-2300@https.bugzilla.kernel.org/>
References: <bug-213715-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213715

--- Comment #1 from Pengyu Ma (mapengyu@gmail.com) ---
Created attachment 297821
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297821&action=3Dedit
4k display edid

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
