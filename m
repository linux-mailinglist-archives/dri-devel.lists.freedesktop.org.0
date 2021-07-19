Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 229733CD5BF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 15:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E2A6E155;
	Mon, 19 Jul 2021 13:32:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CF56E155
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 13:32:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 26ADA61026
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 13:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626701555;
 bh=AEv0HjGP0RU7Pk3g/gsawQC34sGOO8sgXI2ebdeyjdY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kCzs4otub10zklkewLOcz6rZn6a3Z/t+LeR9tqpnGwajXcYr2Q62tPCURK4AS1y14
 PyAtSNPUGRy4/9mM1AVlEBz4x+qMMHFu8z5mS/s/gxtSfkF4Icxsn7YHt1qhYsk1vU
 mWc5YA8BVk4sfdIy+djGLpOzxW382YOSTyXUrxgv3Hs9OcaPSSXvciRL8G3pDOBTj2
 lS8Xr4yKfUY5gq8HXFFSe91xLt5AFvoDaloaeWYoiHDX+1iq33ET6bXo4GvQ10tz0c
 CE0UhLswvPTZ7yXk0C25b1N1pjI4t3dGv4oRZa3VKoorGuYqPZ5HAO+iJuR0iNEiq1
 Ca7UR35shqU7w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 23D0961186; Mon, 19 Jul 2021 13:32:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213201] [KAVERI] memory leak - unreferenced object
 0xffff8881700cf988 (size 56)
Date: Mon, 19 Jul 2021 13:32:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213201-2300-cKoUWmieEW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213201-2300@https.bugzilla.kernel.org/>
References: <bug-213201-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213201

--- Comment #10 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297925
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297925&action=3Dedit
kernel .config (5.14-rc2, AMD A10-8750)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
