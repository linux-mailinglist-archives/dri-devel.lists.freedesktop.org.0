Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB092AD0F4
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 09:13:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB77894C3;
	Tue, 10 Nov 2020 08:13:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2A7894C3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 08:13:40 +0000 (UTC)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kcOmY-0000Xc-KA; Tue, 10 Nov 2020 09:13:38 +0100
Received: from mtr by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kcOmW-0000np-HD; Tue, 10 Nov 2020 09:13:36 +0100
Date: Tue, 10 Nov 2020 09:13:36 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
To: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH v2 00/16] drm/exynos: Convert driver to drm bridge
Message-ID: <20201110081336.GB13669@pengutronix.de>
References: <CGME20200911165401epcas1p3c7ee84dd01db93f472d6fa21c1100f29@epcas1p3.samsung.com>
 <20200911135413.3654800-1-m.tretter@pengutronix.de>
 <fa535450-cd68-415f-5c48-a4f753b2b70b@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa535450-cd68-415f-5c48-a4f753b2b70b@samsung.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 08:49:50 up 264 days, 15:20, 76 users,  load average: 0.13, 0.15,
 0.15
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 narmstrong@baylibre.com, b.zolnierkie@samsung.com, sw0312.kim@samsung.com,
 krzk@kernel.org, a.hajda@samsung.com, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de, sylvester.nawrocki@gmail.com,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAwOSBOb3YgMjAyMCAxMjoxNTozOSArMDkwMCwgSW5raSBEYWUgd3JvdGU6Cj4gMjAu
IDkuIDExLiDsmKTtm4QgMTA6NTPsl5AgTWljaGFlbCBUcmV0dGVyIOydtCjqsIApIOyTtCDquIA6
Cj4gPiBUaGlzIGlzIHYyIG9mIHRoZSBzZXJpZXMgdG8gY29udmVydCB0aGUgRXh5bm9zIE1JUEkg
RFNJIGRyaXZlciBpbnRvIGEgZHJtCj4gPiBicmlkZ2UgYW5kIG1ha2UgaXQgdXNhYmxlIHdpdGgg
b3RoZXIgZHJpdmVycy4gQWx0aG91Z2ggdGhlIGRyaXZlciBpcwo+ID4gY29udmVydGVkLCBpdCBz
dGlsbCBzdXBwb3J0cyB0aGUgY29tcG9uZW50IGZyYW1ld29yayBBUEkgdG8gc3RheSBjb21wbGlh
bnQKPiA+IHdpdGggdGhlIEV4eW5vcyBEUk0gZHJpdmVyLgo+ID4gCj4gPiBUaGUgRXh5bm9zIE1J
UEkgRFNJIFBoeSBpcyBhbHNvIGZvdW5kIG9uIHRoZSBpLk1YOE0gTWluaS4gSG93ZXZlciwgb24g
dGhlCj4gPiBpLk1YOE0gTWluaSwgdGhlIGJyaWRnZSBpcyBkcml2ZW4gYnkgYW4gTENESUYgZGlz
cGxheSBjb250cm9sbGVyIGluc3RlYWQgb2YKPiA+IHRoZSBFeHlub3MgRGVjb24uIFRoZSBkcml2
ZXIgZm9yIHRoZSBMQ0RJRiBkb2VzIG5vdCB1c2UgdGhlIGNvbXBvbmVudAo+ID4gZnJhbWV3b3Jr
LCBidXQgdXNlcyBkcm0gYnJpZGdlcy4KPiA+IAo+ID4gSSBkb24ndCBoYXZlIGFueSBFeHlub3Mg
U29DIHRvIGFjdHVhbGx5IHRlc3QgdGhlIHNlcmllcy4gSSBidWlsZCBhIGR1bW15IHRvCj4gPiB0
ZXN0IHRoZSBicmlkZ2Ugd2l0aCBhIGNvbXBvbmVudCBkcml2ZXIsIHRvIG1ha2Ugc3VyZSB0aGF0
IGF0IGxlYXN0IHRoZQo+ID4gaW5pdGlhbGl6YXRpb24gaXMgd29ya2luZy4gRnVydGhlcm1vcmUs
IHRlc3RlZCB0aGUgZHJpdmVyIGFzIGEgYnJpZGdlIHdpdGggYQo+ID4gZmV3IGFkZGl0aW9uYWwg
dW5maW5pc2hlZCBwYXRjaGVzIG9uIHRoZSBpLk1YOE0gTWluaSBFVksuIEhvd2V2ZXIsIHNvbWVi
b2R5Cj4gPiBzaG91bGQgdmVyaWZ5IHRoYXQgdGhlIGRyaXZlciBpcyBzdGlsbCB3b3JraW5nIG9u
IEV4eW5vcyBoYXJkd2FyZS4KPiA+IAo+ID4gSSBhbHNvIGNoYW5nZWQgdGhlIG9yZGVyIG9mIHRo
ZSBwYXRjaGVzIHRvIGZpcnN0IG1ha2UgdGhlIGRyaXZlciBtb3JlIHBsYXRmb3JtCj4gPiBpbmRl
cGVuZGVudCAocGF0Y2hlcyAyIHRvIDgpLCB0aGVuIGNvbnZlcnQgdG8gYSBkcm0gYnJpZGdlIGRy
aXZlciAocGF0Y2hlcyAxMAo+IAo+IEp1c3QgYSBmdW5kYW1lbnRhbCBxdWVzdGlvbiwgQSBNSVBJ
LURTSShEaXNwbGF5IFNlcmlhbCBJbnRlcmZhY2UpIGJ1cyBkZXZpY2UKPiB3b3VsZCBiZSBvbmUg
b2YgYW4gZW5jb2RlciB0eXBlIG9mIGRldmljZXMgbm90IGJyaWRnZSBzdWNoIGFzIERTSSB0byBM
VkRTCj4gYW5kIExWRFMgdG8gRFNJIGJyaWRnZSBkZXZpY2VzLCBhbmQgYWxzbyBpbWFnZSBlbmhh
bmNlciBhbmQgaW1hZ2UgY29tcHJlc3Nvcgo+IGluIGNhc2Ugb2YgRXh5bm9zLgoKSSBkb24ndCB1
bmRlcnN0YW5kLCB3aHkgdGhlIE1JUEktRFNJIGJ1cyBkZXZpY2Ugd291bGQgYmUgYW4gZW5jb2Rl
ciB0eXBlIGFuZApEU0kgdG8gTFZEUyBvciBNSVBJLURTSSB0byBIRE1JIHdvdWxkIGJlIGJyaWRn
ZXMuIEZvciBleGFtcGxlLCB0aGUgZGV2aWNlIHRyZWUKZG9jdW1lbnRhdGlvbiBmb3IgdGhlIERT
SU0gc3RhdGVzIHRoYXQgdGhlIERTSU0gcmVjZWl2ZXMgUkdCIHZpZGVvIGFzIGlucHV0CmFuZCBw
cm9kdWNlcyBNSVBJLURTSSBhcyBvdXRwdXQuIFRodXMsIHRoZSBEU0lNIGlzIGJhc2ljYWxseSBh
IHBhcmFsbGVsIFJHQiB0bwpNSVBJLURTSSBicmlkZ2UgYW5kIHRoZSBlbmNvZGVyIGlzIHRoZSBM
Q0QgY29udHJvbGxlciB0aGF0IGVuY29kZXMgdGhlIHZpZGVvCmRhdGEgYXMgcGFyYWxsZWwgUkdC
LgoKT24gdGhlIGkuTVg4TU0sIHRoZSBMQ0RJRiBpcyBhbHJlYWR5IHRoZSBlbmNvZGVyLiBPbiBF
eHlub3MsIHRoZSBzZXJpZXMKaW1wbGVtZW50cyB0aGUgZW5jb2RlciBpbiB0aGUgcGxhdGZvcm0g
Z2x1ZSwgYnV0IGluIHRoZSBlbmQgdGhlIGVuY29kZXIgY2FuCnByb2JhYmx5IGJlIG1vdmVkIHRv
IHRoZSBERUNPTi4KCj4gV2h5IGRvIHlvdSB3YW50IHRvIGNvbnZlcnQgc3VjaCBNSVBJLURTSSBk
cml2ZXIgdG8gYnJpZGdlIHR5cGUgb2YgZHJpdmVyPwo+IFNlZW1zIG5vdCBzZW5zaWJsZS4gVGhl
IHJlYXNvbiB3b3VsZCBiZSBqdXN0IHRvIHNoYXJlIE1JUEktRFNJIHBoeSBkcml2ZXIKPiBmb3Ig
RXh5bm9zIHdpdGggaS5NWDhNIE1pbmk/CgpZZXMsIHRoZSByZWFzb24gaXMgdGhhdCB0aGUgZHJp
dmVyIHNob3VsZCBiZSBzaGFyZWQgYmV0d2VlbiBFeHlub3MgYW5kCmkuTVg4TU0uIEl0IGlzIHRo
ZSBzYW1lIElQIGFuZCBJIGRvbid0IHNlZSBhIHJlYXNvbiB3aHkgd2Ugc2hvdWxkIGludHJvZHVj
ZQphbm90aGVyIGRyaXZlciBmb3IgdGhlIHNhbWUgSVAgaWYgdGhlIGRyaXZlciB3b3JrcyBmb3Ig
Ym90aCBTb0NzLgoKTWljaGFlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
