Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70FA8A64013
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 06:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07EC10E0AE;
	Mon, 17 Mar 2025 05:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IRNyt/jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B017210E0AE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 05:46:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4BCBE5C4D66
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 05:44:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3CDDC4CEEF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 05:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742190397;
 bh=mrlzp7OctvpdK/nDRkWrkbY9cpaSrs4UN/XRChIZKqY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IRNyt/jxv13S2Z1VLfmftm7wXxsRl8ZYCYPPDXnxgRWyvWxVRLWWvpp+keZ0p9h1W
 NoJ5ptgRCqtDoMNNfA3sRCzkFUy0b9kk/ayw8Bu5MCfQ3LiVcaJnl8MU0+s/JIN0OP
 jeq8QN+4uJwsOcGY+EZRDUyXiOiMiKByNYTMpmQA4mTjkza7if5E3/Hy1ToKxibB4q
 1SrYO9wFMKSHvigymnvi+KuF4txjyxglPJXa9qTaxIQgy3qLRq1qRs1cl1EaApqEPV
 pSOtb0lHT6qsJqH81OneUuc511PZ3U/eaBhxZ5hVflfzBRo1trJySVzhC9tzYR6cSM
 F6LI7S76dz/dQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CA797C53BC7; Mon, 17 Mar 2025 05:46:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on DCE6
Date: Mon, 17 Mar 2025 05:46:37 +0000
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
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-219888-2300-TNpilTAkbN@https.bugzilla.kernel.org/>
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

Alexandre Demers (alexandre.f.demers@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|amdgpu: Oops connecting     |amdgpu: Oops connecting
                   |HDMI/DVI/DP on HD 7850      |HDMI/DVI/DP on DCE6
                   |(Pitcairn)                  |

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
