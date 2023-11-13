Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E3F7E96AA
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 07:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A665710E150;
	Mon, 13 Nov 2023 06:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E29710E150
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 06:27:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 780A7CE0FD8
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 06:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 570E4C433C9
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 06:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699856853;
 bh=PRizHtkuBR54AvBmOWqHTp4SCYf0VqtT6Asczon3NKY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SLlglj+1ySSJSTw0v+UGG/VSQfOy+CcaMzA/Iowsuo9kAVsF5Fa+pLyfP656H7QVU
 nu5lGPcmB4USCW96MSNXzd8U8IngE+9eGqcoj4MlCF4qqG6hwvJQ6LfF7pxhbwSDeJ
 dhxvxVYi25pU5VCeZRZN8yqk7S44UZBOeHSouo/HFPOUqe+8GsRUB2RPdIYJcuDdrY
 4j4WJWVMIo9soItOdQKSpDOeX4MCAeBIwtvszmq3fXRWDCBZHTGxj0JHhbz3G2vrsV
 F6mzrih7cLt75JWV052n6U/H9/CEJ73of6177riO0FOEfB/6HBfmAXFeTeUHRKdNd1
 L5rOYhZcoNNWg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3C20BC53BD3; Mon, 13 Nov 2023 06:27:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 218134] Null pointer when rearranging screen layout in XFCE.
Date: Mon, 13 Nov 2023 06:27:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218134-2300-vbfkYBHwzI@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218134-2300@https.bugzilla.kernel.org/>
References: <bug-218134-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218134

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |ANSWERED

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
