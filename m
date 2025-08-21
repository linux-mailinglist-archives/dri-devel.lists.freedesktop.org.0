Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F8EB302BC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Aug 2025 21:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8FB010E38D;
	Thu, 21 Aug 2025 19:18:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jdb8oGEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0182810E38D
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 19:18:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DF2CA601F8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 19:18:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94502C113CF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Aug 2025 19:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755803909;
 bh=la6OYDaBHIP6z5rB45Vba0Djsymg57zD+44DteszA68=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Jdb8oGEyTNLQVxhT3ISHyoqAsP8LOTmVLTlcfoSOvvNVaOPnxBtuLNr9czeekISC2
 JOVvCJvHRDwVjQqV3ismfkI/70GlpeLMrYJbTd9AkQGVEut1p7JDe3DG+Vivrpb1Bj
 konWTktXChi+M5Z4hIqswa6PlSHCnrNjpxgHpiT49QpcpZkUJ1vijcyFBG08kC+/o5
 mq+fLcuGazd3DI6C/5D6BFrDWzh8Q9NZ5Ek8x1gYkRsg6lX3g2C96g0Mgs0KCOqWFX
 rzMWx6SBx2BvqjBd/lbRyKIWTqyKfRbjiwSfqWQvqg/ukLxUm+TyZZcevB8o+Xo28d
 w8SGCFzN/h5nA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 87972C3279F; Thu, 21 Aug 2025 19:18:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 46181] No Brightness control-nouveau
Date: Thu, 21 Aug 2025 19:18:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-46181-2300-Fhg0EyBEfe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-46181-2300@https.bugzilla.kernel.org/>
References: <bug-46181-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D46181

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Even if it's not fixed, the proper bug tracker is here:
https://gitlab.freedesktop.org/drm/nouveau/-/issues/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
