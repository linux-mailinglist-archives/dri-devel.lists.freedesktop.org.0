Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB1C3E446B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 13:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E31F889911;
	Mon,  9 Aug 2021 11:09:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6088089911
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 11:09:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0A7F860EBB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 11:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628507374;
 bh=NwYzQOM3e8MFnwU/CEa/8jXe6e89PGKQH/cAwzlO9W8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=d4J3WYVLGK+kra0lulwOZzvKKVhU4HcKJemWKw3Ow1Q1shk/mG88xAv5xnmPPiszJ
 7kdgylvStzzTyvplD0Qti5wvMw0HR/TQigfjcH77hYqlmzNFB6+W7tbVpJw1rBidzy
 Awl+17G6SxGbGy7R1einVL+N51xKlsywlUv6J0kYZViH+ltGDDjeGXvvSrdbY4hoCI
 ktWsPzAjdKKDeixmY1p8cFlevpzeMdS9uoKbuwQMVrttvY7sWY0C3vBv4FgQAKfVG3
 yy71ftc8ClCx5ySd/3jgto/s8RphGxQlJqTcTh/AuqeauqiML5JUxC3BIUPK1afgXN
 kFz3asO4K0ezw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id F31A760E97; Mon,  9 Aug 2021 11:09:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214001] [bisected][regression] After commit "drm/ttm:
 Initialize debugfs from ttm_global_init()" kernels without debugfs explicitly
 set to 'allow all' fail to boot
Date: Mon, 09 Aug 2021 11:09:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component
Message-ID: <bug-214001-2300-icQKzVu2lL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214001-2300@https.bugzilla.kernel.org/>
References: <bug-214001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214001

Linux_Chemist (untaintableangel@hotmail.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Video(DRI - non Intel)      |Video(Other)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
