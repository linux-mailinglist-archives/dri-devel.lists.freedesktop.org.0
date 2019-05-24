Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E21229851
	for <lists+dri-devel@lfdr.de>; Fri, 24 May 2019 14:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C8476E102;
	Fri, 24 May 2019 12:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DEB6E102
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 12:55:06 +0000 (UTC)
Received: from 177.97.63.247.dynamic.adsl.gvt.net.br ([177.97.63.247]
 helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hU9io-0006hg-JZ; Fri, 24 May 2019 12:54:55 +0000
Date: Fri, 24 May 2019 09:54:48 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v3 2/3] media: uapi: Add RGB bus formats for the
 GiantPlus GPM940B0 panel
Message-ID: <20190524095448.5eeddc06@coco.lan>
In-Reply-To: <20190422093722.4344-2-paul@crapouillou.net>
References: <20190422093722.4344-1-paul@crapouillou.net>
 <20190422093722.4344-2-paul@crapouillou.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cyQ2oCePc4465xvjRRiSWu3xnwrETc8dIcA8pz3EwJ0=; b=E4iX4UX6mglLfAHRlj9/ZWx+Pu
 yjmQqjwNzpxIGvni7RskChjxO4ZkWz+4AxWjRGdL/6NO5FLorU4dYd5TmXiM8JGzpnn2J0v82gsPf
 oap2Y2VrPjk8iSXtkTbSk5vr3DIKak5KbRd3qKasC28pEf8aVn+a5aCiXaeImaL5VKHV5kxDl+8rL
 DsC2gwUE9Qy87vP6utPhnfZeTZP+gCCKcj8BxEuy+9oKbpuSf6UK8Pj+l8+B5TcI/BthdUA897BIi
 iaRO0las5/BQy59Sv+piPNCgL/9LhSMmy3jISAVESqnN2tFQ3Sbo91uVu5WwTB+7vmY0prvMP3Mvo
 cLGtF+rw==;
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans Verkuil <hansverk@cisco.com>, Rob Herring <robh+dt@kernel.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gTW9uLCAyMiBBcHIgMjAxOSAxMTozNzoyMSArMDIwMApQYXVsIENlcmN1ZWlsIDxwYXVsQGNy
YXBvdWlsbG91Lm5ldD4gZXNjcmV2ZXU6Cgo+IFRoZSBHaWFudFBsdXMgR1BNOTQwQjAgaXMgYSAy
NC1iaXQgVEZUIHBhbmVsIHdoZXJlIHRoZSBSR0IgY29tcG9uZW50cwo+IGFyZSB0cmFuc2ZlcnJl
ZCBzZXF1ZW50aWFsbHkgb24gYSA4LWJpdCBidXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGF1bCBD
ZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5uZXQ+Cj4gLS0tCj4gCj4gTm90ZXM6Cj4gICAgIHYy
OiBOZXcgcGF0Y2gKPiAgICAgCj4gICAgIHYzOiBObyBjaGFuZ2UKPiAKPiAgaW5jbHVkZS91YXBp
L2xpbnV4L21lZGlhLWJ1cy1mb3JtYXQuaCB8IDQgKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFw
aS9saW51eC9tZWRpYS1idXMtZm9ybWF0LmggYi9pbmNsdWRlL3VhcGkvbGludXgvbWVkaWEtYnVz
LWZvcm1hdC5oCj4gaW5kZXggZDZhNWEzYmZlNmM0Li5mMzE3MjRkNmNkNDAgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS91YXBpL2xpbnV4L21lZGlhLWJ1cy1mb3JtYXQuaAo+ICsrKyBiL2luY2x1ZGUv
dWFwaS9saW51eC9tZWRpYS1idXMtZm9ybWF0LmgKPiBAQCAtMzQsNyArMzQsNyBAQAo+ICAKPiAg
I2RlZmluZSBNRURJQV9CVVNfRk1UX0ZJWEVECQkJMHgwMDAxCj4gIAo+IC0vKiBSR0IgLSBuZXh0
IGlzCTB4MTAxYiAqLwo+ICsvKiBSR0IgLSBuZXh0IGlzCTB4MTAxZCAqLwo+ICAjZGVmaW5lIE1F
RElBX0JVU19GTVRfUkdCNDQ0XzFYMTIJCTB4MTAxNgo+ICAjZGVmaW5lIE1FRElBX0JVU19GTVRf
UkdCNDQ0XzJYOF9QQURISV9CRQkweDEwMDEKPiAgI2RlZmluZSBNRURJQV9CVVNfRk1UX1JHQjQ0
NF8yWDhfUEFESElfTEUJMHgxMDAyCj4gQEAgLTU0LDYgKzU0LDggQEAKPiAgI2RlZmluZSBNRURJ
QV9CVVNfRk1UX1JHQjg4OF8xWDI0CQkweDEwMGEKPiAgI2RlZmluZSBNRURJQV9CVVNfRk1UX1JH
Qjg4OF8yWDEyX0JFCQkweDEwMGIKPiAgI2RlZmluZSBNRURJQV9CVVNfRk1UX1JHQjg4OF8yWDEy
X0xFCQkweDEwMGMKPiArI2RlZmluZSBNRURJQV9CVVNfRk1UX1JHQjg4OF8zWDhfQkUJCTB4MTAx
Ygo+ICsjZGVmaW5lIE1FRElBX0JVU19GTVRfUkdCODg4XzNYOF9MRQkJMHgxMDFjCj4gICNkZWZp
bmUgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMVg3WDRfU1BXRwkJMHgxMDExCj4gICNkZWZpbmUgTUVE
SUFfQlVTX0ZNVF9SR0I4ODhfMVg3WDRfSkVJREEJMHgxMDEyCj4gICNkZWZpbmUgTUVESUFfQlVT
X0ZNVF9BUkdCODg4OF8xWDMyCQkweDEwMGQKCllvdSBzaG91bGQgYWxzbyBwYXRjaCB0aGUgZG9j
dW1lbnRhdGlvbiB0ZXh0IGF0OgoKCURvY3VtZW50YXRpb24vbWVkaWEvdWFwaS92NGwvc3ViZGV2
LWZvcm1hdHMucnN0CgpJbiBvcmRlciB0byBkZXNjcmliZSB0aGUgbmV3IGZvcm1hdHMgdGhhdCB3
aWxsIGJlIGluY2x1ZGVkLgoKKGFsc28gcGF0Y2ggbmVlZHMgdG8gYmUgcmViYXNlZCwgYXMgaXQg
Y29uZmxpY3RzIHRvIHNvbWUgb3RoZXIKbmV3IGZvcm1hdHMgYWRkZWQgdGhlcmUpCgpUaGFua3Ms
Ck1hdXJvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
