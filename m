Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9439F329708
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 09:53:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF5906E913;
	Tue,  2 Mar 2021 08:53:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3D66E913
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 08:53:24 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 0EC5A64DEE
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 08:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614675204;
 bh=Ff0o8fajskvhfUlUI6twETKEvUTBggUSz4ZHd0/dwsU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=llsVDFrtBLhYRhAl87ML8R67S+pZWcUZnWaoDCd7veXDKL3/7L8FUAnHmT5YEYTud
 +CPpgNAQQXNWGvpvMfhSv5QCESxGgeom7UINkIaw9fkgb/yJIT8j9uQ0xTrsL3glXl
 mZILuifGI3VNzq13hVCEtpZ7rf/8EuqwVRJkceBF6Nx00A1tXVO537+zup85lwfKuB
 +v9we0Z760ykjANl2Lyp/SIPg+2wH9hB9kcUWwHzyqY2cR1Th3KVA6j7KGGzeXzKwa
 ijze3FjI3MdpngjABADdVdfq6/cMmdg7IMfaT+D1Aqvc7lCdkDSS7QKvfog+0WiAmB
 y/I5ZBT5ZCcsg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 075E665360; Tue,  2 Mar 2021 08:53:24 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 212019] [drm:drm_atomic_helper_wait_for_flip_done
 [drm_kms_helper]] *ERROR* [CRTC:67:crtc-0] flip_done timed out
Date: Tue, 02 Mar 2021 08:53:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: clemens@endorphin.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212019-2300-G6zwYZcKi3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212019-2300@https.bugzilla.kernel.org/>
References: <bug-212019-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212019

--- Comment #1 from Fruhwirth Clemens (clemens@endorphin.org) ---
Created attachment 295571
  --> https://bugzilla.kernel.org/attachment.cgi?id=295571&action=edit
kernel log

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
