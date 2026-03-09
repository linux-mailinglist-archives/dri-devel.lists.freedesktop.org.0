Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OtaC7TurmkWKQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:00:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF6323C536
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 17:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6263810E54D;
	Mon,  9 Mar 2026 16:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="THvwdv2R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079810E550
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 16:00:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5C5814359F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 16:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39110C4CEF7
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Mar 2026 16:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773072048;
 bh=6tA0exTWUDDTnKNEdx/HqbihV1Pbdgip6/bl8Idkkr4=;
 h=From:To:Subject:Date:From;
 b=THvwdv2RDYszA5aHgESv8RQWT5oLjpY03Oev5Jxb6n46zYwYblCeXPK6Ox/7m3xor
 J6c/45wFnt1qmiq4UZ8t2WjF7gwjXJj1Ncfj6oJ5KdNc1y4LsAmEj44AIPKeLRQ+fi
 HMcaZ1t7k8v+t9okGGLHG/xX1dXCzchS2eT+t0RYawxez8Qa0ayNLYd/Ugjgf4qx4O
 ++M8YS1GEAL3G1eKiocEHQSOhj+qd5ZMRNv0DJkuVK+K25uk4lIKlItSgFWN7O2IL9
 d87OC9u970pz7bELWK2+wEWxNu3TD8bSb2sb3iKPe9pn8Ami+T/ZwuCSFo7Eqk4uM3
 4R2iL6HPjOIeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 30AD0C4160E; Mon,  9 Mar 2026 16:00:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221196] New: No HDMI audio with Linux Kernel 7 rc1, rc2 or rc3...
Date: Mon, 09 Mar 2026 16:00:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gilberto.nunes32@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221196-2300@https.bugzilla.kernel.org/>
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
X-Rspamd-Queue-Id: 7BF6323C536
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NO_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,ubuntu.com:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221196

            Bug ID: 221196
           Summary: No HDMI audio with Linux Kernel 7 rc1, rc2 or rc3...
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: gilberto.nunes32@gmail.com
        Regression: No

Hi there!
I have compiled both RC1, RC2 and Rc3, for kernel 7 and after booting with =
it,
no HDMI sound at all.

This my laptop:

Operating System: Kubuntu 26.04
KDE Plasma Version: 6.6.2
KDE Frameworks Version: 6.23.0
Qt Version: 6.10.2
Kernel Version: 6.19.6-x64v3-xanmod1 (64-bit)
Graphics Platform: X11
Processors: 12 =C3=97 AMD Ryzen 5 5625U with Radeon Graphics
Memory: 64 GiB of RAM (46.9 GiB usable)
Graphics Processor: AMD Radeon Graphics
Manufacturer: Positivo Bahia - VAIO
Product Name: VJFE69F11X-B0411H

With kernel 6.19, even the RC's works perfectly fine. This is how I compiled
the kernel:

git clone from Linus github cd linux make mrproper cp /boot/config-$(uname =
-r)
.config fakeroot make -j$(nproc) deb-pkg

I also downloaded the mainline kernel from here:
https://kernel.ubuntu.com/mainline/v7.0-rc3/

I already tried 3 different Linux distros:

    Debian Forky
    Kubuntu 26.04
    ArchLinux

Same result...

So I wonder if anybody else has the same issue.

Thanks

---

Gilberto Nunes Ferreira

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
