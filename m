Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE7D40ECE7
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 23:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CE1E6E947;
	Thu, 16 Sep 2021 21:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC03A6E947
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 21:48:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 374DF6120C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 21:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631828931;
 bh=v4Q0BuoCIZX3oITdvl5a2zmMYkEitdptT+/IgfHvWdw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Bbg/WYuPARXe/FBPyFrn22PDUhLvjRf4ubO0VWthxm5shIVNvwQNm3njPgMP9sTAk
 RIkI2s5wsrEl5nqPdtWwCvyqVi5PMd5SBoEV7cKgeQqZvFUxYCYqThIIa8jU6tdxun
 D4XMMLc7Z5la4wa7Lcy39vo/dm6oxJiDVUjlJfDjxoh2ewjgcUtwGQ4P7Rx25c1w9U
 WotXnnxHUg/qX7CQw/LglZnUK/gJvCfx31M405VIoXYA2widTfY2Pxt9sn/5IA/TYW
 ijINBe0cpjMMNt5f4WAel6HAOihotpvKLNil/4WOkRFual9DcfIXs7LSHXo/aO6kvJ
 WnnZu4yCrCjuw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3427C60EFE; Thu, 16 Sep 2021 21:48:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211807] [drm:drm_dp_mst_dpcd_read] *ERROR* mstb
 000000004e6288dd port 3: DPCD read on addr 0x60 for 1 bytes NAKed
Date: Thu, 16 Sep 2021 21:48:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: parker.l.reed@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211807-2300-sDPYWeiRsv@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211807-2300@https.bugzilla.kernel.org/>
References: <bug-211807-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211807

Parker Reed (parker.l.reed@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |parker.l.reed@gmail.com

--- Comment #4 from Parker Reed (parker.l.reed@gmail.com) ---
I get full on driver "crashes" when trying two DisplayPort monitors with the
aforementioned ThinkPad USB-C Gen 2 dock (T495 AMD)

I can use either or DisplaPort port but both causes the crashes.

Dmesg attached

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
