Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F9560D101
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 17:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C965C10E3E3;
	Tue, 25 Oct 2022 15:52:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B2F10E3E3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 15:52:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9BFEF61A0C
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 15:52:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0C943C43141
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Oct 2022 15:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666713140;
 bh=H0Wo9JyWN+PabioAIxXtpiREJvBBq28o4v0YBbnWb8w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PDl9byCRZMRC8hM7pfQhHFcSADOvT1FgHQKCjsBdSe/fsTzvqicqRjF5dceg+fEqz
 7vswjxgqn0H5ygUZZpi4So2HYMUE28PQWpQd0Qa+BbKI8v8R4suoCoPhmnN/Z/QFKL
 AGPibaulC+JdBOAgLoYysIi127Dytb7CqY5To1A34UMg3GtKzZVa6LCCmtdpnv69H2
 GiXy5A+g12Q8obmFDNqpSuxCwNNXvqhBYv3rRGPk7EwxUUYlKQJFaNNcoqjj4hF/uz
 pj6jaJls6Jf9m1izywV1IRuCebRSHB9v4j+6CxUYJNKIgbqtKU8J7XX2CUcXJajhY5
 6HBVKVXvC/t6w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EB1B1C433E7; Tue, 25 Oct 2022 15:52:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216625] [regression] GPU lockup on Radeon R7 Kaveri
Date: Tue, 25 Oct 2022 15:52:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-bugzilla@ossman.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_tree
Message-ID: <bug-216625-2300-qR0qalrYpZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216625-2300@https.bugzilla.kernel.org/>
References: <bug-216625-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216625

Pierre Ossman (pierre-bugzilla@ossman.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
               Tree|Mainline                    |Fedora

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
