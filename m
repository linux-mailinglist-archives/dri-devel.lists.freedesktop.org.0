Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1E520C6E7
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 10:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CCF6E1C0;
	Sun, 28 Jun 2020 08:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33746E1C0
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jun 2020 08:02:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BE854FB;
 Sun, 28 Jun 2020 10:02:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593331376;
 bh=nESMEEzOIRljPa7RAK8ux5xjY76qkCuwalXmm9dYPSo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SYdIbHiF9Bq1TVmfEgpI03wV7vnpqn34KS8O128xqXeK3NzTFCd2WZESfCf1WuJqJ
 T3PTnIEPcI8mp4C/8tfyc827Z0tUoNECApMEfw9ijOV9GLywyXsiHq54f+ABU8MLKL
 JWgeoyPs2lEZlqlYkU1OIUWNqyX69wli98bOzhBU=
Date: Sun, 28 Jun 2020 11:02:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/2] drm/panel-simple: Add missing BUS descriptions
 for some panels
Message-ID: <20200628080253.GD6954@pendragon.ideasonboard.com>
References: <20200621222742.25695-1-digetx@gmail.com>
 <20200621222742.25695-3-digetx@gmail.com>
 <20200627204338.GL5966@pendragon.ideasonboard.com>
 <dd1c5972-bbac-c2d8-76e8-08997b951e52@gmail.com>
 <20200628070745.GC6954@pendragon.ideasonboard.com>
 <20200628075245.GA128039@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200628075245.GA128039@ravnborg.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gU3VuLCBKdW4gMjgsIDIwMjAgYXQgMDk6NTI6NDVBTSArMDIwMCwgU2FtIFJh
dm5ib3JnIHdyb3RlOgo+IE9uIFN1biwgSnVuIDI4LCAyMDIwIGF0IDEwOjA3OjQ1QU0gKzAzMDAs
IExhdXJlbnQgUGluY2hhcnQgd3JvdGU6Cj4gPiBPbiBTdW4sIEp1biAyOCwgMjAyMCBhdCAwMjo0
NDoxNUFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gPj4gMjcuMDYuMjAyMCAyMzo0
MywgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+ID4+PiBPbiBNb24sIEp1biAyMiwgMjAy
MCBhdCAwMToyNzo0MkFNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gPj4+PiBUaGlz
IHBhdGNoIGFkZHMgbWlzc2luZyBCVVMgZmllbGRzIHRvIHRoZSBkaXNwbGF5IHBhbmVsIGRlc2Ny
aXB0aW9ucyBvZgo+ID4+Pj4gdGhlIHBhbmVscyB3aGljaCBhcmUgZm91bmQgb24gTlZJRElBIFRl
Z3JhIGRldmljZXM6Cj4gPj4+Pgo+ID4+Pj4gICAxLiBBVU8gQjEwMUFXMDMKPiA+Pj4+ICAgMi4g
Q2h1bmdod2EgQ0xBQTA3MFdQMDNYRwo+ID4+Pj4gICAzLiBDaHVuZ2h3YSBDTEFBMTAxV0EwMUEK
PiA+Pj4+ICAgNC4gQ2h1bmdod2EgQ0xBQTEwMVdCMDEKPiA+Pj4+ICAgNS4gSW5ub2x1eCBOMTU2
QkdFIEwyMQo+ID4+Pj4gICA2LiBTYW1zdW5nIExUTjEwMU5UMDUKPiA+Pj4+Cj4gPj4+PiBTdWdn
ZXN0ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJk
LmNvbT4KPiA+Pj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWls
LmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1w
bGUuYyB8IDEyICsrKysrKysrKysrKwo+ID4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRp
b25zKCspCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9w
YW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ID4+
Pj4gaW5kZXggODdlZGQyYmRmMDlhLi45ODZkZjk5Mzc2NTAgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMKPiA+Pj4+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+ID4+Pj4gQEAgLTY5OCw2ICs2OTgsOCBAQCBz
dGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2MgYXVvX2IxMDFhdzAzID0gewo+ID4+Pj4gIAkJ
LndpZHRoID0gMjIzLAo+ID4+Pj4gIAkJLmhlaWdodCA9IDEyNSwKPiA+Pj4+ICAJfSwKPiA+Pj4+
ICsJLmJ1c19mb3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjY2Nl8xWDdYM19TUFdHLAo+ID4+Pj4g
KwkuYnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0ggfCBEUk1fQlVTX0ZMQUdfUElYREFU
QV9EUklWRV9QT1NFREdFLAo+ID4+PiAKPiA+Pj4gRG9lcyBEUk1fQlVTX0ZMQUdfUElYREFUQV9E
UklWRV8qIG1ha2Ugc2Vuc2UgZm9yIExWRFMgPwo+ID4+IAo+ID4+IFRvIGJlIGhvbmVzdCBJIGRv
bid0IGtub3cgd2hldGhlciBpdCBtYWtlIHNlbnNlIG9yIG5vdCBmb3IgTFZEUy4gSSBzYXcKPiA+
PiB0aGF0IG90aGVyIExWRFMgcGFuZWxzIGluIHBhbmVsLXNpbXBsZS5jIHVzZSB0aGUgUElYREFU
QSBmbGFnIGFuZCB0aGVuCj4gPj4gbG9va2VkIGF0IHdoYXQgdGltaW5nIGRpYWdyYW1zIGluIHRo
ZSBkYXRhc2hlZXRzIHNob3cuCj4gPiAKPiA+IEkgdGhpbmsgd2Ugc2hvdWxkIGRyb3AgRFJNX0JV
U19GTEFHX1BJWERBVEFfRFJJVkVfKiBmb3IgTFZEUyBwYW5lbHMuCj4gPiBJJ2xsIHN1Ym1pdCBh
IHBhdGNoLgo+IAo+IFdlIHNob3VsZCBhbHNvIGNsZWFuIHVwIGFsbCB0aGUgRFJNX0JVU19GTEFH
Xyogb25lIGRheS4KPiBObyBuZWVkIGZvciB0aGUgZGVwcmVjYXRlZCB2YWx1ZXMsIHNvIGEgZmV3
IGZpbGVzIG5lZWRzIGFuIHVwZGF0ZS4KPiBBbmQgd2UgY291bGQgZG9jdW1lbnQgd2hhdCBmbGFn
cyBtYWtlcyBzZW5zZSBmb3IgTFZEUyBldGMuCgpXaGVyZSB3b3VsZCB5b3UgYWRkIHRoYXQgZG9j
dW1lbnRhdGlvbiA/IFRoZSBoYXJkZXN0IHBhcnQgaXMgdG8gZmluZCBhCnBsYWNlIHRoYXQgd2ls
bCBiZSBub3RpY2VkIGJ5IGRldmVsb3BlcnMgOi0pCgpJJ3ZlIGp1c3Qgc3VibWl0dGVkIGEgcGF0
Y2ggdGhhdCBhZGRzIGEgV0FSTl9PTiB0byBjYXRjaCBzaW1pbGFyIGlzc3VlcwppbiB0aGUgcGFu
ZWwtc2ltcGxlIGRyaXZlci4gSXQncyBub3QgaWRlYWwgYXMgd2UgcmVhbGx5IHNob3VsZG4ndCBo
YXZlCnN1Y2ggY29kZSBpbiB0aGUga2VybmVsLCB0aGlzIGlzIHNvbWV0aGluZyB0aGF0IHNob3Vs
ZCBiZSBjYXVnaHQgYXMgcGFydApvZiB0aGUgaW50ZWdyYXRpb24gcHJvY2Vzcy4KCj4gT24gdGhl
IFRPRE8gbGlzdC4uLgo+Cj4gPj4+IFRoZSByZXN0IGxvb2tzIGdvb2QsIGV4Y2VwdCB0aGUgU2Ft
c3VuZyBwYW5lbCBmb3Igd2hpY2ggSSBoYXZlbid0IGJlZW4KPiA+Pj4gYWJsZSB0byBsb2NhdGUg
YSBkYXRhc2hlZXQuCj4gPj4+IAo+ID4+PiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8
bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgoKLS0gClJlZ2FyZHMsCgpMYXVyZW50
IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
