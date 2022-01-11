Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939CE48AB50
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 11:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939DE10E121;
	Tue, 11 Jan 2022 10:25:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B7510E121
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:25:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 13CF3B81616
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:25:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D838BC36AE9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 10:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641896708;
 bh=n9OlwnKS9ALit/w4oh/oUZvKsFxFelgXzVjxPAUfjG0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Kv7LGli27h1o88gPeub1IVoqpNBWejpe3X9Pk1LWPAg9l9e8vdlfVM2ki0++Ea8Cw
 ZV4DAwqdaYZ6GyKT5STVrP5+6LIVdQuU5xh/rmMKWCoXxjdMMMnmRaDA8jjvCa+uYd
 Lqzo6f5kF9mGw5fIt/M1mBT6xc7l05xGVaugVzaCZGXurKIeG8CiK3GQsp4cWlrWCr
 CfiysIdLQ7DydgHArPFi5u6KCpz/zfNcBiVng28Lv2uelaFHfO8Y0VYE2AOB29EWuc
 1GWkajAMD7n5DQ1qIuR7wtRxX/9JQf8eM6XSimslg2ZjFteaOqOCLqAKcypmS4j8Wz
 JUSmxfHoad0fA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B691CC05FD9; Tue, 11 Jan 2022 10:25:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215445] AMDGPU -- UBSAN: invalid-load in amdgpu_dm.c:5882:84 -
 load of value 32 is not a valid value for type '_Bool'
Date: Tue, 11 Jan 2022 10:25:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: peci1@seznam.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215445-2300-TEr3LNSyjy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215445-2300@https.bugzilla.kernel.org/>
References: <bug-215445-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215445

--- Comment #5 from Martin Pecka (peci1@seznam.cz) ---
This problem has disappeared for me in kernel 5.16.0. Can anybody else conf=
irm?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
