Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AB93B20DB
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 21:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505806E97F;
	Wed, 23 Jun 2021 19:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251956E97F
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 19:15:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 003C460FF4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 19:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624475705;
 bh=WIfNTO5dsNreVsV9lduY1v41GJfeKPUmBzfS7pKyGb8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gXEbHceICvDfNxRt1e5ZC0DrjzmJFpomIwAAxm7rurugAJXzHaRHPiC2XuP+z+Sc5
 dQOVrEsdrUDRQ8+3QcRqAIHUoBo4mw1AWAC85+wKGL3bydouGAjN76YdfgbHhhxvxB
 6I2mA5Zm7Y/Jl08ONgnoLYNUdff2lD6nKZaOS1ghvPkcMiAdRpYX6ZPANi4dTgHGG4
 OF79tq4BhmY1go/7BbRhUf2MIyuvksi46ckFSijdnIN8B05OGlxg8DsIlFfdgtTMSi
 u7k2vD8CecEe6t9bBiS+l+X/RQzYdVaEY6p6JuhjVs4uGdZfhmNzwjykWhx+nm11Uy
 6UxDoMMBhsWAg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id EA5E1612AD; Wed, 23 Jun 2021 19:15:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] AMD GPU can no longer enter idle
 state after commit
Date: Wed, 23 Jun 2021 19:15:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-213561-2300-yu5PDVICcv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

Linux_Chemist (untaintableangel@hotmail.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[bisected] AMD GPU can no   |[bisected][regression] AMD
                   |longer enter idle state     |GPU can no longer enter
                   |after commit                |idle state after commit
                   |1c0b0efd148d5b24c4932ddb3fa |
                   |03c8edd6097b3               |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
