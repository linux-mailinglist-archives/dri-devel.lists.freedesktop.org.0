Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C94FE3A49C7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 22:05:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 836576E05D;
	Fri, 11 Jun 2021 20:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EFC6E05D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 20:05:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 86321613DD
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 20:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623441937;
 bh=46R3uEQ6E2N48h23unjddOu3cPTm7VkUngUvzsnyOZg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QUoOaCD5J9TXGyoaCz6oyIGA7vCMi6B+usANLNrMUM69znaCb1vU9CbV8eF8CtBMg
 edXOgYsRN6EbvIxvkia0R+nk32WTEGr7VEyvs3FnCwusFnZ7mPlhqArdSHxHPg/pPd
 CuQSsayOpC8FqC7l0Vx+WbjvkemmiUHTceVCFtUdemWcFBxfOeIluYcUrM7NMu1OZh
 owyqofvjVLNsxmR1ACve70TFsa+YWS2w4GUlv5kPeIDQfVwuPTg0QqGUmdlpCQGv1n
 6G3+pixJ2LoOJCyScRBiJ5IU9X4W1kq69KZl6yIt3i3z9ZAdYa8SgSScmZYIBrOmcD
 dFFcFR6Z5BINw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 78307611AF; Fri, 11 Jun 2021 20:05:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213053] WARNING on dcn30_hwseq.c dcn30_set_hubp_blank, AMD
 Radeon 6700XT
Date: Fri, 11 Jun 2021 20:05:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jonfarr87@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213053-2300-XX8EcpySNl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213053-2300@https.bugzilla.kernel.org/>
References: <bug-213053-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213053

Jonathan Farrugia (jonfarr87@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jonfarr87@gmail.com

--- Comment #2 from Jonathan Farrugia (jonfarr87@gmail.com) ---
Can confirm I also see this message with an RX 6800 (non XT).

It's still present as of Kernel 5.12.10

Tried earlier Kernels 5.12.8 and 5.12.6 - error was present there too.


If it's any help these are my specs:

Ryzen 5800X
Radeon 6800 (non XT)
Using Latest amdgpu firmware and Mesa 21.1.x


Let me know if there's anything else I can help with.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
