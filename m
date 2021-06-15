Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD033A89A8
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 21:37:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F356E15F;
	Tue, 15 Jun 2021 19:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4DB66E15F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 19:36:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8FF4C613B3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 19:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623785818;
 bh=KzpQfsKd4qQRUPK1plpBlt0AF9u6QgqRiYFZLbxgflg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SubaNV8Prek4WvpBk9nd3mfvAMcHo4Rth5TdLlBzmZeQ0JK/BWgrOCJBdDjnTDpVE
 30kkglv8A6Sd3eZ1udHW81yBfrzmY19O8bn5yLfcxJT3GFECMxssuJYCD70933+wBc
 dGD/QY2s9DVQejeeg9bZaeb5xlCZFtS41Gjj7ZeCPLKaUuogxrxbGPg7e/JeWedCeE
 0YgIu6kbUiqTTVhReDbJv1c/R3xDKa1PvYQdg1Wc0jEWf54KHzbqeio2m6VLhNI8T5
 p5y88iHxnxO6mWRHJsuwh8dqVnWof6okPptGedNVkg6PZa4ZxEsthvnGFztc0g9dRG
 TJp1MetOoQt8Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8CE4761279; Tue, 15 Jun 2021 19:36:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213201] [KAVERI] memory leak - unreferenced object
 0xffff8881700cf988 (size 56)
Date: Tue, 15 Jun 2021 19:36:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213201-2300-CUOFCPFha4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213201-2300@https.bugzilla.kernel.org/>
References: <bug-213201-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213201

--- Comment #7 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297379
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297379&action=3Dedit
output of /sys/kernel/debug/kmemleak (kernel 4.4.271)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
