Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD3781A132
	for <lists+dri-devel@lfdr.de>; Wed, 20 Dec 2023 15:35:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E925D10E22E;
	Wed, 20 Dec 2023 14:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFB7410E22E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:35:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0F9F96154C
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:35:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7DDDCC433C9
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Dec 2023 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703082928;
 bh=T3cm7o7Cw57X0kj3DB+UBPpeqX6EOH2vZNE/byI/40I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ux5N5zrm58MO43D+d3Yt5jxHlxPdQjNHSeCOHp++w3gac1VntvC0XAVhlKSO7t4UR
 Hg+cC1yQ7p/6Z7jfr/o5szN4HFO2mPS7xWl1ChPRGgJvshZOf2HeN1lrrjI4ptf3q9
 FI0m0wf3DtWUNkvbghUbsC3Gn1+emN035Z2jO3ZBukvCQaVPwpslg3uizvH8oOMIUt
 mhQXG+KFqi4YYpe7avVABahDemWdx7sfKIL4A1Q9nvp8QcEoLUsihgvsQKNm26orRO
 is2pOQlsHGZeRjZaVV8Q28JmtOmmrDs0i3o65DJnf8zbE3FQw9RmM4sK8rzAi88AjF
 qf3f2w+kDoOyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 699F1C53BD0; Wed, 20 Dec 2023 14:35:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218292] Built in Screen (Laptop) won't wake up from sleep (AMD
 Graphics)
Date: Wed, 20 Dec 2023 14:35:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mail@bewi.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218292-2300-PbJk2WMumR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218292-2300@https.bugzilla.kernel.org/>
References: <bug-218292-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218292

--- Comment #2 from mail@bewi.at ---
Created attachment 305634
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305634&action=3Dedit
dmesg6.1.x_working

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
