Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF3A4628F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 17:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC4189A4F;
	Fri, 14 Jun 2019 15:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D7189A4F
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 15:20:00 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0C9722168B;
 Fri, 14 Jun 2019 15:19:59 +0000 (UTC)
Date: Fri, 14 Jun 2019 17:19:58 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/2] drm: debugfs: make drm_debugfs_remove_files() a void
 function
Message-ID: <20190614151958.GA18049@kroah.com>
References: <20190614095110.3716-1-gregkh@linuxfoundation.org>
 <20190614145908.GZ23020@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190614145908.GZ23020@phenom.ffwll.local>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1560525600;
 bh=lx7ZnpJLsoewj0Shz5wWAefxN1GUj7ZY1dcoJy1k8lo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cCL4qFOxKb2MJzMT12cgJbDpNhnqdQBW7xewMlom1olXwrLH3mKUjg2/XdbcX2aqo
 pK7yA/w88K0CxKLSHS8cVdbCSRWQcwfr3fF/yoSvOzRKpJ83eWVbrfhJ+I12egLjOq
 rzYXif2scHgtiJSm3hZvs7wWnQQz6W/VbLs+mVZM=
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDQ6NTk6MDhQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIEp1biAxNCwgMjAxOSBhdCAxMTo1MTowOUFNICswMjAwLCBHcmVnIEty
b2FoLUhhcnRtYW4gd3JvdGU6Cj4gPiBUaGUgZnVuY3Rpb24gY2FuIG5vdCBmYWlsLCBhbmQgbm8g
b25lIGNoZWNrcyB0aGUgY3VycmVudCByZXR1cm4gdmFsdWUsCj4gPiBzbyBqdXN0IG1hcmsgaXQg
YXMgYSB2b2lkIGZ1bmN0aW9uIHNvIG5vIG9uZSBnZXRzIGNvbmZ1c2VkLgo+ID4gCj4gPiBDYzog
TWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KPiA+
IENjOiBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29tPgo+ID4gQ2M6IFNl
YW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgo+ID4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBs
aW51eC5pZT4KPiA+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4KPiA+IC0tLQo+ID4gIGRy
aXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jIHwgNSArKy0tLQo+ID4gIGluY2x1ZGUvZHJtL2Ry
bV9kZWJ1Z2ZzLmggICAgIHwgOSArKysrLS0tLS0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZGVidWdmcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMKPiA+
IGluZGV4IDZmMjgwMmU5YmZiNS4uNTE1NTY5MDAyYzg2IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9kZWJ1Z2ZzLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVi
dWdmcy5jCj4gPiBAQCAtMjcwLDggKzI3MCw4IEBAIGludCBkcm1fZGVidWdmc19pbml0KHN0cnVj
dCBkcm1fbWlub3IgKm1pbm9yLCBpbnQgbWlub3JfaWQsCj4gPiAgfQo+ID4gIAo+ID4gIAo+ID4g
LWludCBkcm1fZGVidWdmc19yZW1vdmVfZmlsZXMoY29uc3Qgc3RydWN0IGRybV9pbmZvX2xpc3Qg
KmZpbGVzLCBpbnQgY291bnQsCj4gPiAtCQkJICAgICBzdHJ1Y3QgZHJtX21pbm9yICptaW5vcikK
PiA+ICt2b2lkIGRybV9kZWJ1Z2ZzX3JlbW92ZV9maWxlcyhjb25zdCBzdHJ1Y3QgZHJtX2luZm9f
bGlzdCAqZmlsZXMsIGludCBjb3VudCwKPiA+ICsJCQkgICAgICBzdHJ1Y3QgZHJtX21pbm9yICpt
aW5vcikKPiAKPiBXZSdyZSB0cnlpbmcgdG8gZW50aXJlbHkgbnVrZSB0aGlzIGZ1bmN0aW9uIGhl
cmUsIHNlZSB0aGUga2VybmVsZG9jIGZvcgo+IGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcygpLiBP
bmx5IHVzZXIgbGVmdCBpcyB0ZWdyYSwgYW5kIHdlIGNhbGwgdGhlCj4gInJlbW92ZSBhbGwgZGVi
dWdmcyBmaWxlcyIgYW5kIHRoZSAtPmVhcmx5X3VucmVnaXN0ZXIgaG9va3MgYWxsIGZyb20gdGhl
Cj4gc2FtZSBwbGFjZS4gU28gdGhpcyBjYW4gYWxsIGJlIGdhcmJhZ2UgY29sbGVjdGVkLiBJdCdz
IG1pbGRseSBhbm5veWluZwo+IGJlY2F1c2Ugd2UnZCBuZWVkIHRvIG1vdmUgdGhlIGtmcmVlIGZy
b20gLT5lYXJseV91bnJlZ2lzdGVyIGludG8gLT5kZXN0cm95Cj4gY2FsbGJhY2tzLCBiZWNhdXNl
IGNvbm5lY3RvcnMgYXJlIHVucmVnaXN0ZXIgYmVmb3JlIHdlIHRocm93IGF3YXkgYWxsIHRoZQo+
IGRlYnVnZnMgZmlsZXMgaW4gZHJtX2Rldl91bnJlZ2lzdGVyKCkuIEJ1dCBpbW8gdGhhdCdzIGNs
ZWFuZXIgYW53YXkuCgpJIHdvdWxkIGxvdmUgdG8gc2VlIHRoaXMgZnVuY3Rpb24gZ29uZSwgaXQg
Y2FuIGFsc28gbWFrZSB0aGluZ3MgYSBsb3QKc2ltcGxlciBmcm9tIHRoZSBwb2ludCBvZiB2aWV3
IG9mIGNyZWF0aW5nIHRoZSBkZWJ1Z2ZzIGZpbGVzIGFzIHdlbGwsIGFzCm5vIGRlbnRyaWVzIHdp
bGwgbmVlZCB0byBiZSBzYXZlZC4KCj4gVXAgZm9yIHRoYXQ/CgpTdXJlLCBJIGNhbiBkbyB0aGF0
LiAgSSBoYXZlIGEgbXVjaCBsYXJnZXIgcGF0Y2ggbWVzc2luZyB3aXRoCmRybV9kZWJ1Z2ZzX2Ny
ZWF0ZV9maWxlcygpIHRoYXQgSSB3YW50IHlvdSBhbGwgdG8gYmUgaW4gYSBnb29kIG1vb2QgZm9y
CndoZW4gSSBzdWJtaXQgaXQgKGl0IHRvdWNoZXMgYWxsIGRyaXZlcnMgYXQgb25jZSksIHNvIEkg
bWlnaHQgYXMgd2VsbApjbGVhbiB0aGlzIHVwIGZpcnN0IDopCgpHaXZlIG1lIGEgd2VlaywgSSdt
IHN1cHBvc2VkIHRvIGJlIHdyaXRpbmcgbXkgc2xpZGVzIGZvciBhIGNvbmZlcmVuY2UKbm93LCBp
bnN0ZWFkIEknbSBwcm9jcmFzdGluYXRpbmcgYnkgd3JpdGluZyBkZWJ1Z2ZzIGNsZWFudXAgcGF0
Y2hlcywgSQpuZWVkIHRvIHN0b3AuLi4KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
