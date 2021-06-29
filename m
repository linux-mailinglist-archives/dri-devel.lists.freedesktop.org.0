Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ABC3B7AD5
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 01:58:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959CA89E14;
	Tue, 29 Jun 2021 23:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598B489D9B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 23:58:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1E0F461D85
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Jun 2021 23:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625011111;
 bh=tiNJeZo4W9+KIpFC4L78B9cBsP2zgG5KWthpU9Ohxew=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lat+7Vw6bya9g3vifEslP3fuVKvUqbXHvfyz41FbawJajRgDJtXTgBqPJsKpenW/O
 jOfBRjGcIHWW2xW3mnMC/8FQDFxVfajhm4QUinbaJSWM1n1ZwzfKVHLPMK5LQAsatb
 DiBa7th6SY92VU9wMwfzG2BMl3DTd7ZHZ5FJnEuncDZr5gFy/rHu4arsvNKa8Q3u+F
 cfPZdNGhiOlM+gSa1IWcy2EdAGw7KPaR3zIomzkzJbXKcoUw2M/F9QVCdMQsK+rJFs
 NnROHrGEtpNgZIgFeRG7YKLfECBh3HKJfN2Gwe4cMCOSr3gVMCNEN2Io84EL+CYuyn
 jw7VZl6SOspbg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 19B02612A5; Tue, 29 Jun 2021 23:58:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Tue, 29 Jun 2021 23:58:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213391-2300-AAAve1HJFa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #27 from Lahfa Samy (samy@lahfa.xyz) ---
Created attachment 297671
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297671&action=3Dedit
Firmware information for a T495 with an AMD Vega RX 10

Here is again my Linux firmware package version (given by pacman coming from
ArchLinux core repositories) : 20210511.7685cf4-1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
