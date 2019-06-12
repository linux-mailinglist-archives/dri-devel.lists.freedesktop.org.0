Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 399B942DA2
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 19:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 180CB897E4;
	Wed, 12 Jun 2019 17:40:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DEA897EE
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 17:40:30 +0000 (UTC)
Received: from 201.86.169.251.dynamic.adsl.gvt.net.br ([201.86.169.251]
 helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hb7ER-0000RS-UF; Wed, 12 Jun 2019 17:40:20 +0000
Date: Wed, 12 Jun 2019 14:40:15 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v3 33/33] docs: EDID/HOWTO.txt: convert it and rename to
 howto.rst
Message-ID: <20190612144015.033247db@coco.lan>
In-Reply-To: <20190611093701.44344d00@lwn.net>
References: <cover.1560045490.git.mchehab+samsung@kernel.org>
 <74bec0b5b7c32c8d84adbaf9ff208803475198e5.1560045490.git.mchehab+samsung@kernel.org>
 <20190611083731.GS21222@phenom.ffwll.local>
 <20190611060215.232af2bb@coco.lan>
 <20190611093701.44344d00@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QttHRjHJ7MdlFs6psyes3YVzvNlpLf2MWMHYPysLwuw=; b=QddYO1C9EJA++Jit0trZp/JUNF
 3wVeuwLM40EQ05IVR/ZKCgmmPouY6r5zSG+wmAaz1KZ5W5tzKVwYSr0Sa2M/r5RGDbAUMyWFebE51
 yUdq8Cevmj2flA/1vVfKKTtjyWhpFG/F+mk7tba3WWhkJ39a3kKwoxJ/Si70HAjOFrvOAbbwxKbOG
 sHKz4WruU56R1I4yQ+aDgF1epxWJUU/4Fi6IiwSL+HFDUMlbw055MCsq2e+Te1UTA9/dlCvQLbmZr
 zLdQ31mezeTlD2m8JCZ4WmNrfzKeg3e3Hl5RmZArBYmv2kVUs0v/Q29KZE+KZPnOxyIxgAA3ZJ6Rb
 IioY5hIQ==;
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
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gVHVlLCAxMSBKdW4gMjAxOSAwOTozNzowMSAtMDYwMApKb25hdGhhbiBDb3JiZXQgPGNvcmJl
dEBsd24ubmV0PiBlc2NyZXZldToKCj4gT24gVHVlLCAxMSBKdW4gMjAxOSAwNjowMjoxNSAtMDMw
MAo+IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYitzYW1zdW5nQGtlcm5lbC5vcmc+IHdy
b3RlOgo+IAo+ID4gSm9uLCBwbGVhc2UgY29ycmVjdCBtZSBpZiBJJyB3cm9uZywgYnUgSSBndWVz
cyB0aGUgcGxhbiBpcyB0byBwbGFjZSB0aGVtIAo+ID4gc29tZXdoZXJlIHVuZGVyIERvY3VtZW50
YXRpb24vYWRtaW4tZ3VpZGUvLiAgCj4gCj4gVGhhdCBtYWtlcyBzZW5zZSB0byBtZS4KPiAKPiA+
IElmIHNvLCBwZXJoYXBzIGNyZWF0aW5nIGEgRG9jdW1lbnRhdGlvbi9hZG1pbi1ndWlkZS9kcm0g
ZGlyIHRoZXJlIGFuZCAKPiA+IHBsYWNlIGRvY3MgbGlrZSBFRElEL0hPV1RPLnR4dCwgc3ZnYS50
eHQsIGV0YyB3b3VsZCB3b3JrLiAgCj4gCj4gTWF5YmUgImdyYXBoaWNzIiBvciAiZGlzcGxheSIg
cmF0aGVyIHRoYW4gImRybSIsIHdoaWNoIG1heSBub3QgZW50aXJlbHkKPiBhcHBsaWNhYmxlIHRv
IGFsbCBvZiB0aG9zZSBkb2NzIG9yIGFzIGZhbWlsaWFyIHRvIGFsbCBhZG1pbnM/CgpJdCBpcyB1
cCB0byBEYW5pZWwvRGF2aWQgdG8gZGVjaWRlLiBQZXJzb25hbGx5LCBJIGFncmVlIHdpdGggeW91
IHRoYXQKZWl0aGVyICJncmFwaGljcyIgb3IgImRpc3BsYXkiIHdvdWxkIGJlIGJldHRlciBhdCB0
aGUgYWRtaW4gZ3VpZGUuCgo+IAo+ID4gQnR3LCB0aGF0J3Mgb25lIG9mIHRoZSByZWFzb25zWzFd
IHdoeSBJIG9wdGVkIHRvIGtlZXAgdGhlIGZpbGVzIHdoZXJlIHRoZXkKPiA+IGFyZTogcHJvcGVy
bHkgb3JnYW5pemluZyB0aGUgY29udmVydGVkIGRvY3VtZW50cyBjYWxsIGZvciBzdWNoIGtpbmQK
PiA+IG9mIGRpc2N1c3Npb25zLiBPbiBteSBleHBlcmllbmNlLCBkaXNjdXNzaW5nIG5hbWVzIGFu
ZCBkaXJlY3RvcnkgbG9jYXRpb25zCj4gPiBjYW4gZ2VuZXJhdGUgd2FybSBkaXNjdXNzaW9ucyBh
bmQgdGFrZSBhIGxvdCBvZiB0aW1lIHRvIHJlYWNoIGNvbnNlbnN1cy4gIAo+IAo+IE1vdmluZyBk
b2NzIGlzIGEgcGFpbjsgbXkgbGlmZSB3b3VsZCBjZXJ0YWlubHkgYmUgZWFzaWVyIGlmIEkgd2Vy
ZSBoYXBweQo+IHRvIGp1c3QgbGV0IGV2ZXJ5dGhpbmcgbGllIHdoZXJlIGl0IGZlbGwgOikgIEJ1
dCBpdCdzIGZhciBmcm9tIHRoZSBoYXJkZXN0Cj4gcHJvYmxlbSB3ZSBzb2x2ZSBpbiBrZXJuZWwg
ZGV2ZWxvcG1lbnQsIEkgYXNzdW1lIHdlIGNhbiBmaWd1cmUgaXQgb3V0LgoKWWVhaCwgaXQgaXMg
ZG9hYmxlLiBJJ20gaGFwcHkgdG8gd3JpdGUgdGhlIHJlbmFtZSBwYXRjaGVzIGFuZCBldmVuIHRy
eQp0byBzcGxpdCBzb21lIGRvY3VtZW50cyBhdCB0aGUgcGxhY2VzIEknbSBtb3JlIGZhbWlsaWFy
IHdpdGgsIGJ1dCwgSU1ITywKd2Ugc2hvdWxkIGRvIHNvbWUgZGlzY3Vzc2lvbnMgYmVmb3JlIHNv
bWUgb2Ygc3VjaCByZW5hbWVzLgoKRm9yIGV4YW1wbGUsIERhbmllbCBzYWlkIHRoYXQ6Cgo+ID4g
PiBZZWFoIGF0bSB3ZSdyZSBkb2luZyBhIGJhZCBqb2Igb2Yga2VlcGluZyB0aGUga2FwaSBhbmQg
dWFwaSBwYXJ0cwo+ID4gPiBzZXBhcmF0ZS4gQnV0IHRoZSBwbGFuIGF0IGxlYXN0IGlzIHRvIG1v
dmUgYWxsIHRoZSBncHUgcmVsYXRlZCB1YXBpIHN0dWZmCj4gPiA+IGludG8gRG9jdW1lbnRhdGlv
bi9ncHUvZHJtLXVhcGkucnN0LiBOb3Qgc3VyZSB0aGVyZSdzIHZhbHVlIGluIG1vdmluZyB0aGF0
Cj4gPiA+IG91dCBvZiB0aGUgZ3B1IGZvbGRlciAuLi4KCkZyb20gdGhlIGNvbnZlcnNpb25zIEkn
dmUgbWFkZSBzbyBmYXIsIGFsbW9zdCBhbGwgZHJpdmVyIHN1YnN5c3RlbXMKcHV0IGV2ZXJ5dGhp
bmcgdW5kZXIgRG9jdW1lbnRhdGlvbi88c3Vic3lzdGVtOiBrQVBJLCB1QVBJLCBhZG1pbiBpbmZv
LApkcml2ZXItc3BlY2lmaWMgdGVjaG5pY2FsIGluZm8uCgpJdCBzaG91bGQgYmUgZG9hYmxlIHRv
IHBsYWNlIGtBUEkgYW5kIHVBUEkgb24gZGlmZmVyZW50IGJvb2tzLCBidXQgdGhlcmUKd2lsbCBi
ZSBsb3RzIG9mIGNyb3NzLXJlZmVyZW5jZSBsaW5rcyBiZXR3ZWVuIHRoZW0sIG9uIHByb3Blcmx5
LXdyaXR0ZW4KZG9jcy4KCkhvd2V2ZXIsIG90aGVyIGFkbWluLWd1aWRlIHN0dWZmIHVuZGVyIGRy
aXZlcnMgYXJlIHVzdWFsbHkgaW4gdGhlIG1pZGRsZQpvZiB0aGUgZG9jdW1lbnRzLiBGb3IgZXhh
bXBsZSwgb24gbWVkaWEsIHdlIGhhdmUgc29tZSBhdCB0aGUgdUFQSSBndWlkZSwKbGlrZSB0aGUg
RGV2aWNlIE5hbWluZyBpdGVtOgoKCWh0dHBzOi8vbGludXh0di5vcmcvZG93bmxvYWRzL3Y0bC1k
dmItYXBpcy1uZXcvdWFwaS92NGwvb3Blbi5odG1sI2RldmljZS1uYW1pbmcKCkJ1dCBzcGxpdHRp
bmcgaXQgZnJvbSB1QVBJIGd1aWRlIGlzIG5vdCBhbiBlYXN5IHRhc2suCgpBdCB0aGUgZHJpdmVy
J3Mgc3BlY2lmaWMgZG9jdW1lbnRhdGlvbiBpcyBldmVuIG1lc3NpZXIuCgpPaywgc3BsaXR0aW5n
IGlzIGRvYWJsZSwgYnV0IHJlcXVpcmUgbG90cyBvZiBkZWRpY2F0aW9uLCBhbmQgSSdtIG5vdApj
b252aW5jZWQgaWYgaXQgd291bGQgbWFrZSBtdWNoIGRpZmZlcmVuY2UgaW4gcHJhY3RpY2UuCgpU
aGFua3MsCk1hdXJvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
