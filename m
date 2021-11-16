Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91358452E84
	for <lists+dri-devel@lfdr.de>; Tue, 16 Nov 2021 10:56:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930F66E933;
	Tue, 16 Nov 2021 09:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6463D6E933
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:56:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 35A6D63222
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Nov 2021 09:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637056606;
 bh=87bYFBgdwH41lG/WLNdZqLuoLn34X+2dsy85HNm7GCw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gimfJjdLZVwlJEbtZZ260A6CSxhYDGiItsO3Fv0SEjdFHsv8RP9ZT97vQLCNAPCY9
 IKzhfBDMOCHl2nEu48+BDTKF6hkSu3OB7T4woDYriIL49SCBtEtVrdRCCeZl2GtLxQ
 pV8FoUR/8bYjShENRxnrI7Z/+WFe0WuKN5/agzD8FaX28oTQHES094jjCXmaapAEjl
 Lsm9TZd4HU0+AMDUgZtA1A7Gqw+loezdc4YiDRKELc9iPKpJ0S2SBWIfbpYLjNgfJe
 +zbhtNn0m0T3e1uvm6HSrjOfISlFmzBuCLBrMEFGb2EsnDWvhqfFLPkKSv9EOUXpVy
 fmUmpeevYNcgQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 26A5660FC0; Tue, 16 Nov 2021 09:56:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215001] Regression in 5.15, Firmware-initialized graphics
 console selects FB_VGA16, screen corruption
Date: Tue, 16 Nov 2021 09:56:45 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215001-2300-xeAshmZhXQ@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dri-devel@lists.freedesktop
                   |                            |.org

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
