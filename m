Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5F5265D2C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803696E9FA;
	Fri, 11 Sep 2020 09:59:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75CE26E9FA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hgg6FoHK15WmMAYAEZFH4drMXVQgN/IydltaEjCXX9Q=; b=yh5ekNT/CnmyWDBz6fZFL5dyjr
 JS9Ob1Puccx+SzGO/pYsqJMh77fkopJjRsSsu+q7sD4UFFYgTemKiOhhI5kHU0aMkTT23gVBTaYuW
 HzI7dzCv7sMIQNEWCqNZHMxzLrofLZcKmG74ofPELKP+GWLUsdjb57rmlPqbsK2ELg5Nniu2Hn1Xe
 4RItI/PfpkFuQTpHtunat8I+DoRUk56RQB+WBk4AF0f3Xn1pd2OvuR1CDBI2nIrZfHTXTSL1Ww8HJ
 hFhbzHXcdbytDHmgNgWSsOqmIxLkZkOgbrnxQJTKw+qbyIt+hmGIHH1dYsKMBud1JbGiMq2tGiadX
 cTKM+M1g==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kGfqQ-0004Gx-UP; Fri, 11 Sep 2020 12:59:51 +0300
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <11c05ff2-092b-dc40-73a9-c0ec0fa22826@gmail.com>
 <3b3b7d35-e96c-1b6e-ddd0-24fd8a9dd5bf@gmail.com>
 <6d317f3f-51c8-6ed5-0a27-00e72f204941@kapsi.fi>
 <dba5e023-23d5-7e8a-f45e-bf41abf66ef6@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <27ee1096-d7fa-da63-f60e-93dbdd679893@kapsi.fi>
Date: Fri, 11 Sep 2020 12:59:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <dba5e023-23d5-7e8a-f45e-bf41abf66ef6@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xMS8yMCAxMjo1NyBBTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDA5LjA5LjIwMjAg
MTE6MzYsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+IC4uLgo+Pj4KPj4+IERvZXMgaXQg
bWFrZSBzZW5zZSB0byBoYXZlIHRpbWVvdXQgaW4gbWljcm9zZWNvbmRzPwo+Pj4KPj4KPj4gTm90
IHN1cmUsIGJ1dCBiZXR0ZXIgaGF2ZSBpdCBhIGJpdCBtb3JlIGZpbmUtZ3JhaW5lZCByYXRoZXIg
dGhhbgo+PiBjb2Fyc2UtZ3JhaW5lZC4gVGhpcyBzdGlsbCBnaXZlcyBhIG1heGltdW0gdGltZW91
dCBvZiA3MSBtaW51dGVzIHNvIEkKPj4gZG9uJ3QgdGhpbmsgaXQgaGFzIGFueSBuZWdhdGl2ZXMg
Y29tcGFyZWQgdG8gbWlsbGlzZWNvbmRzLgo+IAo+IElmIHRoZXJlIGlzIG5vIGdvb2QgcmVhc29u
IHRvIHVzZSBtaWNyb3NlY29uZHMgcmlnaHQgbm93LCB0aGVuIHNob3VsZCBiZQo+IGJldHRlciB0
byBkZWZhdWx0IHRvIG1pbGxpc2Vjb25kcywgSU1PLiBJdCBzaG91bGRuJ3QgYmUgYSBwcm9ibGVt
IHRvCj4gZXh0ZW5kIHRoZSBJT0NMVCB3aXRoIGEgbWljcm9zZWNvbmRzIGVudHJ5LCBpZiBldmVy
IGJlIG5lZWRlZC4KPiAKPiB7Cj4gCV9fdTMyIHRpbWVvdXRfbXM7Cj4gLi4uCj4gCV9fdTMyIHRp
bWVvdXRfdXM7Cj4gfQo+IAo+IHRpbWVvdXQgPSB0aW1lb3V0X21zICsgMTAwMCAqIHRpbWVvdXRf
dXM7Cj4gCj4gVGhlcmUgc2hvdWxkbid0IGJlIGEgbmVlZCBmb3IgYSBsb25nIHRpbWVvdXRzLCBz
aW5jZSBhIGpvYiB0aGF0IHRha2VzCj4gb3ZlciAxMDBtcyBpcyBwcm9iYWJseSB0b28gdW5wcmFj
dGljYWwuIEl0IGFsc28gc2hvdWxkIGJlIHBvc3NpYmxlIHRvCj4gZGV0ZWN0IGEgcHJvZ3Jlc3Np
bmcgam9iIGFuZCB0aGVuIGRlZmVyIHRpbWVvdXQgaW4gdGhlIGRyaXZlci4gQXQgbGVhc3QKPiB0
aGlzIGlzIHdoYXQgb3RoZXIgZHJpdmVycyBkbywgbGlrZSBldG5hdml2IGRyaXZlciBmb3IgZXhh
bXBsZToKPiAKPiBodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC92NS45LXJjNC9zb3Vy
Y2UvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9zY2hlZC5jI0wxMDcKPiAKCkkgc3Rp
bGwgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB3aHkgaXQncyBiZXR0ZXIgdG8gZGVmYXVsdCB0byAK
bWlsbGlzZWNvbmRzPyBBcyB5b3Ugc2F5LCB0aGVyZSBpcyBubyBuZWVkIHRvIGhhdmUgYSBsb25n
IHRpbWVvdXQsIGFuZCAKaWYgd2UgZ28gbWljcm9zZWNvbmRzIG5vdywgdGhlbiB0aGVyZSB3b3Vs
ZG4ndCBiZSBhIG5lZWQgdG8gZXh0ZW5kIGluIAp0aGUgZnV0dXJlLgoKTWlra28KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
