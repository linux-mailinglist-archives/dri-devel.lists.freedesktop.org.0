Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D688746206E
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 20:27:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50ED36F9A3;
	Mon, 29 Nov 2021 19:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 304 seconds by postgrey-1.36 at gabe;
 Mon, 29 Nov 2021 19:27:06 UTC
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1556F9A3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 19:27:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 878F6CE13DD
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 19:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 317D1C53FD5
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 19:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638213713;
 bh=ocn+j4gg0E9gk87+3luIw0hhdmM7i6qgs3MHuvIAzpM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ntoVtYyONRv0OFuKSwt+bfM6whq4BdWg0dJ7LUfeq++vpTXg2ZdVkQK85ORWFl8Wu
 pZ+1aTPtWDQXzbSa/ktZnnZ53XFp8jn4/LPS251GsXjsVyO7qCaJGrQN5s7UCe2L+D
 YmMgZElCR/QWELhKU8qiMg1gVVR8uVescvj405ghRTzTCmanI1e0KwGVB8URlxDviP
 LCtCx6Tt5Nagj7YOwJNq+5twVwgvX778vhTac9mN2MmzmoA7uZkUTWmYrTS6X4ZubY
 7ZCV5RU77HAduo87NOasSh1cuiYG7ngkyxEItUH6RfyhhoacxjelZ8mcaS2vtlfm77
 CcXU8h5GY9xSQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2091E60F0F; Mon, 29 Nov 2021 19:21:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Mon, 29 Nov 2021 19:21:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kolAflash@kolahilft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-ivgWUjSSJP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #85 from kolAflash (kolAflash@kolahilft.de) ---
(In reply to James Zhu from comment #77)
> Created attachment 299697 [details]
> backport patch for 5.10 stable.
>=20
> Hi @kolAflash, before I send out them to public for review,. could you he=
lp
> take a test? Thanks so much! James

Works excellent!

Tested with Linux-5.10.82 on Debian-11.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
