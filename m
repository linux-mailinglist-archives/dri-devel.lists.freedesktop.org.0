Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0945AF0BF
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 18:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B4F310E085;
	Tue,  6 Sep 2022 16:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355D010E085
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:43:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4C3BDB8190D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A0C5C433D7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662482614;
 bh=JvgJ1Kto39UmnThSFd+YfKkNnJCf5nkMFNxyrmT6FI8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BU/Tbj/+z7UDF9w54TXrR8EXmbhsOGoW3AQQoihJ4SYGsIxT0XL54WNxPKJew/VSJ
 BSyupMtbPDjMa5M3Qhsqr/h9n8yWz7c2xSCJVzJ2dECblnBtqOtIW5L3AhXeP0zW7u
 mvn5gSrojX90iRz+pk/UJr3S5WTkVB+xtyA4ALF1RRi72Dj4a/m6+pBmaXkw+fC5kS
 xX95Ha3iASG6KOGEKV3tVyLpVRbyJEYFw6kB8p9MiLNjBjVQIkQaRAbC9y1+f7oDKX
 bPrvJp4q1je6UtQCpAq6n1EORyo0IgQota/ZPO24GxCu37RXp9uXraji9WHCt49WsO
 keRg4TWSBcxaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 08007C433E7; Tue,  6 Sep 2022 16:43:34 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216455] PCI AER error caused by LTR enablement on amdgpu with
 LTR disabled on video card PCIe bridge
Date: Tue, 06 Sep 2022 16:43:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wielkiegie@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216455-2300-WwlSrrWTB6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216455-2300@https.bugzilla.kernel.org/>
References: <bug-216455-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216455

--- Comment #1 from Gustaw Smolarczyk (wielkiegie@gmail.com) ---
Created attachment 301754
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301754&action=3Dedit
lspci -vvnn on vega10 system

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
