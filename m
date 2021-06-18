Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E663AD209
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 20:22:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF346EA64;
	Fri, 18 Jun 2021 18:22:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7986EA64
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 18:22:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DB824613F8
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 18:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624040547;
 bh=/tCGmWvLMB+LRJsvmOrOEUtupOikbR7EM87loOC5OV8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Mn5/yfzXTeVBmj1Ii0Fdjvb00DxvGxw6Qm3cF0MRrHb+x1ZzQublUAbRP8BXwR8zo
 3KtMqw28ghHZER8PeB4yc8OkkpnBOHXtkBJk2TdzmpgwmLB1S+iXD1Kr8EGKQCEUMe
 3qCbnYQmgL6s+hR0ufM1ZGGS0LpLxTCEceQlg328sHGz94E4EACXNGUFhQwCE885CK
 RxRuy8xNze+6UPN4+pisMsz4sPCvuDAiFLcV/Gh93sNSpfQdp4csfmPJoEcCKZK9R9
 3yAsgtU5K615JxoVLNbOcSAt3XNz9fsSBGVd4y/k4sw9Ji2SUPT4dY3x8rQS4eg+M0
 ruabz0KmIF4kw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D82FA611AB; Fri, 18 Jun 2021 18:22:27 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 209457] AMDGPU resume fail with RX 580 GPU
Date: Fri, 18 Jun 2021 18:22:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-209457-2300-hnckMOmG6L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-209457-2300@https.bugzilla.kernel.org/>
References: <bug-209457-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D209457

--- Comment #28 from Leandro Jacques (lsrzj@yahoo.com) ---
Created attachment 297465
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297465&action=3Dedit
amdgpu crash log for kernel 5.4.126

Another problem appeared in kernel 5.4.126 as the attached log shows. Before
version 5.4.126 I was running out of problems.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
