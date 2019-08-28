Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288769F7FB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 03:48:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B4FF89C08;
	Wed, 28 Aug 2019 01:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB32389C08
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 01:48:51 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204227] Visual artefacts and crash from suspend on amdgpu
Date: Wed, 28 Aug 2019 01:48:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tones111@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204227-2300-gpU8JoR6KD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204227-2300@https.bugzilla.kernel.org/>
References: <bug-204227-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: mail.kernel.org; dkim=permerror (bad
 message/signature format)
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyMjcKCi0tLSBD
b21tZW50ICM5IGZyb20gdG9uZXMxMTFAaG90bWFpbC5jb20gLS0tCihJbiByZXBseSB0byB0b25l
czExMSBmcm9tIGNvbW1lbnQgIzgpCj4gSSBhcHBsaWVkIHRoaXMgdG8gNS4yLjEwIGFuZCBJJ20g
c3RpbGwgc2VlaW5nIGFydGlmYWN0cy4KClNvcnJ5LCBJIHJlYWxpemVkIHRoYXQgc3RhdGVtZW50
IGRvZXNuJ3QgZ2l2ZSBtdWNoIGNvbnRleHQgdG8gd29yayB3aXRoLiAgTXkKc3lzdGVtIGhhcyBh
biBSNSAyNTAwVS4gIGxzcGNpIHNob3dzIHRoZSBmb2xsb3dpbmc6CgowNTowMC4wIFZHQSBjb21w
YXRpYmxlIGNvbnRyb2xsZXI6IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4gW0FNRC9BVEld
IFJhdmVuClJpZGdlIFtSYWRlb24gVmVnYSBTZXJpZXMgLyBSYWRlb24gVmVnYSBNb2JpbGUgU2Vy
aWVzXSAocmV2IGM0KSAocHJvZy1pZiAwMApbVkdBIGNvbnRyb2xsZXJdKQogICAgICAgIFN1YnN5
c3RlbTogTGVub3ZvIFJhdmVuIFJpZGdlIFtSYWRlb24gVmVnYSBTZXJpZXMgLyBSYWRlb24gVmVn
YSBNb2JpbGUKU2VyaWVzXQogICAgICAgIEZsYWdzOiBidXMgbWFzdGVyLCBmYXN0IGRldnNlbCwg
bGF0ZW5jeSAwLCBJUlEgNTEKICAgICAgICBNZW1vcnkgYXQgYjAwMDAwMDAgKDY0LWJpdCwgcHJl
ZmV0Y2hhYmxlKSBbc2l6ZT0yNTZNXQogICAgICAgIE1lbW9yeSBhdCBjMDAwMDAwMCAoNjQtYml0
LCBwcmVmZXRjaGFibGUpIFtzaXplPTJNXQogICAgICAgIEkvTyBwb3J0cyBhdCAxMDAwIFtzaXpl
PTI1Nl0KICAgICAgICBNZW1vcnkgYXQgYzA2MDAwMDAgKDMyLWJpdCwgbm9uLXByZWZldGNoYWJs
ZSkgW3NpemU9NTEyS10KICAgICAgICBDYXBhYmlsaXRpZXM6IFs0OF0gVmVuZG9yIFNwZWNpZmlj
IEluZm9ybWF0aW9uOiBMZW49MDggPD8+CiAgICAgICAgQ2FwYWJpbGl0aWVzOiBbNTBdIFBvd2Vy
IE1hbmFnZW1lbnQgdmVyc2lvbiAzCiAgICAgICAgQ2FwYWJpbGl0aWVzOiBbNjRdIEV4cHJlc3Mg
TGVnYWN5IEVuZHBvaW50LCBNU0kgMDAKICAgICAgICBDYXBhYmlsaXRpZXM6IFthMF0gTVNJOiBF
bmFibGUrIENvdW50PTEvNCBNYXNrYWJsZS0gNjRiaXQrCiAgICAgICAgQ2FwYWJpbGl0aWVzOiBb
YzBdIE1TSS1YOiBFbmFibGUtIENvdW50PTMgTWFza2VkLQogICAgICAgIENhcGFiaWxpdGllczog
WzEwMF0gVmVuZG9yIFNwZWNpZmljIEluZm9ybWF0aW9uOiBJRD0wMDAxIFJldj0xIExlbj0wMTAK
PD8+CiAgICAgICAgQ2FwYWJpbGl0aWVzOiBbMjAwXSBSZXNpemFibGUgQkFSIDw/PgogICAgICAg
IENhcGFiaWxpdGllczogWzI3MF0gU2Vjb25kYXJ5IFBDSSBFeHByZXNzIDw/PgogICAgICAgIENh
cGFiaWxpdGllczogWzJiMF0gQWRkcmVzcyBUcmFuc2xhdGlvbiBTZXJ2aWNlIChBVFMpCiAgICAg
ICAgQ2FwYWJpbGl0aWVzOiBbMmMwXSBQYWdlIFJlcXVlc3QgSW50ZXJmYWNlIChQUkkpCiAgICAg
ICAgQ2FwYWJpbGl0aWVzOiBbMmQwXSBQcm9jZXNzIEFkZHJlc3MgU3BhY2UgSUQgKFBBU0lEKQog
ICAgICAgIENhcGFiaWxpdGllczogWzMyMF0gTGF0ZW5jeSBUb2xlcmFuY2UgUmVwb3J0aW5nCiAg
ICAgICAgS2VybmVsIGRyaXZlciBpbiB1c2U6IGFtZGdwdQogICAgICAgIEtlcm5lbCBtb2R1bGVz
OiBhbWRncHUKCi0tIApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFy
ZSB3YXRjaGluZyB0aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
