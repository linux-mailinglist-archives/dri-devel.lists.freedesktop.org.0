Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A28D48F1B2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 21:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5905310E143;
	Fri, 14 Jan 2022 20:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC52F10E143
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 20:52:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5D2DD61F5C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 20:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFFABC36AEC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 20:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642193525;
 bh=qsSEX7dDeo2BUVmksQmP/GgtlFx82VaHcJ23wS/wwOo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tXBGPRvxK5yLHmY/7no3fT6NQQY6Cf1yuLeqYyRcaTRpgcXdCxX6Mtn42BFQxEbHF
 Hvg4RT86PTCg8HZYPWdIQJiH/mtZ40j1eTs8O0JsnNNs9iWVuNDAlIUXI4/lfxy43N
 iD5a/naPeXsO8gRQuxA6VHXJCG8MY3fvfWHs2Hw/jJ+w4j4iGDROJDtTXvRkaeRSt2
 f30foUlJaAFjTG7uuspw4U8Nh4VtXAsMKVN1roafGz9LnEW1blIWYbTcOkJTuIy7L3
 W4eDuRu+abe/4xGRO2Lmn60btGSmFEMzpwn/G9MBMGEiqRi3V7UpbkltqPlzVjTvZA
 iqwljkgG2IQUg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9F85DCC13AF; Fri, 14 Jan 2022 20:52:05 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215494] [radeon, rv370] Running piglit
 shaders@glsl-vs-raytrace-bug26691 test causes hard lockup & reboot
Date: Fri, 14 Jan 2022 20:52:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215494-2300-rKRwTPfIcM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215494-2300@https.bugzilla.kernel.org/>
References: <bug-215494-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215494

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Done. It's https://gitlab.freedesktop.org/mesa/mesa/-/issues/5870 now.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
