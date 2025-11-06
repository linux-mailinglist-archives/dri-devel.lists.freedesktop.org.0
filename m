Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9157C398FD
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 09:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA5A10E836;
	Thu,  6 Nov 2025 08:22:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IWbRvyNc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3DBB10E836
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 08:22:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 71EE8407A1
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 08:22:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 52870C4CEF7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Nov 2025 08:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762417341;
 bh=yp3F6d4lKr3OLBUeevYFJbavUpg3pTTxc+w6lCfPq4w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IWbRvyNcfCsEGIh0xwiv2yixsb5qruSKd0m9uA8k8+0H/z97DYA+vrWDudFALkBgA
 pyFZA2zDqaWMOfHoEgIHyw+YI5g37pyiavNrnuU0ziy9WqCgCIp2eqakfGvrNpXgKX
 ejZTYVrnTNLJWBnd/H9Yd6tFiENIJ459eFijww6GVKDy6Sg+qOYE4eo0+ZStq9yaq5
 VW1v1Adk3CM24dcBhAGaydZyc0edFo59rFKHo5KefiFWq3E0jjeCYv69dYv1bbE8V7
 +tEh/a7rz8AmAPut9SGDWmGwpknoYreYXrV4XAAfzJeeOU4WVxxc/EoDY+/2DZ4Sh2
 fS2279AnzEnkA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4B7B0C53BC5; Thu,  6 Nov 2025 08:22:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220130] Display not working when connected via displayport
 (purple screen)
Date: Thu, 06 Nov 2025 08:22:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jani.nikula@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution
Message-ID: <bug-220130-2300-mlTnmUP3q6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220130-2300@https.bugzilla.kernel.org/>
References: <bug-220130-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220130

Jani Nikula (jani.nikula@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|DISTRO_KERNEL               |INVALID

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
