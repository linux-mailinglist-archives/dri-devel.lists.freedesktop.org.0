Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77AD136CDA
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5937C896EC;
	Thu,  6 Jun 2019 07:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8353F891E3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 22:00:07 +0000 (UTC)
Date: Wed, 05 Jun 2019 23:59:58 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 2/3] media: uapi: Add RGB bus format for the GiantPlus
 GPM940B0 panel
To: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Message-Id: <1559771998.1972.0@crapouillou.net>
In-Reply-To: <20190605112645.5b357630@coco.lan>
References: <20190603153511.24384-1-paul@crapouillou.net>
 <20190603153511.24384-2-paul@crapouillou.net>
 <20190605112645.5b357630@coco.lan>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1559772004; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xywClfAbICtmWsTPN9rFrgnFtGpCJiSZnGd/4G/sFDU=;
 b=dgEscgVUN2r30uwN1R3XaCqyqJkLsVj0tUVaV9fmT+7mxuvLtMGzDak4rtnsK05vthIyLm
 ccfvUwbQNVVu8riTlKwCgXHRlszCXz9vXOs50psbPAFRBvcKKgy2NkNQ5LArLgUwZQjjPE
 A7NZODVmTXGvqxsvgXaUwW5bsnkmaFo=
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSBtZXIuIDUganVpbiAyMDE5IMOgIDE2OjI2LCBNYXVybyBDYXJ2YWxobyBDaGVoYWIgCjxt
Y2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4gYSDDqWNyaXQgOgo+IEVtIE1vbiwgIDMgSnVuIDIw
MTkgMTc6MzU6MTAgKzAyMDAKPiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4g
ZXNjcmV2ZXU6Cj4gCj4+ICBUaGUgR2lhbnRQbHVzIEdQTTk0MEIwIGlzIGEgMjQtYml0IFRGVCBw
YW5lbCB3aGVyZSB0aGUgUkdCIAo+PiBjb21wb25lbnRzCj4+ICBhcmUgdHJhbnNmZXJyZWQgc2Vx
dWVudGlhbGx5IG9uIGEgOC1iaXQgYnVzLgo+PiAKPj4gIFNpZ25lZC1vZmYtYnk6IFBhdWwgQ2Vy
Y3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pgo+PiAgLS0tCj4+IAo+PiAgTm90ZXM6Cj4+ICAg
ICAgdjI6IE5ldyBwYXRjaAo+PiAKPj4gICAgICB2MzogTm8gY2hhbmdlCj4+IAo+PiAgICAgIHY0
OiBBZGQgb25seSBNRURJQV9CVVNfRk1UX1JHQjg4OF8zWDgsIGFzIHdlIGRvbid0IGhhdmUgdG8g
Y2FyZSAKPj4gYWJvdXQKPj4gICAgICAgICAgZW5kaWFubmVzcwo+IAo+IFNhbWUgY29tbWVudCBh
cyBvbiB2ZXJzaW9uIDM6Cj4gCj4gWW91IHNob3VsZCBhbHNvIHBhdGNoIHRoZSBkb2N1bWVudGF0
aW9uIHRleHQgYXQ6Cj4gCj4gCURvY3VtZW50YXRpb24vbWVkaWEvdWFwaS92NGwvc3ViZGV2LWZv
cm1hdHMucnN0Cj4gCj4gSW4gb3JkZXIgdG8gZGVzY3JpYmUgdGhlIG5ldyBmb3JtYXQgdGhhdCB3
aWxsIGJlIGluY2x1ZGVkLgoKT3VjaC4gU29ycnkuIFdpbGwgZG8uCgotUGF1bAoKPiAKPj4gCj4+
ICAgaW5jbHVkZS91YXBpL2xpbnV4L21lZGlhLWJ1cy1mb3JtYXQuaCB8IDMgKystCj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+PiAKPj4gIGRpZmYg
LS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgvbWVkaWEtYnVzLWZvcm1hdC5oIAo+PiBiL2luY2x1
ZGUvdWFwaS9saW51eC9tZWRpYS1idXMtZm9ybWF0LmgKPj4gIGluZGV4IDJhNmIyNTNjZmIwNS4u
MTZjMWZhMmQ4OWE0IDEwMDY0NAo+PiAgLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L21lZGlhLWJ1
cy1mb3JtYXQuaAo+PiAgKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L21lZGlhLWJ1cy1mb3JtYXQu
aAo+PiAgQEAgLTM0LDcgKzM0LDcgQEAKPj4gCj4+ICAgI2RlZmluZSBNRURJQV9CVVNfRk1UX0ZJ
WEVECQkJMHgwMDAxCj4+IAo+PiAgLS8qIFJHQiAtIG5leHQgaXMJMHgxMDFjICovCj4+ICArLyog
UkdCIC0gbmV4dCBpcwkweDEwMWQgKi8KPj4gICAjZGVmaW5lIE1FRElBX0JVU19GTVRfUkdCNDQ0
XzFYMTIJCTB4MTAxNgo+PiAgICNkZWZpbmUgTUVESUFfQlVTX0ZNVF9SR0I0NDRfMlg4X1BBREhJ
X0JFCTB4MTAwMQo+PiAgICNkZWZpbmUgTUVESUFfQlVTX0ZNVF9SR0I0NDRfMlg4X1BBREhJX0xF
CTB4MTAwMgo+PiAgQEAgLTU1LDYgKzU1LDcgQEAKPj4gICAjZGVmaW5lIE1FRElBX0JVU19GTVRf
UkdCODg4XzFYMjQJCTB4MTAwYQo+PiAgICNkZWZpbmUgTUVESUFfQlVTX0ZNVF9SR0I4ODhfMlgx
Ml9CRQkJMHgxMDBiCj4+ICAgI2RlZmluZSBNRURJQV9CVVNfRk1UX1JHQjg4OF8yWDEyX0xFCQkw
eDEwMGMKPj4gICsjZGVmaW5lIE1FRElBX0JVU19GTVRfUkdCODg4XzNYOAkJMHgxMDFjCj4+ICAg
I2RlZmluZSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDdYNF9TUFdHCQkweDEwMTEKPj4gICAjZGVm
aW5lIE1FRElBX0JVU19GTVRfUkdCODg4XzFYN1g0X0pFSURBCTB4MTAxMgo+PiAgICNkZWZpbmUg
TUVESUFfQlVTX0ZNVF9BUkdCODg4OF8xWDMyCQkweDEwMGQKPiAKPiAKPiAKPiBUaGFua3MsCj4g
TWF1cm8KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
