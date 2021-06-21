Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4D73AF5B1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 20:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A316E3C4;
	Mon, 21 Jun 2021 18:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE116E06E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 18:55:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 24A59611CE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 18:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624301707;
 bh=U3W/dbM3x9cRZj4d3OxWc8pCOUQwaQek7EXSCbL7M9Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IuFm/SltxOFa347p6/6fnv/7nDdxEEgYXkU2HtuyUHC6GdMoaG6PWat9/cdp0PKXb
 l5qcdTVmO24le+tAv46dBcT/iddLEUwvfcFJuU0lElTRMFT297/kCSvaTjuKasyCGG
 RYWK28VeQkOG58li2RxQECMB2V/I1n02dh/KE3sCHNJvI2E30vz2IfSVUHPN/zNifb
 c/XipIrf2i2SX6PkoB4aD7b1m2vOuPwRszQS8pOmvKMdWhZZGt8JUTA/+HCQlmm3IY
 MqOHog/ZGFMl/9gbVKwYuvFqyzbuA6KdTZkQYwgDpZMovmX5sScI2DJCW75+krCasl
 wsV3tG17L7G7A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 217556129B; Mon, 21 Jun 2021 18:55:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Mon, 21 Jun 2021 18:55:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213391-2300-uMa7ngTkAT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #24 from Leandro Jacques (lsrzj@yahoo.com) ---
Created attachment 297557
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297557&action=3Dedit
Firmware info

The downgrade to kernel 5.4.123 doesn't had any effect, I had the same bug.=
 Now
I'm passing my firmware versions information.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
