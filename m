Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 383951B4DF6
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 22:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572EE89F33;
	Wed, 22 Apr 2020 20:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EA889F33;
 Wed, 22 Apr 2020 20:04:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u127so3984043wmg.1;
 Wed, 22 Apr 2020 13:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6yztdvDNTtCJljptlb3cx2jU6FFDXFL01n9PrqvHGv4=;
 b=NSGQ5eZ/BzY2NDuKf5xsGzkW6LalJYAdiLGeNKLytoDFkLoH4OsqUTcwjWk6F0PpAv
 jNdr7BJTKW1h+/kbVHPYWEsP7ItbCB7TUuwPQalWLN1vPGoEgDVKpmrJS68H0+V6uVkV
 RSl3TdnAXjRT25o8K4SPVnS0nLYJ8eg6zwTnqg3jiaVoKnlf9mwiGPBTercoeg0MWYLC
 IGBUEeKA8mzGWSM5drNSFyQnqnnZ0/6qaVOoNmOV9NQGjXRVvONynk9UzKwgjsZisxYi
 CGhSzb9oVxfrHAIaQbDYDjG2sjqdmQ1D2Q4KCImqRW6fQQP6d5s3sO2lbsJ9ieOCddyh
 CPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6yztdvDNTtCJljptlb3cx2jU6FFDXFL01n9PrqvHGv4=;
 b=Dbsg4+sD/Au66qCGGHj8I28H5va0tsfxrlwFSic1lXR+8dzAFuGoheNjk1J8kDwnLE
 IFsKAD+H30Z0Nmb5QMNJExxB0tMwgOVS508KuxnsO2jWsP+/wr1NCeydJyaufZsSBhyY
 Y7hyzgPzdA36aPpeknCR5qssF1FzF/CwtN6GQwhnfvFcIK5wBV8H9PBtPBLrs45zup8V
 opfo8eUUJ/1BggyoF7zDkn0dkGEICoUBoN0JNCbXjeyRP+RCRvFxs2ATrQrwK9STKgrL
 boygT3ES3eC9rbfihiAv7FTj7nMzkyhtpIlPdwhANz4CaO8R1s1vnCBbn27oaJKc3LzT
 BpcQ==
X-Gm-Message-State: AGi0PuaJTrsT/Eg+ktvAC43uGQi6z2xsnJrLxdMmKpRR7/nUHUBf4DZ/
 RBB5hg3xC8WzVdvDNW4ACUsoau6dDQ8TlQaHU+4=
X-Google-Smtp-Source: APiQypIoAkr8oLQXwFzuV3g2rW9HDp81He+9VeAjS/yjQa7NFvxgx84nwF6Vayz7zofjQsZl7UwOJAs9ZVvTSPPJk54=
X-Received: by 2002:a1c:6344:: with SMTP id x65mr193685wmb.56.1587585883169;
 Wed, 22 Apr 2020 13:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200420015015.27991-1-rdunlap@infradead.org>
 <20200420015015.27991-2-rdunlap@infradead.org>
 <128ebc30-e62b-b928-cf92-9ca331bfb6b5@amd.com>
 <aeecb841-c5a4-36c7-e511-eb7250e9ece1@gmail.com>
In-Reply-To: <aeecb841-c5a4-36c7-e511-eb7250e9ece1@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 22 Apr 2020 16:04:32 -0400
Message-ID: <CADnq5_NTAzoB0BEDa9POQ0jdb=PC7S1p48YSe-O1++HMv5yT7w@mail.gmail.com>
Subject: Re: [PATCH] drm: amdgpu: fix kernel-doc struct warning
To: Christian Koenig <christian.koenig@amd.com>
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
Cc: "Signed-off-by : Alex Sierra" <alex.sierra@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, Randy Dunlap <rdunlap@infradead.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBcHIgMjEsIDIwMjAgYXQgMTA6MzQgQU0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5p
Zy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQW0gMjEuMDQuMjAgdW0gMTY6
MzMgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+ID4gQW0gMjAuMDQuMjAgdW0gMDM6NTAgc2No
cmllYiBSYW5keSBEdW5sYXA6Cj4gPj4gRml4IGEga2VybmVsLWRvYyB3YXJuaW5nIG9mIG1pc3Np
bmcgc3RydWN0IGZpZWxkIGRlc3JpcHRpb246Cj4gPj4KPiA+PiAuLi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdm0uYzo5Mjogd2FybmluZzogRnVuY3Rpb24KPiA+PiBwYXJhbWV0
ZXIgb3IgbWVtYmVyICd2bScgbm90IGRlc2NyaWJlZCBpbiAnYW1kZ3B1X3ZtX2V2aWN0aW9uX2xv
Y2snCj4gPgo+ID4gQ2FuJ3Qgd2UganVzdCBkb2N1bWVudCB0aGUgZnVuY3Rpb24gcGFyYW1ldGVy
IGluc3RlYWQ/IFNob3VsZCBvbmx5IGJlCj4gPiBvbmUgSUlSQy4KPgo+IE9uIHRoZSBvdGhlciBo
YW5kIGZvcmdldCB0aGF0LCB0aGUgZm9ybWF0IGRvZXNuJ3QgbWF0Y2ggYSBwcm9wZXIKPiBrZXJu
ZWwtZG9jIGZvciBhIGZ1bmN0aW9uIGFueXdheS4KPgo+IFJldmlld2VkLWJ5OiBDaHJpc3RpYW4g
S8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4KCkFwcGxpZWQuICBUaGFua3MhCgpB
bGV4Cgo+ID4KPiA+IFRoYW5rcywKPiA+IENocmlzdGlhbi4KPiA+Cj4gPj4KPiA+PiBGaXhlczog
YTI2OWU0NDk4OWYzICgiZHJtL2FtZGdwdTogQXZvaWQgcmVjbGFpbSBmcyB3aGlsZSBldmljdGlv
biBsb2NrIikKPiA+PiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFk
ZWFkLm9yZz4KPiA+PiBDYzogU2lnbmVkLW9mZi1ieTogQWxleCBTaWVycmEgPGFsZXguc2llcnJh
QGFtZC5jb20+Cj4gPj4gQ2M6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
Pgo+ID4+IENjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4g
Pj4gQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiA+PiBDYzog
RGF2aWQgKENodW5NaW5nKSBaaG91IDxEYXZpZDEuWmhvdUBhbWQuY29tPgo+ID4+IENjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4+IC0tLQo+ID4+ICAgZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgfCAgICAyICstCj4gPj4gICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Pgo+ID4+IC0tLSBsbngtNTctcmMyLm9y
aWcvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMKPiA+PiArKysgbG54LTU3
LXJjMi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdm0uYwo+ID4+IEBAIC04Miw3
ICs4Miw3IEBAIHN0cnVjdCBhbWRncHVfcHJ0X2NiIHsKPiA+PiAgICAgICBzdHJ1Y3QgZG1hX2Zl
bmNlX2NiIGNiOwo+ID4+ICAgfTsKPiA+PiAgIC0vKioKPiA+PiArLyoKPiA+PiAgICAqIHZtIGV2
aWN0aW9uX2xvY2sgY2FuIGJlIHRha2VuIGluIE1NVSBub3RpZmllcnMuIE1ha2Ugc3VyZSBubwo+
ID4+IHJlY2xhaW0tRlMKPiA+PiAgICAqIGhhcHBlbnMgd2hpbGUgaG9sZGluZyB0aGlzIGxvY2sg
YW55d2hlcmUgdG8gcHJldmVudCBkZWFkbG9ja3Mgd2hlbgo+ID4+ICAgICogYW4gTU1VIG5vdGlm
aWVyIHJ1bnMgaW4gcmVjbGFpbS1GUyBjb250ZXh0Lgo+ID4KPiA+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+
ID4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFt
ZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
