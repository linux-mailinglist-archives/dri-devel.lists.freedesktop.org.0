Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A115A39FDB5
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B596E563;
	Tue,  8 Jun 2021 17:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3A1C6E563
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:30:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id CEE66613AB
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623173439;
 bh=52p2IEzny8uiFoNb7ZxkIC4yOHpdk2IU3fLmnt9bWvQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bNbALE52EE/dY9SW9FYpWtTitsJQiIoJAM5AJqnOcGoHsIZ6tfuhkwtsi1X6vTJDb
 r0m9GBXqyBxWHfKX4/C0H9pigucXDuz4wd+SKbe2tJ+nlK3HFSkK4z3R6prpsT/L3h
 hW7hm9RZ3h7qgrfg9gkvVU9NyosQGGJk8S0nVLwPUh0Ly0PXusFkJZLSBbG34SIeKG
 mq3p4k3/iM4VAKpoW8YG+xHHK8PczOQrAQsThK0oJJegaHoqQz7BA2QVRzUPw8V61P
 vBZSNOYoj0dgfdNuZOHPIqwc8FF76dInYIcfzNPJ+lQUr2RbysanwrMOx/WEU1Uv/3
 YaLI3uLd5mVqg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C3D17610D2; Tue,  8 Jun 2021 17:30:39 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Tue, 08 Jun 2021 17:30:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: meep@binary-kitchen.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213145-2300-fjy39BESIF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

--- Comment #11 from meep@binary-kitchen.de ---
if you have an easy and reproducible way to trigger this bug please tell th=
em

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
