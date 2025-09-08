Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8321CB49DA4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 01:53:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D617510E21C;
	Mon,  8 Sep 2025 23:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PIjEy3RA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09FB10E21C
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 23:53:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8CF5A60051
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 23:53:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C5BCC4CEF1
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Sep 2025 23:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757375625;
 bh=lC3v8KqwbTLPLqJ85RC4icC5Ku0625cY1IaPDPssoUk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=PIjEy3RAzmfMWHD1JIPu+AIgttZ3iBuoXfgKZIYDk6MK/CACIxsrqI2MxsOze9iPm
 j85siriNt2udMiENXoZ5oaSAQQzBQ0Ij+E3TkAkW29REvgyfOjmqnoTmctzQzX38R9
 VrLNH5awnie20WLefRrcUTgcXys/lWeS9NhsWFK0WIeBsT6Ka+F82967GgaUWrEQS0
 2XgJqpHEa5e+D1ZPQv5fAZRT4ri0R7dXXLmxudBJ2tkF1f2eCjm/J6JHW9gjFXqYFn
 YIxrnF0UiPQpObelOTeFp+pD75BwWFKqZmDVKsATQU79gOb6FENDhuD8pWhpsxWo3Q
 F3sQtGoRDDJOg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 344C9C41613; Mon,  8 Sep 2025 23:53:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220554] Display powers off after every update.
Date: Mon, 08 Sep 2025 23:53:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vicencb@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version cf_regression
Message-ID: <bug-220554-2300-WRCwfiwgo0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220554-2300@https.bugzilla.kernel.org/>
References: <bug-220554-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220554

vicencb@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.17-rc2
         Regression|No                          |Yes

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
