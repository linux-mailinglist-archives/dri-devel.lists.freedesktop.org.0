Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B9F92810
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D86616E1AA;
	Mon, 19 Aug 2019 15:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B0DE6E1AA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 15:11:15 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 6645D28497
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 15:11:15 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 5AEC0288BE; Mon, 19 Aug 2019 15:11:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Mon, 19 Aug 2019 15:11:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: virtuousfox@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-204181-2300-kTg8iZmTBH@https.bugzilla.kernel.org/>
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
b21tZW50ICMzNCBmcm9tIFNlcmdleSBLb25kYWtvdiAodmlydHVvdXNmb3hAZ21haWwuY29tKSAt
LS0KKEluIHJlcGx5IHRvIE5pY2hvbGFzIEthemxhdXNrYXMgZnJvbSBjb21tZW50ICMzMykKPiBJ
KEluIHJlcGx5IHRvIFNlcmdleSBLb25kYWtvdiBmcm9tIGNvbW1lbnQgIzI2KQo+ID4gQ3JlYXRl
ZCBhdHRhY2htZW50IDI4NDA4MyBbZGV0YWlsc10KPiA+IGRtZXNnXzIwMTktMDgtMDItYW1kZ3B1
X2ZhaWxfb25fcGF0Y2hlZF81LjIuNQo+ID4gCj4gPiAoSW4gcmVwbHkgdG8gTmljaG9sYXMgS2F6
bGF1c2thcyBmcm9tIGNvbW1lbnQgIzI0KQo+ID4gPiBUaGlzIHNob3VsZCBiZSBmaXhlZCB3aXRo
IHRoZSBzZXJpZXMgbGlua2VkIGJlbG93Ogo+ID4gPiAKPiA+ID4gaHR0cHM6Ly9wYXRjaHdvcmsu
ZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy82NDUwNS8KPiA+ID4gCj4gPiA+IEJ1dCBpdCBzdGlsbCBu
ZWVkcyByZXZpZXcgYW5kIGJhY2twb3J0aW5nIHRvIG9sZGVyIGtlcm5lbHMuCj4gPiAKPiA+IENl
bGVicmF0aW9uIG1pZ2h0IGhhdmUgYmVlbiBwcmVtYXR1cmUuIEhvdXJzIGxhdGVyIEkndmUgZ290
IGFub3RoZXIgZnJlZXplCj4gPiB3aXRoIGRpZmZlcmVudCBlcnJvciBpbiBhbWRncHUuIE9ubHkg
dGhpcyB0aW1lLCBtb3VzZSBjdXJzb3Igd2FzIG1vdmFibGUKPiA+IG92ZXIgZnJvemVuIGZyYW1l
IHJpZ2h0IHVudGlsIEkgdHJpZWQgc3dpdGNoaW5nIFZULiBIZXJlJ3MgdHJhY2U6Cj4gPiBCVUc6
IHVuYWJsZSB0byBoYW5kbGUgcGFnZSBmYXVsdCBmb3IgYWRkcmVzczogMDAwMDAwMDgwMDAwMDE4
NAo+ID4gI1BGOiBzdXBlcnZpc29yIHJlYWQgYWNjZXNzIGluIGtlcm5lbCBtb2RlCj4gPiAjUEY6
IGVycm9yX2NvZGUoMHgwMDAwKSAtIG5vdC1wcmVzZW50IHBhZ2UKPiA+IFBHRCAwIFA0RCAwIAo+
ID4gT29wczogMDAwMCBbIzFdIFBSRUVNUFQgU01QIE5PUFRJCj4gPiBDUFU6IDIgUElEOiAyMTA0
NCBDb21tOiBrd29ya2VyL3UxNjowIFRhaW50ZWQ6IEcgICAgICAgIFcgSU8gICAgIAo+ID4gNS4y
LjUtMTM5Ni5nNzliNmE5Yy1IU0YgIzEgb3BlblNVU0UgVHVtYmxld2VlZCAodW5yZWxlYXNlZCkK
PiA+IEhhcmR3YXJlIG5hbWU6IEdpZ2FieXRlIFRlY2hub2xvZ3kgQ28uLCBMdGQuIEdBLTk5MFhB
LVVEMy9HQS05OTBYQS1VRDMsCj4gQklPUwo+ID4gRjE0ZSAwOS8wOS8yMDE0Cj4gPiBXb3JrcXVl
dWU6IGV2ZW50c191bmJvdW5kIGNvbW1pdF93b3JrCj4gPiBSSVA6IDAwMTA6YW1kZ3B1X2RtX2F0
b21pY19jb21taXRfdGFpbCsweDJlNi8weGQ2MCBbYW1kZ3B1XQo+IAo+IEFyZSB5b3UgYWJsZSB0
byBjb25zaXN0ZW50bHkgcmVwcm9kdWNlIHRoaXMgaXNzdWU/IElzIGl0IHRoZSBzYW1lIHNldHVw
IGFuZAo+IHNhbWUgY29uZGl0aW9ucyBhcyBiZWZvcmU/IEkgaGF2ZW4ndCBiZWVuIGFibGUgdG8g
c2VlIGl0IGluIG15IHRlc3RpbmcgYXQKPiBsZWFzdC4KClllcywganVzdCBoYXZpbmcgUGFnZUZs
aXAgZW5hYmxlZCBpbiBhbWRncHUgZ3VhcmFudGVlcyBpdC4gQ2hhbmdpbmcgYW55dGhpbmcKb3Ro
ZXIgdGhhbiBQYWdlRmxpcCBkb2Vzbid0IHNlZW0gdG8gYWZmZWN0IGl0LiBGb3JjaW5nIFRlYXJG
cmVlIG9uIHdpdGgKUGFnZUZsaXAgZGlzYWJsZWQgbWF5IGFsc28gdHJpZ2dlciBpdCwgSSB0aGlu
ay4gWW91IG1heSB0cnkgbXkgcHJldmlvdXNseQpsaW5rZWQga2VybmVsIGJ1aWxkIGluIHlvdXIg
dGVzdGluZyBidXQgSSBkb3VidCB0aGF0IGl0IGhhcyBzb21ldGhpbmcgc3BlY2lmaWMKZm9yIGl0
LgoKSXQgbWF5IGJlIG5vdCByZXByb2R1Y2libGUgd2l0aCBtb2Rlc2V0dGluZyBYIGRyaXZlciBi
ZWNhdXNlIGl0IGZhaWxzIHRvIGVuZ2FnZQpwYWdlIGZsaXBwaW5nIG9uIGluaXQgYW5kIHRocm93
cyBhIGJ1bmNoIG9mIGVycm9ycyBhYm91dCBpdCBpbiBYb3JnLjAubG9nLiBGb3IKc29tZSByZWFz
b24gSSdtIHVuYWJsZSB0byB1c2UgbW9kZXNldHRpbmcgWCBkcml2ZXIgYXQgYWxsLCBldmVuIHdp
dGggcGFnZQpmbGlwcGluZyBkaXNhYmxlZCwgaXQgZHJhd3Mgb25seSBtb3VzZSBjdXJzb3Igb24g
YmxhY2sgYmFja2dyb3VuZCBpbnN0ZWFkIG9mCnNkZG0gbG9naW4gc2NyZWVuLiBTbyBJIGhhdmUg
dG8gdXNlIGFtZGdwdSB3aXRoIFBhZ2VGbGlwIGFuZCBUZWFyRnJlZQpleHBsaWNpdGx5IGRpc2Fi
bGVkLiBCdXQgdGhlbiBhbm90aGVyLCByYXJlcgowMDEwOmFtZGdwdV92bV91cGRhdGVfZGlyZWN0
b3JpZXMrMHhlNy8weDI2MCBkZXJlZmVyZW5jZSBtYXkgaGFwcGVuIHJlZ2FyZGxlc3MKKHdoaWNo
IEkgc3VzcGVjdCBpcyBjb25uZWN0ZWQgd2l0aCB2bV91cGRhdGVfbW9kZSBvcHRpb24sIHVubGlr
ZSB0aGUgZmlyc3QKb25lKS4KCkJ5IHRoZSB3YXksIGlzIHRoZXJlIGFueSBkaXNhZHZhbnRhZ2Ug
aW4gZm9yY2luZyBUZWFyRnJlZSB0byBiZSBhbHdheXMgb24gd2hlbgppdCB3b3JrcyA/IExpa2Ug
YWRkaXRpb25hbCBmcmFtZSBvZiBsYXRlbmN5IG9yIHNvbWV0aGluZyBsaWtlIHRoYXQgPwoKLS0g
CllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3UgYXJlIHdhdGNoaW5nIHRo
ZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
