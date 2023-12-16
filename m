Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36906815653
	for <lists+dri-devel@lfdr.de>; Sat, 16 Dec 2023 03:19:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF9B10E04E;
	Sat, 16 Dec 2023 02:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2C710E04E
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 02:19:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 1A6C7CE30FB
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 02:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C99DC433C9
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 02:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702693158;
 bh=AAYWR8owfL6mEGIfh64CuQiJoenZ4fFUHpYnOqbtce4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=siePe0JWYDwJyY8d7/ytitS05Lky8f+PFibhaAdnNhEUM9b0OdcWmItwnrftGzMJu
 G72ORDA5rlIbhqN9QAMfnl/bolVCMwMXudJuSTQ8K/ezrSe6NvPwoNVjJFOuQ5XyIN
 gScINN3Zt493umzTmkJY2juWHh262J6uQwcI/+8We9Oo5D59rOO9t3j2oCRpmQSfEo
 emICcPKj3xrdBQayDTO0zz/rDfMVmcLsXBAy2IJvltDEnxnqFF2f29WPcrdtoP8ArM
 W9MDiqk6q/Kwc1AZ4POgqQzo5xscQzOJ7k9crMbfA4xnJ0UMvhMsHqqFSa3nLdn9NY
 2KlfdPIwX0ArA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 36131C53BCD; Sat, 16 Dec 2023 02:19:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218274] AMD r9 m380, 2015,27 imac - amdgpu wont work
Date: Sat, 16 Dec 2023 02:19:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pukurasa@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218274-2300-Xb4FqaEETP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218274-2300@https.bugzilla.kernel.org/>
References: <bug-218274-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218274

--- Comment #1 from Pukurasa (pukurasa@gmail.com) ---
Kernel 6.6 and up, havn`t used anything earlier than that

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
