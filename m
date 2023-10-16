Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A72A7CA9F1
	for <lists+dri-devel@lfdr.de>; Mon, 16 Oct 2023 15:41:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3238810E1DC;
	Mon, 16 Oct 2023 13:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572B710E1DA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 13:41:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 58A7F60F76
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 13:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08F52C433CB
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Oct 2023 13:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697463685;
 bh=VtAtVcpMGef1MYD3cxYZW4UIwL0pToCoYI/VrCAcVGI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qXUu2M6oO+5bSnoMLJO65KNry3mrmMhAZIS6h2/cFQZjju1XJqH2Hr2kTSWcCjYgb
 puUV7dih+oGE/Z1SkP9a1nrlvdbDEIhnatSNdYz4hqciCPMln2fQcVXqWf5Ugyoyo6
 c+7YRFhYsyS13Ja11gT/sD1eoIVZPwrLAhR/Zxc4cLTPET+K9Q2bShfRt7NW6jXQ5P
 qC5ys67C3POTR/tp5Jn8N79wNX5FthbHj3Y5BLQprB6s3bnaAFWYUFrA5Lwve9oBQi
 RDXLAbZGrsgBNOtQiEFXM6+9EFmJ3ZHxAy+cczMKZ/y/fYLSdHJN1yVShUUyQAutIR
 9Gc7hHUIl4UHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E4E62C53BCD; Mon, 16 Oct 2023 13:41:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218015] amdgpu powerplay: Spontaneous changes to
 power_dpm_force_performance_level
Date: Mon, 16 Oct 2023 13:41:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218015-2300-28Ie90tLGf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218015-2300@https.bugzilla.kernel.org/>
References: <bug-218015-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218015

--- Comment #4 from Alex Deucher (alexdeucher@gmail.com) ---
UMDs (e.g., mesa) can change the power profile as well.  E.g., if they want=
 to
capture an SQ trace, etc.  It's likely that is the cause.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
