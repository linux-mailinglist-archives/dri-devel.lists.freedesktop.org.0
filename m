Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE9D58CFD5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 23:41:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1214514BE39;
	Mon,  8 Aug 2022 21:40:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88598F29A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 21:37:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 654DFB810D6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 21:37:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6728C43140
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 21:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659994663;
 bh=qvsxCIHkoK8EZwOGtbyolsvqVD6ipHBsVfQuiXfYAb8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BowVSJNSa91zObFe211b7ViFKftBse5Idgo4HLLdiQstvIFstyQ1915L6TBbirTMq
 iUCjdTq/9vM240iAYKDhpsHlfZ3r7WmAwHOtBVr6cZG3fM8rXpKe9EvSazEgJ4YCu6
 xsfCQb726XNoOEvbAngUE7YOOd+H0v2g5pAsO7Xvs52XhRSQIDSUDyTv9kyjgaK3/b
 3tjjsLTonzzC9K1GrRM1OfQ2omIwLfWPOVpmr3jctOETzzgslupyE9+oTBLAiJGEj0
 Lu8wzU3ojecVRYe5TUkYnVCGpbGxRlGGLut+EV4bHB2zw8v1kdWso9vi226xEQL8f8
 wSDNXd5Qk+mmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A249AC433E4; Mon,  8 Aug 2022 21:37:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 100871] radeon fails to initialize one DisplayPort monitor
Date: Mon, 08 Aug 2022 21:37:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cra@fea.st
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-100871-2300-LgNeiBgE6l@https.bugzilla.kernel.org/>
In-Reply-To: <bug-100871-2300@https.bugzilla.kernel.org/>
References: <bug-100871-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D100871

--- Comment #17 from Charles R. Anderson (cra@fea.st) ---
Still a problem on Fedora 36 / Linux kernel 5.18.16-200.fc36.x86_64.  I'm n=
ow
using two newer monitors (DELL U3219Q) connected via DP instead of the prev=
ious
four monitors (2 DP, 2 DVI) and neither monitor turns on unless radeon.audi=
o=3D0
is passed.

Maybe there needs to be a quirk added to the driver to keep audio turned off
for this card?

Advanced Micro Devices, Inc. [AMD/ATI] Cedar GL [FirePro 2460] (prog-if 00 =
[VGA
controller])

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
