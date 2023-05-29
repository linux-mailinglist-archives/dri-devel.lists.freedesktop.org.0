Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1ABD715236
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 01:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37FBB10E0DC;
	Mon, 29 May 2023 23:06:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7B910E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 23:06:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D18B8622AB
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 23:06:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 428CEC433D2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 23:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685401561;
 bh=jKmqTfc+7UoZMfdwYO0zdTtvquHTH2+EsJ4ZxuqKadA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ua6FOGBCOlZjm0KBIHmL6dxxbGBmmp6SrvfMeij/1u56H/g64ayCqYa5K8E9Pp0e5
 6hbEfrsuJez+kwtHT6DTKP63gVbFe2o76o7wdiicmrwe0LEzLdiZNhZ7KCYPa+LS+a
 u0xGwCaYixu30Bn95qB3kUb6qKvf1XFERpzGFESi6oq4St9t/yM2JT8K9tb00RGEWA
 csQE+4kye/7r/9uuJzctU4RacNyTgm+3EUVMJ+eAXQWqfY49STiY+/vxk9EwvWcCU5
 Oh3U/TJqds14ARc2hfBfyXpF3lB37nx2ODJ8ODsTRcIHwPg0OVlvcnVQbRC+ugWl+f
 +p7OIaIYuQMKA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 24BBEC43143; Mon, 29 May 2023 23:06:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217499] NVIDIA drivers fail to install on 6.4.0-rc3-1-mainline
 kernel
Date: Mon, 29 May 2023 23:06:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wessel.working+kernel@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution
Message-ID: <bug-217499-2300-xLRCxKoUL1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217499-2300@https.bugzilla.kernel.org/>
References: <bug-217499-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217499

Wessel (wessel.working+kernel@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|MOVED                       |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
