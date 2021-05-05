Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E437374AD6
	for <lists+dri-devel@lfdr.de>; Wed,  5 May 2021 23:54:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F4CB6EC5A;
	Wed,  5 May 2021 21:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF636EC5A
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 21:54:44 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 84E4F611EE
 for <dri-devel@lists.freedesktop.org>; Wed,  5 May 2021 21:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620251684;
 bh=dQzO9Tk8iWYUSj3VdeP1FnmxzxPNvvWschZTcWdnSfs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cZ+CxO31vnJAdsZkDcZ3LNtqMn7EAfCsaIWOIeTXJ4uENNLcED+aNjAu4YOrEU8/G
 o4MOdbjIb3K+tQp5X42mWemwaj44nRscvSZ6rZ+t4BILF/gq6iLHVGXI/TSmxc/euc
 nef2o3/eQAZlaNHgznLteu/nedSFrT1EbRmlEQ/JnEOPy1aCF3gW0ETIV4CZbt2hSR
 VYhePnvB/O7DVIL5ov3yodT+yMugI365eDDLD3yJNzxSxale3DO24cc//wY8lIitV3
 SAd2r4RrwJK8H0tbf0hPemxWeoEnW8I2k8w0K9ExRT2Q7Gqywkr8r1YKAOpaQRfN7v
 LGIt5dlEEDvDQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 77DD561278; Wed,  5 May 2021 21:54:44 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212957] [radeon] kernel NULL pointer dereference during system
 boot
Date: Wed, 05 May 2021 21:54:44 +0000
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
Message-ID: <bug-212957-2300-rEWu6OrzVH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212957-2300@https.bugzilla.kernel.org/>
References: <bug-212957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212957

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #1 from Alex Deucher (alexdeucher@gmail.com) ---
Can you bisect?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
