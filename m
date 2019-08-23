Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB029A7CB
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 08:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4879D6E03E;
	Fri, 23 Aug 2019 06:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB2A6E03E
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 06:49:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 197327] radeon 0000:01:00.0: failed VCE resume (-110).
Date: Fri, 23 Aug 2019 06:49:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: xtornado@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-197327-2300-SaPT2iSrfz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-197327-2300@https.bugzilla.kernel.org/>
References: <bug-197327-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0xOTczMjcKCnh0b3Ju
YWRvICh4dG9ybmFkb0BnbWFpbC5jb20pIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJl
bW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAg
ICAgICAgICAgICAgIENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8eHRvcm5hZG9AZ21h
aWwuY29tCgotLS0gQ29tbWVudCAjMTAgZnJvbSB4dG9ybmFkbyAoeHRvcm5hZG9AZ21haWwuY29t
KSAtLS0KSGkKCkkgZ2V0IHNhbWUgZXJyb3IgbWVzc2FnZSBvbiBteSBsYXB0b3AgSFAgODUwIEcy
CgoKdW5hbWUgLWEKTGludXggRWxpdGVCb29rIDUuMC4wLTI1LWdlbmVyaWMgIzI2fjE4LjA0LjEt
VWJ1bnR1IFNNUCBUaHUgQXVnIDEgMTM6NTE6MDIgVVRDCjIwMTkgeDg2XzY0IHg4Nl82NCB4ODZf
NjQgR05VL0xpbnV4CgoKCmxzcGNpIHwgZ3JlcCAtZSBWR0EgLWUgM0QKCjAwOjAyLjAgVkdBIGNv
bXBhdGlibGUgY29udHJvbGxlcjogSW50ZWwgQ29ycG9yYXRpb24gSEQgR3JhcGhpY3MgNTUwMCAo
cmV2IDA5KQowNDowMC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IEFkdmFuY2VkIE1pY3Jv
IERldmljZXMsIEluYy4gW0FNRC9BVEldIE9wYWwKUFJPIFtSYWRlb24gUjcgTTI2MFhdCgoKeHJh
bmRyIC0tbGlzdHByb3ZpZGVycwoKUHJvdmlkZXJzOiBudW1iZXIgOiAyClByb3ZpZGVyIDA6IGlk
OiAweDZjIGNhcDogMHg5LCBTb3VyY2UgT3V0cHV0LCBTaW5rIE9mZmxvYWQgY3J0Y3M6IDMgb3V0
cHV0czogOAphc3NvY2lhdGVkIHByb3ZpZGVyczogMSBuYW1lOm1vZGVzZXR0aW5nClByb3ZpZGVy
IDE6IGlkOiAweDQxIGNhcDogMHg2LCBTaW5rIE91dHB1dCwgU291cmNlIE9mZmxvYWQgY3J0Y3M6
IDIgb3V0cHV0czogMAphc3NvY2lhdGVkIHByb3ZpZGVyczogMSBuYW1lOk9MQU5EIEAgcGNpOjAw
MDA6MDQ6MDAuMAoKCmxzcGNpIC1ubmsgfCBncmVwIC1BMyAtRSAiVkdBfDNEIgoKCjAwOjAyLjAg
VkdBIGNvbXBhdGlibGUgY29udHJvbGxlciBbMDMwMF06IEludGVsIENvcnBvcmF0aW9uIEhEIEdy
YXBoaWNzIDU1MDAKWzgwODY6MTYxNl0gKHJldiAwOSkKICAgICAgICBTdWJzeXN0ZW06IEhld2xl
dHQtUGFja2FyZCBDb21wYW55IFpCb29rIDE1dSBHMiBNb2JpbGUgV29ya3N0YXRpb24KWzEwM2M6
MjIxNl0KICAgICAgICBLZXJuZWwgZHJpdmVyIGluIHVzZTogaTkxNQogICAgICAgIEtlcm5lbCBt
b2R1bGVzOiBpOTE1Ci0tCjA0OjAwLjAgVkdBIGNvbXBhdGlibGUgY29udHJvbGxlciBbMDMwMF06
IEFkdmFuY2VkIE1pY3JvIERldmljZXMsIEluYy4KW0FNRC9BVEldIE9wYWwgUFJPIFtSYWRlb24g
UjcgTTI2MFhdIFsxMDAyOjY2MDVdCiAgICAgICAgU3Vic3lzdGVtOiBIZXdsZXR0LVBhY2thcmQg
Q29tcGFueSBPcGFsIFBSTyBbUmFkZW9uIFI3IE0yNjBdClsxMDNjOjIyNThdCiAgICAgICAgS2Vy
bmVsIGRyaXZlciBpbiB1c2U6IHJhZGVvbgogICAgICAgIEtlcm5lbCBtb2R1bGVzOiByYWRlb24s
IGFtZGdwdQoKCgoKZG1lc2cgLWwgZXJyCgpbICAgIDQuMTcwMTYxXSBpbWE6IEVycm9yIENvbW11
bmljYXRpbmcgdG8gVFBNIGNoaXAKWyAgICA0LjE3NDEyMl0gaW1hOiBFcnJvciBDb21tdW5pY2F0
aW5nIHRvIFRQTSBjaGlwClsgICAgNC4xNzgyMDNdIGltYTogRXJyb3IgQ29tbXVuaWNhdGluZyB0
byBUUE0gY2hpcApbICAgIDQuMTgyNzMyXSBpbWE6IEVycm9yIENvbW11bmljYXRpbmcgdG8gVFBN
IGNoaXAKWyAgICA0LjE4NjY3MF0gaW1hOiBFcnJvciBDb21tdW5pY2F0aW5nIHRvIFRQTSBjaGlw
ClsgICAgNC4xOTA3MDJdIGltYTogRXJyb3IgQ29tbXVuaWNhdGluZyB0byBUUE0gY2hpcApbICAg
IDQuMTk0NzA5XSBpbWE6IEVycm9yIENvbW11bmljYXRpbmcgdG8gVFBNIGNoaXAKWyAgICA0LjE5
OTI3OV0gaW1hOiBFcnJvciBDb21tdW5pY2F0aW5nIHRvIFRQTSBjaGlwClsgICAgOC4wNTAxNjld
IHJhZGVvbiAwMDAwOjA0OjAwLjA6IGZhaWxlZCBWQ0UgcmVzdW1lICgtMTEwKS4KWyAgIDU0LjMy
MDM1Ml0gcmFkZW9uIDAwMDA6MDQ6MDAuMDogZmFpbGVkIFZDRSByZXN1bWUgKC0xMTApLgpbICA0
MjkuODQ3NDQxXSByYWRlb24gMDAwMDowNDowMC4wOiBmYWlsZWQgVkNFIHJlc3VtZSAoLTExMCku
CgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hp
bmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
