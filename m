Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF15987CC
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 17:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443B4BA83B;
	Thu, 18 Aug 2022 15:50:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D0E971B8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 15:49:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8401CB82218
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 15:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8250C43140
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 15:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660837795;
 bh=LDI2kojISEOyDow2x0rSLb5+75rTkyQnzKCYgC2Z6SA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fCCByUrDyta+Y8cU7zRhpnL55gPSW6s280eI493dDk+4D64vaUtKcWvoXQiVqDP3b
 bR6h4C7CpMrt6uQpV9tZSeCFxbLhtGvrv0Sb22YDj3+k6y/KIjEKgs3hurFx52EeZJ
 SuD3Fzi2lScS8NcZXj6idgCuAygcKbfrxBuKxO/2ZBi2RZehlAnP5T1BdRBVNlQPNH
 QxhSZbMl0nzzukHXK0pfDadhndnvUdEA+wkpchYUSI+gkJ4y9OJC2U/LmERfrsGTPO
 KnkQH6cdQsgVG3ebbPTsDA3y2SxFz5Cq2qv5dO6C0jdlhgAhuzXSBmKbAp8sb6nqGr
 J2OoVbjinDj6A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CA1F3C433E6; Thu, 18 Aug 2022 15:49:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212649] general protection fault, probably for non-canonical
 address 0x1856385d1408f284: 0000 [#1] SMP NOPTI, RIP:
 0010:kmem_cache_alloc_trace+0xe9/0x2f0
Date: Thu, 18 Aug 2022 15:49:55 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Memory Management
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: akpm@linux-foundation.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-212649-2300-cbTZa2giCj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212649-2300@https.bugzilla.kernel.org/>
References: <bug-212649-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D212649

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
Sold the GeForce GT 710 some month ago, no longer able to test.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
