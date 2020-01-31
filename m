Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A38614F226
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 19:28:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801556FBD6;
	Fri, 31 Jan 2020 18:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A054E6FBD6
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 18:28:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206351] RX 5600 XT Not Correctly Recognized, Max Memory
 Frequency Below Where it Should Be
Date: Fri, 31 Jan 2020 18:28:30 +0000
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
Message-ID: <bug-206351-2300-Bgaqrzw45Z@https.bugzilla.kernel.org/>
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

--- Comment #7 from Matt McDonald (gardotd426@gmail.com) ---
Ahhh I understand now. So, just to recap and make sure everything is covered...

- The new firmware for the new vBIOS is in QA right now but available for
download (which I've tested, it seems to work for me).

- The Memory clock is correct, but it's the true clock and not the effective
speed

- The marketing strings required for the card to properly be recognized (and
recognized as a 5600 XT as opposed to a 5700/5700 XT) for Vulkan/OpenGL/etc.
are currently being worked on/added?

- This wasn't mentioned in the initial report but I'm assuming the lack of
memory voltage reporting is just an aspect of Navi? For example, Polaris cards
provide a core frequency and a voltage for both the memory and core, but with
Navi it just provides a vddc curve (which is for some reason listed as 0mV for
every state), but I've heard this is just down to Navi. Is this true, or will
we at some point be able to see (and potentially set) voltages for memory (and
individual core states)?

- And finally, there are some rendering issues in certain games that did not
exist with the same drivers with my Polaris card (even with the new firmware).
Are these bugs that should be reported to Mesa, or the amdgpu kernel devs?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
