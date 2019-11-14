Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23837FC074
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 08:04:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24F4C6E109;
	Thu, 14 Nov 2019 07:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAD26E109
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 07:03:29 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205523] New: AMDGPU display lockup during boot with 5.4 RC on
 Ryzen 2700u
Date: Thu, 14 Nov 2019 07:03:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: briancschott@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-205523-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDU1MjMKCiAgICAg
ICAgICAgIEJ1ZyBJRDogMjA1NTIzCiAgICAgICAgICAgU3VtbWFyeTogQU1ER1BVIGRpc3BsYXkg
bG9ja3VwIGR1cmluZyBib290IHdpdGggNS40IFJDIG9uIFJ5emVuCiAgICAgICAgICAgICAgICAg
ICAgMjcwMHUKICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzCiAgICAgICAgICAgVmVyc2lvbjog
Mi41CiAgICBLZXJuZWwgVmVyc2lvbjogNS40LjAtcmM3CiAgICAgICAgICBIYXJkd2FyZTogeDg2
LTY0CiAgICAgICAgICAgICAgICBPUzogTGludXgKICAgICAgICAgICAgICBUcmVlOiBNYWlubGlu
ZQogICAgICAgICAgICBTdGF0dXM6IE5FVwogICAgICAgICAgU2V2ZXJpdHk6IG5vcm1hbAogICAg
ICAgICAgUHJpb3JpdHk6IFAxCiAgICAgICAgIENvbXBvbmVudDogVmlkZW8oRFJJIC0gbm9uIElu
dGVsKQogICAgICAgICAgQXNzaWduZWU6IGRyaXZlcnNfdmlkZW8tZHJpQGtlcm5lbC1idWdzLm9z
ZGwub3JnCiAgICAgICAgICBSZXBvcnRlcjogYnJpYW5jc2Nob3R0QGdtYWlsLmNvbQogICAgICAg
IFJlZ3Jlc3Npb246IE5vCgpDcmVhdGVkIGF0dGFjaG1lbnQgMjg1OTA3CiAgLS0+IGh0dHBzOi8v
YnVnemlsbGEua2VybmVsLm9yZy9hdHRhY2htZW50LmNnaT9pZD0yODU5MDcmYWN0aW9uPWVkaXQK
am91cm5hbGN0bCBvdXRwdXQKCkknbSBnZXR0aW5nIGEgYmxhY2sgc2NyZWVuIG9uIGJvb3Qgd2hl
biB0ZXN0aW5nIHRoZSA1LjQgcmVsZWFzZSBjYW5kaWRhdGUKa2VybmVscyBvbiBhIERlbGwgSW5z
cGlyb24gNzM3NSBsYXB0b3AuIFRoZSBzeXN0ZW0gcmVzcG9uZHMgdG8gdGhlIG1hZ2ljIHN5c3Jx
LApzbyB0aGUga2VybmVsIGlzIG5vdCBjb21wbGV0ZWx5IGRlYWQsIGJ1dCB0aGUgZGlzcGxheSBp
cy4gVGhlIHN5c3RlbSBib290cwpjb3JyZWN0bHkgd2l0aCBhIDUuMy4xIGtlcm5lbC4gVGhlIGxv
ZyBzaG93aW5nIHRoZSBzdGFjayB0cmFjZSBpcyBhdHRhY2hlZC4KSSdsbCBzdGFydCB3b3JraW5n
IG9uIGJpc2VjdGluZyB0aGUgcHJvYmxlbSBzb29uLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRo
aXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVn
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
