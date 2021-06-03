Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B9F399AD1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 08:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A003D6EE65;
	Thu,  3 Jun 2021 06:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9EE6EE65
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 06:33:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id AD39C61406
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 06:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622702023;
 bh=4jEqKG65hMi3HvYXiM+B/fuBUTTIc1+23EuvQbxjOwI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HRFmq7coBU/egueOjTX7topHGXDd4NqkPWPvruxMcHAyUq7cT1CIVUfhPU/pjx37N
 oMcb+VjW8qxa3BgDIImUXhdAJZC+oXx8EYAiyKozV8hrneMUU19ykE3HM0ReHA0o5Y
 lBsiYzxU+FNO6kCsq8R+FH/DKYUX30aQe33y7SGJrolULbCowIeFy7cVoq2zl6JpO0
 s+m9wvwvcRNHEAJ5Uc/3uSO6/lKeTEmPw12A85yE9f/LBGGhl1miv9xazs6u8Q6qTs
 yLU5mXf7xQAeOHC80OyOjSx2dhH3F1IOd0WnpESlsDh7r+ze9Oc5I+HO//kOgKldXk
 e0/9cXDNvkkMw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A46B061155; Thu,  3 Jun 2021 06:33:43 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213321] Laptop not waking from sleep
Date: Thu, 03 Jun 2021 06:33:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: sujay1844@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213321-2300-gK7aKA114E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213321-2300@https.bugzilla.kernel.org/>
References: <bug-213321-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213321

--- Comment #3 from Sujay1844 (sujay1844@protonmail.com) ---
The same files I uploaded here, I uploaded them to gist as well if that's w=
hat
you prefer.

[System-info.txt](https://gist.github.com/e92b976a8a90d2c7a452ffe3d9032573)
[Dmesg.txt](https://gist.github.com/88356db938913489622735ab5c2354cf)
[Journalctl.txt](https://gist.github.com/3e1f7baf20b4babb51e3c1bfbbb4febd)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
