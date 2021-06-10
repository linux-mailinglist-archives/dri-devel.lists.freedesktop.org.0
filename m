Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AAFA3A2BB4
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 14:34:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A30E76ED08;
	Thu, 10 Jun 2021 12:34:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE5C6ED08
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 12:34:22 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 083F0613DD
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Jun 2021 12:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623328462;
 bh=rex7ncu8m852AYgn6TmjwqeEKofI+KjsmlSS3V8tX0Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LOIB1/A7eEAQl1oQ3xIm/InpqSbmSTBbVVQjPZxa65zH+waxAkYmN/6dy3RdmH69b
 ZhxfFS3rtREWFuI4ZTBfw9YurCs67Q4A2AZNbUbTn+a5DpUfi5eDfWD9AEEzGZD2wm
 vtKSmGla7gi1/1IE8h+slXc/O7y8q5AWnghvJpO8c4YxSF5qytPKD6YluHSUXM2icP
 WpjP98BpmzF449M6M3MVRkn3DEj+I0rq3kQKjtDZmsNpqDUSCXUMRNHTxsaK2Y2eIJ
 CyWzpgBgVIq3A8vjVduxRcNM2wsT3HHOcBW80/Nb+JFGe6JyH+SKQqummAeYEywDkB
 f9Qb6pJkkomYw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 056AE61158; Thu, 10 Jun 2021 12:34:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213391] AMDGPU retries page fault with some specific processes
 amdgpu and sometimes followed [gfxhub0] retry page fault until *ERROR* ring
 gfx timeout, but soft recovered
Date: Thu, 10 Jun 2021 12:34:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: samy@lahfa.xyz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: short_desc
Message-ID: <bug-213391-2300-Mpg3Ch2e9Q@https.bugzilla.kernel.org/>
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

Lahfa Samy (samy@lahfa.xyz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
            Summary|AMDGPU retries page fault   |AMDGPU retries page fault
                   |with some specific          |with some specific
                   |processes amdgpu and        |processes amdgpu and
                   |sometimes [gfxhub0] retry   |sometimes followed
                   |page fault until *ERROR*    |[gfxhub0] retry page fault
                   |ring gfx timeout, but soft  |until *ERROR* ring gfx
                   |recovered                   |timeout, but soft recovered

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
