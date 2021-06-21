Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB963AF61A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 21:26:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE3F6E3F0;
	Mon, 21 Jun 2021 19:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62896E3F0
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 19:26:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 72EC261356
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 19:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624303589;
 bh=mbtDuZ7gYsa6RckVUAjQytbVfCYzPxqIqleb0kikxMI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FmTr52/fAPWdDGC0PQDLmMDhYOIDR5n/+hOmVzv5if3JURQD7ErB4AUDIKi+blGkZ
 S+50r1kwjPkT3Z46V6RI3Or6Q3TzWmid9G2uvNnpQ6NrOIRPBOp1zLZyf/xRr4pePT
 uy4fFHYccHe2BPaIS/33XbZqHmoIMje/nHh9llTH9JFRcUdcsC+GwtIq9T/aXC2/wn
 RECmm+kFKmnfVH5lrtVQI53JOkKk0/K/kVmCL5KGDNirODbz6V4nGwknuyKjLi0IJl
 OQt+M0UAvVWnkH1BN5CoAVubdO3srJHCJHPCzFqTHodE/CXMdaUy0QdlQuHFajVLNS
 4EfeVb2JX8tkA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 708AF61278; Mon, 21 Jun 2021 19:26:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Mon, 21 Jun 2021 19:26:28 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-b7YmQPodM2@https.bugzilla.kernel.org/>
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

--- Comment #25 from Leandro Jacques (lsrzj@yahoo.com) ---
(In reply to Dominic Letz from comment #21)

Trying the same version linux firmware 20210315. Let's check how it goes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
