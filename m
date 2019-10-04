Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A675DCB4C6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:03:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821006EAAA;
	Fri,  4 Oct 2019 07:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D356EAAA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 07:03:12 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 777882E5;
 Fri,  4 Oct 2019 09:03:10 +0200 (CEST)
Date: Fri, 4 Oct 2019 10:02:57 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCHv2 2/7] drm/omap: avoid copy in mgr_fld_read/write
Message-ID: <20191004070257.GB9380@pendragon.ideasonboard.com>
References: <20190930103840.18970-1-tomi.valkeinen@ti.com>
 <20190930103840.18970-3-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190930103840.18970-3-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570172591;
 bh=ZJd7H/SQOZEnhjT4XsWvlRWQYOXg0cJq/lEDVBiuvS8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zae1I+2hpFi/PI++gxl6ksKG7oONpLmL+omilcgQ0OskxDIDrxqNmiPO6QmavOj9S
 gIyxBlV7wjo2pSZloGu1I3NsEF/U+Z/aPJevjHDgpEDyZKR5An7reaYgXAEYy7m8cJ
 j6gF2Y1yAljqWt/fwg+Jwp2Boi0C/ofwb7uDDBbA=
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
Cc: Jyri Sarha <jsarha@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gTW9uLCBTZXAgMzAsIDIwMTkg
YXQgMDE6Mzg6MzVQTSArMDMwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gQXZvaWQgdW5uZWNl
c3NhcnkgY29weSBpbiBtZ3JfZmxkX3JlYWQvd3JpdGUgYnkgdGFraW5nIGEgcG9pbnRlciB0byB0
aGUKPiByZWdfcmVzYyBhbmQgdXNpbmcgdGhhdC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL2Rzcy9kaXNwYy5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZGlzcGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFw
ZHJtL2Rzcy9kaXNwYy5jCj4gaW5kZXggMGRjMDI3MjU2OWY2Li4zYzkzMTViMTdlZjIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vZHNzL2Rpc3BjLmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vb21hcGRybS9kc3MvZGlzcGMuYwo+IEBAIC0zNjUsMTcgKzM2NSwxNyBAQCBz
dGF0aWMgaW5saW5lIHUzMiBkaXNwY19yZWFkX3JlZyhzdHJ1Y3QgZGlzcGNfZGV2aWNlICpkaXNw
YywgdTE2IGlkeCkKPiAgc3RhdGljIHUzMiBtZ3JfZmxkX3JlYWQoc3RydWN0IGRpc3BjX2Rldmlj
ZSAqZGlzcGMsIGVudW0gb21hcF9jaGFubmVsIGNoYW5uZWwsCj4gIAkJCWVudW0gbWdyX3JlZ19m
aWVsZHMgcmVnZmxkKQo+ICB7Cj4gLQljb25zdCBzdHJ1Y3QgZGlzcGNfcmVnX2ZpZWxkIHJmbGQg
PSBtZ3JfZGVzY1tjaGFubmVsXS5yZWdfZGVzY1tyZWdmbGRdOwo+ICsJY29uc3Qgc3RydWN0IGRp
c3BjX3JlZ19maWVsZCAqcmZsZCA9ICZtZ3JfZGVzY1tjaGFubmVsXS5yZWdfZGVzY1tyZWdmbGRd
Owo+ICAKPiAtCXJldHVybiBSRUdfR0VUKGRpc3BjLCByZmxkLnJlZywgcmZsZC5oaWdoLCByZmxk
Lmxvdyk7Cj4gKwlyZXR1cm4gUkVHX0dFVChkaXNwYywgcmZsZC0+cmVnLCByZmxkLT5oaWdoLCBy
ZmxkLT5sb3cpOwo+ICB9Cj4gIAo+ICBzdGF0aWMgdm9pZCBtZ3JfZmxkX3dyaXRlKHN0cnVjdCBk
aXNwY19kZXZpY2UgKmRpc3BjLCBlbnVtIG9tYXBfY2hhbm5lbCBjaGFubmVsLAo+ICAJCQkgIGVu
dW0gbWdyX3JlZ19maWVsZHMgcmVnZmxkLCBpbnQgdmFsKQo+ICB7Cj4gLQljb25zdCBzdHJ1Y3Qg
ZGlzcGNfcmVnX2ZpZWxkIHJmbGQgPSBtZ3JfZGVzY1tjaGFubmVsXS5yZWdfZGVzY1tyZWdmbGRd
Owo+ICsJY29uc3Qgc3RydWN0IGRpc3BjX3JlZ19maWVsZCAqcmZsZCA9ICZtZ3JfZGVzY1tjaGFu
bmVsXS5yZWdfZGVzY1tyZWdmbGRdOwo+ICAKPiAtCVJFR19GTERfTU9EKGRpc3BjLCByZmxkLnJl
ZywgdmFsLCByZmxkLmhpZ2gsIHJmbGQubG93KTsKPiArCVJFR19GTERfTU9EKGRpc3BjLCByZmxk
LT5yZWcsIHZhbCwgcmZsZC0+aGlnaCwgcmZsZC0+bG93KTsKPiAgfQo+ICAKPiAgc3RhdGljIGlu
dCBkaXNwY19nZXRfbnVtX292bHMoc3RydWN0IGRpc3BjX2RldmljZSAqZGlzcGMpCgotLSAKUmVn
YXJkcywKCkxhdXJlbnQgUGluY2hhcnQKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
