Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C47B4350D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 11:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4266B898B7;
	Thu, 13 Jun 2019 09:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1CBA898B7;
 Thu, 13 Jun 2019 09:59:36 +0000 (UTC)
Received: from 201.86.169.251.dynamic.adsl.gvt.net.br ([201.86.169.251]
 helo=coco.lan)
 by casper.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMVS-0000iN-9Z; Thu, 13 Jun 2019 09:58:54 +0000
Date: Thu, 13 Jun 2019 06:58:43 -0300
From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Subject: Re: [PATCH v4 18/28] docs: convert docs to ReST and rename to *.rst
Message-ID: <20190613065843.100f72dd@coco.lan>
In-Reply-To: <7dc94cb4-ebf1-22ab-29c9-fcb2b875a9ac@csail.mit.edu>
References: <cover.1560361364.git.mchehab+samsung@kernel.org>
 <fac44e1fbab5ea755a93601a4fdfa34fcc57ae9e.1560361364.git.mchehab+samsung@kernel.org>
 <7dc94cb4-ebf1-22ab-29c9-fcb2b875a9ac@csail.mit.edu>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=X6go1h+qBvd8UqStxDka25oSP1lwn219vXM1njzftqM=; b=st/cCkCW17JvfhPcMMlIiWlWs7
 IjzbMHLeCgNGoALijV6IG+3mBu2hWh+zDF/ixgeztGRJFvKYWEb/k1hwDtOuJEM+LaN5VPyeL2Nyt
 pUW3p7YE7JRXzR5AqF9H3+IiwxYWckQCRps/QFoMco8bS1sS+v518UWrrJXO7ml5NcscdFDSXeQVX
 ZKduv2MoYrDVAMjIkypzrzv1fDu9De18EdqyKnVmVA/jtlt3lbqFtvB/kKq3/UdhRk448WORt2zGk
 vyVeBQhaltTvjNhKaj4bDz1fJNL7g5eIVBQzyzZatNVk3zR46pfOQJ6fi4X1Ul2gzhVbF7Xgp5Fcx
 8jdm6Tow==;
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
Cc: Nishanth Menon <nm@ti.com>, linux-wireless@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Viresh Kumar <viresh.kumar@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Harry Wei <harryxiyou@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, Alex Shi <alex.shi@linux.alibaba.com>,
 Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-pci@vger.kernel.org,
 Len Brown <len.brown@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 intel-gfx@lists.freedesktop.org, Mauro Carvalho Chehab <mchehab@infradead.org>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 netdev@vger.kernel.org, linux-pm@vger.kernel.org, "Rafael J.
 Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Sebastian Reichel <sre@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW0gV2VkLCAxMiBKdW4gMjAxOSAxNzoyNTozOSAtMDcwMAoiU3JpdmF0c2EgUy4gQmhhdCIgPHNy
aXZhdHNhQGNzYWlsLm1pdC5lZHU+IGVzY3JldmV1OgoKPiBPbiA2LzEyLzE5IDEwOjUyIEFNLCBN
YXVybyBDYXJ2YWxobyBDaGVoYWIgd3JvdGU6Cj4gPiBDb252ZXJ0IHRoZSBQTSBkb2N1bWVudHMg
dG8gUmVTVCwgaW4gb3JkZXIgdG8gYWxsb3cgdGhlbSB0bwo+ID4gYnVpbGQgd2l0aCBTcGhpbngu
Cj4gPiAKPiA+IFRoZSBjb252ZXJzaW9uIGlzIGFjdHVhbGx5Ogo+ID4gICAtIGFkZCBibGFuayBs
aW5lcyBhbmQgaWRlbnRhdGlvbiBpbiBvcmRlciB0byBpZGVudGlmeSBwYXJhZ3JhcGhzOwo+ID4g
ICAtIGZpeCB0YWJsZXMgbWFya3VwczsKPiA+ICAgLSBhZGQgc29tZSBsaXN0cyBtYXJrdXBzOwo+
ID4gICAtIG1hcmsgbGl0ZXJhbCBibG9ja3M7Cj4gPiAgIC0gYWRqdXN0IHRpdGxlIG1hcmt1cHMu
Cj4gPiAKPiA+IEF0IGl0cyBuZXcgaW5kZXgucnN0LCBsZXQncyBhZGQgYSA6b3JwaGFuOiB3aGls
ZSB0aGlzIGlzIG5vdCBsaW5rZWQgdG8KPiA+IHRoZSBtYWluIGluZGV4LnJzdCBmaWxlLCBpbiBv
cmRlciB0byBhdm9pZCBidWlsZCB3YXJuaW5ncy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWF1
cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK3NhbXN1bmdAa2VybmVsLm9yZz4KPiA+IEFja2Vk
LWJ5OiBCam9ybiBIZWxnYWFzIDxiaGVsZ2Fhc0Bnb29nbGUuY29tPgo+ID4gQWNrZWQtYnk6IE1h
cmsgQnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiA+IC0tLSAgCj4gCj4gWy4uLl0KPiAKPiA+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL3Bvd2VyL3N1c3BlbmQtYW5kLWNwdWhvdHBsdWcu
dHh0IGIvRG9jdW1lbnRhdGlvbi9wb3dlci9zdXNwZW5kLWFuZC1jcHVob3RwbHVnLnJzdAo+ID4g
c2ltaWxhcml0eSBpbmRleCA5MCUKPiA+IHJlbmFtZSBmcm9tIERvY3VtZW50YXRpb24vcG93ZXIv
c3VzcGVuZC1hbmQtY3B1aG90cGx1Zy50eHQKPiA+IHJlbmFtZSB0byBEb2N1bWVudGF0aW9uL3Bv
d2VyL3N1c3BlbmQtYW5kLWNwdWhvdHBsdWcucnN0Cj4gPiBpbmRleCBhODc1MWI4ZGYxMGUuLjlk
ZjY2NGY1NDIzYSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vcG93ZXIvc3VzcGVuZC1h
bmQtY3B1aG90cGx1Zy50eHQKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vcG93ZXIvc3VzcGVuZC1h
bmQtY3B1aG90cGx1Zy5yc3QKPiA+IEBAIC0xLDEwICsxLDE1IEBACj4gPiArPT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0K
PiA+ICBJbnRlcmFjdGlvbiBvZiBTdXNwZW5kIGNvZGUgKFMzKSB3aXRoIHRoZSBDUFUgaG90cGx1
ZyBpbmZyYXN0cnVjdHVyZQo+ID4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPiAgCj4gPiAtICAgICAoQykgMjAx
MSAtIDIwMTQgU3JpdmF0c2EgUy4gQmhhdCA8c3JpdmF0c2EuYmhhdEBsaW51eC52bmV0LmlibS5j
b20+Cj4gPiArKEMpIDIwMTEgLSAyMDE0IFNyaXZhdHNhIFMuIEJoYXQgPHNyaXZhdHNhLmJoYXRA
bGludXgudm5ldC5pYm0uY29tPgo+ID4gIAo+ID4gIAo+ID4gLUkuIEhvdyBkb2VzIHRoZSByZWd1
bGFyIENQVSBob3RwbHVnIGNvZGUgZGlmZmVyIGZyb20gaG93IHRoZSBTdXNwZW5kLXRvLVJBTQo+
ID4gLSAgIGluZnJhc3RydWN0dXJlIHVzZXMgaXQgaW50ZXJuYWxseT8gQW5kIHdoZXJlIGRvIHRo
ZXkgc2hhcmUgY29tbW9uIGNvZGU/Cj4gPiArSS4gRGlmZmVyZW5jZXMgYmV0d2VlbiBDUFUgaG90
cGx1ZyBhbmQgU3VzcGVuZC10by1SQU0KPiA+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiA+ICsKPiA+ICtIb3cgZG9lcyB0aGUgcmVndWxh
ciBDUFUgaG90cGx1ZyBjb2RlIGRpZmZlciBmcm9tIGhvdyB0aGUgU3VzcGVuZC10by1SQU0KPiA+
ICtpbmZyYXN0cnVjdHVyZSB1c2VzIGl0IGludGVybmFsbHk/IEFuZCB3aGVyZSBkbyB0aGV5IHNo
YXJlIGNvbW1vbiBjb2RlPwo+ID4gIAo+ID4gIFdlbGwsIGEgcGljdHVyZSBpcyB3b3J0aCBhIHRo
b3VzYW5kIHdvcmRzLi4uIFNvIEFTQ0lJIGFydCBmb2xsb3dzIDotKQo+ID4gICAgCj4gCj4gWy4u
Ll0KPiAKPiA+IEBAIC0xMDEsNyArMTA4LDcgQEAgZXhlY3V0aW9uIGR1cmluZyByZXN1bWUpOgo+
ID4gIAo+ID4gIEl0IGlzIHRvIGJlIG5vdGVkIGhlcmUgdGhhdCB0aGUgc3lzdGVtX3RyYW5zaXRp
b25fbXV0ZXggbG9jayBpcyBhY3F1aXJlZCBhdCB0aGUgdmVyeQo+ID4gIGJlZ2lubmluZywgd2hl
biB3ZSBhcmUganVzdCBzdGFydGluZyBvdXQgdG8gc3VzcGVuZCwgYW5kIHRoZW4gcmVsZWFzZWQg
b25seQo+ID4gLWFmdGVyIHRoZSBlbnRpcmUgY3ljbGUgaXMgY29tcGxldGUgKGkuZS4sIHN1c3Bl
bmQgKyByZXN1bWUpLgo+ID4gK2FmdGVyIHRoZSBlbnRpcmUgY3ljbGUgaXMgY29tcGxldGUgKGku
ZS4sIHN1c3BlbmQgKyByZXN1bWUpOjoKPiA+ICAgIAo+IAo+IEkgdGhpbmsgdGhhdCBzaG91bGQg
YmUgYSBwZXJpb2QsIG5vdCBhIGNvbG9uLCBiZWNhdXNlIGl0IGlzIGNsYXJpZnlpbmcKPiB0aGUg
dGV4dCBhYm92ZSBpdCAoYXMgb3Bwb3NlZCB0byByZWZlcnJpbmcgdG8gdGhlIGV4YW1wbGUgYmVs
b3cgaXQpLgo+IAo+IE90aGVyIHRoYW4gdGhhdCwgZm9yIHN1c3BlbmQtYW5kLWNwdWhvdHBsdWcu
dHh0Ogo+IAo+IEFja2VkLWJ5OiBTcml2YXRzYSBTLiBCaGF0IChWTXdhcmUpIDxzcml2YXRzYUBj
c2FpbC5taXQuZWR1PgoKQWgsIG9rLiBJJ2xsIGNoYW5nZSBpdCB0bzoKCglhZnRlciB0aGUgZW50
aXJlIGN5Y2xlIGlzIGNvbXBsZXRlIChpLmUuLCBzdXNwZW5kICsgcmVzdW1lKS4KCgk6OgoKYW5k
IGFkZCB5b3VyIGFja2VkLWJ5LgoKPiAgCj4gUmVnYXJkcywKPiBTcml2YXRzYQo+IFZNd2FyZSBQ
aG90b24gT1MKCgoKVGhhbmtzLApNYXVybwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
