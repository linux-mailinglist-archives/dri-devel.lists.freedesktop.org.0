Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B27484A886A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 17:14:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F10DE10E174;
	Thu,  3 Feb 2022 16:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0161210E174
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 16:14:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 2AE1ECE205D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 16:14:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 751CFC340E8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 16:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643904841;
 bh=Jq/oL97Xx75g4YMEf5jxrkkp1ADW6HnHJTt/VcSC2sc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=e05tUgdwiv8IBKR+XMSawJcYvG4fCH8yU+zb1bc0EwJL1mXAeIptQDighYbmO++er
 qIWeCxM+EBVBDyZXuFwVbVSX3x6jyXmU+TxwwJ0KKGOAzd8ZheMaDP2KmzTwNPGq9d
 dJHTngN7UyISmUL5zMIFH8+KqrKomLVqOTTqHR676O92p6qZnKe7RK5qoFasZ9LEZ1
 doMX4+qIFG9EbzoB3THwnpuGCWviymvdfkg12CGkb2oPvltmHJkoFcetBc8uKDvRaj
 HQ5LEdIH7URQSqGSTIiLncATfP/wTR08DC+PcjUHmd2JT3JHErPhBRpdJY9qG6LwjD
 ofiuIAkM6ocow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5DC10C05FD6; Thu,  3 Feb 2022 16:14:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215511] Dual monitor with amd 5700 causes system to hang at
 startup.
Date: Thu, 03 Feb 2022 16:14:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmestre@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215511-2300-sx9MR4Pud8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215511-2300@https.bugzilla.kernel.org/>
References: <bug-215511-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215511

--- Comment #6 from Jose Mestre (pmestre@gmail.com) ---
Hello, i've tried this patch and it works with
5.15.12#0f591d17e36e08313b0c440b99b0e57b47e01a9a and with 5.17.0-rc2.
Kind regards.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
