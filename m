Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99503D8155
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 22:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 113FE6E09A;
	Tue, 15 Oct 2019 20:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED026E09A
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 20:51:35 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205169] AMDGPU driver with Navi card hangs Xorg in fullscreen
 only.
Date: Tue, 15 Oct 2019 20:51:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: drjoms@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205169-2300-oPiPx6bBca@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205169-2300@https.bugzilla.kernel.org/>
References: <bug-205169-2300@https.bugzilla.kernel.org/>
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

aHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDUxNjkKCi0tLSBD
b21tZW50ICMxMiBmcm9tIERtaXRyaSBTZWxldHNraSAoZHJqb21zQGdtYWlsLmNvbSkgLS0tCihJ
biByZXBseSB0byBEbWl0cmkgU2VsZXRza2kgZnJvbSBjb21tZW50ICMxMSkKPiAoSW4gcmVwbHkg
dG8gUGllcnJlLUVyaWMgUGVsbG91eC1QcmF5ZXIgZnJvbSBjb21tZW50ICMxMCkKPiA+ICJnaXQg
YmlzZWN0IiBpZGVudGlmaWVzIHRoaXMgY29tbWl0IGFzIHRoZSBwcm9ibGVtYXRpYyBvbmU6IDYx
NzA4OWQ1ODM3YQo+ID4gKCJkcm0vYW1kL2Rpc3BsYXk6IHJldmVydCB3YWl0IGluIHBpcGVsb2Nr
IikuCj4gPiAKPiA+IFJldmVydGluZyB0aGlzIGNvbW1pdCBvbiB0b3Agb2YgYW1kLXN0YWdpbmct
ZHJtLW5leHQgc2VlbXMgdG8gd29yayBmaW5lLgo+IAo+IHVuYW1lIC1hCj4gTGludXggKG5vbmUp
ZGlta28ncyBEZXNrdG9wIDUuMy4wLXJjMysgIzMgU01QIFBSRUVNUFQgTW9uIE9jdCAxNCAyMDo0
OTowMgo+IElTVCAyMDE5IHg4Nl82NCBBTUQgUnl6ZW4gNSAxNjAwIFNpeC1Db3JlIFByb2Nlc3Nv
ciBBdXRoZW50aWNBTUQgR05VL0xpbnV4Cj4gCj4gCj4gZ2l0IGNoZWNrb3V0IDYxNzA4OWQ1ODM3
YV4KPiAKPiBJc3N1ZSBubyBsb25nZXIgaGFwcGVucwo+IAo+IE1ham9yIGRvd25ncmFkZSwgYnV0
IG5vIG1vcmUgcHJvYmxlbS4KPiBXaGljaCBjb21taXQgY2FuIEkgdXNlIHRvIHNvbHZlIHRoaXMg
aXNzdWU/Cj4gCj4gQnVnIDIwNTE2OSAtIEFNREdQVSBkcml2ZXIgd2l0aCBOYXZpIGNhcmQgaGFu
Z3MgWG9yZyBpbiBmdWxsc2NyZWVuIG9ubHkuCj4gKGVkaXQpIAo+IGh0dHBzOi8vYnVnemlsbGEu
a2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjA0NzI1Cj4gCj4gU29ycnkgdGhhdCBJIHRha2Ug
YWR2YW50YWdlIG9mIHlvdSBoZXJlLgo+IEkgd2lsbCB0cnkgdG8gZmluZCA1LjMuMCBjb21taXQu
IEkgYW0gbmV3IGludG8gYWxsIHRoaXMgc3R1ZmYuCgp3aXRoIHJlZ2FyZHMgdG8gdGhhdCBvdGhl
ciBidWcuIEl0J3MgdGhlcmUgc2luY2UgbW9tZW50IHdoZW4gTmF2aSBkcml2ZXIgd2FzCmZpcnN0
IGludHJvZHVjZWQuCgotLSAKWW91IGFyZSByZWNlaXZpbmcgdGhpcyBtYWlsIGJlY2F1c2U6Cllv
dSBhcmUgd2F0Y2hpbmcgdGhlIGFzc2lnbmVlIG9mIHRoZSBidWcuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
