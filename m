Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F75C980D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 07:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE35A6E1F3;
	Thu,  3 Oct 2019 05:56:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601906E1F3
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 05:56:25 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x935uHKw127747;
 Thu, 3 Oct 2019 00:56:17 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x935uHDh027690
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 3 Oct 2019 00:56:17 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 3 Oct
 2019 00:56:06 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 3 Oct 2019 00:56:06 -0500
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x935uF3I043768;
 Thu, 3 Oct 2019 00:56:16 -0500
Subject: Re: [PATCH v2 13/50] drm/bridge: panel: Implement bridge connector
 operations
To: Sam Ravnborg <sam@ravnborg.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>
References: <20190820011721.30136-1-laurent.pinchart@ideasonboard.com>
 <20190820011721.30136-14-laurent.pinchart@ideasonboard.com>
 <20190820103706.GB9745@ravnborg.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <e9e47b5f-4da5-7131-d09c-92a7ec8ba46a@ti.com>
Date: Thu, 3 Oct 2019 08:56:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190820103706.GB9745@ravnborg.org>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570082177;
 bh=xKvie4GnCaKycv3lfJbdYaF9e1PFJ9YLaC+SWVsPwmE=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=GpufL3lGKK5qLAG1hGF+2rDHg2Za3XHdOkzeJP/YjMBJkg+cJVdWFX407d7LJ48hP
 FAwCp+w1uwK6mOHN33ztxM4jtJzQbZNS1e31MCiaew8gqkFkz9BehfvCD+CVtez1XV
 xMnsnfPhQiCEXlS2DPcX6Y3WD6LqSEJhcBS9I5bw=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKT24gMjAvMDgvMjAxOSAxMzozNywgU2FtIFJhdm5ib3JnIHdyb3RlOgoKPj4gQEAg
LTEyMyw2ICsxMjMsMTggQEAgc3RhdGljIHZvaWQgcGFuZWxfYnJpZGdlX3Bvc3RfZGlzYWJsZShz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+PiAgIAlkcm1fcGFuZWxfdW5wcmVwYXJlKHBhbmVs
X2JyaWRnZS0+cGFuZWwpOwo+PiAgIH0KPj4gICAKPj4gK3N0YXRpYyBpbnQgcGFuZWxfYnJpZGdl
X2dldF9tb2RlcyhzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlLAo+PiArCQkJCSAgc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPj4gK3sKPj4gKwlzdHJ1Y3QgcGFuZWxfYnJpZGdlICpw
YW5lbF9icmlkZ2UgPSBkcm1fYnJpZGdlX3RvX3BhbmVsX2JyaWRnZShicmlkZ2UpOwo+PiArCj4+
ICsJLyoKPj4gKwkgKiBGSVhNRTogZHJtX3BhbmVsX2dldF9tb2RlcygpIHNob3VsZCB0YWtlIHRo
ZSBjb25uZWN0b3IgYXMgYW4KPj4gKwkgKiBhcmd1bWVudC4KPj4gKwkgKi8KPiBOb3RlZCwgSSBo
YXZlIHBhdGNoZXMgdG8gZml4IHRoaXMuIE5lZWRzIGEgbGl0dGxlIHRlc3RpbmcvcG9saXNoaW5n
Cj4gYmVmb3JlIEkgcG9zdCB0aGVtLgoKRG8geW91IGhhdmUgYW55IHRlc3RhYmxlIHBhdGNoZXMg
Zm9yIHRoaXM/CgpJIHdhcyB0ZXN0aW5nIHRoaXMgc2VyaWVzIHdpdGggYSBUb3NoaWJhIERQSS0y
LURTSSBicmlkZ2UgYW5kIGEgRFNJIApwYW5lbCwgYW5kIHdhcyBoaXR0aW5nIGEgY3Jhc2ggYXMg
c2ltcGxlLXBhbmVsIGNvdWxkbid0IGdldCB0aGUgY29ubmVjdG9yLgoKTGF1cmVudCBjb21tZW50
ZWQ6Cgo+IHBhbmVsX2JyaWRnZV9hdHRhY2goKSBzaG91bGQgYmUgbW9kaWZpZWQgdG8gY2FsbCBk
cm1fcGFuZWxfYXR0YWNoKCkgZXZlbgo+IHdoZW4gZmxhZ3MgJiBEUk1fQlJJREdFX0FUVEFDSF9O
T19DT05ORUNUT1IsIHdpdGggdGhlIGNvbm5jdG9yIHBhcmFtZXRlcgo+IHNldCB0byBOVUxMLiBU
aGF0J3MgZWFzeSwgYW5kIGRybV9wYW5lbF9hdHRhY2goKSB3b24ndCBjb21wbGFpbiBhbmQKPiBo
YXBwaWx5IHNldCBwYW5lbC0+Y29ubmVjdG9yIHRvIE5VTEwuIFRoZSB0cm91YmxlIGlzIHRoYXQg
dGhlIHBhbmVsCj4gZHJpdmVycyByZWx5IG9uIHBhbmVsLT5jb25uZWN0b3IgaW4gdGhlaXIgZ2V0
X21vZGVzKCkgaW1wbGVtZW50YXRpb24uCj4gVGhhdCBmdW5jdGlvbiBuZWVkcyB0byBiZSBtb2Rp
ZmllZCB0byB0YWtlIHRoZSBjb25uZWN0b3IgcG9pbnRlciBpbnN0ZWFkCj4gb2YgcmV0cmlldmlu
ZyBpdCBmcm9tIHBhbmVsLT5jb25uZWN0b3IgKHdoaWNoIGNhbiB0aGVuIGJlIHJlbW92ZWQpLgoK
ICBUb21pCgotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlubGFuZCBPeSwgUG9ya2thbGFua2F0dSAy
MiwgMDAxODAgSGVsc2lua2kuClktdHVubnVzL0J1c2luZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlw
YWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
