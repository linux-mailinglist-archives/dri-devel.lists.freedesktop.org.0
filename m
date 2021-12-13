Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B58EC472B3C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 12:23:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38DB689CD8;
	Mon, 13 Dec 2021 11:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBFBF89CD8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 11:23:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4CA71CE100E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 11:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A384C34607
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 11:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639394612;
 bh=fzKUyd7QAUd7ifa5UGoPoKsYW6+J01QpFB/J0VbcwEs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cflPvX2t2wRCjREZndWp8ROJ4TPtpD/6aM20k/60T/nt7WrqmPT6cNKT1PAfy6wsb
 7M9+rWs5o0uw54OXqZ4dkuSqPg4fWogyG8aVhDB2WzH6XgyCNQjeGiUuxMmcKOkWQ3
 kdsN3lR2HjV0f+mPP58ISua+r3CUwEQX4JLnvN5Kfc/js3x5Etmkp5sZ6AXlafSANb
 2j5IB6GV3LXLwh4Dmg/8XkH/l9377NsMOe3Kf4O+y+nVvQYAIOy4CWR5Khwi4G+Loh
 zKmQdBoU8Xj7SNe0V8Ylae0NO9mQ7OGB0iCE50zAiOFmn+h4kcN3Rji7n5NdYDqkj4
 SdLK/gYujmAtw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 560AD61104; Mon, 13 Dec 2021 11:23:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Mon, 13 Dec 2021 11:23:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: kernelorg@iopsthecloud.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211807-2300-AT4x5LBSHY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

--- Comment #19 from Renaud R. (kernelorg@iopsthecloud.com) ---
(In reply to Renaud R. from comment #18)
> My setup:
> * Latitude E5570 via dock DisplayPort
> * Kernel: https://bugzilla.kernel.org


Kernel: 5.15.7-051507-generic #202112080459 SMP

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
