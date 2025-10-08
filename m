Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB5ABC5D3C
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 17:47:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7000210E146;
	Wed,  8 Oct 2025 15:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NhihWEM7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1494110E126
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 15:47:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2D70462073
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 15:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D0D19C19423
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 15:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759938423;
 bh=v1V1FkoXJYdaYWUhhKeVv3APhrkPA1+dZ21wO6TQSew=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NhihWEM7ayWwmDToa9yR+ckdh4gVHC/VFagW74jvRzyKfnYFcEhUiO0WwLqC6JhFk
 XdBRphQqzmcevomPzg070v9tW7CAio2ulQ2rFM814iTIOZKDPGocN/UTqLw9Yfffz8
 JZ6Fi7ZRnY9czx2QHzMJPXwZqAGOzRZ+E3RZyCLeLe3viO2ooj97OL1erRPffz+kzX
 jZjp7Cg0S8qEFw20ygypHdL3e5oHQqv525+JaGqWkS9LvVgPuFOmgP57v8Z0Vcw6AE
 Pe4TM7Xe0QTj6V3QGzpNJ4tTjE8hHTr/ov1T71WMjwHjP9RleddcRMBnVSq9rKFLEh
 NIxCjQEauWC5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BAF20C53BBF; Wed,  8 Oct 2025 15:47:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220642] amdgpu: Vblank missed when playing video using GBM on
 AMD Ryzen APU
Date: Wed, 08 Oct 2025 15:47:03 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220642-2300-f8LOeztJkv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220642-2300@https.bugzilla.kernel.org/>
References: <bug-220642-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220642

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--- Comment #1 from Artem S. Tashkinov (aros@gmx.com) ---
Please report here https://gitlab.freedesktop.org/drm/amd/-/issues

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
