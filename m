Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 642EB3B671A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 18:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAF3E6E4CB;
	Mon, 28 Jun 2021 16:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657D76E4CB
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 16:55:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 23A7B6198D
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 16:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624899358;
 bh=fA3uMf+yugGVZelQo+GLXCbQaUxXXMZeWRj147avmkA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bOJB8jkEEQ7oYYSF9X4sdWs82cDOPcNNzhF8rxV/Sy3bnd5tv56+kXxKcwRjF9LJY
 +odFMbs8A1xuIztJpcnKfa5smdHdZpoKVjrnY0CD/Zy8I1Fngiz2NdSoaowXmM9qzW
 lLgtgxlKBnbVOaxqj1AHErJDgbNCalTn5DFA4e9aPw9O99qlxwDV7DJr4feQzVZ6kV
 S+DIcKQA12DxoPhYe5L4T0bzVZMIJ7i4HqhNeMUbSt7rw5u0udLPXxFRoveGqueBfI
 D9A8dzDiZaoYf+JjqlQNdWTLXX+lMBTFKyWmUztVsJOJjNA59P7O7Pr1+aKG/bGvle
 JAl/4BC8azBKQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1DAB961242; Mon, 28 Jun 2021 16:55:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213599] amdgpu: navi RX 5500XT Very high idle power consumption
 (22 Watts)
Date: Mon, 28 Jun 2021 16:55:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: high
X-Bugzilla-Who: contato-myghi63@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-213599-2300-Ezb0c8Phz8@https.bugzilla.kernel.org/>
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

Paulo Marcos de Souza Arruda do Nascimento (contato-myghi63@protonmail.com)=
 changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
