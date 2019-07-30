Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1CAB7AA94
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 16:09:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6221F6E53E;
	Tue, 30 Jul 2019 14:09:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B52C89ACC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 14:09:23 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n4so66023335wrs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 07:09:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=LZsG/s5jOtsbzlRKW8PKqAQkBM+xaVVYAfsSo2wPupA=;
 b=uMbXkcVNFWeMepktG8MEVkFTCvj2MYatRFERXHWwB7x3VJWv+o5CBT2sggYDfirvwz
 RshC1qB94Z+ttRYyCx/16diYXlD6YfwIaY9LP7eVN3IC2w9rb3hdlSAQ1sZA2MxI0AUe
 GOwghYbKMvI+Xem6rhyZQKXhw+va4IJF9nsSsAoO0BRsB4LBdrdX+MLL3D1FhE6FuZNZ
 YLHTqIDU6O7Svy0VvY3x3ac8UpLqTIdIXU1JuNnNyn3KzoA99e5yZf9GCXeMpS3OPNRB
 AGcT/fPmhG3xcRl1JTavm5IoKYZy5Iq5qHUrLAi9no0+lIDGO3PbfqSXMHa7UOPKbYTL
 eNOQ==
X-Gm-Message-State: APjAAAWwcxoWdGUYchwj/ssJbMn0Ot5IjdUvXJYQ02WnaHNGhhcG2Hlm
 kto4Epw1b8Zj63K7EjKFACsBz0uW
X-Google-Smtp-Source: APXvYqxMKz2wtegCn7OUJY6HW6Laq+z6G/oA++W8N45yWo9Ir6l7vzfB6T9+085tqTZO2YSw3tSppQ==
X-Received: by 2002:a5d:4085:: with SMTP id o5mr126346630wrp.101.1564495762176; 
 Tue, 30 Jul 2019 07:09:22 -0700 (PDT)
Received: from arch-x1c3 ([2a00:5f00:102:0:9665:9cff:feee:aa4d])
 by smtp.gmail.com with ESMTPSA id f192sm67862071wmg.30.2019.07.30.07.09.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 07:09:21 -0700 (PDT)
Date: Tue, 30 Jul 2019 15:08:52 +0100
From: Emil Velikov <emil.l.velikov@gmail.com>
To: Jan Sebastian =?iso-8859-1?Q?G=F6tte?= <linux@jaseg.net>
Subject: Re: [PATCH 5/6] drm: uapi: add gdepaper uapi header
Message-ID: <20190730140852.GB12424@arch-x1c3>
References: <3c8fccc9-63f7-18bb-dcb5-dcd0b9e151d2@jaseg.net>
 <0e22c86a-3998-c2fd-cb14-203df547eb5c@jaseg.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e22c86a-3998-c2fd-cb14-203df547eb5c@jaseg.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent;
 bh=LZsG/s5jOtsbzlRKW8PKqAQkBM+xaVVYAfsSo2wPupA=;
 b=T0bXGO2XKLP4M7xqw5lCTKWqVX653o6KAihg4YH2utjTY7W8HvQFClzNjx+rRAwQfq
 BcZgRUsRyhpe1TXm4vmbFAK6UlT1BtFIdJ5s1/FIFnN26q/ATEWFjmSHY6qywRTKszvf
 V5NczzKud8EGdcbTZ8PaV0ei42m8Ix09VDdg2YWzFW1I140ajIuW+Ddq7fOg/SSBe+0G
 9MQmLc+WG3O+23Iz7u4S2GZZcyPlTsSIIxJyJpTC7mtPRuHoZ8ywrqZyMLKUqE3Nsd/h
 iMgW2NcNV42PbBBA/U4XdA4ytGyM61xXbyh03yMrg7+rT57kOpMI57mdKsZPfIUk1AQD
 vV3w==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSmFuLAoKT24gMjAxOS8wNy8zMCwgSmFuIFNlYmFzdGlhbiBHw7Z0dGUgd3JvdGU6Cj4gU2ln
bmVkLW9mZi1ieTogSmFuIFNlYmFzdGlhbiBHw7Z0dGUgPGxpbnV4QGphc2VnLm5ldD4KPiAtLS0K
PiAgaW5jbHVkZS91YXBpL2RybS9nZGVwYXBlcl9kcm0uaCB8IDYyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNjIgaW5zZXJ0aW9ucygrKQo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2RybS9nZGVwYXBlcl9kcm0uaAo+IAo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvZHJtL2dkZXBhcGVyX2RybS5oIGIvaW5jbHVkZS91YXBp
L2RybS9nZGVwYXBlcl9kcm0uaAo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAw
MDAwMDAwLi44NGZmNjQyOWJlZjUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvaW5jbHVkZS91YXBp
L2RybS9nZGVwYXBlcl9kcm0uaAo+IEBAIC0wLDAgKzEsNjIgQEAKPiArLyogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEdQTC0yLjArIFdJVEggTGludXgtc3lzY2FsbC1ub3RlICovCj4gKy8qIGdk
ZXBhcGVyX2RybS5oCj4gKyAqCj4gKyAqIENvcHlyaWdodCAoYykgMjAxOSBKYW4gU2ViYXN0aWFu
IEfDtnR0ZQo+ICsgKi8KPiArCkknbSBnbGFkIHRvIHNlZSBtb3JlIGRldmljZXMgdXNpbmcgdXBz
dHJlYW0gS01TIGludGVyZmFjZS4gVXN1YWxseQpjdXN0b20gVUFQSSBzaG91bGQgbm90IGJlIG5l
ZWRlZCBmb3Igc3VjaCBkZXZpY2VzLgoKQ2FuIHlvdSBlbGFib3JhdGUgd2h5IHRoaXMgaXMgcmVx
dWlyZWQ/IElzIHRoZXJlIGFuIG9wZW4tc291cmNlCnVzZXJzcGFjZSB0aGF0IHVzZXMgdGhlc2U/
CgoKPiArI2lmbmRlZiBfVUFQSV9HREVQQVBFUl9EUk1fSF8KPiArI2RlZmluZSBfVUFQSV9HREVQ
QVBFUl9EUk1fSF8KPiArCj4gKyNpbmNsdWRlICJkcm0uaCIKPiArCj4gKyNpZiBkZWZpbmVkKF9f
Y3BsdXNwbHVzKQo+ICtleHRlcm4gIkMiIHsKPiArI2VuZGlmCj4gKwo+ICtlbnVtIGRybV9nZGVw
YXBlcl92Z2hsX2x2IHsKPiArCURSTV9HREVQX1BXUl9WR0hMXzE2ViA9IDAsCj4gKwlEUk1fR0RF
UF9QV1JfVkdITF8xNVYgPSAxLAo+ICsJRFJNX0dERVBfUFdSX1ZHSExfMTRWID0gMiwKPiArCURS
TV9HREVQX1BXUl9WR0hMXzEzViA9IDMsCj4gK307Cj4gKwo+ICtzdHJ1Y3QgZ2RlcGFwZXJfcmVm
cmVzaF9wYXJhbXMgewo+ICsJZW51bSBkcm1fZ2RlcGFwZXJfdmdobF9sdiB2Z19sdjsgLyogZ2F0
ZSB2b2x0YWdlIGxldmVsICovCkZyb20gbXkgZXhwZXJpZW5jZSwga2VybmVsIGRyaXZlcnMgYWlt
IHRvIGF2b2lkIGV4cG9zaW5nIHZvbHRhZ2UgY29udHJvbAp0byB1c2Vyc3BhY2UuIEFGQUlDVCBl
eGNlcHRpb25zIGFyZSBwcmVzZW50LCBidXQgZ2VuZXJhbGx5IGl0J3MgYSBuby1nby4KCgo+ICsJ
X191MzIgdmNvbV9zZWw7IC8qIFZDT00gc2VsZWN0IGJpdCBhY2NvcmRpbmcgdG8gZGF0YXNoZWV0
ICovCj4gKwlfX3MzMiB2ZGhfYndfbXY7IC8qIGRyaXZlIGhpZ2ggbGV2ZWwsIGIvdyBwaXhlbCAo
bVYpICovCj4gKwlfX3MzMiB2ZGhfY29sX212OyAvKiBkcml2ZSBoaWdoIGxldmVsLCByZWQveWVs
bG93IHBpeGVsIChtVikgKi8KPiArCV9fczMyIHZkbF9tdjsgLyogZHJpdmUgbG93IGxldmVsICht
VikgKi8KPiArCV9fczMyIHZjb21fZGNfbXY7Cj4gKwlfX3UzMiB2Y29tX2RhdGFfaXZsX2hzeW5j
OyAvKiBkYXRhIGl2bCBsZW4gaW4gaHN5bmMgcGVyaW9kcyAqLwo+ICsJX191MzIgYm9yZGVyX2Rh
dGFfc2VsOyAvKiAidmJkIiBpbiBkYXRhc2hlZXQgKi8KPiArCV9fdTMyIGRhdGFfcG9sYXJpdHk7
IC8qICJkZHgiIGluIGRhdGFzaGVldCAqLwpUaGVzZSBwcm9wZXJ0aWVzIGxvb2sgbGlrZSB0aGV5
IHNob3VsZCBsaXZlIGluIHRoZSBkZXZpY2UtdHJlZSBiaW5kaW5ncy4KCj4gKwlfX3UzMiB1c2Vf
b3RwX2x1dHNfZmxhZzsgLyogVXNlIE9UUCBMVVRzICovCj4gKwlfX3U4IGx1dF92Y29tX2RjWzQ0
XTsKPiArCV9fdTggbHV0X3d3WzQyXTsKPiArCV9fdTggbHV0X2J3WzQyXTsKPiArCV9fdTggbHV0
X2JiWzQyXTsKPiArCV9fdTggbHV0X3diWzQyXTsKVGhlcmUgaXMgVUFQSSB0byBtYW5hZ2UgTFVU
IChvciB3YXMgaXQgV0lQIHdpdGggcGF0Y2hlcyBvbiB0aGUgbGlzdCkgdmlhCnRoZSBhdG9taWMg
QVBJLiBJcyB0aGF0IG5vdCBmbGV4aWJsZSBlbm91Z2ggZm9yIHlvdXIgbmVlZHM/Cgo+ICt9Owo+
ICsKPiArLyogRm9yY2UgYSBmdWxsIGRpc3BsYXkgcmVmcmVzaCAqLwo+ICsjZGVmaW5lIERSTV9H
REVQQVBFUl9GT1JDRV9GVUxMX1JFRlJFU0gJCTB4MDAKPiArI2RlZmluZSBEUk1fR0RFUEFQRVJf
R0VUX1JFRlJFU0hfUEFSQU1TCQkweDAxCj4gKyNkZWZpbmUgRFJNX0dERVBBUEVSX1NFVF9SRUZS
RVNIX1BBUkFNUwkJMHgwMgo+ICsjZGVmaW5lIERSTV9HREVQQVBFUl9TRVRfUEFSVElBTF9VUERB
VEVfRU4JMHgwMwo+ICsKPiArI2RlZmluZSBEUk1fSU9DVExfR0RFUEFQRVJfRk9SQ0VfRlVMTF9S
RUZSRVNIIFwKPiArCURSTV9JTyhEUk1fQ09NTUFORF9CQVNFICsgRFJNX0dERVBBUEVSX0ZPUkNF
X0ZVTExfUkVGUkVTSCkKPiArI2RlZmluZSBEUk1fSU9DVExfR0RFUEFQRVJfR0VUX1JFRlJFU0hf
UEFSQU1TIFwKPiArCURSTV9JT1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9HREVQQVBFUl9HRVRf
UkVGUkVTSF9QQVJBTVMsIFwKPiArCXN0cnVjdCBnZGVwYXBlcl9yZWZyZXNoX3BhcmFtcykKPiAr
I2RlZmluZSBEUk1fSU9DVExfR0RFUEFQRVJfU0VUX1JFRlJFU0hfUEFSQU1TIFwKPiArCURSTV9J
T1IoRFJNX0NPTU1BTkRfQkFTRSArIERSTV9HREVQQVBFUl9TRVRfUkVGUkVTSF9QQVJBTVMsIFwK
PiArCXN0cnVjdCBnZGVwYXBlcl9yZWZyZXNoX3BhcmFtcykKPiArI2RlZmluZSBEUk1fSU9DVExf
R0RFUEFQRVJfU0VUX1BBUlRJQUxfVVBEQVRFX0VOIFwKPiArCURSTV9JT1IoRFJNX0NPTU1BTkRf
QkFTRSArIERSTV9HREVQQVBFUl9TRVRfUEFSVElBTF9VUERBVEVfRU4sIF9fdTMyKQo+ICsKU2lt
aWxhcmx5IHRvIHRoZSBMVVQgYWJvdmUsIHRoZSBhdG9taWMgVUFQSSBoYXMgc3VwcG9ydCBmb3Ig
cGFydGlhbAp1cGRhdGVzLiBUaGUgcHJvcGVydHkgaXMgY2FsbGVkIEZCX0RBTUFHRV9DTElQUyBh
bmQgdGhlcmUgaXMgYW4gZXhhbXBsZQppbiB3ZXN0b24gaG93IHRvIHVzZSBpdCBzZWUgMDA5YjNj
ZmE2ZjE2YmIzNjFlYjU0ZWZjYzc0MzViZmVkZTQ1MjRiYy4KCkhUSApFbWlsCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
