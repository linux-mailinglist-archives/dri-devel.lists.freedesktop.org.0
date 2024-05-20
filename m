Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AFE8C9E32
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 15:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C3010E147;
	Mon, 20 May 2024 13:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G0PvHuWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6BA210E217
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 13:30:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 22C866198D
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 13:30:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64D2AC4AF0C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 13:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716211833;
 bh=/CjrX9D5qIaK/Lt0V3lkPsU/RawwGiM/Hh4emHMKvHY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=G0PvHuWKEKUOgUm004MRGQxApJY9XZVO8OEJuaCbePnwvAPskEnhSP1FQWUPELEj6
 ZTCovt310L/5bUJp40T2v+giamRg689mjiUbOU/kqMnR6dNHq4naRz2dBj9M3nmH40
 CJNBlBWhWwDu87G+/3HaThnbTsbIQA9TMkGaxUIT7OgWlqKASeN2Lzu28SJsn5aaT/
 ch+7TVumV/gJsF2Jp7tI7GeuDJ3hlAWwtcIqAlyjNq1r3DpFZdddfWF1ED5i/Pl/4Z
 bf6YM7s4l66pu4EXSYWAIf2VYRZw04KXXGUR5c5XXBhGQd+zhGnUGnQVhGuCYHbANg
 Kimut0oSHq5jA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4B44EC53B7F; Mon, 20 May 2024 13:30:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217607] null pointer dereference with NVIDIA installer on 
 5.15.118 and  5.15.119
Date: Mon, 20 May 2024 13:30:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jani.nikula@intel.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217607-2300-bgurgmvXUl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217607-2300@https.bugzilla.kernel.org/>
References: <bug-217607-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217607

Jani Nikula (jani.nikula@intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
