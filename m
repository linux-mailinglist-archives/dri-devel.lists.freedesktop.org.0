Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E973CD5B5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 15:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A111A89F8B;
	Mon, 19 Jul 2021 13:30:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A27676E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 13:30:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 1AB0061026
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 13:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626701437;
 bh=M4rCthbTJ1FycRrm3MYK8VItCl0tyGJ6zytrEAwmYZg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZFjvTyI4xfOxahoXkinjGPIsnC4CBDewxID0XhyTawfH7gbfo54fZIR2dRQf2Bm2s
 SL+EidW2I8hcYrs58Mn7S+wd9dOFiw2VhJ0ZvSNptTuIOIzi+bCm/qTaEs4mKCDMqV
 ZtuT5VFecMoCGpj39Eax0E28X8xrL8CKAAHC/5RkR3J/qoNMKZC5VXRRXmtLRRVORN
 AtgIrEloHiGCuZ5b9PcZpSo5RvJ7+YMJxTXiiDN/5e6yz7ffYjnydMl2sm7tcz2jWZ
 zzVKNJf3vXZMB+0pDIZl58Zp8lB0cBm4gJM/f6xmAj/gjgcmo798GID35ZjBO7QyVh
 2X2QmIAXDM+gQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 17D00611BE; Mon, 19 Jul 2021 13:30:37 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213201] [KAVERI] memory leak - unreferenced object
 0xffff8881700cf988 (size 56)
Date: Mon, 19 Jul 2021 13:30:36 +0000
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
Message-ID: <bug-213201-2300-AbvRxxllO3@https.bugzilla.kernel.org/>
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

--- Comment #9 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297923
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297923&action=3Dedit
kernel dmesg (5.14-rc2, AMD A10-8750)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
