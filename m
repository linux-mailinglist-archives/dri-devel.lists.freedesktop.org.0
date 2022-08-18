Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C11C6598C94
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 21:33:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D453F10E16C;
	Thu, 18 Aug 2022 19:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2929010E102
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 19:32:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9CC5CB823CF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 19:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65E3BC433D6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 19:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660851149;
 bh=DVrii1hl/zqYrmUObKzojuMdo0TOiRQo+AU7uiqYBkk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fmcIccEAXQQrLsuhu42ez/f9qHrnaQ7Ff16NsVDX/Ta4xqCixLxFRWEAHAVZRLyKl
 KV2IofB0srdb8cEBw3Aq0IzW6SxI5CUUW0YiE7zrnMR368+sz6EJQSIkSd+c3zJAny
 kahPlD75EUtERxIkgQLVgoSKVB0zsbpevl72U24Iqct51EkH2xd5q9Hywmyg0UIc3t
 doN5dWrj+/XH+3iY1wkdaSGp8z8p32dO6JdP7JXPEZVfANZaECd7wlybeIBuFUuqdc
 JrkFL/HAV1cxOxDRKGOizvWBwKFOzqEw6Jgqa6Uwt5TaewG3yhnRtJo8Y+lmNtULWV
 6guD8Uhfj9byA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5039DC433E9; Thu, 18 Aug 2022 19:32:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216376] AMDGPU: display output disables and quickly reenables
 when switching AVR into/from standby doing HDMI passthrough
Date: Thu, 18 Aug 2022 19:32:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216376-2300-RS4ISaQg8W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216376-2300@https.bugzilla.kernel.org/>
References: <bug-216376-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216376

--- Comment #5 from Alex Deucher (alexdeucher@gmail.com) ---
Yes, those are the events.  The desktop environment listens for them and
reacts.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
