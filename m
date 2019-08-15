Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA33B8F6C1
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 00:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F092F6E460;
	Thu, 15 Aug 2019 22:05:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.wl.linuxfoundation.org (mail.wl.linuxfoundation.org
 [198.145.29.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A976E460
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 22:05:23 +0000 (UTC)
Received: from mail.wl.linuxfoundation.org (localhost [127.0.0.1])
 by mail.wl.linuxfoundation.org (Postfix) with ESMTP id 61582289F0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Aug 2019 22:05:23 +0000 (UTC)
Received: by mail.wl.linuxfoundation.org (Postfix, from userid 486)
 id 3FC81289AD; Thu, 15 Aug 2019 22:05:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
 pdx-wl-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=2.0 tests=BAYES_00,NO_RECEIVED,
 NO_RELAYS autolearn=unavailable version=3.3.1
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 204181] NULL pointer dereference regression in amdgpu
Date: Thu, 15 Aug 2019 22:05:22 +0000
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
Message-ID: <bug-204181-2300-wyQl9j0J4J@https.bugzilla.kernel.org/>
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
b21tZW50ICMzMSBmcm9tIFNlcmdleSBLb25kYWtvdiAodmlydHVvdXNmb3hAZ21haWwuY29tKSAt
LS0KKEluIHJlcGx5IHRvIEFuZHJleSBHcm9kem92c2t5IGZyb20gY29tbWVudCAjMzApCj4gKElu
IHJlcGx5IHRvIFNlcmdleSBLb25kYWtvdiBmcm9tIGNvbW1lbnQgIzI3KQo+IAo+IFNlcmdleSwg
SSB0cmllZCB0byByZXByb2R1Y2UgeW91IGxhdGVzdCBpc3N1ZSBvbiBFbGxzbWVyZSAoUG9sYXJp
cyAxMCkgd2l0aAo+ICJTaGFkb3dQcmltYXJ5IiBlbmFibGVkIGZsaXAgZGlzYWJsZWQgYW5kIGRp
ZG4ndCBvYnNlcnZlIGFueSBjcmFzaC4KPiBJbiBjYXNlIHlvdSBidWlsdCB5b3VyIG93biBrZXJu
ZWwgY2FuIHlvdSBnaXZlIG1lIHRoZSBvdXRwdXQgb2YgdGhpcyBjb21tYW5kCj4gLQo+IAo+IFJ1
biBnZGIgb24gYW1kZ3B1LmtvCj4gZ2RiIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dS5rbwo+IAo+IFRoZW4gZG8gLSAKPiBsaXN0ICooYW1kZ3B1X3ZtX3VwZGF0ZV9kaXJlY3Rvcmll
cysweGU3KQoKVGhlIGNyYXNoIG1heSB0YWtlIGEgd2hpbGUgKGhvdXJzKSB0byBtYW5pZmVzdCBh
bmQgcmVxdWlyZXMgc29tZSB2aWRlby13YXRjaGluZwp2aWEgRmlyZWZveCBhbmQvb3IgbXB2ICh3
aXRoICctLW9wZW5nbC1wYm8nIG9wdGlvbiBvbiBvcGVuZ2wtaHEgcHJvZmlsZSkuIEl0CmFsc28g
bWF5IG9yIG1heSBub3QgbmVlZCBWQUFQSSB0byBiZSB1c2VkICgnLS1od2RlYz12YWFwaS1jb3B5
JyBpbiBjYXNlIG9mCm1wdikuCgpNeSBrZXJuZWwgaXMgYnVpbHQgb24gT0JTIGJ1aWxkLXNlcnZl
ciwgc28gSSBoYWQgdG8gZW5hYmxlIGRlYnVnaW5mbyBwYWNrYWdpbmcKYW5kIHJlYnVpbGQgaXQs
IHRoZW4gZGVidWdpbmZvIHBhY2thZ2UgdXNlZCB1cCBtaW5kLWJvZ2dsaW5nIDUsMWdiIG9mIHNw
YWNlCmxlYXZpbmcgbWUgd2l0aCBtZWFzbHkgfjQwMG1iIG9uIC8gISBBZnRlciB0aGF0IEkgbWFu
YWdlZCB0byBnZXQgdGhpczoKMHgyZTEyNyBpcyBpbiBhbWRncHVfdm1fdXBkYXRlX2RpcmVjdG9y
aWVzCiguLi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYzoxMTkxKS4Kd2hl
cmUgbGluZSAjMTE5MSBpczoKc3RydWN0IGFtZGdwdV9ibyAqYm8gPSBwYXJlbnQtPmJhc2UuYm8s
ICpwYm87CgpCdXQgaXQgYSBkaWZmZXJlbnQgYnVpbGQgb2YgdGhlIGtlcm5lbCwgc28gSSBkb24n
dCBrbm93IGlmIHRoaXMgaXMgZXZlbgpyZWxldmFudC4gSSdtIG5vdCBnb2luZyB0byBzdGljayBh
cm91bmQgd2l0aCB0aGlzIG1vbnN0cm9zaXR5LiBZb3UgbWF5IGNoZWNrCm91dCB0aGUgcGFja2Fn
ZXMgYXQKaHR0cHM6Ly9idWlsZC5vcGVuc3VzZS5vcmcvcGFja2FnZS9iaW5hcmllcy9ob21lOlgw
RjpIU0Y6S2VybmVsL2tlcm5lbC1IU0Yvc3RhbmRhcmQKLSB0aGV5IGhhdmUgcHJldHR5IG11Y2gg
YWxsIGtlcm5lbCBtb2R1bGVzIHRoYXQgeDg2XzY0IHN1cHBvcnRzLCBzbyBpdCBzaG91bGQKcnVu
IGFueXdoZXJlLgoKLS0gCllvdSBhcmUgcmVjZWl2aW5nIHRoaXMgbWFpbCBiZWNhdXNlOgpZb3Ug
YXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
