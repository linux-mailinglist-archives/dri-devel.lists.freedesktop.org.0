Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30B73CF98E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 14:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480756E210;
	Tue, 20 Jul 2021 12:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA6986E210
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 12:27:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9186B6120F
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 12:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626784051;
 bh=zW1GsVL8cPJu8KSwtd2TDz/dJo10cOHnAQ0XSZ9tQqM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FLtcVaNSUYKUV7oGj+z20j8Mx7cbFZj4noFnNSW/nA/3ZO18vZWpeCnaPIvXYgxlR
 D+wYCkmPy/lKljNjUGDZHBPeXBwYexnbTEVQW2SVOSN9Gebw/Vtk2Jj32E2uMo/fPl
 WE45QqAjm93XPzXKaP+JTkKyTEus1ZT9AxgY9vRN4R2c9zFz4PmMktQoAhByvDLtab
 w9PRzMO+dS083AYOznKeEUV8RbGMYrimz5iHRyKlGYYizHLcbVhJBqkiDz1CxF/pOx
 a/p6b33C9FIWKQ6+/yf1Jj/smHegEER1prKwHJm6qSW59qjeK/+6BGZIZyWxEnKFvc
 A/YVs9Bm5U/zg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 8625C6120A; Tue, 20 Jul 2021 12:27:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213779] Screen  stays blank on resume. from hibernate
Date: Tue, 20 Jul 2021 12:27:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: alex14641@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-213779-2300-TKIyXzER64@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213779-2300@https.bugzilla.kernel.org/>
References: <bug-213779-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213779

alex14641@yahoo.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Regression|No                          |Yes

--- Comment #3 from alex14641@yahoo.com ---
That patch works.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
