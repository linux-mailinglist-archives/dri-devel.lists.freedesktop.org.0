Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B9844552C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Nov 2021 15:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B9C6F427;
	Thu,  4 Nov 2021 14:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B94E6F427
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 14:18:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D3B8D611C1
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Nov 2021 14:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636035520;
 bh=jdIVzSnDq+j8LFuPAFGfnrhiDNlmYv3MVKqTaydpknY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hUTyGStVUaDcg5tk1k6mEZxgJhKaHvqC084tQbGWCHD9ruFw3gAAZqAlaBh1ubStF
 L/g0ZTi9K5eUF8ry0M+4jApQc65NLLo5UJ5A8imuzY1/iA+6JGmbPGve72v/jnVWGM
 TSLOh4vVZRh2Es2Y2yltyjEYXjk9/mSIGEhl5stEdtK3Qe64mLD15lN/w0i4qGGJ7N
 6obFzsoyT2Xdbl2bbCm3Gp5r8lgAJNdlkEnatib1VtcA+W1z5lYVA7U/KivuJzogZP
 mqTJijPQdNrln8LkrQuH53bl01EcWj0eL8wjcD1dJqGBjV5QYISVpW8mwpbl9B8Y5/
 ask8k05+deynQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D096660FEC; Thu,  4 Nov 2021 14:18:40 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214621] WARNING: CPU: 3 PID: 521 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0xb64/0xe40 [ttm]
Date: Thu, 04 Nov 2021 14:18:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Lang.Yu@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214621-2300-x6nbuTMYnD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214621-2300@https.bugzilla.kernel.org/>
References: <bug-214621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214621

--- Comment #17 from Lang Yu (Lang.Yu@amd.com) ---
Created attachment 299441
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299441&action=3Dedit
test patch to find who pinned amdgpu dmabuf

dmesg may be too large, please add log_buf_len=3D1024M into kernel cmdline.
Thanks for you help!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
