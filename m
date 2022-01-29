Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F684A31B5
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jan 2022 20:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D8610E155;
	Sat, 29 Jan 2022 19:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384DA10E17A
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 19:55:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 097E8B827EE
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 19:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24BC8C340EE
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jan 2022 19:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643486113;
 bh=+n20ci1NDxkh1BqA6cATL4Quk9XlVf1O3wPcLW5+veo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Yk3C2LgU1ZNIPY+jGh3XLKosGHCUeutlGvUg0yBsq8I+4iqPjL0JlUbPr+n75b/dK
 TY606WXTIa9QI2ZQQOe44sdDfF7v9N07DNDzvrO94p+x8bYtpt51J8BZMXksdVyQrj
 bv7PAjSFI7zwkXpZm4Eko3hYpjCug3AfLLfFPYpw6LaCttmfRjCARq13upTGNCIiiR
 Kp2DOkaG30ht4PDAly39ta342eKCbkCzzT5oRypezsepjeANucmf8DfiEHMShrkMmM
 ROgl4WIRnyapxQid8pU2nLNPsEuO5ddwUGSmC7z6YvNBUg7ZTIQW4vdoGfq80jSxyb
 xIHK1eCpzn0ZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 14C01C05FD5; Sat, 29 Jan 2022 19:55:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204611] amdgpu error scheduling IBs when waking from sleep
Date: Sat, 29 Jan 2022 19:55:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tones111@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204611-2300-zz716rav07@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204611-2300@https.bugzilla.kernel.org/>
References: <bug-204611-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D204611

--- Comment #12 from tones111@hotmail.com ---
I haven't seen problems resuming from sleep in some time.  Is anyone still
experiencing this problem on newer kernels?  If not then I'd like to propose
this issue be marked as resolved.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
