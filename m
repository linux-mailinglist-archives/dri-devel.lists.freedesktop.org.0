Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8123A2A40
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 13:33:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F8D16E4F4;
	Thu, 10 Jun 2021 11:33:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7CD6E4F4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:33:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 12CCE613F1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 11:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623324814;
 bh=lGTSiJVfabLlh9GgX0+smmIvGqhY+pQuPRpb6Plvt6I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HClqetjkzC5X4rtiSOYWlb5lTJN1z68cgLkIHB8iCMcR17uxgc0JfMx9AvDsom/d3
 hWVS6FVANFXhoFKHbIGv4XZFnmIbt97kJzbr1vwgfk/kblX8qO556N8dVhT3qjCtUB
 XMwsafV0pF93Y9Z/nPuRrKxi4Wb5W1U9ym4cI5Pyp4sqK8MD0q7581CRCDNPTMx+2G
 wSNxhembhfooxCNXLOVfxhmUdYEydYSyBXfm0lqm55J6MX3Tnzop1OKTnhdLvjm89i
 fOGPg89nNNNMFu/7Q8IxNjBsjHtKlsCrCiZ5koEka+n6kj/lWEHKNkkRhSHY2/ZFDb
 +Tn7h7zWhZ7PQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 04E1261158; Thu, 10 Jun 2021 11:33:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu: [gfxhub0] retry page fault until *ERROR* ring gfx timeout, but soft
 recovered
Date: Thu, 10 Jun 2021 11:33:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213391-2300-fvB64WDmwM@https.bugzilla.kernel.org/>
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

--- Comment #1 from Lahfa Samy (samy@lahfa.xyz) ---
Created attachment 297287
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297287&action=3Dedit
dmesg-chromium-amdgpu-retry-page-fault

In the dmesg, there is the end of an entry to a sleep state and then out of=
 the
sleep state (a USB-C dock was connected to the laptop, and it has screens
however errors happened with it plugged and when it was unplugged).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
