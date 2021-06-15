Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBFA3A8BA4
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 00:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5305A89BFE;
	Tue, 15 Jun 2021 22:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFD289BFE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 22:14:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3173D6128C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623795251;
 bh=VJxGzOuil23wRpNs2wyeSvVYKuTCq+pehdPqa6/F/l8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hpZ8S1ljQwKTYil1qDLv57KhmPt3gACAbnBcZNc7d4AalKieQHbOS/1mbBUwEjLUl
 55+Rt81DHvnTarPyaC1DItR+Ak2AS4kTnLcrUyqaXC1dltxSW0HEDb9cSIbL9uBzfN
 fjvOKY49a9vSUj9t9LfglX/w6aGzem1+WcV8q6HBOsOXrQpuGorc3WZ/F+vWSsqonV
 KOE1QmrqpqZVIE86w/oQCMxWgv1x3CC3G+xqpWzmuHVv4ekFPMgIBvLlR28rO5ent4
 EoVkwHZN9BDVW8snIwOUAcoaN8HGDhDgkrhp3AUYaPgF0gRuwHOtaOo1RAXUiZmk/2
 CMs/Cb/rrrMSQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 2969B612A2; Tue, 15 Jun 2021 22:14:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Tue, 15 Jun 2021 22:14:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: dominic.letz@berlin.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-1veCoQoNjS@https.bugzilla.kernel.org/>
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

--- Comment #14 from Dominic Letz (dominic.letz@berlin.de) ---
Having the same issue on an E495 with Kernel 5.12.9. Will try to downgrade =
the
/lib/firmware/amdgpu any hint to which git tag you would consider safe?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
