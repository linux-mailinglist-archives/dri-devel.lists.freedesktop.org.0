Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3DA573D2
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 22:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81B9D10E01F;
	Fri,  7 Mar 2025 21:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RMBXD4Cm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 952C910E01F
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 21:40:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2B107A45379
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 21:35:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 373FDC4CEF2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 21:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741383655;
 bh=OExTuxpAwwgK2Up9S6FzOeGi7MiyGlByqRcqzuo2EV4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RMBXD4CmfM4zemR8CcPAOf5xX0ZiLcGrtHJ5wUZyXWAPUbu+GmqlRtjBPU4Q389jf
 +at+8BvNmAl530XtPsrDXGeNFCxdLYH6EmL7EsZP90litbMCH1rsQjwx3Vt3VTMXRk
 igCtSj5FMxUwq0Xy7ZHfTP/kWr2rSjWY1bczFI/gDCPnWIx412Hr7SUc3+jup43ZAm
 rdbzc5jUgGQ+H9rq6qkwp/VVOijFrJEciybVacemxLQ3ymPyBPqZe1NxwNQSVN87qD
 AjdEmOjSHOvdLFJTVvrazx3ABb5W2kkSRyuqh/2kgPjrcV69zakvtdYs11XXddTpkU
 88bksDitT11Lg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2D722C41614; Fri,  7 Mar 2025 21:40:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 219834] amdgpu: kernel oops dce_aux_transfer_raw
Date: Fri, 07 Mar 2025 21:40:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: atiqcx@gmail.com
X-Bugzilla-Status: CLOSED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-219834-2300-CdvarYm6R7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219834-2300@https.bugzilla.kernel.org/>
References: <bug-219834-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219834

Atiq (atiqcx@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |CLOSED

--- Comment #3 from Atiq (atiqcx@gmail.com) ---
Thanks for pointing that out.

Found existing similar issue at
https://gitlab.freedesktop.org/drm/amd/-/issues/4017

Commented there and attached OOPS trace. Please let me know if anything els=
e is
necessary.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
