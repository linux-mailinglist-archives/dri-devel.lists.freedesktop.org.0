Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21A1375581
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 16:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA1A6E5CF;
	Thu,  6 May 2021 14:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065756E5CF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 14:20:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id C5B09613C7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 14:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620310816;
 bh=YmSXV/3B+zMtMK5+8fNQbfx3JHMBZ2lgnMF6qwCU7yQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uS+WdN5NN9GPBRV3k3eLSC/x/CJorvEjOZ12tW+aGOH3QdaWK2asCsz2ixewy1RKS
 kFV46HrSQCIVpMcnOYkZpDNUtvKbqsB8PB5D1KyzYa7vTTZ+0HCHeI2Z3I1qNuNrC6
 xPJM216cCofCoyNP4D4AY7xs4m7eWIZ3TTZln6r4oEtMj7g1Ca7ha27Bb8DftkgW4n
 3FOUdP6wMpmd9R3knRnAE9teYiRR5qlG1lMORNgS2XnvAi8MOmJTyzou4FkO2zbw6i
 S6QvJJZCKuwPN/UoNDGTzX3x0M2p3/74fl17+m3GadxEkbI1JxF3r8TL7dHEwUN0lU
 IL8u+f17sEqFg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C25C2612A1; Thu,  6 May 2021 14:20:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Thu, 06 May 2021 14:20:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: filip.hejsek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-203905-2300-vCNIcQ79Dl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203905

--- Comment #33 from Filip Hejsek (filip.hejsek@gmail.com) ---
Forgot to mention: since your AMD GPU has number 1 (not 0), you need to rep=
lace
acpi_video0 with acpi_video1 in my workaround.

(To others: sorry for the email spam)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
