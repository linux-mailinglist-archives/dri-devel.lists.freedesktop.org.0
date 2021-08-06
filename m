Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 666DA3E1FD1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 02:13:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AE046E8EE;
	Fri,  6 Aug 2021 00:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F248A6E8EE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 00:13:13 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C214861154
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 00:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628208793;
 bh=QMMNvH3phYQ7DZDAU8x0ddtNJCKlfMQHuUt+dqupCXg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fD+fR6+Zx1z+oPIXFUF5CjADGD8PZYtmDTluOP0YUUR96oLHU0jgvorEQsMlUMsAU
 1sY/6I9ORf2KLspTc1taevpKa1k8Edr0558Z+4M2Tqh0c9eK78hWibVD/ikvCtHpTV
 J0HrSfWtGhYHmj1NVqARHR0n6F9UKQEO/jGyBk+UbxYLI958Fr0NPv2Dx08UDp9nZj
 Y8w6im8g1M9winJgGyeq+Sm3XK5i6n5Oj7/IdCXTmsjWkIrYI+43Nuoy+f2MGH3C5F
 7UtgIfK2U2EaAjPMyR+a1SuxXfn1ev+6OkGSN1sLMH08iZs2Wdk83fFh3mrcEud6SW
 PhPDPDBiBTrAA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id BBC4460F37; Fri,  6 Aug 2021 00:13:13 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213201] [KAVERI] memory leak - unreferenced object
 0xffff8881700cf988 (size 56)
Date: Fri, 06 Aug 2021 00:13:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213201-2300-yr9Zypz1sX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213201-2300@https.bugzilla.kernel.org/>
References: <bug-213201-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213201

--- Comment #12 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298217
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298217&action=3Dedit
kernel dmesg (5.14-rc4, AMD A10-7860K)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
