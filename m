Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 681ADA63639
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 16:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1386010E177;
	Sun, 16 Mar 2025 15:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rXeqAmqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7EB10E177
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 15:25:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4DED1A48BAA
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 15:20:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49911C4CEDD
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 15:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742138747;
 bh=ERNEE8NS4+PUi5h0aNPpf8p0ixKW/tHp7gJKkRb5N5Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rXeqAmqmkpR11//hXT4qP2Z+AsyoMnHhz+fNogEpEr5Eqi7FP92gQh7xB4cRdVWxv
 tz9rt+jqaub6OSoqRiCmkXFYQdGRFFN4NCe0j86S5epB/tPoL5bbXOO2CsUdYT75ie
 W4wPeX5KO2CmpOu6fInOgfJf2id4qdm9tcynh11H4gzC2ek8025mFIXB3tgsNbKIpW
 n6dYtlRYB5HVgx+UjHxaEz7AEYYrFYog7w4f4qRwDy+Ybh83JXzcRcV81tgG/4c8rf
 I5fwKkqG7AgcppFvcIgpfAllvc6gP85Vr4Py2xzTAERhbDtuMR0eia4Cbdm+VBuA03
 coBiuBmz4cRuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3B1C4C41613; Sun, 16 Mar 2025 15:25:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219888] amdgpu: Oops connecting HDMI/DVI/DP on HD 7850
 (Pitcairn) when connected as secondary GPU
Date: Sun, 16 Mar 2025 15:25:47 +0000
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
Message-ID: <bug-219888-2300-UXGS027CU6@https.bugzilla.kernel.org/>
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

--- Comment #2 from Alexandre Demers (alexandre.f.demers@gmail.com) ---
6.11.0 exhibits the same problem where there is no output. There must a sig=
nal
established though, since the monitor doesn't complain about "No signal".
However, the boot process is stuck.

Using the radeon driver works as expected.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
