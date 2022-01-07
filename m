Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD81348764C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 12:13:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 240F4112234;
	Fri,  7 Jan 2022 11:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F7D11221C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 11:13:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBCED611EE
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 11:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4301BC36AE0
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jan 2022 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641554022;
 bh=TidbRJ52eOZjM9MEXlzUHebtRVXYnm6ti5u6Y7nRVNA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BIyhChpp+qtUr3GTq2xAajIJyQPTCkB74SGVjTOBjzQpMGQaLKsGiA0BX5wb/OpJw
 uSeDaBrjgjluHA29snN6PUrW8UhSvdAs62NRjsZxwkeDFKzcPwiFo4qpgx7ZAKCg3I
 RNaUauBjr/PsR3D35pXMHxrouPEjZUGhZaic2sL/h+/NDv8Eir08epyygSB/Kv1r83
 WIMEjR0ULHlGHr86ZorFxTiZbYNUNPGvlO5CUGSWn8aQ243BNl7PsVaT8zxW6iQA25
 j4V8v/WyD1NJMxb2m3M+Lwes6OMdicYOV0o9aSpnJJZtMib63kHONdBWSDPzTadexX
 cwPQ6fXqkVtbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 28895C05FD7; Fri,  7 Jan 2022 11:13:42 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215001] Regression in 5.15, Firmware-initialized graphics
 console selects FB_VGA16, screen corruption
Date: Fri, 07 Jan 2022 11:13:41 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: javier@dowhile0.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215001-2300-iuYvNNwH6L@https.bugzilla.kernel.org/>
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

--- Comment #8 from Javier Martinez Canillas (javier@dowhile0.org) ---
Hello Kris,

(In reply to Kris Karas from comment #7)
> Hi Javier - I tested the (updated) patch from comment 6 on three different
> systems, two servers with a character-graphic BIOS (expected to use VGA16=
),
> and my development system with a graphical UEFI boot (expected to use
> EFIFB).  I am happy to report that in all cases, the patch worked perfect=
ly.
>=20
> Thanks for having whipped up this patch!
>=20
> Feel free to submit upstream to Linus, and also to Greg for inclusion in
> 5.15.y.
> Tested-By: Kris Karas <bugs-a21@moonlit-rail.com>
>=20

Thanks for testing the patch!

I've just posted it along with another fix for a bug I noticed by reading t=
he
code (EGA is never used and the driver always assume to be VGA):

https://lkml.org/lkml/2022/1/7/270

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
