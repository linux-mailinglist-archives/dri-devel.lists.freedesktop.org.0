Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4EE3B1CC7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 16:41:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE2C6E91E;
	Wed, 23 Jun 2021 14:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 671356E91C
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 14:41:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 21F8160FF2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 14:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624459300;
 bh=aWK9HcurnTFN+esyWWDSuclSDZ0nmNhr8S0DZpXJLfI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SXmgeORLvMJ3jra+dLP0ci12XyPeygcEx6lBaOWLbMyxBTifHjmR7ACvt5Q4w2wpo
 zbShfPAcFRXVou6Eqf21vh7eSGXWmGpNR2n9PjVTzHqU5HtVBsBLEydPcpP2CvAbfa
 ISS0f9huO3UPSgIhTFE55fcf6v2vPfmjnrnDDFmLkPfHX+PZEvCEpi+PEN8XsbP++i
 ts2aQVGOo8QxJfO11QCqCyKq3Bzw1a+Oag52rP+X+RgcrXHd6n6c6hHKnJfw+sgff4
 CfEyMo9Z0dRDhkTd70HAuhVXfnWAImO4oH+iizsNkn2IvqxOkaAibLVOHu/ujdObty
 +1LzW3Pr+IDmA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1EBE4612AD; Wed, 23 Jun 2021 14:41:40 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected] AMD GPU can no longer enter idle state after
 commit 1c0b0efd148d5b24c4932ddb3fa03c8edd6097b3
Date: Wed, 23 Jun 2021 14:41:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: untaintableangel@hotmail.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-213561-2300-xAWvHAXyWA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

Linux_Chemist (untaintableangel@hotmail.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|[bisected] AMD GPU can no   |[bisected] AMD GPU can no
                   |longer idle state after     |longer enter idle state
                   |commit                      |after commit
                   |1c0b0efd148d5b24c4932ddb3fa |1c0b0efd148d5b24c4932ddb3fa
                   |03c8edd6097b3               |03c8edd6097b3

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
