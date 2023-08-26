Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C99578985A
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 19:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C10E10E1A0;
	Sat, 26 Aug 2023 17:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1F910E1A0
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 17:15:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2200961712
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 17:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89183C433CB
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Aug 2023 17:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693070124;
 bh=5OuL/tb6MXMAyUtfAkjbVZvMu4tf6QgED422b6uzY/w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VuZQlmzufEXs2gH0ZUoLTBrdY7E/yadDCv9xG59GQy8ueUdixeyaIna0K3IulbXdO
 4Ekd+hFOT7S5sC/xQriNeBY5uv4vUd2PsTh2muA4PR2+zEv0yto9T2FTzJWDVbIijM
 M+Nyshaq5/CtFgUEvW6hzKJCrQyDaDZDBFHBYPs2GnArZZqTOVK1/rfbb7BKr9l1k4
 2J/dHyPp/rsKdUAW3DJXHoErqtbDmwFlj15kHJsr0q4PnVQ7+uHSGGhcXIV856TxJa
 ncLeVYziyABiGbD3OK3LsHEjV0Io8SJCnW5XIpPbNwC46Q10rBlnqwb/mRu+LTofOI
 X0REutU+Q/FYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 730A2C53BD4; Sat, 26 Aug 2023 17:15:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217664] Laptop doesnt wake up from suspend mode.
Date: Sat, 26 Aug 2023 17:15:23 +0000
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
Message-ID: <bug-217664-2300-Zg8HsvCGJ5@https.bugzilla.kernel.org/>
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

--- Comment #36 from popus_czy_to_ty (penteljapan@o2.pl) ---
Created attachment 304944
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304944&action=3Dedit
journalctl from 26/08/23

doesnt work now, when im trying to it doesnt want go suspend for first time,
then i repeat and it goes but not recovers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
