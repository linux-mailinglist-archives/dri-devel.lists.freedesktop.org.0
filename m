Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 350C1CC6D3
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 02:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2BE56EC3D;
	Sat,  5 Oct 2019 00:08:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008086EC3D
 for <dri-devel@lists.freedesktop.org>; Sat,  5 Oct 2019 00:08:04 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204241] amdgpu fails to resume from suspend
Date: Sat, 05 Oct 2019 00:08:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Ahzo@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-204241-2300-esr5F7Avf0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204241-2300@https.bugzilla.kernel.org/>
References: <bug-204241-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQyNDEKCkFoem9A
dHV0YW5vdGEuY29tIGNoYW5nZWQ6CgogICAgICAgICAgIFdoYXQgICAgfFJlbW92ZWQgICAgICAg
ICAgICAgICAgICAgICB8QWRkZWQKLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogICAgICAgICAgICAgICAg
IENDfCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8QWh6b0B0dXRhbm90YS5jb20KCi0tLSBD
b21tZW50ICMxNCBmcm9tIEFoem9AdHV0YW5vdGEuY29tIC0tLQpDcmVhdGVkIGF0dGFjaG1lbnQg
Mjg1MzQ5CiAgLS0+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9hdHRhY2htZW50LmNnaT9p
ZD0yODUzNDkmYWN0aW9uPWVkaXQKUGF0Y2ggdG8gcHJldmVudCBmcmVxdWVudCByZXN1bWUgZmFp
bHVyZXMKCldoaWxlIHRoaXMgaXNzdWUgaGFwcGVucyByYXRoZXIgcmFuZG9tbHksIGl0IGNhbiBi
ZSBxdWl0ZSByZWxpYWJseSByZXByb2R1Y2VkCm9uIGxpbnV4IDUuMiBhbmQgbGF0ZXIgYnkgcGVy
Zm9ybWluZyBzdWNjZXNzaXZlIHN1c3BlbmQtcmVzdW1lIGN5Y2xlcy4KVXN1YWxseSB0aGUgZXJy
b3Igb2NjdXJzIGFmdGVyIGxlc3MgdGhhbiAxMCBjeWNsZXMsIGJ1dCBvY2Nhc2lvbmFsbHkgb25s
eSBhZnRlcgptb3JlIHRoYW4gMjAuIFRodXMgb25lIGNhbiB1c2UgdGhlIGZvbGxvd2luZyBjb21t
YW5kIHRvIHJlcHJvZHVjZSBpdCBhbG1vc3QKY2VydGFpbmx5OgokIGZvciBpIGluICQoc2VxIDMw
KTsgZG8gc3VkbyBydGN3YWtlIC1tIG1lbSAtcyA1OyBzbGVlcCAxNTsgZG9uZQoKQSBiaXNlY3Rp
b24gdXNpbmcgdGhpcyBtZXRob2QgbGVhZCB0bzoKY29tbWl0IDUzM2FlZDI3OGFmZWFhNjhiYjVk
MDYwMDg1NmFiMDIyNjhjZmEzYjgKQXV0aG9yOiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdy
b2R6b3Zza3lAYW1kLmNvbT4KRGF0ZTogICBXZWQgTWFyIDYgMTY6MTY6MjggMjAxOSAtMDUwMAoK
ICAgIGRybS9hbWRncHU6IE1vdmUgSUIgcG9vbCBpbml0IGFuZCBmaW5pIHYyCgogICAgUHJvYmxl
bToKICAgIFVzaW5nIFNETUEgZm9yIFRMQiBpbnZhbGlkYXRpb24gaW4gY2VydGFpbiBBU0lDcyBl
eHBvc2VkIGEgcHJvYmxlbQogICAgb2YgSUIgcG9vbCBub3QgYmVpbmcgcmVhZHkgd2hpbGUgU0RN
QSBhbHJlYWR5IHVwIG9uIEluaXQgYW5kIGFscmVhZHkKICAgIHNodXR0IGRvd24gd2hpbGUgU0RN
QSBzdGlsbCBydW5uaW5nIG9uIEZpbmkuIFRoaXMgY2F1c2VkCiAgICBJQiBhbGxvY2F0aW9uIGZh
aWx1cmUuIFRlbXByb2FyeSBmaXggd2FzIGNvbW1pdGVkIGludG8gYQogICAgYnJpbmd1cCBicmFu
Y2ggYnV0IHRoaXMgaXMgdGhlIGdlbmVyaWMgZml4LgoKICAgIEZpeDoKICAgIEluaXQgSUIgcG9v
bCByaWd0aCBhZnRlciBHTUMgaXMgcmVhZHkgYnV0IGJlZm9yZSBTRE1BIGlzIHJlYWR5LgogICAg
RG8gdGggb3Bwb3NpdGUgZm9yIEZpbmkuCgogICAgdjI6IFJlbW92ZSByZXN0cmljdGlvbiBvbiBT
RE1BIGVhcmx5IGluaXQgYW5kIG1vdmUgYW1kZ3B1X2liX3Bvb2xfZmluaQoKICAgIFJldmlld2Vk
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CiAgICBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZXkgR3JvZHpvdnNreSA8YW5kcmV5Lmdyb2R6b3Zza3lAYW1kLmNvbT4K
ICAgIFNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNv
bT4KCgpSZXZlcnRpbmcgdGhpcyBjb21taXQgbWFrZXMgdGhlIHByb2JsZW0gdW5yZXByb2R1Y2li
bGUgd2l0aCBhYm92ZSBjb21tYW5kLgoKQW5vdGhlciB3YXkgdG8gcHJldmVudCB0aGVzZSBmcmVx
dWVudCByZXN1bWUgZmFpbHVyZXMsIHdoaWxlIHByZXNlcnZpbmcgdGhlCmludGVudGlvbiBvZiB0
aGlzIGNvbW1pdCwgaXMgdG8gc2ltcGx5IGNhbGwgYW1kZ3B1X2liX3Bvb2xfaW5pdCBkaXJlY3Rs
eSBhZnRlcgpjYWxsaW5nIGFtZGdwdV91Y29kZV9jcmVhdGVfYm8gaW5zdGVhZCBvZiBkaXJlY3Rs
eSBiZWZvcmUgdGhhdC4gQXR0YWNoZWQgaXMgYQpwYXRjaCBkb2luZyBpdCB0aGF0IHdheS4KCi0t
IApZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKWW91IGFyZSB3YXRjaGluZyB0
aGUgYXNzaWduZWUgb2YgdGhlIGJ1Zy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
