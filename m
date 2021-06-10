Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589273A2CCA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 15:19:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF8C46ED15;
	Thu, 10 Jun 2021 13:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62B316ED15
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:19:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2F59A613F1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 13:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623331148;
 bh=BDuCOFFU68C53xWO/UgrUjxsHV6POJK+qysNUcoOW24=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OroFSwwZGqGojEeVTUiTga8U4THgwS8hHZUVwhqQcgYzsE3takkasNdEnZZDrjlut
 Zkjy7iDNPAbCWPst2KYJrclaNwAjALjhDTUVRfbqdxPWKnNT2tkwL+rriOUVS+A92m
 EWbdssU5dmm6qoPuBnPTtRLUv1TyxEE9NXkDU98TRelD/IQHv3qcn+9BMqyVy7N8hI
 QSsjpPzV9geIiX6z41U4Al5/8VeD7bASAhOsrTsBJtM4aouw+w7TWAOO+inTfeubBV
 sNn9iNI45ZNMwzUAqKbaWGeIv2p70fK25jGi5Vs2gzbmDBt5IwFVT9zp6aBzklGsIG
 xDIPFu0VPLv/g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 225106115A; Thu, 10 Jun 2021 13:19:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Thu, 10 Jun 2021 13:19:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-sHDRcR2GR0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #6 from Lahfa Samy (samy@lahfa.xyz) ---
I'm under ArchLinux running with the ZFS module (I can't boot and mount the
root/home "partition" without it), thanks for the time you'll be taking to =
make
this guide, I'll be trying my best to test the patch in any ways I can.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
