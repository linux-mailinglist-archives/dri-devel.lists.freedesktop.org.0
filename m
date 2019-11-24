Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D5108274
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2019 08:32:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 598656E0C1;
	Sun, 24 Nov 2019 07:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A40046E06E
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2019 07:32:26 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id BF78727E7AF;
 Sun, 24 Nov 2019 07:32:24 +0000 (GMT)
Date: Sun, 24 Nov 2019 08:32:22 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH v3 00/21] drm: Add support for bus-format negotiation
Message-ID: <20191124083222.657619ee@collabora.com>
In-Reply-To: <947ed9253bf501636e035698336c80c8af0743e0.camel@collabora.com>
References: <20191023154512.9762-1-boris.brezillon@collabora.com>
 <947ed9253bf501636e035698336c80c8af0743e0.camel@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Nikita Yushchenko <nikita.yoush@cogentembedded.com>,
 devicetree@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCAyNCBOb3YgMjAxOSAwOTo0Njo0MSArMDkwMApFemVxdWllbCBHYXJjaWEgPGV6ZXF1
aWVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOgoKPiBIaSBCb3JpcywgTmVpbCwKPiAKPiBPbiBXZWQs
IDIwMTktMTAtMjMgYXQgMTc6NDQgKzAyMDAsIEJvcmlzIEJyZXppbGxvbiB3cm90ZToKPiA+IFRo
aXMgcGF0Y2ggc2VyaWVzIGFpbXMgYXQgYWRkaW5nIHN1cHBvcnQgZm9yIHJ1bnRpbWUgYnVzLWZv
cm1hdAo+ID4gbmVnb3RpYXRpb24gYmV0d2VlbiBhbGwgZWxlbWVudHMgb2YgdGhlCj4gPiAnZW5j
b2RlciAtPiBicmlkZ2VzIC0+IGNvbm5lY3Rvci9kaXNwbGF5JyBzZWN0aW9uIG9mIHRoZSBwaXBl
bGluZS4KPiA+IAo+ID4gSW4gb3JkZXIgdG8gc3VwcG9ydCB0aGF0LCB3ZSBuZWVkIGRybSBicmlk
Z2VzIHRvIGZ1bGx5IHRha2UgcGFydCBpbiB0aGUKPiA+IGF0b21pYyBzdGF0ZSB2YWxpZGF0aW9u
IHByb2Nlc3MsIHdoaWNoIHJlcXVpcmVzIGFkZGluZyBhCj4gPiBkcm1fYnJpZGdlX3N0YXRlIGFu
ZCBhIG5ldyBkcm1fYnJpZGdlX2Z1bmNzLmF0b21pY19jaGVjaygpIGhvb2suCj4gPiBPbmNlIHRo
b3NlIGJhc2ljIGJ1aWxkaW5nIGJsb2NrcyBhcmUgaW4gcGxhY2UsIHdlIGNhbiBhZGQgbmV3IGhv
b2tzIHRvCj4gPiBhbGxvdyBidXMgZm9ybWF0IG5lZ290aWF0aW9uICh0aG9zZSBhcmUgY2FsbGVk
IGp1c3QgYmVmb3JlICAKPiA+IC0+YXRvbWljX2NoZWNrKCkpLiBUaGUgYnVzIGZvcm1hdCBzZWxl
Y3Rpb24gaXMgZG9uZSBhdCBydW50aW1lIGJ5ICAKPiA+IHRlc3RpbmcgYWxsIHBvc3NpYmxlIGNv
bWJpbmF0aW9ucyBhY3Jvc3MgdGhlIHdob2xlIGJyaWRnZSBjaGFpbiB1bnRpbAo+ID4gb25lIGlz
IHJlcG9ydGVkIHRvIHdvcmsuCj4gPiAKPiA+IE1ham9yIGNoYW5nZXMgc2luY2UgdjI6Cj4gPiAq
IEdldCByaWQgb2YgdGhlIGR1bW15IGJyaWRnZSBlbWJlZGRlZCBpbiBkcm1fZW5jb2RlciBhbmQg
bGV0IGVuY29kZXIKPiA+ICAgZHJpdmVycyBwcm92aWRlIHRoZWlyIG93biBicmlkZ2UgZWxlbWVu
dAo+ID4gKiBDbGFyaWZ5IEFQSXMgYW5kIGltcHJvdmUgdGhlIGRvYwo+ID4gKiBQcm9wYWdhdGUg
YnVzIGZsYWdzIGJ5IGRlZmF1bHQKPiA+IAo+ID4gTWFqb3IgY2hhbmdlcyBzaW5jZSB0aGUgUkZD
Ogo+ID4gCj4gPiAqIEFkZCBhIGR1bW15IGJyaWRnZSB0byB0aGUgZHJtX2VuY29kZXIgb2JqZWN0
IHNvIHRoYXQgdmM0IGFuZCBleHlub3MKPiA+ICAgRFNJIGRyaXZlcnMgY2FuIGltcGxlbWVudCB0
aGUgcHJlX2VuYWJsZS9wb3N0X2Rpc2FibGUgaG9va3MgaW5zdGVhZAo+ID4gICBvZiBtYW51YWxs
eSBzZXR0aW5nIGVuY29kZXItPmJyaWRnZSB0byBOVUxMIHRvIGNvbnRyb2wgdGhlCj4gPiAgIGVu
YWJsZS9kaXNhYmxlIHNlcXVlbmNlLiBUaGlzIGNoYW5nZSBpcyBhbHNvIGEgZmlyc3Qgc3RlcCB0
b3dhcmRzCj4gPiAgIGRybV9icmlkZ2UvZHJtX2VuY29kZXIgdW5pZmljYXRpb24uIE5ldyBlbmNv
ZGVyIGRyaXZlcnMgc2hvdWxkCj4gPiAgIHN0b3AgaW1wbGVtZW50aW5nIGRybV9lbmNvZGVyX2hl
bHBlcl9mdW5jcyBhbmQgc3dpdGNoIHRvCj4gPiAgIGRybV9icmlkZ2VfZnVuY3MuIEV4aXN0aW5n
IGRyaXZlcnMgY2FuIGJlIGNvbnZlcnRlZCBwcm9ncmVzc2l2ZWx5Cj4gPiAgIChhbHJlYWR5IGhh
dmUgYSBicmFuY2ggd2hlcmUgSSBzdGFydGVkIGNvbnZlcnRpbmcgc29tZSBvZiB0aGVtIFsxXSkK
PiA+ICogcmV3b3JrIHRoZSBidXMgZm9ybWF0IG5lZ290aWF0aW9uIHRvIGdpdmUgbW9yZSBjb250
cm9sIHRvIGJyaWRnZQo+ID4gICBkcml2ZXJzIGluIHRoZSBzZWxlY3Rpb24gcHJvY2VzcyAoZHJp
dmVyIGNhbiBzZWxlY3QgYXQgcnVudGltZSB3aGljaAo+ID4gICBpbnB1dCBidXMgZm9ybWF0IHRo
ZXkgc3VwcG9ydCBmb3IgYSBzcGVjaWZpYyBvdXRwdXQgYnVzIGZvcm1hdCBiYXNlZAo+ID4gICBv
biBhbnkgaW5mb3JtYXRpb24gYXZhaWxhYmxlIGluIHRoZSBjb25uZWN0b3IsIGNydGMgYW5kIGJy
aWRnZSBzdGF0ZS4KPiA+IAo+ID4gQSBtb3JlIGRldGFpbGVkIGNoYW5nZWxvZyBpcyBwcm92aWRl
ZCBpbiBlYWNoIHBhdGNoLgo+ID4gCj4gPiBUaGlzIHBhdGNoIHNlcmllcyBpcyBhbHNvIGF2YWls
YWJsZSBoZXJlIFsyXS4KPiA+IAo+ID4gVGhhbmtzLAo+ID4gCj4gPiBCb3Jpcwo+ID4gCj4gPiBb
MV1odHRwczovL2dpdGh1Yi5jb20vYmJyZXppbGxvbi9saW51eC0wZGF5L2NvbW1pdHMvZHJtLWVu
Y29kZXItYnJpZGdlCj4gPiBbMl1odHRwczovL2dpdGh1Yi5jb20vYmJyZXppbGxvbi9saW51eC0w
ZGF5L2NvbW1pdHMvZHJtLWJyaWRnZS1idXNmbXQtdjMKPiA+IAo+ID4gKioqIEJMVVJCIEhFUkUg
KioqCj4gPiAKPiA+IEJvcmlzIEJyZXppbGxvbiAoMjEpOgo+ID4gICBkcm0vdmM0OiBEZWNsYXJl
IHRoZSBEU0kgZW5jb2RlciBhcyBhIGJyaWRnZSBlbGVtZW50Cj4gPiAgIGRybS9leHlub3M6IERv
bid0IHJlc2V0IGJyaWRnZS0+bmV4dAo+ID4gICBkcm0vZXh5bm9zOiBEZWNsYXJlIHRoZSBEU0kg
ZW5jb2RlciBhcyBhIGJyaWRnZSBlbGVtZW50Cj4gPiAgIGRybS9icmlkZ2U6IFJlbmFtZSBicmlk
Z2UgaGVscGVycyB0YXJnZXRpbmcgYSBicmlkZ2UgY2hhaW4KPiA+ICAgZHJtL2JyaWRnZTogSW50
cm9kdWNlIGRybV9icmlkZ2VfY2hhaW5fZ2V0X25leHRfYnJpZGdlKCkKPiA+ICAgZHJtOiBTdG9w
IGFjY2Vzc2luZyBlbmNvZGVyLT5icmlkZ2UgZGlyZWN0bHkgIAo+IAo+IFBhdGNoZXMgMSB0byA2
IHNlZW0gdG8gYmUgcmV2aWV3ZWQsIGFuZCBhcHBlYXIgYXMgYSBnb29kCj4gc3RlcCBmb3J3YXJk
LgoKQUZBSUNULCBwYXRjaCAxIGFuZCAzIGFyZSBub3QgcmV2aWV3ZWQsIHdoaWNoIGlzIGtpbmQg
b2YgYmxvY2tpbmcgbWUKZm9yIHBhdGNoIDQtNi4gSSBjYW4gKGFuZCBwbGFuIHRvKSBhcHBseSBw
YXRjaCAyLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
