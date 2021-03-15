Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 660B733C829
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 22:06:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD966E1B8;
	Mon, 15 Mar 2021 21:06:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3B46E1B8
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 21:06:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 652BC64F37
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615842414;
 bh=PbczC/cq2V9Mr8ki0ixvXW375buhvcOh4CaL53RkQjM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MnWJChKNuyBGLPA/O6NmUePJY8k0xqq4WPj0EYJyjhQQ+dg45cPkmVOYMpKk1gbDw
 kUPEl2iITbBPUDWep+7j+5Y2ppE7Vf1x47uBzc2ltVKc3o5jVIIHGMZ4J9HU75jVly
 d4eH10NdyDSog/5o+n/XLvSMUC0xJZxU7V3XEjLDJSBgwRForEl4JItchuTQOJw/vq
 Un5GX3acfzK33SltrAEWXm4wg5l4hnGlAx5EQ0t5gW9MdKJSSIXpLb7vl95TPacIG3
 kDh/sYFRAdr+ncXBgqIn/cPWalJS/sZ8YxAM68Db4E2/zDLgOhM6OlajRwwy0n1YGa
 TO+2F2XNft/MQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5633865350; Mon, 15 Mar 2021 21:06:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAyMTIyNzldIEFNREdQVSBkb2VzbuKAmXQgZXhwb3NlIGFu?=
 =?UTF-8?B?eSB3YXkgb2Ygc2V0dGluZyB0aGUgZnVsbCBSR0IgcmFuZ2UgW3J5emVuKyBt?=
 =?UTF-8?B?b2JpbGVd?=
Date: Mon, 15 Mar 2021 21:06:53 +0000
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
Message-ID: <bug-212279-2300-GrB7M7JcSp@https.bugzilla.kernel.org/>
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

--- Comment #3 from Neil (ledufff@hotmail.com) ---
Created attachment 295875
  --> https://bugzilla.kernel.org/attachment.cgi?id=295875&action=edit
edited edid with wxedid

Got it!
I failed at editing the file first because it was a 0 byte file (didn't had my
TV connected lol!)
So.  I followed this video https://www.youtube.com/watch?v=tYYMiX7dlak
And basically did the following in my debian sid partition (I will describe it
for anyone interested): 

To find my TV edid
$ find /sys/devices/pci*/ -name edid 
Grab/copy the desired edid file to my home folder
$ cp
/sys/devices/pci0000:00/0000:00:08.1/0000:05:00.0/drm/card0/card0-HDMI-A-1/edid
~/edid.bin

Then edited that file with wxedid to change the following:
SPF: Supported features = vsig_format to 0b00
CHD: CEA-861 header = YCbCr 4:2:2 to 0
CHD: CEA-861 header = YCbCr 4:4:4 to 0
VSD: Vendor Specific Data Block = DC_Y444 to 0

Then before saving the file I clicked Options > Recalc checksum (otherwise the
system will not use your edited edid!), after that I did saved the file, and
copied that new modified edid file to /lib/firmware/edid/edid.bin 
To use the new edid, I added
'drm_kms_helper.edid_firmware=HDMI-A-1:edid/edid.bin' to /etc/default/grub (to
the line GRUB_CMDLINE_LINUX="foo")
updated initramfs with 'sudo update-initramfs -u' and then updated grub as well
with 'sudo update-grub'.

Note:  I compiled the latest wxedid from sourceforge, and, 'options > recalc
checksum' option is MISSING at least for me.  That's why the process was
failing for me.  Luckily for me debian has a wxedid in their repo that has the
recalc checksum option.  


Now...  bit of work ain't it?  I don't know if this happens because of my TV, 
I haven't tried with other monitors/televisions.  But a bit of improvement in
the matter would be GREAT.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
