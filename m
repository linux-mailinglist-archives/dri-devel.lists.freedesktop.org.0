Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15BED1E8DE
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C4F98957B;
	Wed, 15 May 2019 07:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37352891CB;
 Tue, 14 May 2019 19:57:41 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id d15so374007ljc.7;
 Tue, 14 May 2019 12:57:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=LG2jNR9I3wU6ZQlQR9ck16sb9YpNs6ZuXawGdag3IJU=;
 b=HHR5hzY7Y/belQkacFGWDcpvZn2+gcV/zMgPBVMQI/HRF+gHGl5L/UC23457L55AVF
 0m8h3SPa12dfioYKLZn/qyijxvaA4QtH67Fe2li5l5tCzra1TEA/TV9yFtF5YvCHSBGr
 GCoKIUcOKwXTRIvn7ngyYB9LNnP+0pQYCW0v05DMHxseXHPH+vlwf5YDym/hWdIeKMVO
 jyqR+yDS9jD2vQARwObE2P1ehR9x7rLL8pGyWEiAYDB8JrFZjmg+Q/FzufnugRMlntKf
 TX14poVqjwn+lnDxdAWvYWOmkHvJRllbHPBxrDYhCv+PVFEKVCcz4TXdA7pyoynj7M0P
 1q0A==
X-Gm-Message-State: APjAAAVqh7nS/pJwS/4TvSstFWXy+EDiljCLmOuV3dJwln99HKRwMhnu
 CjnGMwz5Cgaw2RHM5Vrx51ggGpHHyhQ=
X-Google-Smtp-Source: APXvYqwi7w87iebpk38FOWc4p3x9NN0EhalezHJvi+X5tqyoiPUkN7STc5ZwzIIFlPMnBe4LcvxgtQ==
X-Received: by 2002:a2e:1b8a:: with SMTP id c10mr18398631ljf.139.1557863859456; 
 Tue, 14 May 2019 12:57:39 -0700 (PDT)
Received: from y40-linux (c-e295e355.03-206-616c6b1.bbcust.telenor.se.
 [85.227.149.226])
 by smtp.gmail.com with ESMTPSA id x16sm1401213lji.3.2019.05.14.12.57.38
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 May 2019 12:57:38 -0700 (PDT)
Date: Tue, 14 May 2019 21:57:37 +0200
From: Peteris Rudzusiks <peteris.rudzusiks@gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [PATCH] drm/nouveau: fix duplication of nv50_head_atom struct
Message-ID: <20190514195736.GB5179@y40-linux>
References: <20190511170831.25645-1-peteris.rudzusiks@gmail.com>
 <CACAvsv5Ux7Av45JGQ7Rqe+ZX2zWcbbBNqc+kCZgLT-uGkQAegw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACAvsv5Ux7Av45JGQ7Rqe+ZX2zWcbbBNqc+kCZgLT-uGkQAegw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LG2jNR9I3wU6ZQlQR9ck16sb9YpNs6ZuXawGdag3IJU=;
 b=e8ENlLEtbbxCcq6ibSVroekvD/jjAcWmQ/PZfnoKlBtZamTtDjXA0el7pazRPyGDQ7
 peySsxlFpC2H3Nzv3lqZQy7bv/pmF90AEFE0bDbu3+VyAM1+yLU/vr7uTQnN3u812CEX
 4kKoJxlQ766tKOxcQiMXMKuyh1sDE/SX9VUCnuUWt6FTF4JFpcZj51d0sny7tJ7Fn641
 TecmSTN8SwcZqASHLM8t++Rzpd5IDo3VtNMpWC14ijlXvTH+WRLw2gQ/muuhM0Q9vI0q
 lOBxmA2lq0bXrCFZ0eLej0C3nTT7EiG/vJaxLgX8360QhixtKGDa62S5Gu13hEWPIjEC
 xwJw==
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMTQsIDIwMTkgYXQgMDQ6NTU6MDVQTSArMTAwMCwgQmVuIFNrZWdncyB3cm90
ZToKPiBPbiBTdW4sIDEyIE1heSAyMDE5IGF0IDA0OjIzLCBQZXRlcmlzIFJ1ZHp1c2lrcwo+IDxw
ZXRlcmlzLnJ1ZHp1c2lrc0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IG52NTBfaGVhZF9hdG9t
aWNfZHVwbGljYXRlX3N0YXRlKCkgbWFrZXMgYSBjb3B5IG9mIG52NTBfaGVhZF9hdG9tCj4gPiBz
dHJ1Y3QuIFRoaXMgcGF0Y2ggYWRkcyBjb3B5aW5nIG9mIHN0cnVjdCBtZW1iZXIgbmFtZWQgIm9y
Iiwgd2hpY2gKPiA+IHByZXZpb3VzbHkgd2FzIGxlZnQgdW5pbml0aWFsaXplZCBpbiB0aGUgZHVw
bGljYXRlZCBzdHJ1Y3R1cmUuCj4gPgo+ID4gRHVlIHRvIHRoaXMgYnVnLCBpbmNvcnJlY3Qgbmhz
eW5jIGFuZCBudnN5bmMgdmFsdWVzIHdlcmUgc29tZXRpbWVzIHVzZWQuCj4gPiBJbiBteSBwYXJ0
aWN1bGFyIGNhc2UsIHRoYXQgbGVhZCB0byBhIG1pc21hdGNoIGJldHdlZW4gdGhlIG91dHB1dAo+
ID4gcmVzb2x1dGlvbiBvZiB0aGUgZ3JhcGhpY3MgZGV2aWNlIChHZUZvcmNlIEdUIDYzMCBPRU0p
IGFuZCB0aGUgcmVwb3J0ZWQKPiA+IGlucHV0IHNpZ25hbCByZXNvbHV0aW9uIG9uIHRoZSBkaXNw
bGF5LiB4cmFuZHIgcmVwb3J0ZWQgMTY4MHgxMDUwLCBidXQKPiA+IHRoZSBkaXNwbGF5IHJlcG9y
dGVkIDEyODB4MTAyNC4gQXMgYSByZXN1bHQgb2YgdGhpcyBtaXNtYXRjaCwgdGhlIG91dHB1dAo+
ID4gb24gdGhlIGRpc3BsYXkgbG9va2VkIGxpa2UgaXQgd2FzIGNyb3BwZWQgKG9ubHkgcGFydCBv
ZiB0aGUgb3V0cHV0IHdhcwo+ID4gYWN0dWFsbHkgdmlzaWJsZSBvbiB0aGUgZGlzcGxheSkuCj4g
Pgo+ID4gZ2l0IGJpc2VjdCBwb2ludGVkIHRvIGNvbW1pdCAyY2E3ZmI1YzFjYzYgKCJkcm0vbm91
dmVhdS9rbXMvbnY1MDogaGFuZGxlCj4gPiBTZXRDb250cm9sT3V0cHV0UmVzb3VyY2UgZnJvbSBo
ZWFkIiksIHdoaWNoIGFkZGVkIHRoZSBtZW1iZXIgIm9yIiB0bwo+ID4gbnY1MF9oZWFkX2F0b20g
c3RydWN0dXJlLCBidXQgZm9yZ290IHRvIGNvcHkgaXQgaW4KPiA+IG52NTBfaGVhZF9hdG9taWNf
ZHVwbGljYXRlX3N0YXRlKCkuCj4gPgo+ID4gRml4ZXM6IDJjYTdmYjVjMWNjNiAoImRybS9ub3V2
ZWF1L2ttcy9udjUwOiBoYW5kbGUgU2V0Q29udHJvbE91dHB1dFJlc291cmNlIGZyb20gaGVhZCIp
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBQZXRlcmlzIFJ1ZHp1c2lrcyA8cGV0ZXJpcy5ydWR6dXNpa3NA
Z21haWwuY29tPgo+IE9vcHMsIG5pY2UgY2F0Y2guICBUaGFuayB5b3UgZm9yIHRoaXMsIEkndmUg
bWVyZ2VkIGl0IGluIG15IHRyZWUgYW5kCj4gd2lsbCBnZXQgaXQgdXBzdHJlYW0gQVNBUC4KPiAK
PiBUaGFua3MsCj4gQmVuLgo+IApIaSBCZW4sCgpUaGFuayB5b3UgZm9yIHRha2luZyB0aGUgdGlt
ZSB0byByZXZpZXcgYW5kIG1lcmdlIHRoaXMgcGF0Y2guCgpJJ20gbmV3IHRvIHRoZSBMaW51eCBr
ZXJuZWwgZGV2ZWxvcG1lbnQgcHJvY2Vzcywgc28gSSBhbSBub3Qgc3VyZSB3aGF0CmhhcHBlbnMg
bmV4dC4gRG9lcyBpbmNsdXNpb24gaW4geW91ciB0cmVlIGltcGx5IHRoYXQgdGhpcyBmaXggd2ls
bCBlbmQKdXAgaW4gc29tZSAobW9zdCBsaWtlbHkgLSBuZXh0KSBtYWlubGluZSBrZXJuZWw/IFdp
bGwgaXQgYWxzbyBiZQpiYWNrcG9ydGVkIHRvIDQuMTkgTFRTIGJyYW5jaD8KClRoaXMgYnVnIGFm
ZmVjdHMgYWxsIGtlcm5lbCB2ZXJzaW9ucyBzdGFydGluZyBmcm9tIHY0LjE4LiBQcm9iYWJseSBu
b3QKdGhhdCBtYW55IHN5c3RlbXMgdGhvdWdoLgoKQ2hlZXJzLApQZXRlcmlzCgo+ID4gLS0tCj4g
PiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvaGVhZC5jIHwgMSArCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L2Rpc3BudjUwL2hlYWQuYwo+ID4gaW5kZXggMmU3YTBjMzQ3ZGRiLi5hZGNlNjJmNGUxOGYgMTAw
NjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9oZWFkLmMKPiA+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2hlYWQuYwo+ID4gQEAgLTQx
Myw2ICs0MTMsNyBAQCBudjUwX2hlYWRfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJt
X2NydGMgKmNydGMpCj4gPiAgICAgICAgIGFzeWgtPm92bHkgPSBhcm1oLT5vdmx5Owo+ID4gICAg
ICAgICBhc3loLT5kaXRoZXIgPSBhcm1oLT5kaXRoZXI7Cj4gPiAgICAgICAgIGFzeWgtPnByb2Nh
bXAgPSBhcm1oLT5wcm9jYW1wOwo+ID4gKyAgICAgICBhc3loLT5vciA9IGFybWgtPm9yOwo+ID4g
ICAgICAgICBhc3loLT5kcCA9IGFybWgtPmRwOwo+ID4gICAgICAgICBhc3loLT5jbHIubWFzayA9
IDA7Cj4gPiAgICAgICAgIGFzeWgtPnNldC5tYXNrID0gMDsKPiA+IC0tCj4gPiAyLjE3LjEKPiA+
Cj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4g
ZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zwo+ID4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
