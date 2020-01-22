Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43340145E5B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 23:05:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F446F916;
	Wed, 22 Jan 2020 22:05:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D048A6F916
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2020 22:05:32 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206231] R9 280X low performance with all games
Date: Wed, 22 Jan 2020 22:05:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kentosama@whiteninjastudio.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206231-2300-C8tRYav3hS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206231-2300@https.bugzilla.kernel.org/>
References: <bug-206231-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206231

--- Comment #26 from Jacques Belosoukinski (kentosama@whiteninjastudio.com) ---
Yes !

I forgot to check the output of dmesg | err!

Here are lots of nice messages while playing Tomb Raider :

80456.046410] amdgpu 0000:01:00.0: GPU fault detected: 146 0x0004880c
[80456.046414] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[80456.046416] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0408800C
[80456.046418] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 2) at page 0, read
from '' (0x00000000) (136)
[80456.324714] amdgpu 0000:01:00.0: GPU fault detected: 146 0x0004880c
[80456.324721] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[80456.324723] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0408800C
[80456.324727] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 2) at page 0, read
from '' (0x00000000) (136)
[80456.422582] amdgpu 0000:01:00.0: GPU fault detected: 146 0x0004880c
[80456.422593] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[80456.422599] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0408800C
[80456.422606] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 2) at page 0, read
from '' (0x00000000) (136)
[80473.031594] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000e880c
[80473.031601] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[80473.031605] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0E08800C
[80473.031610] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 7) at page 0, read
from '' (0x00000000) (136)
[80477.432789] amdgpu 0000:01:00.0: GPU fault detected: 146 0x0008880c
[80477.432795] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[80477.432797] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0808800C
[80477.432801] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 4) at page 0, read
from '' (0x00000000) (136)
[80480.828014] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[80480.828025] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[80480.828031] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[80480.828040] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[81054.557056] amdgpu 0000:01:00.0: GPU fault detected: 146 0x0008880c
[81054.557062] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[81054.557064] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0808800C
[81054.557067] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 4) at page 0, read
from '' (0x00000000) (136)
[81054.640152] amdgpu 0000:01:00.0: GPU fault detected: 146 0x0004880c
[81054.640161] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[81054.640165] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0408800C
[81054.640171] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 2) at page 0, read
from '' (0x00000000) (136)
[81054.722106] amdgpu 0000:01:00.0: GPU fault detected: 146 0x0004880c
[81054.722116] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[81054.722120] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0408800C
[81054.722126] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 2) at page 0, read
from '' (0x00000000) (136)
[95566.215198] amdgpu 0000:01:00.0: GPU fault detected: 146 0x0002880c
[95566.215204] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95566.215208] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0208800C
[95566.215212] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 1) at page 0, read
from '' (0x00000000) (136)
[95566.230108] amdgpu 0000:01:00.0: GPU fault detected: 146 0x0002880c
[95566.230114] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95566.230117] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0208800C
[95566.230120] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 1) at page 0, read
from '' (0x00000000) (136)
[95566.278914] amdgpu 0000:01:00.0: GPU fault detected: 146 0x0002880c
[95566.278923] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95566.278927] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0208800C
[95566.278933] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 1) at page 0, read
from '' (0x00000000) (136)
[95566.299712] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95566.299722] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95566.299727] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95566.299733] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95566.318446] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95566.318450] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95566.318451] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95566.318454] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95566.380189] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95566.380193] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95566.380195] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95566.380198] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95566.400966] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95566.400972] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95566.400976] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95566.400980] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95566.420512] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95566.420516] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95566.420518] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95566.420521] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95566.439104] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95566.439111] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95566.439114] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95566.439119] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95566.459230] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95566.459237] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95566.459240] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95566.459245] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95571.227323] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95571.227329] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95571.227333] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95571.227338] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95571.247587] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95571.247594] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95571.247598] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95571.247603] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95571.267222] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95571.267226] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95571.267227] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95571.267233] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95571.287203] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95571.287208] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95571.287210] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95571.287213] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95571.311337] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95571.311343] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95571.311346] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95571.311350] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95571.335510] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95571.335515] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95571.335517] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95571.335520] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95571.357131] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95571.357136] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95571.357138] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95571.357141] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95571.381006] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95571.381014] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95571.381020] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95571.381026] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95571.402502] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95571.402513] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95571.402518] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95571.402525] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)
[95571.424923] amdgpu 0000:01:00.0: GPU fault detected: 146 0x000a880c
[95571.424930] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_ADDR  
0x00000000
[95571.424934] amdgpu 0000:01:00.0:   VM_CONTEXT1_PROTECTION_FAULT_STATUS
0x0A08800C
[95571.424939] amdgpu 0000:01:00.0: VM fault (0x0c, vmid 5) at page 0, read
from '' (0x00000000) (136)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
