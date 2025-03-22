Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75868A6CCA2
	for <lists+dri-devel@lfdr.de>; Sat, 22 Mar 2025 22:25:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364BC10E0AC;
	Sat, 22 Mar 2025 21:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PqeNGUrV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02BC510E0AC
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 21:25:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4AD7E5C47DC
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 21:23:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02EBAC4CEEE
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Mar 2025 21:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742678727;
 bh=BR2c9GR5KL5/NnzOawGSkUste2J9j24MR/K2Tuk9BMI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PqeNGUrVPOTbLySeBhTWHlwiTA/LLWLdibLkCBaCuFsy+J+IeU+OfhpKsMtQAU7Mh
 YNmKeqKnRiEU53MLE9qHzn50MF+y0Q4pH+VbJSy+Opi8dS4apUimZk4sNQYymPMuCC
 0YqIkaVwmxLfiIYzyqZM4nitw4KMEZ1EI2xnm5bC5Pj2bsHJAWlZ8EnNnIGtxWHdmG
 NCyeGempPhtPZ+DecSR88dWsZklRjJy1qFEbBCsKvE0TFHQ3nDNwuxlZl1ccA0dV12
 JKxlE2co5/xOqJ2dLvGsRAwXzBfp7//+9JXeyMRDLLkQNZarQ1itqNCHJQamOKHM7b
 fvQEGnYUGNMNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E284EC41612; Sat, 22 Mar 2025 21:25:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on DCE6
Date: Sat, 22 Mar 2025 21:25:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexandre.f.demers@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219888-2300-A3pW1Vsh6p@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219888-2300@https.bugzilla.kernel.org/>
References: <bug-219888-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219888

--- Comment #9 from Alexandre Demers (alexandre.f.demers@gmail.com) ---
It will be patched in upcoming 6.14, but this should be backported.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
