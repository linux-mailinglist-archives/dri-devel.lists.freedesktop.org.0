Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D4148F07A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 20:34:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAAE10E177;
	Fri, 14 Jan 2022 19:34:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24C3510E177
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 19:34:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 11B83B8242E
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 19:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DE68CC36AED
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 19:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642188843;
 bh=On5yG9tfZVbQjfREE0XSoCbM4Ih7Wm2WiwNXn1gvzIM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PdxFnOu2XS2X4FExkDQp7d2Ccz+FLhDDqfHJSAD9Oe+USEL3liBiPq7y9xz/3Zsi+
 wXP12LD2PP6a3VZOZC+vH9nVtKg9N0dnPmfadIzlIJUGbweID88V4PretAw6qk7gS8
 Uoyz+kmaqa3scXWqEcmBHnm6HtMydnhftXg6W5wIWa08EzsB4wWKtbMVAhWlmk51DT
 ebVJlalIyIAGontWCjwVhVMOTwj/nAvxtw2qgVbZISphwtlGfmplPF3loD5tGfsp6D
 H/qrniPh+m/YZcRvxHIRxIYzaGB1SEE23MTzwkSkeyv9Qjul/TtUhLeUoyGjW+D5u6
 xku/RT45dVPZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id CD5CACC13A9; Fri, 14 Jan 2022 19:34:03 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215494] [radeon, rv370] Running piglit
 shaders@glsl-vs-raytrace-bug26691 test causes hard lockup & reboot
Date: Fri, 14 Jan 2022 19:34:03 +0000
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
Message-ID: <bug-215494-2300-ERwElcBDVA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215494-2300@https.bugzilla.kernel.org/>
References: <bug-215494-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215494

--- Comment #1 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 300269
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D300269&action=3Dedit
kernel .config (kernel 5.16.0, Ryzen 9 5950X)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
