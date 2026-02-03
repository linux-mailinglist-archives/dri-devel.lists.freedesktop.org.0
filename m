Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCzqHV5TgmliSQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 20:58:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E532CDE4DE
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 20:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C26E10E117;
	Tue,  3 Feb 2026 19:58:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="eKnvoxZR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F89010E117
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 19:58:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D83AA40473
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 19:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7291C19422
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 19:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770148697;
 bh=MGGPOcGu2H69Hhnsmk0DWQNmHCdwUTlGvXKJ7ljtST0=;
 h=From:To:Subject:Date:From;
 b=eKnvoxZRO/V6HKPEdIPWigHC7glLrHwYtMkTj3CZ/n3wQ+5y+K6Rd3h4R0RanJOOf
 H5QNcUuONfLdlb3qEPK4kMaQWO8BYpO/MD1ZPJZ+JSpG7he9tPbW8YWXLQtKlMwY1T
 iGLHF09S72eoMSVmbTHY7ii+cpLFDaHFxcP78FXeGLQJno9w1Oae24+mBlNyyhUFfA
 QbcWmTyZT1kOGUp75rwGh/SXMwb0Fq60+NV9u3uSH6WEsqBwCKtXLfpWlP1YkOaUTT
 1kKiwXV5uE61ERgXq4QwEwXi2PnmAbKgcfr1ISUywwZPw4gtbAZmI5w29ijzUxXzMn
 m5eYXxvaevGNA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AB07DC4160E; Tue,  3 Feb 2026 19:58:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 221040] New: AMD Ryzen 5700G (Renoir/Cezanne): Second suspend
 hangs after "PM: suspend entry (deep)" - xhci_hcd and asus_wmi LPS0
 involvement
Date: Tue, 03 Feb 2026 19:58:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: s93nesua@bote.unbox.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-221040-2300@https.bugzilla.kernel.org/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[unbox.at:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,osdl.org:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: E532CDE4DE
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221040

            Bug ID: 221040
           Summary: AMD Ryzen 5700G (Renoir/Cezanne): Second suspend hangs
                    after "PM: suspend entry (deep)" - xhci_hcd and
                    asus_wmi LPS0 involvement
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: s93nesua@bote.unbox.at
        Regression: No

Created attachment 309304
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D309304&action=3Dedit
after-resume-1_with-612-kernel.log  +
after-failed-second-suspend_with-612-kernel.log +
suspend-log-0x1C_with-618-kernel.txt

=3D=3D=3D=3D=3D=3D=3D=3D=3D System =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=20

- CPU: AMD Ryzen 7 5700G (Renoir APU)
- Motherboard: ASUS ROG STRIX B450-I (BIOS 5901)
- OS: EndeavourOS (Arch-based)
- Kernel: 6.12.63-1-lts
- Mesa: 25.3.4
- Display: Wayland (GNOME Shell 49.3)

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Bug =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D

First suspend/resume cycle works correctly. Second suspend hangs with cursor
update failures. PC fan keeps running.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Logs in Attachement =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- after-resume-1_with-612-kernel.log=20
- after-failed-second-suspend_with-612-kernel.log=20
- suspend-log-0x1C_with-618-kernel.txt

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Key Errors =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D

- xhci_hcd 0000:01:00.0: xHC error in resume, USBSTS 0x401, Reinit
- gnome-shell: Cursor update failed: drmModeAtomicCommit: Invalid argument
- System hangs at "Performing sleep operation 'suspend'"=C2=A0

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Update =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Testing with Kernel 6.18 shows:
- New error: "asus_wmi: failed to register LPS0 sleep handler" (not present=
 in
6.12 LTS)
- amdgpu.dcfeaturemask=3D0x1C fixes cursor errors in 6.12 LTS but has NO ef=
fect
in 6.18
- Suspect: ASUS board-specific LPS0 handler failure interferes with suspend
- Hardware: ASUS ROG STRIX B450-I GAMING (BIOS 5901)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
