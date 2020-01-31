Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247D14E6DE
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 02:46:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D103A6E113;
	Fri, 31 Jan 2020 01:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3466E113
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 01:46:38 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206351] RX 5600 XT Not Correctly Recognized, Max Memory
 Frequency Below Where it Should Be
Date: Fri, 31 Jan 2020 01:46:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gardotd426@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206351-2300-k2sH7OFzPg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206351-2300@https.bugzilla.kernel.org/>
References: <bug-206351-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206351

--- Comment #5 from Matt McDonald (gardotd426@gmail.com) ---
I'm not referring to the 1750MHz boost clock. I'm referring to the 14Gbps
Memory clock on the same page. Which is 1750MHz (1750Mhz * 8 octopumped GDDR6 =
14Gbps or 14GT/s, which is the stated memory frequency of the card) . Which is
how it's reported in Windows as well. Like explained on here:



https://forums.tomshardware.com/threads/effective-memory-clock-speed-confusions.3518637/ 



and here:
https://www.techpowerup.com/forums/threads/how-to-calculate-gddr6-speed-from-gpu-z.250747/



Literally everything I can find has said to calculate the GDDR6 clock frequency
as DOUBLE(DoubleDataRate, so x2) rate and Quad(x4) pumped, so 1750 * 2 * 4 =
14000, or 14Gbps. The specs for the card itself show it's memory frequency at
14Gbps, which fits everything I've seen. Windows reports the Memory clock (no,
not the Boost clock, they're listed separately) as 1750MHz which also lines up. 




Am I missing something? If I am, I apologize but literally everything I can
find says otherwise. If I am missing something, how does 14Gbps (which is the
official memory clock frequency of the card) end up being 900MHz?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
