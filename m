Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9026655BDE0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 05:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D135C10ECF7;
	Tue, 28 Jun 2022 03:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFFE10ECF7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:39:22 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A47D6B81C00
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:39:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7160AC341CB
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 03:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656387560;
 bh=vw5MBzYrOCx87n83SZVdyV/PGE3XV3EsJt3/Ahfq8kc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LWcfxttvYBiXQPPLDfCEO3jU2p3icwj56SgQyb4dSYyWkqvouULeYoNltlakgy3EV
 aWEs9UV/+YVwmUlkqvFydnQIHK5y2QrALtrbpiyQNAgFQFSH8nmY3GLwH7fj50jeiL
 nyh8wGEl5uyndVHVMCzxz3W2zy3cv7otr6ZG3xNbO80G17sH4V17YFil1O6LcltOdk
 5rruER8+IZJo5Gh7uyt+X+Md0DGSELMFS18U0R1ls0dMn1hhQF7X9hXJg2z4oEUpz5
 j+6eqemWLi+27Hm85boL6v35K+vZA0jaQ2FvIXQ/hh+2076sr6/2Y2AmQDJr0ltz9v
 AeHeFPDqiLanA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5C21DCC13B1; Tue, 28 Jun 2022 03:39:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216175] PowerColor Radeon Rx 6400 ITX does not work.
Date: Tue, 28 Jun 2022 03:39:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: nobutarounosuke@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216175-2300-3nWNxEnFoQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216175-2300@https.bugzilla.kernel.org/>
References: <bug-216175-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216175

--- Comment #6 from Nobiuki (nobutarounosuke@gmail.com) ---
Created attachment 301293
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301293&action=3Dedit
journal with rx6400 and amdgpu.runpm=3D0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
