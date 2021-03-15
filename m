Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF24D33C584
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 19:25:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9726E0C6;
	Mon, 15 Mar 2021 18:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075486E0C6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 18:25:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B4F9F64F4C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 18:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615832748;
 bh=4My60n3jSp52Jz0WjT24CfEw6CcRtN3i9JEdd3Gt8cE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Sn0e2w4rKgArwwyrBD7o1cMv+Nz4TiIcLQqnJVQ0JPHleNtResDM5ssrD2tPa2FWh
 KUIvj6Pxt4+dTaEEXN2aGcNJhUV6Y8Mx4Nd4cyXPHDMnxGSmZgwsduoi8yP4Zgs+PY
 B3Nj55G20sbVr67wq53lNSApiugZYE8nJU1y3dq6KwgiCOkRm0V8/LSiVji7zI2f2Q
 kKGlepwVxxd4J1mH0rnwJRIYMNG4OB38uppDBG55kkEAsEevciHg4fLsfL/IbnKtFs
 QUZINqJQ/+nK1W5MzjL3iyKVYyv7sVrukTr/J7j+GlXTmm00GfS5VDBNYdryi2Nivd
 LaLRTUmq9HTVQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id ADC0F65360; Mon, 15 Mar 2021 18:25:48 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIyNzldIEFNREdQVSBkb2VzbuKAmXQgZXhwb3NlIGFu?=
 =?UTF-8?B?eSB3YXkgb2Ygc2V0dGluZyB0aGUgZnVsbCBSR0IgcmFuZ2UgW3J5emVuKyBt?=
 =?UTF-8?B?b2JpbGVd?=
Date: Mon, 15 Mar 2021 18:25:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: ledufff@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-212279-2300-OEPuf2wCMJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-212279-2300@https.bugzilla.kernel.org/>
References: <bug-212279-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=212279

--- Comment #2 from Neil (ledufff@hotmail.com) ---
Created attachment 295873
  --> https://bugzilla.kernel.org/attachment.cgi?id=295873&action=edit
edid-decode

Here is the edid file for my TV (works full rgb range with windows 10)
I will try to edit the file with wxEDID now, but, it would be less tedious if
it were automatic as you say.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
