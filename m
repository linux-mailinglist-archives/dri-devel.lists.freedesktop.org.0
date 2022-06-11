Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1329547157
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 04:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 376DB10E729;
	Sat, 11 Jun 2022 02:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BBD10E37E
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 02:26:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9E9E2CE36CB
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 02:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC478C3411F
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jun 2022 02:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654914378;
 bh=azWuR87uR5CcIwIyPx4GjyiPhpcB0GzttxzeUh4TTEg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Lpvn6Wugo1M372CuzgapgOT0+uY6LGyZlkrvz66ArHRIolfNzPa4KHLZa3lorQOxh
 1UqfFCCnnRCzymZYfkiMNyvBNGh3Kz4I5L+sOutTJXML4qeUdCbDDzZgMEhX+6uvIc
 a6LfTvJ0GmRY4iMva+UGTg0CK60tX9ls8r0eAuff3AIk1TefmtmpJHEtZh2s/ctiJI
 0qqgzxd6iUyxkK+HRycT5yhZCLJ9NTNc75pwB/FRXpNQDER+aN/lz5ZMJuEIRik9LK
 ounNfoj7Gs939X3rT9xNEoGoajM1ltZRJj3Z4Sta+Cqvu2x1cyIysxmS72+w3C3SrF
 /SB7xacXtlXKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C4FFECC13B1; Sat, 11 Jun 2022 02:26:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 210301] *ERROR* IB test failed on gfx (-110) on Ryzen 4750u
Date: Sat, 11 Jun 2022 02:26:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: me@ramast.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210301-2300-fzFM18E4wK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210301-2300@https.bugzilla.kernel.org/>
References: <bug-210301-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D210301

--- Comment #3 from ramast (me@ramast.me) ---
I think mine could be a different problem but I'll paste the output here an=
yway
in case it help anyone. Mine consistently happen the second time my PC goes
into sleep mode (S3).

https://pastebin.com/DZ8rZuHq

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
