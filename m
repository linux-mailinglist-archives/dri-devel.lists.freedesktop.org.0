Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DA244F850
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 15:03:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C0589CC9;
	Sun, 14 Nov 2021 14:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF4289CC9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 14:03:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3E80561177
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 14:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636898628;
 bh=E47lnyPEOypPdj7OIKhHP/CrJhGF/jflRrA6XUBkRyA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RgmJYVQtBm66JlOa1+uPjq8Tr04Zqa1pBJfpabokKO/WIorJMv2p6RUYt6c09lAce
 rtVIcDq6VmOQedLShPcgG9K0QcELzjhlpNikfS1HEh7mKrXRV0dI5jv+Rvaicri+1t
 Ctb1Qs+scVWO6FYG2Mj7zprng4btJza+jYfGeULOPLpRBAF4UffwfpxNx2pF35cC6R
 TWFRG4OJXpa+zZyMlRUkXAAVGRIOsLG0XeTKbYUR8/CHksB6T9CqSNDRtlBS5HIELm
 1eRdC7Yq0BMhRG2TabqEAHGa1cffLCaBC/nT3aVn22dVKARjoUaD94vuDLAMw6z1Jx
 6qe5ryrwbhq3w==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 30ED560EE0; Sun, 14 Nov 2021 14:03:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213823] Broken power management for amdgpu
Date: Sun, 14 Nov 2021 14:03:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bruno.n.pagani@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213823-2300-ShdXU0JFUo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213823-2300@https.bugzilla.kernel.org/>
References: <bug-213823-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213823

--- Comment #6 from Bruno Pagani (bruno.n.pagani@gmail.com) ---
So while I still don=E2=80=99t have time to setup bisecting, I=E2=80=99m no=
w affected even on
LTS kernel. Also, I=E2=80=99ve been in touch with other users having a simi=
lar laptop
(the XPS version instead of the Precision, but still KabyLake-G), and they
don=E2=80=99t seem affected. Thus I=E2=80=99m not sure anymore this is a ke=
rnel issue (and
whether BOCO vs ATPX is relevant). Where should I seek for guidance in
understanding why my dGPU stays stuck in D0 instead of going into D3? Is th=
is
or https://gitlab.freedesktop.org/drm/amd and appropriate place?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
