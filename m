Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FFFF29BF
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 09:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7C06F38D;
	Thu,  7 Nov 2019 08:51:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58D66F38D
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 08:51:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id D73273F474
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:41:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5Y7wYng--SXL for <dri-devel@lists.freedesktop.org>;
 Thu,  7 Nov 2019 09:41:26 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id D35583F491
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:41:24 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 1A69A360103
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 09:41:24 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/8] Emulated coherent graphics memory take 2
Date: Thu,  7 Nov 2019 09:41:08 +0100
Message-Id: <20191107084116.33032-1-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573116084; bh=H5/Pjfi37kvRwoZ6zM3Ax+ssS6D1FnBcIKICKaeIRWA=;
 h=From:To:Subject:Date:From;
 b=EbirIBZ5P8wigm6Sp06PUkRsUms8vePgzexDXR7GH4wt6JYjMgUuzHxoIe5+iGx3G
 ktqKQ/OEcTMcawql512CtiRUYUhFUHDild88ENvx6/q0iM2wRNfdJuArtIL9G3bB2n
 cdio8gjg0tN6JxXbqUipF7uQdxY9ObqnOFHcIXLY=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=EbirIBZ5; 
 dkim-atps=neutral
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

RnJvbTogVGhvbWFzIEhlbGxzdHLDtm0gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KCkdyYXBoaWNz
IEFQSXMgbGlrZSBPcGVuR0wgNC40IGFuZCBWdWxrYW4gcmVxdWlyZSB0aGUgZ3JhcGhpY3MgZHJp
dmVyCnRvIHByb3ZpZGUgY29oZXJlbnQgZ3JhcGhpY3MgbWVtb3J5LCBtZWFuaW5nIHRoYXQgdGhl
IEdQVSBzZWVzIGFueQpjb250ZW50IHdyaXR0ZW4gdG8gdGhlIGNvaGVyZW50IG1lbW9yeSBvbiB0
aGUgbmV4dCBHUFUgb3BlcmF0aW9uIHRoYXQKdG91Y2hlcyB0aGF0IG1lbW9yeSwgYW5kIHRoZSBD
UFUgc2VlcyBhbnkgY29udGVudCB3cml0dGVuIGJ5IHRoZSBHUFUKdG8gdGhhdCBtZW1vcnkgaW1t
ZWRpYXRlbHkgYWZ0ZXIgYW55IGZlbmNlIG9iamVjdCB0cmFpbGluZyB0aGUgR1BVCm9wZXJhdGlv
biBpcyBzaWduYWxlZC4KClBhcmF2aXJ0dWFsIGRyaXZlcnMgdGhhdCBvdGhlcndpc2UgcmVxdWly
ZSBleHBsaWNpdCBzeW5jaHJvbml6YXRpb24KbmVlZHMgdG8gZG8gdGhpcyBieSBob29raW5nIHVw
IGRpcnR5IHRyYWNraW5nIHRvIHBhZ2VmYXVsdCBoYW5kbGVycwphbmQgYnVmZmVyIG9iamVjdCB2
YWxpZGF0aW9uLgoKUHJvdmlkZSBtbSBoZWxwZXJzIG5lZWRlZCBmb3IgdGhpcyBhbmQgdGhhdCBh
bHNvIGFsbG93IGZvciBodWdlIHBtZC0KYW5kIHB1ZCBlbnRyaWVzIChwYXRjaCAxLTMpLCBhbmQg
dGhlIGFzc29jaWF0ZWQgdm13Z2Z4IGNvZGUgKHBhdGNoIDQtNykuCgpUaGUgY29kZSBoYXMgYmVl
biB0ZXN0ZWQgYW5kIGV4ZXJjaXNlZCBieSBhIHRhaWxvcmVkIHZlcnNpb24gb2YgbWVzYQp3aGVy
ZSB3ZSBkaXNhYmxlIGFsbCBleHBsaWNpdCBzeW5jaHJvbml6YXRpb24gYW5kIGFzc3VtZSBncmFw
aGljcyBtZW1vcnkKaXMgY29oZXJlbnQuIFRoZSBwZXJmb3JtYW5jZSBsb3NzIHZhcmllcyBvZiBj
b3Vyc2U7IGEgdHlwaWNhbCBudW1iZXIgaXMKYXJvdW5kIDUlLgoKSSB3b3VsZCBsaWtlIHRvIG1l
cmdlIHRoaXMgY29kZSB0aHJvdWdoIHRoZSBEUk0gdHJlZSwgc28gYW4gYWNrIHRvIGluY2x1ZGUK
dGhlIG5ldyBtbSBoZWxwZXJzIGluIHRoYXQgbWVyZ2Ugd291bGQgYmUgZ3JlYXRseSBhcHByZWNp
YXRlZC4KCkNoYW5nZXMgc2luY2UgUkZDOgotIE1lcmdlIGNvbmZsaWN0IGNoYW5nZXMgbW92ZWQg
dG8gdGhlIGNvcnJlY3QgcGF0Y2guIEZpeGVzIGludHJhLXBhdGNoc2V0CiAgY29tcGlsZSBlcnJv
cnMuCi0gQmUgbW9yZSBhZ2dyZXNzaXZlIHdoZW4gdHVybmluZyB0dG0gdm0gY29kZSBpbnRvIGhl
bHBlcnMuIFRoaXMgbWFrZXMgc3VyZQogIHdlIGNhbiB1c2UgYSBjb25zdCBxdWFsaWZpZXIgb24g
dGhlIHZtd2dmeCB2bV9vcHMuCi0gUmVpbnN0YXRlIGEgbG9zdCBjb21tZW50IGFuIGZpeCBhbiBl
cnJvciBwYXRoIHRoYXQgd2FzIGJyb2tlbiB3aGVuIHR1cm5pbmcKICB0aGUgdHRtIHZtIGNvZGUg
aW50byBoZWxwZXJzLgotIFJlbW92ZSBleHBsaWNpdCB0eXBlLWNhc3RzIG9mIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdDo6dm1fcHJpdmF0ZV9kYXRhCi0gQ2xhcmlmeSB0aGUgbG9ja2luZyBpbnZlcnNp
b24gdGhhdCBtYWtlcyB1cyBub3QgYmVpbmcgYWJsZSB0byB1c2UgdGhlIG1tCiAgcGFnZXdhbGsg
Y29kZS4KCkNoYW5nZXMgc2luY2UgdjE6Ci0gUmVtb3ZlZCB0aGUgdm13Z2Z4IG1haW50YWluZXIg
ZW50cnkgZm9yIGFzX2RpcnR5X2hlbHBlcnMuYywgdXBkYXRlZAogIGNvbW1pdCBtZXNzYWdlIGFj
Y29yZGluZ2x5Ci0gUmVtb3ZlZCB0aGUgVFRNIHBhdGNoZXMgZnJvbSB0aGUgc2VyaWVzIGFzIHRo
ZXkgYXJlIG1lcmdlZCBzZXBhcmF0ZWx5CiAgdGhyb3VnaCBEUk0uCkNoYW5nZXMgc2luY2UgdjI6
Ci0gU3BsaXQgb3V0IHRoZSBwYWdld2FsayBjb2RlIGZyb20gYXNfZGlydHlfaGVscGVycy5jIGFu
ZCBkb2N1bWVudCBsb2NraW5nLgotIEFkZCBwcmVfdm1hIGFuZCBwb3N0X3ZtYSBjYWxsYmFja3Mg
dG8gdGhlIHBhZ2V3YWxrIGNvZGUuCi0gUmVtb3ZlIGh1Z2UgcG1kIGFuZCAtcHVkIGFzc2VydHMg
dGhhdCB3b3VsZCB0cmlwIHdoZW4gd2UgcHJvdGVjdCB2bWFzIHdpdGgKICBzdHJ1Y3QgYWRkcmVz
c19zcGFjZTo6aV9tbWFwX3J3c2VtIHJhdGhlciB0aGFuIHdpdGgKICBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3Q6Om1tYXBfc2VtLgotIERvIHNvbWUgbmFtaW5nIGNsZWFudXAgaW4gYXNfZGlydHlfaGVs
cGVycy5jCkNoYW5nZXMgc2luY2UgdjM6Ci0gRXh0ZW5zaXZlIHJlbmFtaW5nIG9mIHRoZSBkaXJ0
eSBoZWxwZXJzIGluY2x1ZGluZyB0aGUgZmlsZW5hbWUuCi0gVXBkYXRlIHdhbGtfcGFnZV9tYXBw
aW5nKCkgZG9jLgotIFVwZGF0ZSB0aGUgcGFnZXdhbGsgY29kZSB0byBub3QgdW5jb25kaXRpb25h
bGx5IHNwbGl0IHBtZHMgaWYgYSBwdGVfZW50cnkoKQogIGNhbGxiYWNrIGlzIHByZXNlbnQuIFVw
ZGF0ZSB0aGUgZGlydHkgaGVscGVyIHBtZF9lbnRyeSBhY2NvcmRpbmdseS4KLSBVc2Ugc2VwYXJh
dGUgd2FsayBvcHMgZm9yIHRoZSBkaXJ0eSBoZWxwZXJzLgotIFVwZGF0ZSB0aGUgcGFnZXdhbGsg
Y29kZSB0byB0YWtlIHRoZSBwYWdldGFibGUgbG9jayBpbiB3YWxrX3B0ZV9yYW5nZS4KQ2hhbmdl
cyBzaW5jZSB2NDoKLSBGaXggcHRlIHBvaW50ZXIgY29uZnVzaW9uIGluIHBhdGNoIDIvOAotIFNr
aXAgdGhlIHBhZ2V3YWxrIGNvZGUgY29uZGl0aW9uYWwgc3BsaXQgcGF0Y2ggZm9yIG5vdywgYW5k
IHVwZGF0ZSB0aGUKICBtYXBwaW5nX2RpcnR5X2hlbHBlciBhY2NvcmRpbmdseS4gVGhhdCBwcm9i
bGVtIHdpbGwgYmUgc29sdmVkIGluIGEgY2xlYW5lcgogIHdheSBpbiBhIGZvbGxvdy11cCBwYXRj
aHNldC4KQ2hhbmdlcyBzaW5jZSB2NToKLSBGaXggdGxiIGZsdXNoaW5nIHdoZW4gd2UgaGF2ZSBv
dGhlciBwZW5kaW5nIHRsYiBmbHVzaGVzLgpDaGFuZ2VzIHNpbmNlIHY2OgotIEFkZGVkIEFuZHJl
dyBNb3J0b24gUi1CcyBhbmQgYWNrcy4gU2VyaWVzIGlzIG5vdyBhcHByb3ZlZCB0byBtZXJnZSB0
aHJvdWdoCiAgRFJNOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkxMTA1MTk1MTE0LmY3
NWJlNWU3Njc2M2RhNTU0NjEyMWI0MUBsaW51eC1mb3VuZGF0aW9uLm9yZy8KLSBSZW1vdmVkIGFu
IHJlZHVuZGFudCBhc3NpZ25tZW50IGluIHBhdGNoICM4IChDb2xpbiBJYW4gS2luZykKCiAgCkNj
OiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWF0dGhldyBX
aWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+CkNjOiBXaWxsIERlYWNvbiA8d2lsbC5kZWFjb25A
YXJtLmNvbT4KQ2M6IFBldGVyIFppamxzdHJhIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4KQ2M6IFJp
ayB2YW4gUmllbCA8cmllbEBzdXJyaWVsLmNvbT4KQ2M6IE1pbmNoYW4gS2ltIDxtaW5jaGFuQGtl
cm5lbC5vcmc+CkNjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6IEh1YW5nIFlp
bmcgPHlpbmcuaHVhbmdAaW50ZWwuY29tPgpDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJl
ZGhhdC5jb20+CkNjOiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbEBzaHV0ZW1vdi5uYW1lPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
