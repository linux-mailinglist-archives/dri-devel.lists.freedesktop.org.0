Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4898D34BD1C
	for <lists+dri-devel@lfdr.de>; Sun, 28 Mar 2021 17:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD84E898E8;
	Sun, 28 Mar 2021 15:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43B9E898E8
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 15:59:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 192B261958
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Mar 2021 15:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616947158;
 bh=RcKUqkTNDHAbM+I0gijilDsWTsTwM1SXbXJcDeuhMys=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JpgeAPHidM6cqEgc5YJgwrvzIDhZZiCHw7tNL2AbNM1ogxs8oNOpj2bE+piaiYJHw
 aEQQxZpggz8il76aVRLVO94XTSAhTo62Z2JI+qF+GJ/ytsDKZHmEFTQ1xFEDYGXIlD
 bDcBXzTSpjBwDUtRRXObyzM2WXsRrDRp8rhZznbT1Cp3JAbzPr3TtEhGzdSpWW6gsJ
 Nfx2pBGQIVMudPfjXS8Wib5HWlJxlod8w6/eQM/+B8ku/kWGT+mz/lgRM/QQpceoLn
 GURYcyZ1Nv54+YupSlEs1ct4CO7HhJuWR+P35ic8pdpHHuzzkZLT23iZPpUxj94Oye
 2l1DRgn2C4IBA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0D51C62AC4; Sun, 28 Mar 2021 15:59:18 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212467] AMDGPU -- amdgpu: Unsupported power profile mode 0 on
 RENOIR
Date: Sun, 28 Mar 2021 15:59:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bogdan.pylypenko107@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-212467-2300-bQu8xqjeVS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212467-2300@https.bugzilla.kernel.org/>
References: <bug-212467-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212467

--- Comment #2 from Bogdan (bogdan.pylypenko107@gmail.com) ---
My VGA adapter is:

05:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Renoir (rev c7)

Which integrated into CPU - AMD Ryzen 4600H.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
