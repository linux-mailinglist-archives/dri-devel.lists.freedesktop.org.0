Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38F8598AF4
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 20:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91EB710E2DC;
	Thu, 18 Aug 2022 18:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0AAE10E7C7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:16:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11C9A61535
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:16:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70F61C433D7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660846592;
 bh=N7cFxQDvDh6lIpf34deIsZ9E4mtmrvx91Z49TB7nDAk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=I5NLdCwLkfiPs2MXtQETTvh5nbx/jZv13UEQ7XUkskPFOnXlajsSHdFOLuLsCOf/w
 Nm3XBPgaIskHH7w83TjT+boz20xCx6ZZ+Q/SwbJf2kwMbmz5CbP7ogKC/Dl/htec2T
 tbKEeTl3Rh+Kj+rwEfDRsojqv/mDJJaA04F7UrUw6v7Q1UufrIh7urbkiFFL2Dn93U
 /f4JxYH/nK3hytelaqkmCtFNIhE7TUwoIHwXYQXog95VpTIGPzahCJJjQX7daUgDF8
 AOflobH6GuMW6F7kB1SoesUuw58FGr7fCaZ7ROEmgMfGghEtkyWAW2CVqctyMZjfHK
 6PmsHyNkOSwbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6149BC433E6; Thu, 18 Aug 2022 18:16:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216376] AMDGPU: display output disables and quickly reenables
 when switching AVR into/from standby doing HDMI passthrough
Date: Thu, 18 Aug 2022 18:16:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: jlp.bugs@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216376-2300-IEIjL2Hc2E@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216376-2300@https.bugzilla.kernel.org/>
References: <bug-216376-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216376

--- Comment #2 from Jure Repinc (jlp.bugs@gmail.com) ---
Created attachment 301602
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301602&action=3Dedit
lspci

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
