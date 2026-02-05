Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGQXF/ZfhGng2gMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:16:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D25AEF076A
	for <lists+dri-devel@lfdr.de>; Thu, 05 Feb 2026 10:16:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AED10E817;
	Thu,  5 Feb 2026 09:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="f31A4fYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9604410E817
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:16:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5F398408C7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F92BC4CEF7
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Feb 2026 09:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770282995;
 bh=NM/WqUB8INSg5osvs87Ir+L3QnpraoctJJDAIazbwoY=;
 h=From:To:Subject:Date:From;
 b=f31A4fYqOLUchLLzqfM9/2d3TqtQaXcLflLP+P409MjZdtcUfdJ6Z7zi7AuspQQmA
 U0I1as26teRJ226h/ywGkwCXgyU3q9f+TflPA7AUtdikEbF3Tn90erKeZTvbMDKDFA
 pretq+Rp+6xGmN/NZmSjqmruxCEimJ/yhxbZ5kRoahIQlxyRP42PyCk4BaI29xv41D
 RAk0F6Q2Hll+jZto3KxzPKnDyQIW9ctpZ1oB8IuYeOYvOQhrgQ0Ty21oHb2WqYlU98
 yjjxbiit5wYl/UqVzGcibOQpAa8s5ErLlE+ilLwjtD12afHPQx8082RmU/XmBGdmvG
 EwkYpJA2OnK9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 31D1DC4160E; Thu,  5 Feb 2026 09:16:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMjEwNTFdIE5ldzogbW9kcHJvYmUgLXIgYW1kZ3B1IA==?=
 =?UTF-8?B?57O757uf5bSp5rqD?=
Date: Thu, 05 Feb 2026 09:16:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: onmyway123890@163.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-221051-2300@https.bugzilla.kernel.org/>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FROM_NO_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bugzilla-daemon@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[dri-devel];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCPT_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: D25AEF076A
X-Rspamd-Action: no action

https://bugzilla.kernel.org/show_bug.cgi?id=3D221051

            Bug ID: 221051
           Summary: modprobe -r amdgpu =E7=B3=BB=E7=BB=9F=E5=B4=A9=E6=BA=83
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: onmyway123890@163.com
        Regression: No

https://github.com/torvalds/linux/commit/28695ca09d326461f8078332aa01db5169=
83e8a2
=E9=94=90=E9=BE=99r5 5600=EF=BC=8CAMD Radeon RX 6750 GRE 10GB
=E8=BF=99=E4=B8=AA=E6=8F=90=E4=BA=A4=E6=9C=89=E9=97=AE=E9=A2=98
=E5=8D=B8=E8=BD=BDamdgpu=E5=90=8E=EF=BC=8C=E4=BC=9A=E6=AD=BB=E6=9C=BA=E9=87=
=8D=E5=90=AF=EF=BC=8C=E8=AE=A9=E6=88=91=E7=8E=A9=E4=B8=8D=E4=BA=86pci=E7=9B=
=B4=E9=80=9A=E4=BA=86=F0=9F=98=AD
=E6=8A=A5=E9=94=99=E6=98=AF=EF=BC=9A
[ 0.600081] mce: [Hardware Error]: Machine check events logged
[ 0.600082] [Hardware Error]: System Fatal error.
[ 0.600093] [Hardware Error]: CPU:4 (19:21:2)
MC5_STATUS[-|UE|MiscV|AddrV|PCC|TCC|SyndV|-|-|-]: 0xbea0000001000108
[ 0.600116] [Hardware Error]: Error Addr: 0x01ffffffc100201c
[ 0.600126] [Hardware Error]: IPID: 0x000500b000000000, Syndrome:
0x000000004d000000
[ 0.600145] [Hardware Error]: Execution Unit Ext. Error Code: 0
[ 0.600146] [Hardware Error]: cache level: RESV, tx: GEN, mem-tx: GEN

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
