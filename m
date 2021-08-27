Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 039303FA15A
	for <lists+dri-devel@lfdr.de>; Sat, 28 Aug 2021 00:02:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EB836E9DF;
	Fri, 27 Aug 2021 22:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC486E9DF
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 22:02:25 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1425960FE6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 22:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630101745;
 bh=IG9FjlrAysQ2XeJFJr330zQpyWp4uM4ESW9R3jJl9/o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RlQ4U7vEgagJFAbFU8O9spcRF7jzsk/+KjHHZApje4DToaVvXn/1WgRA3elepDDev
 IgUq8kESyfKA1NZPNstQbsWVGdMYuPV1N7gtQkRoNFSg0temVrnVuInHv8qqCY7pQo
 XNz1wnXYqKf8swYW5buRHouZ8CzjmuOim8hXQge1N2aNH1zYcAZepbnUjJToJB5Tow
 IgSGANTDqeHeyYpo5RskoVSbuQMfGmBUaMbqE3LDTgS7eKyzC7v1e2613U537Ne5jK
 k45/JI79fZ/Ekx9o9PWMq2V7Naoc8wDksQSfwxAsHwuKRBb9+IPkBbrIfpgjlhM8xr
 T2joNyHH5/Blg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 11AD160EFD; Fri, 27 Aug 2021 22:02:25 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Fri, 27 Aug 2021 22:02:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: nils.tonnaett@posteo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-zgUGMH0cqy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

Nils Tonn=C3=A4tt (nils.tonnaett@posteo.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nils.tonnaett@posteo.de

--- Comment #3 from Nils Tonn=C3=A4tt (nils.tonnaett@posteo.de) ---
Same with Radeon RX5500 and Dell P2815Q display.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
