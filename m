Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 048A13D8437
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jul 2021 01:45:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0BD26E40F;
	Tue, 27 Jul 2021 23:45:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC72D6E1C0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 23:45:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 9A48860F6B
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jul 2021 23:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627429534;
 bh=PjxMQthOpABd+2mb6tYT2ptwq4hz4LW2diKUJ5viHrQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=vMCx6YIFF+S/CM5jqze13qwkoykJxnMKzfd9sIGNHoaonmbUCJNlzjRNS/aHkNoT6
 gEnrc0U/Kuj5uC5aWFAfrorRJrdQJnxNBy5YYam5WwguFM3DSRfeuQf4mrrzIXtqgM
 P1zkK2ff69qANWWjGDt10vZTBXJkToQO3Q4RPWqQwddo46RSTOb9gH4CKOTRnSspST
 N4V776sXRPpIO0pYdv9qEEPv1Qw9VPAApumkwyeDOcdDt5FrE1ferVAkXZcjUoMyn7
 OncopEaQBVqKUZ8Z2+2AwgDXJ5RQtALJaxR+LLfwxUhjnKpZ68iouW6wIe2bB5tl4s
 xH2hWX1eK6NkQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 9168360EBF; Tue, 27 Jul 2021 23:45:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213779] Screen  stays blank on resume from hibernate
Date: Tue, 27 Jul 2021 23:45:34 +0000
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
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-213779-2300-4E5WmcILum@https.bugzilla.kernel.org/>
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
            Summary|Screen  stays blank on      |Screen  stays blank on
                   |resume. from hibernate      |resume from hibernate

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
