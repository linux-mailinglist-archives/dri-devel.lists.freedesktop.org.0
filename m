Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19C64CCDC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 16:09:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B8010E414;
	Wed, 14 Dec 2022 15:09:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D4F10E414
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 15:09:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 28E3361AA0
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 15:08:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89469C433F1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Dec 2022 15:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671030533;
 bh=H5OMFUwK20CeZa/WMlnFDaojkA46aDNXRbD3eOi0nzA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Vm7jC1gIQWWufrmJaBH5NchgU529Q0pwMT6wk+0smLOg6jdnw75+G/+9/4e8L9loj
 QM4u07HZ7n6gQYmY5l47SONbBm++F/WTKl9vndUeglSP7z3FR39Qr+uJLGn9jfC9KD
 IfrmpXXXWj8nIOSEbAjZkIfm4WBpQH93ugfEKlSyaHXXCg2sw5jQyNfTiECwRFhuqk
 1q4BYBHMRCOGxiXNFyWx+uRUDl2noJKCw1PMcyW8XL08rgYsFIRsD5fFnTGoA7bPh6
 D0jbv5wRApNMgVqQuPVUd+kFm97RwHO+MKKJmzTunTdLTH2HlHonL1+h1uJK+AP+Gg
 r60NEHFtG1FSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 510BBC43144; Wed, 14 Dec 2022 15:08:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216806] [Raven Ridge] console disappears after framebuffer
 device loads
Date: Wed, 14 Dec 2022 15:08:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: vinibali1@gmail.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216806-2300-3ytKAPr6oi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216806-2300@https.bugzilla.kernel.org/>
References: <bug-216806-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216806

--- Comment #3 from Balazs Vinarz (vinibali1@gmail.com) ---
It looks like this: https://www.youtube.com/watch?v=3D8oUUBjmo0_I

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
