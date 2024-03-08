Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 948DE875E58
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 08:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8B6B10F86F;
	Fri,  8 Mar 2024 07:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Vj39McMQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3751210F86F
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 07:18:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 23368CE2569
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 07:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63EB0C43390
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Mar 2024 07:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709882298;
 bh=VlF69rjneHk/vEr3NbIq4GBeoMpqESLgjS4e/OF9Uug=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Vj39McMQAi6pkxZO84JN8Pw4uoR4Iun2Gafzfk7AUq5DnuPfIVwrvccu39d2bWj9V
 ufel5z0F1L2kNJieA6H8+f80IluCcjwKgQ/TrTFwpFT8e5Vz/c1lz9iZne8FnetluO
 Ii64py4EA+ysqUBFU98/sRemhmH265Sxx06usfI2ivIczHUNtCLweZqbRRjHsmlmny
 GU5IeQZnI9fDgf/nZYMvH//Qyz1DWsfM2dfVdR65c+JCDqhOU7YlQ8VUrP9kEZ3mOt
 JSFfPn/m0GtOZmPBZZGlPkBYs8cwxx6G10jP75ir8MIvmzbEiWXKASuU7grsw5rpdR
 JQgyY3R/B0haA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4CB1DC53BC6; Fri,  8 Mar 2024 07:18:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218569] Early KMS Resolution Issue on MST dock connected 4K
 Monitor
Date: Fri, 08 Mar 2024 07:18:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erenoglu@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218569-2300-s3lv41QYYR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218569-2300@https.bugzilla.kernel.org/>
References: <bug-218569-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218569

--- Comment #2 from Emre (erenoglu@gmail.com) ---
OK, I don't have windows on this laptop. I can try another windows laptop b=
ut
that has thunderbolt and I dont know if behavior would be the same in windo=
ws.

I had an impression this was sth to do with MST rather than amdgpu since am=
dgpu
can drive hdmi port just fine, but anyway I will open a bug report in the d=
rm
as well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
