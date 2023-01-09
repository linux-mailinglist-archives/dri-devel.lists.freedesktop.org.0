Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC82662CB4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 18:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9358D10E058;
	Mon,  9 Jan 2023 17:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B134910E058
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 17:28:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 31A03B80E00
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 17:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4CA5C433F2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 17:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673285328;
 bh=HmCpuBKEia8/NqU5Q9XeDspTdi2dxBTex0LKhklR+4s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tChprtAzuIrRQH6CV3RnFpV388oyE/385cFtRedc5Bd8TL23dNZIUrmEe3FhnoVag
 oDch21DJMt51mg0vjTOL3fgAd/4NP0x52n6hZ6iNgVUVV+OCcrcZnxBQQAXR6qvQQ5
 UACJ74H2xXggegOgS5TppqUVfNPuN9xidaP5bIU3k75Igo2KHugtqyEGwshR1sZX7w
 TWjDrqUtpLHcL3o3nVBECTjQQgp8BFq+K8EYK2CvEjUsbtO0gZN/IQeUHJbqVnu9DO
 mUuHsIUrIHYubn5XOPp/eXg2I043fxJqqXdKvMWiqe8bvCB4MLktaPYVuJsDg3Z1Ci
 XexqbfYPC7Aqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BBD99C43141; Mon,  9 Jan 2023 17:28:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211189] vgaarb overrides boot device unexpectedly with Intel
 and discrete AMDGPU
Date: Mon, 09 Jan 2023 17:28:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: edurayasmedina@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211189-2300-arqwRwYlGF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211189-2300@https.bugzilla.kernel.org/>
References: <bug-211189-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211189

--- Comment #6 from Eduardo Medina (edurayasmedina@outlook.com) ---
How I do to check that? I force the use of the iGPU from the motherboard, b=
ut
even with that the system identifies the dedicated card as the iGPU and vice
versa.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
