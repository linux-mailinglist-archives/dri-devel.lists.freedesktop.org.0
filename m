Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCEMCRvUmGnbNAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 22:37:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 801F616B064
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 22:37:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B39F10E318;
	Fri, 20 Feb 2026 21:37:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Td+dVduN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408B910E318
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 21:37:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 63FD460134
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 21:37:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 174BEC116C6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Feb 2026 21:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771623445;
 bh=NJK8OdBozaXkLWqivw8B99Q0CfGooDa3a69KnlN5o4k=;
 h=From:To:Subject:Date:From;
 b=Td+dVduNKsn3/xRAM9Tl0O+ou87G2BpjYdwC6sfqTMNGnMG9/QpYx2H7/R+6aiBB4
 8MiC09TKXNBpn3No5WVkT7s0nwNMplX/wk1NTpDZgQrD5vbtdQEDxJwhBf1t3JL7Od
 nq1tLv4Mx+WBTOusCNnvqcRG3jC1Yd7yWkKLEqYGlAGOdnw+PmdbKBhkXGmA/necHi
 nyCaLQ7UDV9WnV0Q2g+tVm4S5x+VgdSqExO7RlsnivsuRWje8IYx97JcngyxLgn/G3
 i8OXdQyG7l7s7Oy7+vvOVPDh0fTzKWQQBZGP5QzA4poSScCrjqPgJENK/r62NmCBUZ
 PAxtP0G2EgzOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0F53AC41613; Fri, 20 Feb 2026 21:37:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221110] New: amdgpu DM skips backlight registration on ASUS TUF
 A14 (DCN 3.5) due to ATPX detection regardless of active GPU mode
Date: Fri, 20 Feb 2026 21:37:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: maurotibanez@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221110-2300@https.bugzilla.kernel.org/>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NO_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[osdl.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-0.986];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 801F616B064
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221110

            Bug ID: 221110
           Summary: amdgpu DM skips backlight registration on ASUS TUF A14
                    (DCN 3.5) due to ATPX detection regardless of active
                    GPU mode
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: maurotibanez@gmail.com
        Regression: No

Hardware:

Laptop: ASUS TUF A14
Panel: BOE NE140QDM-NX7
iGPU: AMD (DCN 3.5)
dGPU: NVIDIA (disabled via vga_switcheroo / supergfxctl, Integrated mode
active)
Kernel: 6.17.9-76061709-generic

Problem:
No backlight device is registered in /sys/class/backlight/ when booting in
Integrated GPU mode. Brightness control is completely non-functional.
Kernel log showing root cause:

[3.831962] amdgpu: vga_switcheroo: detected switching method
\_SB_.PCI0.GPPA.VGA_.ATPX handle
[3.832035] amdgpu: ATPX version 1, functions 0x00000801
[3.832077] amdgpu: ATPX Hybrid Graphics
[4.320982] amdgpu 0000:65:00.0: amdgpu: [drm] Skipping amdgpu DM backlight
registration

The amdgpu driver detects ATPX at 3.83s and skips backlight registration at
4.32s. The skip occurs unconditionally based on ATPX presence, without chec=
king
whether vga_switcheroo has actually handed display control to the iGPU. Whe=
n in
Integrated mode, amdgpu owns the display pipeline (DCN 3.5 active, eDP-1
connected to card0) but does not register a backlight device.
Confirmed not caused by:

asus_wmi / asus-nb-wmi (loads at 6.08s, after the skip at 4.32s)
Missing ACPI backlight method (DSDT contains no backlight method)
Panel quirk (BOE NE140QDM-NX7 has no known quirk entry)

Kernel parameters tested with no effect:

amdgpu.backlight=3D0 / amdgpu.backlight=3D1
acpi_backlight=3Dnative
acpi_backlight=3Dvideo
acpi_backlight=3Dvendor

ATPX functions value: 0x00000801
Expected behavior:
When vga_switcheroo/supergfxctl has placed the system in Integrated mode and
the AMD iGPU owns the display pipeline, amdgpu DM should register a backlig=
ht
device normally regardless of ATPX presence.
Additional info:

/proc/acpi/video/ does not exist
card0-eDP-1 is the active internal panel path
NVIDIA modules are fully unloaded in Integrated mode
supergfxctl -g confirms Integrated

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
