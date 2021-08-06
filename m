Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1633E1FDA
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 02:17:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70AB6E8EF;
	Fri,  6 Aug 2021 00:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB4246E8EF
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 00:17:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 8C4A361166
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 00:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628209037;
 bh=qHefvVU1PDjkiOJwl6RbItfSWb0WYWN1EwnfDBobPmM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NHt8bWAlosKz+JoCoHzdjGYrMWFAYAlD5xj0tiHMpUWZWqQWGEgKG8HzebJpwxKLD
 Rjo76FjCbMKrbPyr2dEtBlKlREW3OygNhn+aFSzEjHReCdxRHoizYnVAEWyeNAjb7w
 R13Gnp3pzRK4Zjg622dfEcpegMRmlsRciN+vHYbjIxjBkyQvk8tX0RAxVbLmIHImmQ
 /nkllxsyMZeR3DJnp6wLyS4QJ5m9kVxtJ1qIVQUqwavpPAjwrrM62HSTvS7JJBZiC5
 jv+shMFP+wr5sUdyqHQBo2fmQnk+hEeHbb8k0s1TfzqDtsd/71wcJH+iplmGI/0x7P
 rPmXN5uY2PVjQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7D67460F6F; Fri,  6 Aug 2021 00:17:17 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213201] [KAVERI] memory leak - unreferenced object
 0xffff8881700cf988 (size 56)
Date: Fri, 06 Aug 2021 00:17:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-213201-2300-8DUCV13TEO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213201-2300@https.bugzilla.kernel.org/>
References: <bug-213201-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213201

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #297921|0                           |1
        is obsolete|                            |

--- Comment #13 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298219
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298219&action=3Dedit
output of /sys/kernel/debug/kmemleak (kernel 5.14-rc4)

Same board, another CPU:

unreferenced object 0xffff888102e48bd0 (size 56):
  comm "systemd-udevd", pid 199, jiffies 4294881489 (age 3502.134s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 0d 01 70 00 00 00 00 00  ..........p.....
    7b 5d 02 00 00 c9 ff ff 00 00 00 00 00 00 00 00  {]..............
  backtrace:
    [<ffffffff9e33706e>] kmem_cache_alloc+0x109/0x132
    [<ffffffff9e92d8aa>] acpi_ps_alloc_op+0x8b/0x1c4
    [<ffffffff9e92aa44>] acpi_ps_create_op+0x4b1/0x8ec
    [<ffffffff9e92954f>] acpi_ps_parse_loop+0x401/0x1062
    [<ffffffff9e92c7f7>] acpi_ps_parse_aml+0x1cd/0x6fa
    [<ffffffff9e92e327>] acpi_ps_execute_method+0x51f/0x57b
    [<ffffffff9e91defb>] acpi_ns_evaluate+0x64c/0x886
    [<ffffffff9e925ec9>] acpi_evaluate_object+0x335/0x690
    [<ffffffffc112c200>] amdgpu_atcs_call.constprop.0+0x141/0x1bd [amdgpu]
    [<ffffffffc112c759>] amdgpu_atcs_pci_probe_handle.isra.0+0x147/0x2a1
[amdgpu]
    [<ffffffffc112d769>] amdgpu_acpi_detect+0xd1/0x38e [amdgpu]
    [<ffffffffc1c0c0aa>] 0xffffffffc1c0c0aa
    [<ffffffff9e0006b7>] do_one_initcall+0xe0/0x1fc
    [<ffffffff9e18517d>] do_init_module+0x1c1/0x584
    [<ffffffff9e18a561>] load_module+0x4ea2/0x5cc6
    [<ffffffff9e18b643>] __do_sys_finit_module+0xf6/0x145
unreferenced object 0xffff888102e48480 (size 56):
  comm "systemd-udevd", pid 199, jiffies 4294881489 (age 3502.134s)
  hex dump (first 32 bytes):
    d0 8b e4 02 81 88 ff ff 0d 01 2d 00 00 00 00 00  ..........-.....
    7c 5d 02 00 00 c9 ff ff 00 00 00 00 00 00 00 00  |]..............
  backtrace:
    [<ffffffff9e33706e>] kmem_cache_alloc+0x109/0x132
    [<ffffffff9e92d8aa>] acpi_ps_alloc_op+0x8b/0x1c4
    [<ffffffff9e92aa44>] acpi_ps_create_op+0x4b1/0x8ec
    [<ffffffff9e92954f>] acpi_ps_parse_loop+0x401/0x1062
    [<ffffffff9e92c7f7>] acpi_ps_parse_aml+0x1cd/0x6fa
    [<ffffffff9e92e327>] acpi_ps_execute_method+0x51f/0x57b
    [<ffffffff9e91defb>] acpi_ns_evaluate+0x64c/0x886
    [<ffffffff9e925ec9>] acpi_evaluate_object+0x335/0x690
    [<ffffffffc112c200>] amdgpu_atcs_call.constprop.0+0x141/0x1bd [amdgpu]
    [<ffffffffc112c759>] amdgpu_atcs_pci_probe_handle.isra.0+0x147/0x2a1
[amdgpu]
    [<ffffffffc112d769>] amdgpu_acpi_detect+0xd1/0x38e [amdgpu]
    [<ffffffffc1c0c0aa>] 0xffffffffc1c0c0aa
    [<ffffffff9e0006b7>] do_one_initcall+0xe0/0x1fc
    [<ffffffff9e18517d>] do_init_module+0x1c1/0x584
    [<ffffffff9e18a561>] load_module+0x4ea2/0x5cc6
    [<ffffffff9e18b643>] __do_sys_finit_module+0xf6/0x145

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
