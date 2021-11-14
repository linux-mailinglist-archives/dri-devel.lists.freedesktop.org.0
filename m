Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2DA044F6FE
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 07:08:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285C06E06B;
	Sun, 14 Nov 2021 06:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5CB6E06B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 06:08:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B43F4610F9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 06:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636870088;
 bh=AkgG6qMYSQGciXxlRqN/5S0IWhYNSlYEWb7HA2WCXb4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Aq67TM/27zMsGLVWrdd50In8q4YIZbWfRQvNrB6hUJQwTSGlRHdgw011nuTtuteeR
 3miQjnMVnU316ZS6pzdGkdnLPQY9HNga3cZpM/kyyHKoy4wsXJ5n/UiUCHng/eqmte
 kHyL3VUb+xC5SKwOaliaLjn17KOoy4b5VC6imhT0ucCUF5be+26gWY8cLhLayj14RG
 nklbpLzYT7AQg0fSo//iRS1+nwBuvc9YP+QVeA31WL9J+njuVOwO4a7kBNt2fULzGd
 QuvjFIVMM90IUCjQ+OTdutwQHMhac2bG9TRi8YnwNgiD6eTGe8DRv2A7NZCEPK7WDu
 PGI00k8wJMa9A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A235260E49; Sun, 14 Nov 2021 06:08:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215003] apple_gmux fails to initialize and iGPU unclaimed on
 MacBook Pro 16" 2019
Date: Sun, 14 Nov 2021 06:08:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dreifachstein@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215003-2300-9FOr4UIv62@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215003-2300@https.bugzilla.kernel.org/>
References: <bug-215003-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215003

--- Comment #3 from Xiaolei Yu (dreifachstein@gmail.com) ---
Created attachment 299561
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299561&action=3Dedit
acpidump

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
