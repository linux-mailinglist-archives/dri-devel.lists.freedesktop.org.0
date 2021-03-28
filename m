Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A57534BBD9
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 12:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E54189F99;
	Sun, 28 Mar 2021 10:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC74189CD7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 10:00:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 404356197E
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616925657;
 bh=KLYJ4Ju55mV6c4EHk5qqIUvPu+Izsho2nAiNvwm5Wy0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=A1Xa+EoAub4RCKXep0gYjvlfRBdkxYrE9IY/JTzdVOUZjMqQGB5KbrShSFNO7BMT4
 EO+oZZx1axztR4e/xWvwagExdnSy40119GW7INmZpvLjmRfY4nZQUmtjmWkOF7KodK
 soZEZISFo/bi0h+grXr9xsCQow1eCE+rhmH2lIvaWyXznBYTJTgCNx91op7CDvITHc
 WwcNSVll089lzcxl1Ei34TZSd+yhjHBBtZvLRCB6SS3sCAd+kpTRCgzKI4JUWaWIQP
 i03/QWvqUPEufMO3DmdcisxHmKaAN2khRVJdYj/a999sF7L9PL88rqmZRO/YttDl2v
 IbnWKH5EHXBWQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 34B2762AD2; Sun, 28 Mar 2021 10:00:57 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212449] DDC requires amdgpu.dc=0, HDMI sound requires
 amdgpu.dc=1. Make them work together!
Date: Sun, 28 Mar 2021 10:00:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sdiconov@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212449-2300-W48RUE7r0C@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212449-2300@https.bugzilla.kernel.org/>
References: <bug-212449-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=212449

--- Comment #2 from Vyacheslav Dikonov (sdiconov@mail.ru) ---
I doubt that. 
Please, see my ddccontrol logs with different settings. It shows that
ddccontrol cannot access the controls unless the options are set as dc=0,
hw_itc=0.  All logs are taken under root and with POSIX locale. 
I also add a reference log drom a different machine attached to the same
display.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
