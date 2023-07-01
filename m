Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F3174491C
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 15:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A780A10E04B;
	Sat,  1 Jul 2023 13:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF5C10E04B
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 13:10:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 42D3660B6D
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 13:10:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9CBDC433C7
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 13:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688217046;
 bh=dOPnPQKpH3ExSiqdZGqZ1sKtP/WbG4U+7Qmu/CCItwE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aI+bT/HI13KDMvVqW0arfgcklyU0meXHDyFI1sqW7bNgGCUxBn2dEbVSpI/vjuk4y
 D6E4Nq/nKuLZywvVWKY3LvPl38HLTEBYudjXEURnd1stX8A6D7n79M691O8UlL4g4i
 8k+o5XFqe5GiZXuwvJaJcp1NI+AIugwrIRcuTBtw7mDI1b1qGGnpXP30jQTaYNh+Ph
 6nbWSBZdaFqTpmx4gR+hAzcBJrujNhgdJhxTBcGrtOhfFklGCLD8z78uIfmYVCe4bq
 CzlQgkyvy5+4Yr/r/6fQUylEcoaUBUjgW9s/7MpldgxuYmLKzRMqUyubInErPyV0D4
 eS0O+oZbXde0Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 94AECC53BCD; Sat,  1 Jul 2023 13:10:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217621] AMDGPU - Internal 4K display used with 1920x1080 leads
 to screen flickering and distortion, regression from commit
 edcfed8671ee57bb599184f2e12a1b3e11b32306
Date: Sat, 01 Jul 2023 13:10:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: der.timosch@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217621-2300-3SRTitWLei@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217621-2300@https.bugzilla.kernel.org/>
References: <bug-217621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217621

--- Comment #2 from Timo Schr=C3=B6der (der.timosch@gmail.com) ---
Created attachment 304516
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304516&action=3Dedit
Commit edcfed8671ee57bb599184f2e12a1b3e11b32306

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
