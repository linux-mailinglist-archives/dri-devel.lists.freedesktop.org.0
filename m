Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA1FD66B3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 17:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 591EE89DCF;
	Mon, 14 Oct 2019 15:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECB389DCF
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 15:59:00 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id z14so11109807vsz.13
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 08:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YhZmTuECyvNatPuwMHw4UrCLmojj7sz6D63jp3de7MU=;
 b=NJK7o42UlXSKYe791ZtnzYaarQEF3JI3tkJz5+ZKCtWDumi8KxxFRh0LmRvpa11HZK
 j1F9I+xWkkyjVcSrjVQSziJhSD95MwyW5tzA+za86tNbGQQ6sbpdW0NsjdrdqqV/4KKW
 lu94omPxjCgs8fXF0zhpJmyvROTwciEvnzlpyrNSaV0IhVRgX5CKbQI8o8kAlV+M/BvH
 cK1H9V8x/982gC/EhD+R/P5b0Bc9M3YAoPdtwKZcJotQ0ff1iTNmen2wugYfShEZhqmY
 +du5nVEYeVch3Y/cyHGZfaiZt2bGyH+njXGVJ9HnVliEk33Qi0PNCT9YaRX44lUNVRHf
 3QZQ==
X-Gm-Message-State: APjAAAX35cDX1gfbaGwKd/dHJK/MJbSORH69PxD/7qQ0bKvycfTiLFCJ
 FOqFaYDeMs49Dq597bd7nsvzFMIflIymtT0d6AA=
X-Google-Smtp-Source: APXvYqwcPL8t68p5ICsXAF44cUv/Deq8Lfd1v6j50uCjwERnfswo082+5RyGFNTyE8RiX0Re8APNiEdJOCFy36neXSk=
X-Received: by 2002:a05:6102:253:: with SMTP id
 a19mr17354178vsq.37.1571068739538; 
 Mon, 14 Oct 2019 08:58:59 -0700 (PDT)
MIME-Version: 1.0
References: <20191011054240.17782-1-james.qian.wang@arm.com>
 <20191011054240.17782-2-james.qian.wang@arm.com>
In-Reply-To: <20191011054240.17782-2-james.qian.wang@arm.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 14 Oct 2019 11:58:48 -0400
Message-ID: <CAKb7Uvik6MZSwCQ4QF7ed1wttfufbR-J4vNdOtYzM+1tqPE_vw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] drm/komeda: Add a new helper
 drm_color_ctm_s31_32_to_qm_n()
To: "james qian wang (Arm Technology China)" <james.qian.wang@arm.com>
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
Cc: nd <nd@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 "Oscar Zhang \(Arm Technology China\)" <Oscar.Zhang@arm.com>,
 "Tiannan Zhu \(Arm Technology China\)" <Tiannan.Zhu@arm.com>,
 Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "airlied@linux.ie" <airlied@linux.ie>, Liviu Dudau <Liviu.Dudau@arm.com>,
 "Jonathan Chai \(Arm Technology China\)" <Jonathan.Chai@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Julien Yin \(Arm Technology China\)" <Julien.Yin@arm.com>,
 "Channing Chen \(Arm Technology China\)" <Channing.Chen@arm.com>,
 "Yiqi Kang \(Arm Technology China\)" <Yiqi.Kang@arm.com>,
 "Thomas Sun \(Arm Technology China\)" <thomas.Sun@arm.com>,
 "Lowry Li \(Arm Technology China\)" <Lowry.Li@arm.com>,
 "sean@poorly.run" <sean@poorly.run>, Ben Davis <Ben.Davis@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMTo0MyBBTSBqYW1lcyBxaWFuIHdhbmcgKEFybSBUZWNo
bm9sb2d5IENoaW5hKQo8amFtZXMucWlhbi53YW5nQGFybS5jb20+IHdyb3RlOgo+Cj4gQWRkIGEg
bmV3IGhlbHBlciBmdW5jdGlvbiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKCkgZm9yIGRy
aXZlciB0bwo+IGNvbnZlcnQgUzMxLjMyIHNpZ24tbWFnbml0dWRlIHRvIFFtLm4gMidzIGNvbXBs
ZW1lbnQgdGhhdCBzdXBwb3J0ZWQgYnkKPiBoYXJkd2FyZS4KPgo+IFNpZ25lZC1vZmYtYnk6IGph
bWVzIHFpYW4gd2FuZyAoQXJtIFRlY2hub2xvZ3kgQ2hpbmEpIDxqYW1lcy5xaWFuLndhbmdAYXJt
LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9jb2xvcl9tZ210LmMgfCAyMyArKysr
KysrKysrKysrKysrKysrKysrKwo+ICBpbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oICAgICB8
ICAyICsrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb2xvcl9tZ210LmMKPiBpbmRleCA0Y2U1YzZkOGRlOTkuLjNkNTMzZDBiNDVhZiAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NvbG9yX21nbXQuYwo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fY29sb3JfbWdtdC5jCj4gQEAgLTEzMiw2ICsxMzIsMjkgQEAgdWludDMyX3Qg
ZHJtX2NvbG9yX2x1dF9leHRyYWN0KHVpbnQzMl90IHVzZXJfaW5wdXQsIHVpbnQzMl90IGJpdF9w
cmVjaXNpb24pCj4gIH0KPiAgRVhQT1JUX1NZTUJPTChkcm1fY29sb3JfbHV0X2V4dHJhY3QpOwo+
Cj4gKy8qKgo+ICsgKiBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uCj4gKyAqCj4gKyAqIEB1
c2VyX2lucHV0OiBpbnB1dCB2YWx1ZQo+ICsgKiBAbTogbnVtYmVyIG9mIGludGVnZXIgYml0cwoK
SXMgdGhpcyB0aGUgZnVsbCAyJ3MgY29tcGxlbWVudCB2YWx1ZT8gaS5lLiBpbmNsdWRpbmcgdGhl
ICJzaWduIiBiaXQKb2YgdGhlIDIncyBjb21wbGVtZW50IHJlcHJlc2VudGF0aW9uPyBJJ2Qga2lu
ZGEgYXNzdW1lIHRoYXQgbSA9IDMyLCBuCj0gMCB3b3VsZCBqdXN0IGdldCBtZSB0aGUgaW50ZWdl
ciBwb3J0aW9uIG9mIHRoaXMsIGZvciBleGFtcGxlLgoKPiArICogQG46IG51bWJlciBvZiBmcmFj
dGluYWwgYml0cwoKZnJhY3Rpb25hbAoKPiArICoKPiArICogQ29udmVydCBhbmQgY2xhbXAgUzMx
LjMyIHNpZ24tbWFnbml0dWRlIHRvIFFtLm4gMidzIGNvbXBsZW1lbnQuCj4gKyAqLwo+ICt1aW50
NjRfdCBkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKHVpbnQ2NF90IHVzZXJfaW5wdXQsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MzJfdCBtLCB1aW50MzJf
dCBuKQo+ICt7Cj4gKyAgICAgICB1NjQgbWFnID0gKHVzZXJfaW5wdXQgJiB+QklUX1VMTCg2Mykp
ID4+ICgzMiAtIG4pOwo+ICsgICAgICAgYm9vbCBuZWdhdGl2ZSA9ICEhKHVzZXJfaW5wdXQgJiBC
SVRfVUxMKDYzKSk7Cj4gKyAgICAgICBzNjQgdmFsOwo+ICsKPiArICAgICAgIC8qIHRoZSByYW5n
ZSBvZiBzaWduZWQgMnMgY29tcGxlbWVudCBpcyBbLTJebittLCAyXm4rbSAtIDFdICovCgpUaGlz
IGltcGxpZXMgdGhhdCBuID0gMzIsIG0gPSAwIHdvdWxkIGFjdHVhbGx5IHlpZWxkIGEgMzMtYml0
IDIncwpjb21wbGVtZW50IG51bWJlci4gSXMgdGhhdCB3aGF0IHlvdSBtZWFudD8KCj4gKyAgICAg
ICB2YWwgPSBjbGFtcF92YWwobWFnLCAwLCBuZWdhdGl2ZSA/IEJJVChuICsgbSkgOiBCSVQobiAr
IG0pIC0gMSk7CgpJJ20gZ29pbmcgdG8gcGxheSB3aXRoIG51bXB5IHRvIGNvbnZpbmNlIG15c2Vs
ZiB0aGF0IHRoaXMgaXMgcmlnaHQKKGVzcCB3aXRoIHRoZSBlbmRwb2ludHMpLCBidXQgaW4gdGhl
IG1lYW53aGlsZSwgeW91IHByb2JhYmx5IHdhbnQgdG8KdXNlIEJJVF9VTEwgaW4gY2FzZSBuICsg
bSA+IDMyIChJIGRvbid0IHRoaW5rIHRoYXQncyB0aGUgY2FzZSB3aXRoIGFueQpjdXJyZW50IGhh
cmR3YXJlIHRob3VnaCkuCgo+ICsKPiArICAgICAgIHJldHVybiBuZWdhdGl2ZSA/IDBsbCAtIHZh
bCA6IHZhbDsKCldoeSBub3QganVzdCAibmVnYXRpdmUgPyAtdmFsIDogdmFsIj8KCj4gK30KPiAr
RVhQT1JUX1NZTUJPTChkcm1fY29sb3JfY3RtX3MzMV8zMl90b19xbV9uKTsKPiArCj4gIC8qKgo+
ICAgKiBkcm1fY3J0Y19lbmFibGVfY29sb3JfbWdtdCAtIGVuYWJsZSBjb2xvciBtYW5hZ2VtZW50
IHByb3BlcnRpZXMKPiAgICogQGNydGM6IERSTSBDUlRDCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL2RybV9jb2xvcl9tZ210LmggYi9pbmNsdWRlL2RybS9kcm1fY29sb3JfbWdtdC5oCj4gaW5k
ZXggZDFjNjYyZDkyYWI3Li42MGZlYTU1MDE4ODYgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9kcm0v
ZHJtX2NvbG9yX21nbXQuaAo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jb2xvcl9tZ210LmgKPiBA
QCAtMzAsNiArMzAsOCBAQCBzdHJ1Y3QgZHJtX2NydGM7Cj4gIHN0cnVjdCBkcm1fcGxhbmU7Cj4K
PiAgdWludDMyX3QgZHJtX2NvbG9yX2x1dF9leHRyYWN0KHVpbnQzMl90IHVzZXJfaW5wdXQsIHVp
bnQzMl90IGJpdF9wcmVjaXNpb24pOwo+ICt1aW50NjRfdCBkcm1fY29sb3JfY3RtX3MzMV8zMl90
b19xbV9uKHVpbnQ2NF90IHVzZXJfaW5wdXQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICB1aW50MzJfdCBtLCB1aW50MzJfdCBuKTsKPgo+ICB2b2lkIGRybV9jcnRjX2Vu
YWJsZV9jb2xvcl9tZ210KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHVpbnQgZGVnYW1tYV9sdXRfc2l6ZSwKPiAtLQo+IDIuMjAuMQo+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
