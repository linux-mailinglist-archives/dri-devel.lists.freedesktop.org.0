Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AAF76C6F1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 09:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B70410E426;
	Wed,  2 Aug 2023 07:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6470410E426
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 07:35:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B30AF61839
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 07:35:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23A66C433CD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Aug 2023 07:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690961719;
 bh=cc1WR15axW+5QdUlcxjw6pNr15zzV+C2eCYNBLXNrjA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SadZuF6D87eLgTwPIJGHLh0x//Paa7AKrWWSCmDMPLSQZGMDAZuc+G8ONWXtC4JTK
 aT5ZkL7v/rjhG+5WmmWRQ0M6Eo73eH9kh/xR4dRRGyOJsJqcSh/N2nYaouorh+Zpl7
 khRbTRcuMecUhxriv+roTtci5P65mOyDmiHFhvEXiniZ6wHg/aK6CeAkM/wXosDDYO
 LU1aHW/8BSE++/0rIjxU0pEpY0CSFh4joB3YhjifdyQNrRRp+xip1XOXhp/XFEH7v/
 8BYVJX3iufZhehXFk63dE5q/qpxhDtxm+EWtu2Y6Ep+h3QWoXEVCMARwGUbYu+tECZ
 hwvuVbqYwJ8MA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F3A59C53BD0; Wed,  2 Aug 2023 07:35:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Wed, 02 Aug 2023 07:35:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-hVWshOZPAS@https.bugzilla.kernel.org/>
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

--- Comment #7 from popus_czy_to_ty (penteljapan@o2.pl) ---
https://www.youtube.com/watch?v=3D9a-t6vMo7YM

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
