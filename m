Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42449752
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 04:14:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D6F6E0C6;
	Tue, 18 Jun 2019 02:14:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E433E6E0C6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 02:14:09 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p15so19105344eds.8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 19:14:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=D2NgW05ReAdcCqQzyndiXyY+NNxlaFfMXxA+HzXYFHo=;
 b=NE6TD3x2MfrEKffvpeHMxAVeL4ZUBJR8PNPsZJD2Tm5f+XRGOzi7DOnLVr8+HUIJ7H
 qXjmwBgMgQWMD1+k+dOMqIC97reuPKuekkBK2MJc/iZv3E5KmWWrm7L8xOuqmzkux4+a
 plavOLLBSzB8FO0EGMVNoJNrS35MDzEitiegDgnyy85aKHtmu4MB4vBSjRz2Hn11JnnN
 OhOr5nwseRLagrYNqBGT0cLXgLfqTpzmB7VIGNTyYVVjjxXflfCqxwMgWPmcQ9LSviFE
 LuWym0MhJ2Xt1i2Qah4jIFguhLn+pKrkJJoG7dXwt+YHT1a6h/mbituLSDpH2lls2p1S
 y/jQ==
X-Gm-Message-State: APjAAAUpnke20QluZN6R/aguf48PUtVZxYpAbfVhAhoUdCAv8Te0Qirx
 dDDwbO7ftQSTWSCEX8kxC9fu2ByK
X-Google-Smtp-Source: APXvYqwEQ8iMEA0xFUP40jc9t3L/1XWhLpm9xCeIJOvhKAs1vUhaqtdhQ46ighvJve6r8XzaFq4sqQ==
X-Received: by 2002:a50:eac6:: with SMTP id u6mr14926610edp.83.1560824048540; 
 Mon, 17 Jun 2019 19:14:08 -0700 (PDT)
Received: from smtp.gmail.com ([187.121.151.146])
 by smtp.gmail.com with ESMTPSA id t6sm587566ejk.74.2019.06.17.19.14.06
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 19:14:07 -0700 (PDT)
Date: Mon, 17 Jun 2019 23:14:03 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
To: Oleg Vasilev <oleg.vasilev@intel.com>
Subject: Re: [PATCH 3/3] drm/vkms: add crc sources list
Message-ID: <20190618021403.spulni376sc54tem@smtp.gmail.com>
References: <20190613121802.2193-1-oleg.vasilev@intel.com>
 <20190613121802.2193-3-oleg.vasilev@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613121802.2193-3-oleg.vasilev@intel.com>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=D2NgW05ReAdcCqQzyndiXyY+NNxlaFfMXxA+HzXYFHo=;
 b=BD6hQDFRgqBpIpP/jGfABiFPTvEzr3ph9CDI1+f8+tvYce9nnrQGkO8gJxGjHM2Uul
 EQK2DMxpobMQ0q2o2ZXF5SSmXgCwLv8+wmndUJ+7z1sE7WCRu1f8tTwFrW8JRNe2PDhB
 MSzsvhtHVfDatpFJd1FG0U6hu6f7Zkl2pyTpjZZ6wgjVAzHCLrTYn69gE5xU3FwnAtRA
 rQSEf2KSbSvtPzFVX0yNR8KVNfXWisSYIH3zLQlcZiIYLc0U6uBSM4pnSFFEsq1Fuscx
 eUBVzy/KDEE2MzOxfgWYLSQ7ggmsovFy0BBHuN3TX3QURXLi+nlvo2SHk310y7e+lnI+
 9dnQ==
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
Cc: Shayenne Moura <shayenneluzmoura@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDYvMTMsIE9sZWcgVmFzaWxldiB3cm90ZToKPiBPdGhlciBkcml2ZXJzIGFyZSBhYmxlIHRv
IGxpc3QgY3JjIHNvdXJjZXMgd2hlbiBhY2Nlc3NpbmcKPiAvc3lzL2tlcm5lbC9kZWJ1Zy9kcmkv
Li4uL2NydGMtMC9jcmMvY29udHJvbAo+IAo+IEV2ZW4gdGhvdWdoIFZLTVMgbm93IHN1cHBvcnRz
IG9ubHkgJ2F1dG8nIG1vZGUsIGl0IGlzIG1vcmUgY29uc2lzdGVudCB0bwo+IGhhdmUgdGhlIGxp
c3QgYXZhaWxhYmxlIHRvIHRoZSB1c2Vyc3BhY2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogT2xlZyBW
YXNpbGV2IDxvbGVnLnZhc2lsZXZAaW50ZWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
dmttcy92a21zX2NyYy5jICB8IDkgKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS92a21zL3Zr
bXNfY3J0Yy5jIHwgMSArCj4gIGRyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmggIHwgMiAr
Kwo+ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3Zr
bXNfY3JjLmMKPiBpbmRleCBiYzcxN2E4ODg4YjUuLjgxOTMxM2VmODBiNiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX2NyYy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3ZrbXMvdmttc19jcmMuYwo+IEBAIC0yMjAsNiArMjIwLDE1IEBAIHZvaWQgdmttc19jcmNfd29y
a19oYW5kbGUoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQo+ICAJc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmb3V0LT5zdGF0ZV9sb2NrLCBmbGFncyk7Cj4gIH0KPiAgCj4gK3N0YXRpYyBjb25zdCBj
aGFyICogY29uc3QgcGlwZV9jcmNfc291cmNlc1tdID0geyJhdXRvIn07Cj4gKwo+ICtjb25zdCBj
aGFyICpjb25zdCAqdmttc19nZXRfY3JjX3NvdXJjZXMoc3RydWN0IGRybV9jcnRjICpjcnRjLAo+
ICsJCQkJCXNpemVfdCAqY291bnQpCj4gK3sKPiArCSpjb3VudCA9IEFSUkFZX1NJWkUocGlwZV9j
cmNfc291cmNlcyk7Cj4gKwlyZXR1cm4gcGlwZV9jcmNfc291cmNlczsKPiArfQo+ICsKPiAgc3Rh
dGljIGludCB2a21zX2NyY19wYXJzZV9zb3VyY2UoY29uc3QgY2hhciAqc3JjX25hbWUsIGJvb2wg
KmVuYWJsZWQpCj4gIHsKPiAgCWludCByZXQgPSAwOwo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdmttcy92a21zX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfY3J0Yy5j
Cj4gaW5kZXggMWJiZTA5OWI3ZGI4Li40ZDExMjkyYmM2ZjMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3ZrbXMvdmttc19jcnRjLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92
a21zX2NydGMuYwo+IEBAIC0xNDcsNiArMTQ3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
Y3J0Y19mdW5jcyB2a21zX2NydGNfZnVuY3MgPSB7Cj4gIAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUg
ICA9IHZrbXNfYXRvbWljX2NydGNfZGVzdHJveV9zdGF0ZSwKPiAgCS5lbmFibGVfdmJsYW5rCQk9
IHZrbXNfZW5hYmxlX3ZibGFuaywKPiAgCS5kaXNhYmxlX3ZibGFuawkJPSB2a21zX2Rpc2FibGVf
dmJsYW5rLAo+ICsJLmdldF9jcmNfc291cmNlcwk9IHZrbXNfZ2V0X2NyY19zb3VyY2VzLAo+ICAJ
LnNldF9jcmNfc291cmNlCQk9IHZrbXNfc2V0X2NyY19zb3VyY2UsCj4gIAkudmVyaWZ5X2NyY19z
b3VyY2UJPSB2a21zX3ZlcmlmeV9jcmNfc291cmNlLAo+ICB9Owo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdmttcy92a21zX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc19k
cnYuaAo+IGluZGV4IDgxZjFjZmJlYjkzNi4uODkxZjJkNjNkNzRmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfZHJ2LmgKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmtt
cy92a21zX2Rydi5oCj4gQEAgLTEzNiw2ICsxMzYsOCBAQCBpbnQgdmttc19nZW1fdm1hcChzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKm9iaik7Cj4gIHZvaWQgdmttc19nZW1fdnVubWFwKHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqb2JqKTsKPiAgCj4gIC8qIENSQyBTdXBwb3J0ICovCj4gK2NvbnN0IGNo
YXIgKmNvbnN0ICp2a21zX2dldF9jcmNfc291cmNlcyhzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCj4g
KwkJCQkJc2l6ZV90ICpjb3VudCk7CgpMR1RNCgpSZXZpZXdlZC1ieTogUm9kcmlnbyBTaXF1ZWly
YSA8cm9kcmlnb3NpcXVlaXJhbWVsb0BnbWFpbC5jb20+Cgo+ICBpbnQgdmttc19zZXRfY3JjX3Nv
dXJjZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsIGNvbnN0IGNoYXIgKnNyY19uYW1lKTsKPiAgaW50
IHZrbXNfdmVyaWZ5X2NyY19zb3VyY2Uoc3RydWN0IGRybV9jcnRjICpjcnRjLCBjb25zdCBjaGFy
ICpzb3VyY2VfbmFtZSwKPiAgCQkJICAgc2l6ZV90ICp2YWx1ZXNfY250KTsKPiAtLSAKPiAyLjIx
LjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwKCi0tIApSb2RyaWdvIFNpcXVlaXJhCmh0dHBzOi8vc2lxdWVpcmEudGVjaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
