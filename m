Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44A5B0426
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 14:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3FD10E74C;
	Wed,  7 Sep 2022 12:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5E2110E74C
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 12:45:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E43DDB81CD6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 12:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CD89C433D6
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 12:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662554731;
 bh=jXX2szvBf27NJAl3TJty1ZT2t9/nXJ4tQMIRoHd33yw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MfiZ6qIgT25RlA0zbUI+ggXI3H/D78nsYJZ2n5fHhZzOGp6hXoFC0iDeAwUri3RRx
 3ULEgzRwFaMsYLWxKTOiXln+zhK9fsKQVOUbtFm0mL1DIEgyT4Tn+A9i5r1vjtMLpH
 7bol7kLHwzTLMcTy7u4YugBfFYnr3dvoP8PZIYVocVPiZqpKKSUKZqhViduHGgM0ZH
 HbyUJlbtCctJwhdMsyqG2eTEsda7c5owEr2EIkH7ejDZDvsnmbiCijm9IyQC4ErCt5
 E+rE3GT2UjsJmXgPwxP92s95BFwNIc6d4QOSZ4J3maWyfN86QDLpcylL88XUxbLfD4
 E2jPhKojVgoUA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7157DC433E7; Wed,  7 Sep 2022 12:45:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216455] PCI AER error caused by LTR enablement on amdgpu with
 LTR disabled on video card PCIe bridge
Date: Wed, 07 Sep 2022 12:45:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lijo.lazar@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216455-2300-7lIcPYlYvZ@https.bugzilla.kernel.org/>
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

--- Comment #3 from Lijo Lazar (lijo.lazar@gmail.com) ---
Created attachment 301760
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301760&action=3Dedit
LTR Fix

Does the attached patch help?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
