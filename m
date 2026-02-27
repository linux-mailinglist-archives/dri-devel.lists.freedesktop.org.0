Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sAfHMNn9oGmqowQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 03:13:45 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 504D81B1E79
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 03:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A79710EA1A;
	Fri, 27 Feb 2026 02:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LmVFyneK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C75D110EA1A
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 02:13:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C9BEA60054
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 02:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B7E1C116C6
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 02:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772158419;
 bh=/PjgGjvbJ7eeYTLnq27GN6RMDJXtgk6+5AHNmJDjCJ0=;
 h=From:To:Subject:Date:From;
 b=LmVFyneK6u8EmzGpbTS6HTTDO1b0Lwh0/vAA2oeyDBLZcfqr2b2ODgo+OYhWPh9ku
 AF1URF1mBnqFAm59zZa7lSpgJecPgXo0L/WC/8xJJj7NcVXakoL6Dnv9gQ3Frjekhs
 IqnOe81DkNwa1fcj2FAZjbeYCUuBueITMxkTAbqjtht4NWqgkRwflWiIPnZNvhyHKt
 FHLABPwMC8q/4IlTeVmJRoV6Eq1j4jUtAgFBJgwv+sSN60kt/mcyQm65iBgW4wTQjW
 PSVjUSv7xTcbNXdb7rsneF5Fl9D1NObG9vA8L5oXm89Mo07YVy2/Me7IBy22A58o84
 9R9plBwBMEfhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6AF30C41612; Fri, 27 Feb 2026 02:13:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221148] New: Regression: Screen tearing on AMD RX 6800 with
 amdgpu on Linux 6.19.x (works fine on 6.18.9)
Date: Fri, 27 Feb 2026 02:13:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: f@6610199.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221148-2300@https.bugzilla.kernel.org/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,6610199.xyz:email,osdl.org:email];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 504D81B1E79
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221148

            Bug ID: 221148
           Summary: Regression: Screen tearing on AMD RX 6800 with amdgpu
                    on Linux 6.19.x (works fine on 6.18.9)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: f@6610199.xyz
        Regression: No

**Kernel Versions Tested**

Good: linux-6.18.9 (no tearing)
Bad: linux-6.19.1 ~ linux-6.19.4 (visible tearing in 3D games)


**Hardware**

GPU: AMD Radeon RX 6800
Driver: amdgpu
Display: 1920x1080@75Hz
Connection: DisplayPort


**Software Environment**

- Session: X11 only
- Desktop: XFCE 4 (started via startx, no display manager)
- Game example: Nioh 3 (via Steam Proton)


**Symptom**

After upgrading from 6.18.9 to any 6.19.x release, obvious screen tearing
appears in 3D games (classic vsync-off appearance).=20=20
The tearing is most noticeable when the viewport moves vertically (e.g. loo=
king
up/down in-game).


**Reproduction Steps**
1. Boot with Linux 6.19.4 (or any 6.19.x)
2. Start X11 session (XFCE via startx)
3. Launch Nioh 3 via Steam Proton (default settings with VSync OFF or ON)
4. Move the camera/viewport vertically =E2=86=92 observe horizontal tearing=
 lines


**Workaround that eliminates the tearing**

Create or edit:
/etc/X11/xorg.conf.d/20-amdgpu.conf

```
Section "Device"
    Identifier "AMD Graphics"
    Driver "amdgpu"
    Option "TearFree" "true"
EndSection
```
However, it introduces a small performance overhead or input latency.
On 6.18.9, no such configuration was needed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
