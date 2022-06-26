Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6BA55ADB5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 02:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242D110E16A;
	Sun, 26 Jun 2022 00:09:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 906D210E16A
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 00:09:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BA5C560023
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 00:09:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E0071C3411C
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jun 2022 00:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656202184;
 bh=5t79iIDl9q5WRfHpIicBRSl2jJ1oGQfvZdHvy3l++/4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BWOLByLlWZPYPjdU8aWQI4eec13AwanS/LY/Jb3cdp6oV8lMQe67nwncbRGmVkq7F
 ZqiTYbDd5MO3mg0Y6Uf7azfiFaZ7l9yIO0kogBwWUzNPRwqlV9wJdc/HrXTXD8PjKo
 0+QcUPs1H27MNyWPIMc7sotsCFmds8CWK+pWCedopQs8NvSXzEXHRVVjrLlFW1Opz+
 qXURSMRpINrGZa2/Vrj9jh5S+wnnaBtjehLNIopRHlrcdjmaM8IQ8JDKpMKIQBus/d
 /MsKmCaj+Hi6FaOYXyju/ZehBLnuuptD0lHwCA4etUF/AllQvn/DbQJe5lP8Dostmp
 P/nTd92ZHmrLQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C6A9FCAC6E2; Sun, 26 Jun 2022 00:09:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216173] amdgpu [gfxhub] page fault (src_id:0 ring:173 vmid:1
 pasid:32769, for process Xorg pid 2994 thread Xorg:cs0 pid 3237)
Date: Sun, 26 Jun 2022 00:09:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: witold.baryluk+kernel@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216173-2300-5kfnTtaduH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216173-2300@https.bugzilla.kernel.org/>
References: <bug-216173-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216173

--- Comment #8 from Witold Baryluk (witold.baryluk+kernel@gmail.com) ---
# cat /sys/kernel/debug/dri/0/amdgpu_firmware_info=20
VCE feature version: 0, firmware version: 0x00000000
UVD feature version: 0, firmware version: 0x00000000
MC feature version: 0, firmware version: 0x00000000
ME feature version: 38, firmware version: 0x0000003e
PFP feature version: 38, firmware version: 0x00000056
CE feature version: 38, firmware version: 0x00000024
RLC feature version: 1, firmware version: 0x0000005b
RLC SRLC feature version: 0, firmware version: 0x00000000
RLC SRLG feature version: 0, firmware version: 0x00000000
RLC SRLS feature version: 0, firmware version: 0x00000000
MEC feature version: 38, firmware version: 0x00000058
MEC2 feature version: 38, firmware version: 0x00000058
SOS feature version: 0, firmware version: 0x00210862
ASD feature version: 553648218, firmware version: 0x2100005a
TA XGMI feature version: 0x00000000, firmware version: 0x2000000b
TA RAS feature version: 0x00000000, firmware version: 0x1b00012a
TA HDCP feature version: 0x00000000, firmware version: 0x1700001f
TA DTM feature version: 0x00000000, firmware version: 0x12000009
TA RAP feature version: 0x00000000, firmware version: 0x0700000e
TA SECUREDISPLAY feature version: 0x00000000, firmware version: 0x00000000
SMC feature version: 0, program: 0, firmware version: 0x003a4700 (58.71.0)
SDMA0 feature version: 52, firmware version: 0x0000004c
SDMA1 feature version: 52, firmware version: 0x0000004c
SDMA2 feature version: 52, firmware version: 0x0000004c
SDMA3 feature version: 52, firmware version: 0x0000004c
VCN feature version: 0, firmware version: 0x0210d02a
DMCU feature version: 0, firmware version: 0x00000000
DMCUB feature version: 0, firmware version: 0x02020003
TOC feature version: 0, firmware version: 0x00000000
VBIOS version: 113-69XB6SSB1-D01

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
