Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB923B6804
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 19:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7216E504;
	Mon, 28 Jun 2021 17:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D050F6E504
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 17:57:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 96AB661C6F
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624903068;
 bh=o3IpZq+RWouNnTgzsKmQcKagdicLFzm4/Vmc7J316NU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s+rpHfObyFbYi02/AbBbVIQ0MPoUzGohWZ9W09rsNcg5QEEdvm+1JQ7bdUYW3GHzB
 gL8pvLZr8b9JU9oFZ0+TiPZyaEa92Hj1Aw+3CFvCaqARVLHS1knF1aSqzoNRz7fA+F
 DizMtmYWbzBtHnvgJ9NIDhQBb6cv16wYn43hmD2mquLAg3/Rv4q6Z3jX6vL7sieSDX
 LT+oFvvPxgGWO77EsB5R1fY+1Ktv7nRjcmiOpFDx3MNrugMNgOj1toSEtmXRxVJ9dd
 FVU/c5InoaDptKCnB8uqoTRAiKWMZlK3r6yAtN63rWrzJGm3bc8euyJPkTP7srIoK6
 rGRcdPqlmj05w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 904D0612A3; Mon, 28 Jun 2021 17:57:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213599] amdgpu: navi RX 5500XT Very high idle power consumption
 (22 Watts)
Date: Mon, 28 Jun 2021 17:57:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: high
X-Bugzilla-Who: fkrueger@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213599-2300-GXqmYZSvQW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213599-2300@https.bugzilla.kernel.org/>
References: <bug-213599-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213599

--- Comment #6 from Frank Kruger (fkrueger@mailbox.org) ---
Fixed with kernel 5.13, thanks.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
