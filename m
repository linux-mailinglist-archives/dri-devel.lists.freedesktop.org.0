Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 258DB3B5CF6
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 13:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8C06E42A;
	Mon, 28 Jun 2021 11:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FEF06E42A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 11:10:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3B65B61C77
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624878607;
 bh=KtBi2yKOL7b1WaLV8zCoeRLiyiVNumbrovxn8r/PKGM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FfpTDpucztnU5y62oyAoSvTJgMMTaP2S48UnfuJU/USaFqwPglfFQA/p3fV+MtXvv
 knkDRuAAHVK21VxdHdezoA3Gr6nsWH3nOourao+fGWCzHASHSI8FZgV2gY0JYYqpYn
 MT5uxxLCgCzG2AW6hk1tBCxEqGw+QqUnVhtHntn6Qsu4/OhlKq+9DOPhRGJELEj+qQ
 DKVM6GfdMTrgQfCBWOUqtpn61e9kPnSys4jfRx2AqEDnWu1lu5K+EZQ83m8fXp+IMB
 BIS26xkh+dEn1jRCSY+8pdNUB3ClAoHRO/09n3NQ32XiovOaitUUgPmP4EPKzxHege
 I3YXl7Rz9Vufg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 38C4C61242; Mon, 28 Jun 2021 11:10:07 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] GFX10 AMDGPUs can no longer
 enter idle state after commit. Commit has been pushed to stable branches too.
Date: Mon, 28 Jun 2021 11:10:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213561-2300-ulC150qlUN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

--- Comment #12 from Linux_Chemist (untaintableangel@hotmail.co.uk) ---
(In reply to Marco Scardovi from comment #11)
> Hi everyone, I'm facing same issue here on kernel 5.12.13 with the AMD 32=
00U
> in an HP-15s laptop. Can you confirm these commits will fix for iGPU too?

Hi Marco, it should do if it's the same issue. Your choice of actions are to
either:

1) Downgrade to or use kernel 5.12.12 (I don't know which distro you're usi=
ng,
but it should be available somewhere).
2) Build your own kernel from mainline (currently latest version is 5.13 fi=
nal)
3) Wait until kernel 5.12.14 or later is available for you (at this time, I
don't think it's been released yet).
4) Download and run a kernel from a 3rd party source that doesn't contain t=
hese
commits.

As you're on a laptop (and thus probably on battery power), I would just pi=
ck
an earlier kernel for now (option 1).=20
If you've got grub for your bootloader (for example), just install an earli=
er
kernel (or use another one if there's one installed), by choosing it at gru=
b's
menu when you boot up, then once you're logged in and confirm you're not on
5.12.13 (confirm with the command 'uname -a'), remove/uninstall 5.12.13 and
then return things to how you like it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
