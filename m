Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9F3A9807
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 12:46:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E8C26E560;
	Wed, 16 Jun 2021 10:46:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F5A6E560
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 10:46:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EC95961351
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623840392;
 bh=Lz2RNp6mGQLzE54zIA/0G5uAAiM3MACVpW9J80V6EgU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sAFlsJGVd13Mv2NZlO9OiibugmF54udFmIV6RVoNcISNKr1fqmEnvsb0sP3PHnZuK
 27pRfK3DoO1TY5afUDo9/duRiIUpSgyAKH+RU0vsfdYLDXIwtbvqoAEupal0kw/w+5
 TXt7rtPu1JmTJjiVh8uXpxN807lksiXX2oX0OllbByqRZ+empNG9hjqmGuD1OCCpeM
 SRCOsx5vHxFrKPYqQ1sN6JjWqBNXRdWoNSL6Hti9jH6cC9YnwtqoUAXNtSC4YdgOl0
 44obYa1Cu4dFFCFUVAnAP5sGuVDWuVBDy2LSOOAGOX9Tmj8gxaTK0HBPOISCW5tUlh
 bcM3B1iDaATug==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E492C6109E; Wed, 16 Jun 2021 10:46:31 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Wed, 16 Jun 2021 10:46:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: dominic.letz@berlin.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213391-2300-jBSeqUvUBE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213391-2300@https.bugzilla.kernel.org/>
References: <bug-213391-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213391

--- Comment #16 from Dominic Letz (dominic.letz@berlin.de) ---
(In reply to Michel D=C3=A4nzer from comment #15)
> (In reply to Dominic Letz from comment #14)
> > Having the same issue on an E495 with Kernel 5.12.9. Will try to downgr=
ade
> > the /lib/firmware/amdgpu any hint to which git tag you would consider s=
afe?
>=20
> 20210315 seems to work fine here (on an E595).

+1 trying that

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
