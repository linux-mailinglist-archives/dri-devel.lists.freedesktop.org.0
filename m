Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFB544E14D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 06:07:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E3A89B01;
	Fri, 12 Nov 2021 05:07:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68AF489B01
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 05:06:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 22B1F61037
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 05:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636693619;
 bh=WMDoZyUUW+gcnX2wEcddZN+DvqEIyxJDsTYH3s85xAw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aG8M72gRH4yb0ABgVJZfkJl/f2QBjkOAe87Y2dpDnf6vCAd1S8LOOnfZWjwOfpyDp
 J1Xwoiwud8m4JCWT2LtIV+3p+76AZawG8SIIhjd+nK3dFHQKfrHyCPtP36QyBO4jv0
 I6xlvjIyhOUJJy59ZnBy4mQUQTWqUcQg1VoU6AwTOqWrlVmuJ7XhoKNrc2M4An6gJF
 2puIZbkkFR1HbCD2OCrXTTSnsMGPTHuiEZR0hrmj5i4GJIipCMF9NjiQWdHx+OI0Xb
 WrTVzlkFjsRZufyNnE3Mg3hOdfEpsfWysdpFlscn5wXwV/gWO6WXfXyisBQtp5xAcF
 QRjN+hX9MAEJw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1B6C960FF3; Fri, 12 Nov 2021 05:06:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Fri, 12 Nov 2021 05:06:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jlouis.espinosa@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-hDVemxZg8K@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

--- Comment #23 from Joey Espinosa (jlouis.espinosa@gmail.com) ---
... and I guess some of this info:

Mesa: 21.2.5
DE: Gnome 41.1
Vulkan: 1.2.189
Xorg: 1.20.11

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
