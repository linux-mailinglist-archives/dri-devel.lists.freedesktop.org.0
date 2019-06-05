Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E394235F31
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBF389BA3;
	Wed,  5 Jun 2019 14:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9C8A89BA3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 14:27:03 +0000 (UTC)
Received: from [179.182.172.34] (helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYWsO-0002Er-6a; Wed, 05 Jun 2019 14:26:52 +0000
Date: Wed, 5 Jun 2019 11:26:45 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/3] media: uapi: Add RGB bus format for the
 GiantPlus GPM940B0 panel
Message-ID: <20190605112645.5b357630@coco.lan>
In-Reply-To: <20190603153511.24384-2-paul@crapouillou.net>
References: <20190603153511.24384-1-paul@crapouillou.net>
 <20190603153511.24384-2-paul@crapouillou.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lTJZ7yvx2GJn/5Ucl0IpHbkLAJMz/sLGSpI28ny4Qgc=; b=FHC+epX7Epn/9PMwVZpDGE2gYh
 9bs1PVFxV3ddPcqxWbVbtVC9OvlXVaEiKv7KY+VxKkSrmsSsDkzj5tmUjb8EDKG8oWktusbeahEJ5
 FssgsPLunzGe9XEtRZSi2BN5xyscJyO5DT53Ckr5gmpQA/jNeap7pVsE2s+NGqS3/u+C4Lh2y+5UV
 I5zbYGpJnOYqJuDMjEJ6EQ1Eydk7ocvjOoR4FJzl8d0Cq0E6oi6ptgdgGh+ae2j49nUnzwfKBCYsY
 s5kdPlghAB5sehdD5+zOGJ9trAFcZkO1kaKYvY6mRU10ueKpF2KKukOhKDCj5KAIQ5PTDwdB9p+8S
 H759F1ug==;
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
Cc: devicetree@vger.kernel.org, od@zcrc.me, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Hans Verkuil <hansverk@cisco.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gTW9uLCAgMyBKdW4gMjAxOSAxNzozNToxMCArMDIwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gZXNjcmV2ZXU6Cgo+IFRoZSBHaWFudFBsdXMgR1BNOTQwQjAgaXMgYSAy
NC1iaXQgVEZUIHBhbmVsIHdoZXJlIHRoZSBSR0IgY29tcG9uZW50cwo+IGFyZSB0cmFuc2ZlcnJl
ZCBzZXF1ZW50aWFsbHkgb24gYSA4LWJpdCBidXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBD
ZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIHYy
OiBOZXcgcGF0Y2gKPiAgICAgCj4gICAgIHYzOiBObyBjaGFuZ2UKPiAgICAgCj4gICAgIHY0OiBB
ZGQgb25seSBNRURJQV9CVVNfRk1UX1JHQjg4OF8zWDgsIGFzIHdlIGRvbid0IGhhdmUgdG8gY2Fy
ZSBhYm91dAo+ICAgICAgICAgZW5kaWFubmVzcwoKU2FtZSBjb21tZW50IGFzIG9uIHZlcnNpb24g
MzoKCllvdSBzaG91bGQgYWxzbyBwYXRjaCB0aGUgZG9jdW1lbnRhdGlvbiB0ZXh0IGF0OgoKCURv
Y3VtZW50YXRpb24vbWVkaWEvdWFwaS92NGwvc3ViZGV2LWZvcm1hdHMucnN0CgpJbiBvcmRlciB0
byBkZXNjcmliZSB0aGUgbmV3IGZvcm1hdCB0aGF0IHdpbGwgYmUgaW5jbHVkZWQuCgoKPiAKPiAg
aW5jbHVkZS91YXBpL2xpbnV4L21lZGlhLWJ1cy1mb3JtYXQuaCB8IDMgKystCj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL2xpbnV4L21lZGlhLWJ1cy1mb3JtYXQuaCBiL2luY2x1ZGUvdWFwaS9saW51
eC9tZWRpYS1idXMtZm9ybWF0LmgKPiBpbmRleCAyYTZiMjUzY2ZiMDUuLjE2YzFmYTJkODlhNCAx
MDA2NDQKPiAtLS0gYS9pbmNsdWRlL3VhcGkvbGludXgvbWVkaWEtYnVzLWZvcm1hdC5oCj4gKysr
IGIvaW5jbHVkZS91YXBpL2xpbnV4L21lZGlhLWJ1cy1mb3JtYXQuaAo+IEBAIC0zNCw3ICszNCw3
IEBACj4gIAo+ICAjZGVmaW5lIE1FRElBX0JVU19GTVRfRklYRUQJCQkweDAwMDEKPiAgCj4gLS8q
IFJHQiAtIG5leHQgaXMJMHgxMDFjICovCj4gKy8qIFJHQiAtIG5leHQgaXMJMHgxMDFkICovCj4g
ICNkZWZpbmUgTUVESUFfQlVTX0ZNVF9SR0I0NDRfMVgxMgkJMHgxMDE2Cj4gICNkZWZpbmUgTUVE
SUFfQlVTX0ZNVF9SR0I0NDRfMlg4X1BBREhJX0JFCTB4MTAwMQo+ICAjZGVmaW5lIE1FRElBX0JV
U19GTVRfUkdCNDQ0XzJYOF9QQURISV9MRQkweDEwMDIKPiBAQCAtNTUsNiArNTUsNyBAQAo+ICAj
ZGVmaW5lIE1FRElBX0JVU19GTVRfUkdCODg4XzFYMjQJCTB4MTAwYQo+ICAjZGVmaW5lIE1FRElB
X0JVU19GTVRfUkdCODg4XzJYMTJfQkUJCTB4MTAwYgo+ICAjZGVmaW5lIE1FRElBX0JVU19GTVRf
UkdCODg4XzJYMTJfTEUJCTB4MTAwYwo+ICsjZGVmaW5lIE1FRElBX0JVU19GTVRfUkdCODg4XzNY
OAkJMHgxMDFjCj4gICNkZWZpbmUgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVg3WDRfU1BXRwkJMHgx
MDExCj4gICNkZWZpbmUgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVg3WDRfSkVJREEJMHgxMDEyCj4g
ICNkZWZpbmUgTUVESUFfQlVTX0ZNVF9BUkdCODg4OF8xWDMyCQkweDEwMGQKCgoKVGhhbmtzLApN
YXVybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
