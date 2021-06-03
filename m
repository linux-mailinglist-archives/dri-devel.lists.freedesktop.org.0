Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C034739AAE9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 21:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92756F4F3;
	Thu,  3 Jun 2021 19:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CE126F4F3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 19:26:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0A5A561263
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 19:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622748377;
 bh=E+tei+gDxluX3+F1mIypvPz37NmojL69BF7aJLwaVrA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VZDUSF2FaRGKpW5U8EfOe3hfLn+vCIs78bhOdlOm2QVt2WKMJlt4Us8c5f6GNGUgM
 9dhGYzswaAA1zBDGknOwJu1IdZQgTsb7Ku4IajWongVnn6gb/EXkRJbYx58KdVAXjF
 9zoe/7PSD4e6UeWZMx0onaRr0ydmyRe7CAgRIINeOXC9kM/fJ6Yfm/nwnXGdSva60f
 O80njZ2VqGsx0pQ3GDt1IVkCkTx8B9EkrZmmcoBfIvnu8Hc4e1YL4Wpn3zF/trm8gU
 eniNbQnYnx3O5lND4bnzXKNoVX2A6LRl64hdvgTrgqkBwjAWjwfN5lf1i84TtIizo1
 N3nMUqnASC1zg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 00F3D611AB; Thu,  3 Jun 2021 19:26:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213321] Laptop not waking from sleep
Date: Thu, 03 Jun 2021 19:26:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213321-2300-vaewymvZ5P@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213321-2300@https.bugzilla.kernel.org/>
References: <bug-213321-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213321

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #4 from Alex Deucher (alexdeucher@gmail.com) ---
This is probably a S0ix laptop and requires a number of platform fixes as w=
ell.
 See: https://gitlab.freedesktop.org/drm/amd/-/issues/1230

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
