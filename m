Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A9A92544
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 15:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774C3891DB;
	Mon, 19 Aug 2019 13:39:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8646E129
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 13:39:27 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id B665828814
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 13:39:27 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id A98C12882F; Mon, 19 Aug 2019 13:39:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Mon, 19 Aug 2019 13:39:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nicholas.kazlauskas@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-YnHgGnm4wE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-204181-2300@https.bugzilla.kernel.org/>
References: <bug-204181-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQxODEKCi0tLSBD
b21tZW50ICMzMyBmcm9tIE5pY2hvbGFzIEthemxhdXNrYXMgKG5pY2hvbGFzLmthemxhdXNrYXNA
YW1kLmNvbSkgLS0tCkkoSW4gcmVwbHkgdG8gU2VyZ2V5IEtvbmRha292IGZyb20gY29tbWVudCAj
MjYpCj4gQ3JlYXRlZCBhdHRhY2htZW50IDI4NDA4MyBbZGV0YWlsc10KPiBkbWVzZ18yMDE5LTA4
LTAyLWFtZGdwdV9mYWlsX29uX3BhdGNoZWRfNS4yLjUKPiAKPiAoSW4gcmVwbHkgdG8gTmljaG9s
YXMgS2F6bGF1c2thcyBmcm9tIGNvbW1lbnQgIzI0KQo+ID4gVGhpcyBzaG91bGQgYmUgZml4ZWQg
d2l0aCB0aGUgc2VyaWVzIGxpbmtlZCBiZWxvdzoKPiA+IAo+ID4gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NDUwNS8KPiA+IAo+ID4gQnV0IGl0IHN0aWxsIG5lZWRz
IHJldmlldyBhbmQgYmFja3BvcnRpbmcgdG8gb2xkZXIga2VybmVscy4KPiAKPiBDZWxlYnJhdGlv
biBtaWdodCBoYXZlIGJlZW4gcHJlbWF0dXJlLiBIb3VycyBsYXRlciBJJ3ZlIGdvdCBhbm90aGVy
IGZyZWV6ZQo+IHdpdGggZGlmZmVyZW50IGVycm9yIGluIGFtZGdwdS4gT25seSB0aGlzIHRpbWUs
IG1vdXNlIGN1cnNvciB3YXMgbW92YWJsZQo+IG92ZXIgZnJvemVuIGZyYW1lIHJpZ2h0IHVudGls
IEkgdHJpZWQgc3dpdGNoaW5nIFZULiBIZXJlJ3MgdHJhY2U6Cj4gQlVHOiB1bmFibGUgdG8gaGFu
ZGxlIHBhZ2UgZmF1bHQgZm9yIGFkZHJlc3M6IDAwMDAwMDA4MDAwMDAxODQKPiAjUEY6IHN1cGVy
dmlzb3IgcmVhZCBhY2Nlc3MgaW4ga2VybmVsIG1vZGUKPiAjUEY6IGVycm9yX2NvZGUoMHgwMDAw
KSAtIG5vdC1wcmVzZW50IHBhZ2UKPiBQR0QgMCBQNEQgMCAKPiBPb3BzOiAwMDAwIFsjMV0gUFJF
RU1QVCBTTVAgTk9QVEkKPiBDUFU6IDIgUElEOiAyMTA0NCBDb21tOiBrd29ya2VyL3UxNjowIFRh
aW50ZWQ6IEcgICAgICAgIFcgSU8gICAgIAo+IDUuMi41LTEzOTYuZzc5YjZhOWMtSFNGICMxIG9w
ZW5TVVNFIFR1bWJsZXdlZWQgKHVucmVsZWFzZWQpCj4gSGFyZHdhcmUgbmFtZTogR2lnYWJ5dGUg
VGVjaG5vbG9neSBDby4sIEx0ZC4gR0EtOTkwWEEtVUQzL0dBLTk5MFhBLVVEMywgQklPUwo+IEYx
NGUgMDkvMDkvMjAxNAo+IFdvcmtxdWV1ZTogZXZlbnRzX3VuYm91bmQgY29tbWl0X3dvcmsKPiBS
SVA6IDAwMTA6YW1kZ3B1X2RtX2F0b21pY19jb21taXRfdGFpbCsweDJlNi8weGQ2MCBbYW1kZ3B1
XQoKQXJlIHlvdSBhYmxlIHRvIGNvbnNpc3RlbnRseSByZXByb2R1Y2UgdGhpcyBpc3N1ZT8gSXMg
aXQgdGhlIHNhbWUgc2V0dXAgYW5kCnNhbWUgY29uZGl0aW9ucyBhcyBiZWZvcmU/IEkgaGF2ZW4n
dCBiZWVuIGFibGUgdG8gc2VlIGl0IGluIG15IHRlc3RpbmcgYXQKbGVhc3QuCgotLSAKWW91IGFy
ZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6CllvdSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2ln
bmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
