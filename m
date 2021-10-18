Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA53431F77
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 16:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C4B6E083;
	Mon, 18 Oct 2021 14:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23E6E083
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 14:26:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3152060F8F
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 14:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634567166;
 bh=+p5dZbQQTjOuqgcOLYzKHftYa3UiOvxSfwlMvPflDcA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XYKku9wUtcfZ5wRg8pAICgKlBKf9YCOIJJNSDAvRMZL1c304DD86wcxB9egVVY0he
 YaqdZe/MwsHh6rzrqeu8d3TLJfU8m/psPqfHSSVkYyKBIpKNNYJBGn+YlrODm8348U
 Jza+RN1V5MXiRJwyXqNCYFzrxmHpcTLKry2BZC0p0mT3aWkBejV0JY//FZcjulf62s
 kuNPuYQ2yd3a0XJO18hEkD4dkt9Jg1CS+u5fs8eO4MDfEbUsxbFD2CZN9NwkEK/RRe
 kjJcjmfZNrkL1bgT4NHIGoySkYOADEjspf8fcjDUpz423cHW51QZLN0SUceFXqML4h
 w/CcfRZc8kFhQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2E1D9610CD; Mon, 18 Oct 2021 14:26:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205649] Daisy Chain (MST) Session Crash after Screen Lock Resume
Date: Mon, 18 Oct 2021 14:26:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michael@rauch.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-205649-2300-dMNxe6FOJM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205649-2300@https.bugzilla.kernel.org/>
References: <bug-205649-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205649

Michael Rauch (michael@rauch.be) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|5.3, 5.4, 5.5-rc3, 5.9-rc7  |5.3, 5.4, 5.5-rc3, 5.9-rc7,
                   |                            |5.13

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
