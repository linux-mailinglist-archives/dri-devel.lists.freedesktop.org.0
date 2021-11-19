Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F10114570C0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 15:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1D316E1F2;
	Fri, 19 Nov 2021 14:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2DEA6E20F
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 14:35:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8A28761B42
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 14:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637332519;
 bh=yBZV7J6hSj7VoqricFHeDZuU87kyXxLAiXM177L3lm0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Vu30JGZXzJEJmzQRS5IbScXUaO8G+BfFypz6Xawy9G5xMUr2EabR1hOQ4GAR9wnlw
 u+uF/lTOBBGfOPOySHMHuA8vqYsN1CHseLb2ZBsv6HRE3ealE8aWZwAAFDFRXPET4Q
 8RCW3+QaSZle5Dz1wiRIefL2QNm7q8nH2dEQD2Cnn2nYqS/wImkZWyTQpEA2LC7NGy
 2XfCinlv3ILHAR6g8F52J5o+eEghxIIsJUtMnLS3wXjUtUo5bJdptM1Jy1DrY0XRft
 gO2eMflHvzbuB+99USKyykELiO61r5NomQFQTngVwz4a3ExPY4jkQ0HlkPIv297JfH
 AThCutiutXqNg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8740961004; Fri, 19 Nov 2021 14:35:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Fri, 19 Nov 2021 14:35:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: michel@daenzer.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211807-2300-W2QTWJX5cN@https.bugzilla.kernel.org/>
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

--- Comment #15 from Michel D=C3=A4nzer (michel@daenzer.net) ---
(In reply to Daan from comment #14)
> I also had this in my logs yesterday, right before my system locked
> completely (had to do a hard reset).

That's probably coincidence. I get these messages on a regular basis, witho=
ut
any bad behaviour.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
