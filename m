Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF5E3A955A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 10:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B6A6E536;
	Wed, 16 Jun 2021 08:51:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7026B6E536
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:51:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 454B96135C
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623833492;
 bh=evESh4WD5slZJrRjnCUUPGlrY49dEtYeK0CeRhJT+bQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gBsCvx+dHtna4Z0M2VP8G3VLpgTUVaNHRLBCyIK7D/1vF+GIyKZ60DtD9xHvveixy
 dEhYG/3AmR4o9Ula+wPKmLxW4gWJ2QjY8hC2p3guokdW/6pLVlBzIMoI2BSUD/2pG/
 erbaSs9MO1PpxiaXy1JDCVeEMNbXIkV/XTsayKsAqcaC4N+tECHo1rWoX22BZhwJ/W
 5l9wLWoQSSRUNA2qTnfVPkim0tINt7IW6RNaum5TmpkinIQG57+9v/PkzlFMGvMN/h
 0XVBKCZmS7CwwkVErHkZ+u0GaZcPzq/jsATPaFnAVNVysk9Ek2JOW2IpVOMxZmrM0+
 9uhjQqEt3ceiw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3F61B6109D; Wed, 16 Jun 2021 08:51:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Wed, 16 Jun 2021 08:51:31 +0000
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
Message-ID: <bug-213391-2300-YR1tkDzm1c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #15 from Michel D=C3=A4nzer (michel@daenzer.net) ---
(In reply to Dominic Letz from comment #14)
> Having the same issue on an E495 with Kernel 5.12.9. Will try to downgrade
> the /lib/firmware/amdgpu any hint to which git tag you would consider saf=
e?

20210315 seems to work fine here (on an E595).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
