Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7C4787F8D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 08:08:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7F810E601;
	Fri, 25 Aug 2023 06:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85D010E601
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:08:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F7BE64529
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:08:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94EB3C433CB
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 06:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692943687;
 bh=7VCYjLD8h0n2CMQiKttI93ZWyjMFGdeJKW1I/OAvfFs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=l7VMDh7PFMxGsJGvyaxPZ+ZnCCFwUgqTEYm2pc5s9ENF+QA2Q/ihcbWNQ+IWRlmUF
 8y9+4qR2Jpro8jwRn/SzFT5moGV3t7bMZACP8SrdRF3FP0NJytDc7DsnorfKnDBHVL
 NTF5rnhxYPJGT+ulV5prHwRe/N1roN3tdup4Ei/E1NJZJMVDCW9tqGs0p+wM7BLt/R
 jUYZd4CRXXHoykFDAW5rqFJgmOS1p1nZp8tEfuDjwfXWR9MtRKVfVn/znHslLpRnSu
 kNDAO4ePXgWHiK6aIkEmdWe8TLus7rpLkGgJG8ZuF67qpI+K4eaTSU+4tD9Q2HqDDg
 kO52OQEOHeWrg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 85647C53BD0; Fri, 25 Aug 2023 06:08:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Fri, 25 Aug 2023 06:08:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: ACPI
X-Bugzilla-Component: Power-Sleep-Wake
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: penteljapan@o2.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217664-2300-WlAIsygBS3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217664-2300@https.bugzilla.kernel.org/>
References: <bug-217664-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217664

--- Comment #32 from popus_czy_to_ty (penteljapan@o2.pl) ---
Created attachment 304939
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304939&action=3Dedit
python script - results

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
