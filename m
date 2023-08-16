Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C641C77E53C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 17:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A5310E390;
	Wed, 16 Aug 2023 15:35:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B38310E37F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 15:35:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D407460F8F
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 15:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49433C433C9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692200132;
 bh=Sra8Lu2uoAJLRIJpJVDAq+bhhCe2PpgAeUCUcH2IWBA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Bjud+i4/3yCADGda5g5Ac3Bdkb+mBRT7/8AypwjZEq88OSgoW3PYdPsXtbkjOwoyu
 mMXd0ZEjTW3Ka6AEcNIHWtk+wOsKVr7+1VVMOFMmrXac7OrQ6edAoR0dc5KvJiR+PY
 eJR9bYiG6+1q+ucwLDjtxYxM6GxKK8bUPGUd/nrKNz/O5DrpB+1qPiIvXJkStluDww
 lBlbYiGP+7nxu7RqZiRmEQZ3dnIlcTKCZ8FkRx6kqb3doCsOKwuyWIZZQHyC+ijW9a
 7TJxv0idKoH1pQnW7g++s0feZpHtrelWD5l1ouaNTyst0CX0F6RBmI9mEHOsK3VS0Z
 pRSDRPdZhMr4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2B2DAC53BCD; Wed, 16 Aug 2023 15:35:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Wed, 16 Aug 2023 15:35:31 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217664-2300-VB8rCdnkQ7@https.bugzilla.kernel.org/>
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

--- Comment #10 from popus_czy_to_ty (penteljapan@o2.pl) ---
aafter reinstalling and many times trying response for your questions is

1 (mux) whatever it is --> no
2 no
3 no, via command its dead also
4.no=20
5. insyde corp (bios manufacturer doesnt respond to my emails), even in bio=
s i
cant disable dedicated card

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
