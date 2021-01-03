Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E25A2E8D4E
	for <lists+dri-devel@lfdr.de>; Sun,  3 Jan 2021 17:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2952D89561;
	Sun,  3 Jan 2021 16:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC0789561
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jan 2021 16:49:09 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E433920B1F
 for <dri-devel@lists.freedesktop.org>; Sun,  3 Jan 2021 16:49:08 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
 id E1E9A81F02; Sun,  3 Jan 2021 16:49:08 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205675] Display locks up. AMDGPU timeout
Date: Sun, 03 Jan 2021 16:49:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: cru.kilyan@auweek.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-205675-2300-U8UPNZyi7Q@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205675-2300@https.bugzilla.kernel.org/>
References: <bug-205675-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=205675

wrenrte (cru.kilyan@auweek.net) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cru.kilyan@auweek.net

--- Comment #44 from wrenrte (cru.kilyan@auweek.net) ---
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Buffalo-Bills-vs-Miami-Dolphins-live-Stream.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Buffalo-Bills-vs-Miami-Dolphins-live-Stream-01.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Buffalo-Bills-vs-Miami-Dolphins-live-Stream-02.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Buffalo-Bills-vs-Miami-Dolphins-live-Stream-03.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Buffalo-Bills-vs-Miami-Dolphins-live-Stream-04.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Buffalo-Bills-vs-Miami-Dolphins-live-Stream-05.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Buffalo-Bills-vs-Miami-Dolphins-live-Stream-06.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Buffalo-Bills-vs-Miami-Dolphins-live-Stream-07.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Tampa-Bay-Buccaneers-vs-Atlanta-Falcons-Live-Stream.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Tampa-Bay-Buccaneers-vs-Atlanta-Falcons-Live-Stream-01.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Tampa-Bay-Buccaneers-vs-Atlanta-Falcons-Live-Stream-02.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Tampa-Bay-Buccaneers-vs-Atlanta-Falcons-Live-Stream-03.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Tampa-Bay-Buccaneers-vs-Atlanta-Falcons-Live-Stream-04.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Tampa-Bay-Buccaneers-vs-Atlanta-Falcons-Live-Stream-05.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Tampa-Bay-Buccaneers-vs-Atlanta-Falcons-Live-Stream-06.pdf
https://www-dev.medicine.uiowa.edu/sercc/sites/medicine.uiowa.edu.sercc/files/webform/Tampa-Bay-Buccaneers-vs-Atlanta-Falcons-Live-Stream-07.pdf

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
