Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2708F6449AE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 17:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8450310E334;
	Tue,  6 Dec 2022 16:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7958310E334
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:48:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 01B2DB81ABD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:48:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98D43C433C1
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Dec 2022 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670345286;
 bh=qhXoDN0SNFzoWswUbNbnya/SW/E/CKt3vG86o9m2vMw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=skAxAGGAJ5L3MRRZo8Bk9g4k9CJFLLGi1XSlMb9xD+YCW40VC37UZIX6B3eLEdiOU
 FmSTG+yF638vsst77gnYXiTKpGuEnoCLyf8a2BHKLZeilwui389PWDqB8aBIoRUmK9
 ABMs0undJFOa85NM93b8irG6e7VDGd2XtkgXGjSQNy6X+9k4CtshlKr1RuaZ8qWam2
 KzCinxkLopA0Izw4mtJ0Y+Q4nPVe9nvdAu2VUy4h0LHOT08t1ZAk8wnsZawJG0jPk8
 B4k0rf5GP+ckCgLLDIWccwo23O2OOUffP5uUfbKB8U9Z9Gxsx1N/CtiYUTDIDleyiv
 UggyU4qol2kVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8B019C433E7; Tue,  6 Dec 2022 16:48:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216780] problem of Mesa drawing boxes after resume from suspend
 with Geforce4 420 Go
Date: Tue, 06 Dec 2022 16:48:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: estellnb@elstel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216780-2300-b3MRKLebgC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216780-2300@https.bugzilla.kernel.org/>
References: <bug-216780-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216780

--- Comment #3 from Elmar Stellnberger (estellnb@elstel.org) ---
Created attachment 303371
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303371&action=3Dedit
before resume from s2ram: background box of login screen is drawn correctly

just tested:: same issue with suspend to disk

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
