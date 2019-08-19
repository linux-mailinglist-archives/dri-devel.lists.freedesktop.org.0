Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFD292195
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 12:46:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0189A6E0FC;
	Mon, 19 Aug 2019 10:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E10036E0FC
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 10:46:22 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id EC97E20035;
 Mon, 19 Aug 2019 12:46:17 +0200 (CEST)
Date: Mon, 19 Aug 2019 12:46:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
Subject: Re: [PATCH v2 2/2] drm: bridge: adv7511: Add support for ADV7535
Message-ID: <20190819104616.GA15890@ravnborg.org>
References: <20190809141611.9927-1-bogdan.togorean@analog.com>
 <20190809141611.9927-3-bogdan.togorean@analog.com>
 <20190809152510.GA23265@ravnborg.org>
 <c99cfbd3dc45bb02618e7653c33022f3553e1cce.camel@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c99cfbd3dc45bb02618e7653c33022f3553e1cce.camel@analog.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=dqr19Wo4 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=-vBUGyUoSLmi7INXVdEA:9 a=CjuIK1q_8ugA:10
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "matt.redfearn@thinci.com" <matt.redfearn@thinci.com>,
 "allison@lohutok.net" <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQm9nZGFuLgoKPiA+ID4gIAkJYWR2NzUzM19kZXRhY2hfZHNpKGFkdjc1MTEpOwo+ID4gPiAg
CWkyY191bnJlZ2lzdGVyX2RldmljZShhZHY3NTExLT5pMmNfY2VjKTsKPiA+ID4gIAlpZiAoYWR2
NzUxMS0+Y2VjX2NsaykKPiA+ID4gQEAgLTEyNjYsOCArMTI3OCw5IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgaTJjX2RldmljZV9pZAo+ID4gPiBhZHY3NTExX2kyY19pZHNbXSA9IHsKPiA+ID4gIAl7
ICJhZHY3NTExIiwgQURWNzUxMSB9LAo+ID4gPiAgCXsgImFkdjc1MTF3IiwgQURWNzUxMSB9LAo+
ID4gPiAgCXsgImFkdjc1MTMiLCBBRFY3NTExIH0sCj4gPiA+IC0jaWZkZWYgQ09ORklHX0RSTV9J
MkNfQURWNzUzMwo+ID4gPiArI2lmZGVmIENPTkZJR19EUk1fSTJDX0FEVjc1M3gKPiA+ID4gIAl7
ICJhZHY3NTMzIiwgQURWNzUzMyB9LAo+ID4gPiArCXsgImFkdjc1MzUiLCBBRFY3NTM1IH0sCj4g
PiA+ICAjZW5kaWYKPiA+IAo+ID4gVGhpcyBpZmRlZiBtYXkgbm90IGJlIG5lZWRlZD8/Cj4gPiBJ
ZiB3ZSBkaWQgbm90IGdldCB0aGlzIHR5cGUgd2Ugd2lsbCBub3QgbG9vayBpdCB1cC4KPiBCdXQg
aWYgd2UgaGF2ZSBkZWZpbmVkIGluIERUIGFkdjc1MzMvNSBkZXZpY2UgYnV0Cj4gQ09ORklHX0RS
TV9JMkNfQURWNzUzeCBub3Qgc2VsZWN0ZWQgcHJvYmUgd2lsbCBmYWlsIHdpdGggRU5PREVWLiBU
aGF0Cj4gd291bGQgYmUgb2s/CgpXaGF0IGRvIHdlIGdhaW4gZnJvbSB0aGlzIGNvbXBsZXhpdHkg
aW4gdGhlIGVuZC4KV2h5IG5vdCBsZXQgdGhlIGRyaXZlciBhbHdheXMgc3VwcG9ydCBhbGwgdmFy
aWFudHMuCgpJZiB0aGlzIHJlc3VsdCBpbiBhIHNpbXBsZXIgZHJpdmVyLCBhbmQgbGVzcyBjaG9p
Y2VzIGluIEtjb25maWcKdGhlbiBpdCBpcyBhIHdpbi13aW4uCgoJU2FtCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
