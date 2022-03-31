Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB8B4ED707
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 11:33:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AB610EE57;
	Thu, 31 Mar 2022 09:33:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FB010EB06
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 09:33:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E059B619D3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 09:33:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54EBDC340ED
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648719228;
 bh=WG8m1hZO1+KVsXhe2yZh74Wqd6XsM+fBY0trAjwpS7Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ATdVRr1Iao5TUG3h5qxuKLiWwBna7Yu3WFAh1EGEN0QnVDAGc8Kdk+cKa7fSYYK1G
 +06GZQtHPNjw0VKJkF5B3SUqFQhhl72wvtn5/aPOWRu8Y8KOZz4L0eTiyFE6D7QW3Q
 Giy2IVGPe3WfU6C1cgXcGXvMP6q3clf8wso78dhKTEvcovIJ8x1lJZBll3/gzWnAQS
 E6CJaUBLmon8quM7ksyEy558rHY97hvm1Zi80VvnNJbvM8PtYlJQmVD+iF6LO/pSL0
 44Ddd4d0+6uoj3p/VC5lHVj5IJu7CyzTAK2xDqk8go6yNDpAObubTZ0e8+YWi7D8OH
 LGg76oRbtD4Jw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3E861C05FD5; Thu, 31 Mar 2022 09:33:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214071] amdgpu idle power draw too high at +75Hz
Date: Thu, 31 Mar 2022 09:33:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: info@lox.enterprises
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214071-2300-b1E5Ze7hmF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214071-2300@https.bugzilla.kernel.org/>
References: <bug-214071-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214071

kasimir (info@lox.enterprises) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |info@lox.enterprises

--- Comment #2 from kasimir (info@lox.enterprises) ---
Anything happening with this bug? I noticed the same behavior, but like to =
add
it's fine for me at 100Hz (using ~7W) only at 120Hz it fires up (~35W).

I have an AMD RX 6900XT with kernel 5.17.1 and Mesa 22.0.0 (on GNOME/Xorg, =
Arch
Linux).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
