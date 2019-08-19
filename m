Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA5E948CF
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 17:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7662A89C84;
	Mon, 19 Aug 2019 15:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278F589C84
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 15:46:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7767E510;
 Mon, 19 Aug 2019 17:46:28 +0200 (CEST)
Date: Mon, 19 Aug 2019 18:46:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: omap4: how to obtain drm_connector in hdmi4_cec.c for
 cec_s_conn_info()?
Message-ID: <20190819154623.GN5011@pendragon.ideasonboard.com>
References: <ceac551b-6871-2039-e6c5-2b93d09874f9@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ceac551b-6871-2039-e6c5-2b93d09874f9@xs4all.nl>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1566229588;
 bh=kUSQfoRo7bK0f2zh3yvo1LzL+akVIXEGpxi6oWNhhPc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NVcqwJwE+gEJPLNRcglhk2OGxUHFEBdaiKwvQohAjPaCJbDiIinchvKTIwtGtTVnQ
 RZ+2gpYLDJF5BqQEYIx/0H3+PnA7vONQaXu3Q3tDjTYZLk0vCx2yBt8Rd+tAhr9Knf
 nmP0q4CTUVy/n+A+rLp0e5U8G0NfxcoA5q0dAVr4=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dariusz Marcinkiewicz <darekm@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFucywKCk9uIE1vbiwgQXVnIDE5LCAyMDE5IGF0IDA1OjIzOjMxUE0gKzAyMDAsIEhhbnMg
VmVya3VpbCB3cm90ZToKPiBIaSBUb21pLCBMYXVyZW50LAo+IAo+IEZvciB0aGUgQ0VDIGZyYW1l
d29yayB3ZSAoRGFyaXVzeiBhbmQgbXlzZWxmKSBhcmUgd29ya2luZyBvbiBjb2RlIHRvIGFzc29j
aWF0ZQo+IGEgZHJtX2Nvbm5lY3RvciB3aXRoIGEgQ0VDIGFkYXB0ZXIsIG1ha2luZyBpdCBlYXNp
ZXIgZm9yIHVzZXJzcGFjZSB0byBsaW5rIHRoZQo+IHR3by4KPiAKPiBJbiBvcmRlciB0byBkbyB0
aGF0IEkgbmVlZCB0aGUgZHJtX2Nvbm5lY3RvciBzdHJ1Y3R1cmUgd2hlbiBjcmVhdGluZyB0aGUK
PiBDRUMgYWRhcHRlciBpbiBoZG1pNF9jZWMuYy4gVGhhdCdzIGVhc3kgZW5vdWdoIGluIHRoZSBH
UFUgZHJpdmVycywgZXhjZXB0IGZvcgo+IHRoZSBvbWFwLgo+IAo+IEkgbmVlZCB0aGUgZHJtX2Nv
bm5lY3RvciBpbiBoZG1pNF9jZWNfaW5pdCgpLiBBbnkgaWRlYSBob3cgdG8gb2J0YWluIGl0Cj4g
dGhyb3VnaCB0aGUgc2VlbWluZ2x5IGVuZGxlc3MgbGF5ZXJzIG9mIGRhdGEgc3RydWN0dXJlcz8K
PiAKPiBUaGUgY29kZSBpdHNlbGYgdGhhdCBuZWVkcyB0byBiZSBhZGRlZCB0byBoZG1pNF9jZWNf
aW5pdCgpIGlzIGVhc3kgZW5vdWdoOgo+IAo+IAlzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9pbmZvIGNv
bm5faW5mbzsKPiAKPiAJY2VjX2ZpbGxfY29ubl9pbmZvX2Zyb21fZHJtKCZjb25uX2luZm8sIGNv
bm5lY3Rvcik7Cj4gCWNlY19zX2Nvbm5faW5mbyhjb3JlLT5hZGFwLCAmY29ubl9pbmZvKTsKPiAK
PiBidXQgZ2V0dGluZyB0aGUgZHJtX2Nvbm5lY3RvciBpcyB0aGUgaGFyZCBiaXQuCgpQbGVhc2Ug
aGF2ZSBhIGxvb2sgYXQgIltQQVRDSCAwMC82MF0gZHJtL29tYXA6IFJlcGxhY2UgY3VzdG9tIGRp
c3BsYXkKZHJpdmVycyB3aXRoIGRybV9icmlkZ2UgYW5kIGRybV9wYW5lbCIsIGF2YWlsYWJsZSBp
biBhIG5ldyB2ZXJzaW9uIGF0CgoJZ2l0Oi8vbGludXh0di5vcmcvcGluY2hhcnRsL21lZGlhLmdp
dCBvbWFwZHJtL2JyaWRnZS9kZXZlbAoKKEkgd2lsbCBwb3N0IHYyIHNvb24pCgpUaGUgcGF0Y2hl
cyBzaG93IHRoZSBkaXJlY3Rpb24gdGhlIG9tYXBkcm0gZHJpdmVyIGlzIHRha2luZy4gVGhlIGdv
YWwgaXMKdG8gZGVjb3VwbGUgY29ubmVjdG9ycyBmcm9tIGJyaWRnZXMsIHdoaWNoIEknbSBhZnJh
aWQgd2lsbCBoYXZlIGFuCmltcGFjdCBvbiBhc3NvY2lhdGluZyBkcm1fY29ubmVjdG9yIHdpdGgg
YSBDRUMgYWRhcHRlci4gVGhpcyBzaG91bGQgYmUKaW1wbGVtZW50ZWQgdGhyb3VnaCBuZXcgZHJt
X2JyaWRnZSBvcGVyYXRpb25zLCBhcyBicmlkZ2VzLCB3aGVuIGNyZWF0ZWQsCndpbGwgbm90IGNy
ZWF0ZSBkcm1fY29ubmVjdG9yIGFueW1vcmUuCgpJJ3ZlIHNvbHZlZCBhIHNpbWlsYXIgcHJvYmxl
bSByZWxhdGVkIHRvIGFzc29jaWF0aW5nIERSTSBjb25uZWN0b3JzIHdpdGgKYW4gSTJDIGFkYXB0
ZXIgZm9yIEREQy4gUGxlYXNlIHNlZSB0aGUgZHJtX2JyaWRnZV9jb25uZWN0b3JfaW5pdCgpCmZ1
bmN0aW9uIGFuZCBob3cgdGhlIEREQyBhZGFwdGVyIGlzIGhhbmRsZWQuIFNvbWV0aGluZyBzaW1p
bGFyIGNvdWxkIGJlCmRvbmUgZm9yIENFQy4KCj4gQXMgYW4gYXNpZGU6IEkgZmluYWxseSBmb3Vu
ZCBzb21lIHRpbWUgdG8gZmluaXNoIG15IHdvcmsgb24gdGhlIG9tYXA1IENFQyBzdXBwb3J0Lgo+
IEV4cGVjdCBwYXRjaGVzIGZvciB0aGlzIHNvb24uCgpDb3VsZCB5b3UgcGxlYXNlIHJlYmFzZSB0
aGF0IG9uIHRoZSBhYm92ZSBwYXRjaCBzZXJpZXMgPwoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBp
bmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
