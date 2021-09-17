Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F6341006F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 22:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFE016E048;
	Fri, 17 Sep 2021 20:55:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5CB6E048
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 20:55:45 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 7594361246
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 20:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631912145;
 bh=7c/1oAfzjGxu6Y6M5JEbAQ155OkmOraDyFPDRzWcBrI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=auOIR5v1r7F1Y22l28t7GDCriRJB7h4t2VeG+iCpyv179clOc76K/8sLEJzAHRVM9
 qdER2HDtPoCP31oBleBthw/AYGasQx5fySjuuA0P21rd8Cs35KkJ/W2QlxDK8jYHtz
 BQLh8CZGJ/oBpvAHhOTWdxGux9oHC/ydQfCOqp9gtzLO8/drIxZeHo1GeyD7Li0byt
 N6bcuobg1bDZaklCtOrGVh745A4CouXDlaDl9wr+ZCASaKNtRQAP5lGtiZdQ67FH7e
 JLI6ExuyIHybSwejIvmJZFNTMJ0uIOyGPUtJjrUxo57/PqnXbDLBB6naJmSrObwih2
 y9AXu4kHmCuhw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 72A42610D0; Fri, 17 Sep 2021 20:55:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Fri, 17 Sep 2021 20:55:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: parker.l.reed@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211807-2300-2w7uGAsF9T@https.bugzilla.kernel.org/>
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

--- Comment #8 from Parker Reed (parker.l.reed@gmail.com) ---
Just built 5.15 rc1 (master) and I'm hung up right after bootloader. Maybe
someone else can test that patch. I'll be unable to get back around to this
until next week.=20

Thanks for the prompt reply.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
