Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A23AD21A
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 20:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9CE6EA68;
	Fri, 18 Jun 2021 18:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C60E6EA66
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 18:27:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id D605F613EE
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624040858;
 bh=56uJz+C4Rm+rIY18hclu4H6x5+9rkitOUCqeR3ebNJw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MVaqlAA3i9IVsV2SkpyNQXW8reyT/21NM78odvcytNmVIq2zGOePiABeewEB11N7F
 929+HGobUt8YU1VqNSHdQ8NxZj3UapKtZOicr93DsP4Qp25EMqaJoXKx7TyrviEFwh
 8fnnbLG2kyBS0eq87Bjr8YbXXdsWyEko/bWTqLiDvotlxh591VLUx7+ZV5DfNyABNA
 zisF8c3A6jauXp+midjoJzsgGHeMqbBpmeAXL2hbWX0qdN8F5vle6MqwAI8aTtBoJ0
 jcJxfleZu2KUJ7YY38N6s8WEts6Q/7wqoFYUUkZI49KHR5CMOciQheGClFk7NgZ89Q
 ze0cHfNpUx1MA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D2424611AB; Fri, 18 Jun 2021 18:27:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Fri, 18 Jun 2021 18:27:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: lsrzj@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213391-2300-27eZg35h4E@https.bugzilla.kernel.org/>
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

--- Comment #18 from Leandro Jacques (lsrzj@yahoo.com) ---
Created attachment 297467
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297467&action=3Dedit
amdgpu crash log for kernel 5.4.126

Before 5.4.126 I had no issues at all, downgrading to 5.4.123 to check if t=
he
problem will be gone.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
