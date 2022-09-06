Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE105AF0C0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 18:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC53210E089;
	Tue,  6 Sep 2022 16:44:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5191910E089
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:44:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D6613B81920
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90C23C433D7
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 16:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662482644;
 bh=MfhF4gXzwHrwks805vyKoJqATT2m3sp/ltDmaAAOmqA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=UU98L8gLSSmEWd+HtCKaiGAFT6ff8UJX59egXzl2sTQzfxG7pUJtWf/uch3+f0LA2
 VuOlK/FxWw5sz73oQC2molQ2O0J62/gGmyUM9VsOPiHJEi2mXJaoPdId+AG+QOFnaQ
 hHmhlIa3cKfKBWtOMXKdmvCBT6fBtisqaDWa8s1aVU1P8PweU6Nw3PdT1V4oFPERi9
 pBtphLEYKVOLpQImY+OFQHaPo5oybRuCN3pVR6PDuORkZtxmt/Yul2Zl6miRSA30eI
 ydm+hf8s9HMUdssidq/emO37uD7IaE9OxZWgL0ORmoZakLFpEPrJBtDcrxnU8aDvd1
 axhboIPK6wT8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7E5C2C433E6; Tue,  6 Sep 2022 16:44:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216455] PCI AER error caused by LTR enablement on amdgpu with
 LTR disabled on video card PCIe bridge
Date: Tue, 06 Sep 2022 16:44:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wielkiegie@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216455-2300-tnvXRQST1L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216455-2300@https.bugzilla.kernel.org/>
References: <bug-216455-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216455

--- Comment #2 from Gustaw Smolarczyk (wielkiegie@gmail.com) ---
Hardware:
CPU: Ryzen Threadripper 1950X
MB: Asrock X399 Taichi
GPU: Radeon Vega 64 [1002:687f]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
