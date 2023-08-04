Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669B4770AB7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 23:19:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6955910E131;
	Fri,  4 Aug 2023 21:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C379810E131
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 21:19:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 420B9620DD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 21:19:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4F1AC433C7
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 21:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691183981;
 bh=9kcyGb0opwjjWPgFmiCt/UjhKhZdRZyQBgQjnp7THVE=;
 h=From:To:Subject:Date:From;
 b=TOnc3b2ZVYgvXvb2+WekCp8ivNiqAuftW2BdNZgCWLpQECm/ymndS6+/3Q3SyqhXX
 AEq09Fxn5Zfa7zzDfu94mIkWU83sa4FkmUW9k3vEjdw4PfVrLv7BXozNlVkwknwWsj
 0ulFOht0IXm1g1bv6orpdMvpFu9d10rhodgCX8TVLS4zSZ/SZ/dNuGaDIuUFuKzeto
 eqHd54/2lcm0/f6kdNNdgSdm6VWrkoGebuoAtBQ3HrlYnpg1lapbt86M3QIa0mpU6F
 O4u86Ye/YFCeuvag1qAswSuHEr0PJx4hRUPfDHha5KIXuSfcsG2lDUB7OmvdS81W71
 cUUO/DX2kvqwQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8657AC53BD0; Fri,  4 Aug 2023 21:19:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217764] New: nouveau: system hangs when changing pstate on
 GeForce GT 320M (NVAF (MCP89))
Date: Fri, 04 Aug 2023 21:19:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dswdev@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217764-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217764

            Bug ID: 217764
           Summary: nouveau: system hangs when changing pstate on GeForce
                    GT 320M (NVAF (MCP89))
           Product: Drivers
           Version: 2.5
          Hardware: i386
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: dswdev@outlook.com
        Regression: No

Created attachment 304780
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304780&action=3Dedit
Crash log

System hangs after pstate is changed with /sys/kernel/debug/dri/0/pstate
interface to any option (like 0f). It hangs sometimes right after changing,=
 and
sometimes after few moments. According to kernel log it seems it attempts to
divide by zero for some reason in gt215_clk_info
(drivers/gpu/drm/nouveau/nvkm/subdev/clk/gt215.c) and fails with divide by =
zero
interrupt which causes system to hang. It happens on MacbookPro7,1 (Macbook=
 Pro
13 inch Mid 2010) with NVIDIA GeForce GT 320M on Fedora 38 with Linux versi=
on
6.4.7-200.fc38.x86_64.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
