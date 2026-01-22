Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oIvkHJiocmnaoQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 23:45:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E99F36E448
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 23:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AC610EB65;
	Thu, 22 Jan 2026 22:45:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JpvlS44O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7048D10EB64
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 22:45:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8CF3F6001A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 22:45:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 433FAC116D0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 22:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769121940;
 bh=5EPnoz76tAypOriSjMofET0xX3pckgcdTGFq+M8AIhc=;
 h=From:To:Subject:Date:From;
 b=JpvlS44OBfv+KNYxXjmKm5yIVc9u74V12ZA7qJbmD/UnA4N8g+xZM4O+a2fIjm875
 ZIChgsSD/36/k6KMDg9iVG2tEZ3edsjkPDl91KwW5Ok2R64GL1+1dlJPrc4YDtiXhm
 mY1PRLy09Qong7SvdbXvtz2Y26hLp+EjDmLdNk9CePc8uZm8/KMd71smAQkfWN+3EE
 STLSLM122e9LoKn5AzmSYvr8FymF2ODXr9fyPLj4f/LaXuCdYNmaOvpB0jRsvcImsT
 UzAcLcHUHEhTPdkloR7mVJRF6lmBFEJpINJ5fzNnoRIJmQboCRKiSN+A5y0VeYql+5
 s1xZEkCpm9B1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3B0F5C433E1; Thu, 22 Jan 2026 22:45:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221004] New: After some hours FPS drop to half while gaming
 using amdgpu driver with wayland
Date: Thu, 22 Jan 2026 22:45:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: quanticcpu2100@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221004-2300@https.bugzilla.kernel.org/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	NEURAL_HAM(-0.00)[-0.994];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: E99F36E448
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221004

            Bug ID: 221004
           Summary: After some hours FPS drop to half while gaming using
                    amdgpu driver with wayland
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: quanticcpu2100@gmail.com
        Regression: No

For some reason, in the Wayland session, after a few hours, the frame rate
drops by half in all games using the amdgpu driver. It seems that after pla=
ying
for a long time, the amdgpu driver changes the GPU clock to the minimum
profile, and the memory goes into idle or has a low clock speed. I ran the
command below now when the problem is occurring during the game to help pro=
vide
some information related to the problem.

---

$ sudo cat /sys/kernel/debug/dri/0/amdgpu_pm_info

GFX Clocks and Power:
        96 MHz (MCLK)
        0 MHz (SCLK)
        1825 MHz (PSTATE_SCLK)
        1000 MHz (PSTATE_MCLK)
        6 mV (VDDGFX)
        13.00 W (average SoC)

GPU Temperature: 31 C
GPU Load: 0 %
MEM Load: 5 %

SMC Feature Mask: 0x00003342a36b6df9
VCN: Powered down

Clock Gating Flags Mask: 0xb8198a0d
        Graphics Fine Grain Clock Gating: On
        Graphics Medium Grain Clock Gating: On
        Graphics Medium Grain memory Light Sleep: Off
        Graphics Coarse Grain Clock Gating: On
        Graphics Coarse Grain memory Light Sleep: On
        Graphics Coarse Grain Tree Shader Clock Gating: Off
        Graphics Coarse Grain Tree Shader Light Sleep: Off
        Graphics Command Processor Light Sleep: Off
        Graphics Run List Controller Light Sleep: Off
        Graphics 3D Coarse Grain Clock Gating: On
        Graphics 3D Coarse Grain memory Light Sleep: Off
        Memory Controller Light Sleep: Off
        Memory Controller Medium Grain Clock Gating: On
        System Direct Memory Access Light Sleep: Off
        System Direct Memory Access Medium Grain Clock Gating: On
        Bus Interface Medium Grain Clock Gating: On
        Bus Interface Light Sleep: Off
        Unified Video Decoder Medium Grain Clock Gating: Off
        Video Compression Engine Medium Grain Clock Gating: Off
        Host Data Path Light Sleep: On
        Host Data Path Medium Grain Clock Gating: On
        Digital Right Management Medium Grain Clock Gating: Off
        Digital Right Management Light Sleep: Off
        Rom Medium Grain Clock Gating: Off
        Data Fabric Medium Grain Clock Gating: Off
        VCN Medium Grain Clock Gating: Off
        Host Data Path Deep Sleep: Off
        Host Data Path Shutdown: Off
        Interrupt Handler Clock Gating: On
        JPEG Medium Grain Clock Gating: Off
        Repeater Fine Grain Clock Gating: Off
        Perfmon Clock Gating: Off
        Address Translation Hub Medium Grain Clock Gating: On
        Address Translation Hub Light Sleep: On

---

Operating System: Fedora 43
KDE Plasma Version: 6.5.5
KDE Frameworks Version: 6.22.0
Qt Version: 6.10.1
Kernel Version: 6.18.6_tkg_eevdf (64-bit)
Graphics Platform: Wayland
Processors: 16 =C3=97 AMD Ryzen 7 5700X 8-Core Processor
Memory: 32 GiB of RAM (31,3 GiB usable)
Graphics Processor: AMD Radeon RX 6800 XT
Manufacturer: ASUS

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
