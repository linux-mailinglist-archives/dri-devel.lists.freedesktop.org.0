Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EB977FED9
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 18:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E016EEE6;
	Fri,  2 Aug 2019 16:45:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59926EEE6
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 16:45:29 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id v18so73406536ljh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 09:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Apx6eyVhme3RtzRN7rrve/HJquGAd42j7wD20czkGgE=;
 b=iw5/jWDDMdDhFwcd8IKOIGKQUH94EfDS17is6Ncqod9PqBqQKr3VGD44X9lpiMO+je
 tYrY8jOp9hdUbq7DfbG3Hk31e/KxgmNxhpSy7K3Bjl0UIuGZHiUzs0BMt3NvMRmHI7o7
 m7nf+2FPJWPkt1ZSIbdmCCGRZlz5TE4uOK8gqOo1V0Mnr7NZvYH4d7dEC337biup2Ha3
 1mo6+MD8L3jFJcGkRKkRiVx7DrhoQwyQZN/q04HJaevtpn4QF9oNoxswN2qs8FHeeNQH
 lU66t9FVhOlCTBGDam3uK9iUhhs1xdpByWdUkUMMM64xkNpppml56QvBBjsCffRZzI43
 cpEQ==
X-Gm-Message-State: APjAAAX3rF3oPKe0Byv5Vbh6DThCO5Mn3eDsKNNh6Hzv5S2nnpzgFWgO
 faHm9JoHIQJrSvJ1qz7LAww5P94pAGM=
X-Google-Smtp-Source: APXvYqw4njRXSfyP7zdVM6VNPoOwRDozh7f7xCtmf5J8rfytci09rXI4YYW7BgAJlh+fQXzJN7HaLw==
X-Received: by 2002:a2e:b0ea:: with SMTP id h10mr26425831ljl.50.1564764327937; 
 Fri, 02 Aug 2019 09:45:27 -0700 (PDT)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com.
 [209.85.167.48])
 by smtp.gmail.com with ESMTPSA id k82sm15220318lje.30.2019.08.02.09.45.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 02 Aug 2019 09:45:27 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id r15so36390741lfm.11
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 09:45:27 -0700 (PDT)
X-Received: by 2002:a19:f007:: with SMTP id p7mr4248094lfc.24.1564764327079;
 Fri, 02 Aug 2019 09:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <20190801022517.1903-1-gurchetansingh@chromium.org>
 <20190801022517.1903-3-gurchetansingh@chromium.org>
 <20190801064023.sd3jxlg6aqls523g@sirius.home.kraxel.org>
In-Reply-To: <20190801064023.sd3jxlg6aqls523g@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Fri, 2 Aug 2019 09:45:15 -0700
X-Gmail-Original-Message-ID: <CAAfnVBn=ckrOkGW1bv4aHeO4vNVtVB_yKj8tTmDhsLPmOjj3nw@mail.gmail.com>
Message-ID: <CAAfnVBn=ckrOkGW1bv4aHeO4vNVtVB_yKj8tTmDhsLPmOjj3nw@mail.gmail.com>
Subject: Re: [RFC 2/6] udmabuf: add ability to set access flags on udmabuf
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Apx6eyVhme3RtzRN7rrve/HJquGAd42j7wD20czkGgE=;
 b=U5PUzcM1ra2ay6aPmYkMcxds3qwjd1tmMZ8cewJzkRX5qvrsf3rN9OIJqDUMRp+XDu
 JkPfNfGF6OgopXnLBGvmCR2yizHtElg+sXnGmzv6qfJuPvVy1vABMiaulR290OSNGogA
 zn6W0i21cMVqxl4ON3mTnLMM3WNqLnmlWugWc=
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTE6NDAgUE0gR2VyZCBIb2ZmbWFubiA8a3JheGVsQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDc6MjU6MTNQTSAt
MDcwMCwgR3VyY2hldGFuIFNpbmdoIHdyb3RlOgo+ID4gVGhlIG1haW4gdXNlIGZvciB1ZG1hYnVm
IGlzIHNlbmRpbmcgZ3Vlc3QgbWVtb3J5IHBhZ2VzCj4gPiB0byB0aGUgaG9zdC4KPiA+Cj4gPiBJ
dCdzIGdlbmVyYWxseSBhIGJhZCBpZGVhIHRvIGhhdmUgdG8gc2VwYXJhdGUgbWFwcGluZ3Mgd2l0
aAo+ID4gZGlmZmVyZW50IGF0dHJpYnV0ZXMuIEZvciBleGFtcGxlLCBhIFdDIG1hcHBpbmcgdGhl
IGd1ZXN0Cj4gPiBrZXJuZWwgYW5kIGNhY2hlZCBtYXBwaW5nIG9uIHRoZSBob3N0IGlzIHByb2Js
ZW1hdGljLgo+ID4KPiA+IEFkZCBjcmVhdGlvbiB0aW1lIGZsYWdzIHNvIHRoZSB1c2VyIGhhcyBy
ZXNwb25zaWJpbGl0eSBmb3IKPiA+IHRoZSBzcGVjaWZpYyB1c2UgY2FzZS4KPgo+ID4gLSNkZWZp
bmUgVURNQUJVRl9GTEFHU19DTE9FWEVDICAgICAgICAweDAxCj4gPiArI2RlZmluZSBVRE1BQlVG
X0ZMQUdTX0NMT0VYRUMgICAgMHgwMQo+ID4gKyNkZWZpbmUgVURNQUJVRl9GTEFHU19QUk9UX05P
TkUgIDB4MDIKPiA+ICsjZGVmaW5lIFVETUFCVUZfRkxBR1NfUFJPVF9SRUFEICAweDA0Cj4gPiAr
I2RlZmluZSBVRE1BQlVGX0ZMQUdTX1BST1RfV1JJVEUgMHgwOAo+Cj4gWyBkaWRuJ3QgbG9vayBh
dCBmb2xsb3d1cCBwYXRjaGVzIHlldCBdCj4KPiBZb3UgY2FuJ3QgaGF2ZSByZWFkb25seS93cml0
ZW9ubHkgZG1hYnVmcy4KPiBTbyB0aGF0IGlzbid0IGdvaW5nIHRvIGZseS4KPgo+IFRoZSBjb21t
aXQgbWVzc2FnZSBzdWdnZXN0cyB0aGlzIGlzIGZvciBjYWNoZSBhdHRyaWJ1dGVzIG5vdCBwcm90
ZWN0aW9uLAo+IHNvIGhhdmluZyB0aGUgZmxhZ3MgbWlnaHQgbWFrZSBzZW5zZSwgYnV0IHBsZWFz
ZSBkb24ndCBuYW1lIHRoZSBmbGFncwo+IFBST1RfKiB0aGVuLgoKT2theSwgSSdsbCBjaGFuZ2Ug
dGhlIGZsYWdzIHRvIENBQ0hFRCAvIFVOQ0FDSEVEIC8gV1JJVEVfQ09NQklORSAobGlrZQptc21f
ZHJtLmgpLiAgQW5kIHNpbmNlIHRoZSBkbWEgYXBpIGRvZXNuJ3Qgd29yayBvbiB4ODYgWzFdLCB3
ZSdsbCBoYXZlCnRvIGNhbGwgZHJtX2NmbHVzaF9wYWdlcyBpbiB0aGUgZ3Vlc3QuICBTaW5jZSBj
YWNoaW5nIGlzIHByaXZpbGVnZWQgb24KQVJNIGFuZCBub3Qgb24geDg2LCB0aGF0ICpzaG91bGQq
IGdldCB1cyB3cml0ZS1jb21iaW5lIGd1ZXN0IGJ1ZmZlcnMuCgpbMV0gaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRldmVsLzIwMTktQXVndXN0LzIyOTE2MS5odG1s
Cgo+Cj4gY2hlZXJzLAo+ICAgR2VyZAo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
