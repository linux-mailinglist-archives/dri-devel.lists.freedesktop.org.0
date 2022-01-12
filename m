Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C1948BD00
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 03:14:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBFA710E350;
	Wed, 12 Jan 2022 02:14:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92EE10E350
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 02:14:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AA6F60E0B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 02:14:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C2814C36AE3
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 02:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641953687;
 bh=TSpztQ+5+f8TiUpx2J1DHUS+JUPprjKqG3L2zqhQCBs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VLT+bSEx9aG241i2pN1qR8ZOP9X/0AjCTSlw6k5Y4YSUZS1uJrxjg6wBDziOTK910
 KnbA4ARGhWop+qXjytIFtocw4ZH23LW3ZIhL79UGsLTw/9N88kTG2CnLMfB3J/IkGH
 GxrndJmnm5Q7861b/IQ7V7Hzdm3gq51KfMkMmJ5gCqFZHfGy4E4nujejMFDbR5SZBv
 XbKvd0gYk0NM1xf0dsQ46dYrANhCNYoMV1UCZwBjKaQ9zY9D/U6iM8543mszzQxwzK
 D1yWS3f3IxtuykZAvqgyFjqgxltqEG9CTgee9bNQ2GVRQmDlZUsIQfoXSFVsq6aly2
 npgT2q0R6VOcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AC13FCC13AF; Wed, 12 Jan 2022 02:14:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215001] Regression in 5.15, Firmware-initialized graphics
 console selects FB_VGA16, screen corruption
Date: Wed, 12 Jan 2022 02:14:47 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bugs-a21@moonlit-rail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215001-2300-7ACdI2r5DU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215001-2300@https.bugzilla.kernel.org/>
References: <bug-215001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215001

--- Comment #13 from Kris Karas (bugs-a21@moonlit-rail.com) ---
Hi Javier, et al,

I have just tested version two of the patch (from email, I don't see it lis=
ted
in the attachments), on the original two BIOS/VGAC servers, one new UEFI
server, and my original UEFI desktop.  Once again, I'm happy to report flaw=
less
operation on all four.

Tested-By: Kris Karas <bugs-a21@moonlit-rail.com>

Thanks again, Javier!  I hope this one also makes Geert happy, too.

(I'd still be happier if non-X86 would be patched to use orig_video_isVGA a=
s an
integer; but for expediency, this seems fine.)

Kris

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
