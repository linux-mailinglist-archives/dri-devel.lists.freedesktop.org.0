Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F93FAE276
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 05:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 848D489BA3;
	Tue, 10 Sep 2019 03:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCD3389BA3;
 Tue, 10 Sep 2019 03:09:51 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id r26so34035323ioh.8;
 Mon, 09 Sep 2019 20:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qOVOKZVgjmlW6Zpq1gN6HvDKrqzeVYxQNDKBPmhL/9c=;
 b=pImlNQiP8WrtbJbMbf8W2g0k/P4X6/yficoHuw/atDtcGGoF59EiZHwi8GKzuWi86J
 YiZWo09wpz43mMbCmE8/B+j6skXAASxmw+vjAYMMScbU3IYzMMlWerjKBaGrChcWcu3D
 ZqkRyZpg1/btDo/HAOGQ0wfcWBmukbfBvH83ZBqn2Ag259fyC7r48WI1UxYlANc+zVwC
 1txWFuF+2N35HA7UlrWnolrfh+hS3FHVW0gfdbJQ2b5pBdWfk+PlMbOqDfvfob+1fjNq
 D0L2GYWUk4gpxcRaaEdbBjkS5zk7ngc/8X39wiJrWwZzc/txk4BPIa8IjtGZHQGd2HM4
 awWQ==
X-Gm-Message-State: APjAAAU/6DWnnWGdwvnKVVBQd0K724E8JuCoYs2ZcIGqc6+aF+aiegmt
 Qc2cBYtPo2jLb4zIYOJdOTdvHyUwtXn3bn2vCkE=
X-Google-Smtp-Source: APXvYqwYW4p+ltV7NCUzOgTROiF3zlMmry3YmQjoX9gTVOD1LaOjaEzL4cEIJouJtW1yxeG4YwqKq2SMvga+9SuV5bI=
X-Received: by 2002:a5d:9b02:: with SMTP id y2mr4928775ion.146.1568084990931; 
 Mon, 09 Sep 2019 20:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190908024800.23229-1-anarsoul@gmail.com>
 <CAKGbVbt056DyZHer1bKnAv8uBCX6zbsWeMjE6AQy8HYQf7L1wg@mail.gmail.com>
 <3263343.nbYvo8rMJO@diego>
 <CA+E=qVfWYd8QdEi=h7JL=AVV+ehpP=GZ3cUsZ1Cbhh0O5xn1ng@mail.gmail.com>
 <CAKGbVbskXmWJOrRWOSJ2f1dN7VAKTosLmYEA_n6fn+AjQnBj9Q@mail.gmail.com>
In-Reply-To: <CAKGbVbskXmWJOrRWOSJ2f1dN7VAKTosLmYEA_n6fn+AjQnBj9Q@mail.gmail.com>
From: Qiang Yu <yuq825@gmail.com>
Date: Tue, 10 Sep 2019 11:09:39 +0800
Message-ID: <CAKGbVbvaYgSkVXsBsrgrXDF1mK1t8dwGVdrH-6AOXLReOQX_OQ@mail.gmail.com>
Subject: Re: [Lima] [PATCH] drm/lima: fix lima_gem_wait() return value
To: Vasily Khoruzhick <anarsoul@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qOVOKZVgjmlW6Zpq1gN6HvDKrqzeVYxQNDKBPmhL/9c=;
 b=RASqfkL6oEBRL6Qd508T+JGbHB7Ubb5duDRC4ZPol7oaDf2GWOWhLyQeydGQfPosUc
 WQt4HlWF2UTwDHlzQfn021wE+Q0g9kPSsPqqZrkZSsYtj/aZtlIK8O02JwW1KBM6OVd+
 GSKfvDoXn05z0ZvHxZtNmstOa31C7CDYvUNiV/tZuMEsqyKt0wEQIg5qoq6P9x+XnTKO
 6RWIWiiJ8T8vtqCVbM0hc2sEMkgKt9A3bvdt2a5z1qcyGJ+K5Vq0RA/KQn/ANoqnOs6E
 i9BaJ1kiq7Wo7uctW1YQSV1IBz0Irf7ThBoAVwJ8QYHhay/iTO0oj/gNj/Hrosu2jkGh
 5zfA==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 stable@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSd2ZSBwdXNoZWQgdGhpcyBwYXRjaCB0byBkcm0tbWlzYy1maXhlczoKaHR0cHM6Ly9jZ2l0LmZy
ZWVkZXNrdG9wLm9yZy9kcm0vZHJtLW1pc2MvY29tbWl0Lz9oPWRybS1taXNjLWZpeGVzJmlkPTIx
NjcwYmQ3OGEyNTAwMWNmOGVmMjY3OWIzNzhjNzNmYjczYjkwNGYKClRoZXJlIGlzIGEgY29uZmxp
Y3Qgd2hlbiBkcm0tdGlwIG1lcmdlIHByb2Nlc3Mgd2hpY2ggaGFzIGJlZW4gc29sdmVkCmJ5IGZv
bGxvd2luZyB0aGUgZG9jOgpodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvbWFpbnRh
aW5lci10b29scy9kcm0tdGlwLmh0bWwKZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmplY3Rfd2FpdCgp
IGhhcyBiZWVuIHJlbmFtZWQgdG8KZHJtX2dlbV9kbWFfcmVzdl93YWl0KCkgaW4gZHJtLW1pc2Mt
bmV4dCBhbmQgZHJtLW5leHQuCgpQbGVhc2UgbGV0IG1lIGtub3cgaWYgSSBoYXZlIHRvIGFsc28g
cHVzaCB0aGlzIGZpeCB0byBkcm0tbWlzYy1uZXh0IGJ5IG15IG93bi4KClRoYW5rcywKUWlhbmcK
Ck9uIFR1ZSwgU2VwIDEwLCAyMDE5IGF0IDk6MTYgQU0gUWlhbmcgWXUgPHl1cTgyNUBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gVGhhbmtzIEhlaWtvLCBJJ2xsIHB1c2ggdGhpcyBwYXRjaCB0byBkcm0t
bWlzYy1maXhlcy4KPgo+IEkgY2FuIGFkZCB0aGUgRml4ZXMgdGFnIGJlZm9yZSBwdXNoLgo+Cj4g
VGhhbmtzLAo+IFFpYW5nCj4KPiBPbiBUdWUsIFNlcCAxMCwgMjAxOSBhdCAxMjoyMyBBTSBWYXNp
bHkgS2hvcnV6aGljayA8YW5hcnNvdWxAZ21haWwuY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBNb24s
IFNlcCA5LCAyMDE5IGF0IDU6MTggQU0gSGVpa28gU3TDvGJuZXIgPGhlaWtvQHNudGVjaC5kZT4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IEhpIFFpYW5nLAo+ID4gPgo+ID4gPiBBbSBNb250YWcsIDkuIFNl
cHRlbWJlciAyMDE5LCAwNDozMDo0MyBDRVNUIHNjaHJpZWIgUWlhbmcgWXU6Cj4gPiA+ID4gT2gs
IEkgd2FzIG1pc3MgbGVhZGluZyBieSB0aGUgZHJtX2dlbV9yZXNlcnZhdGlvbl9vYmplY3Rfd2Fp
dAo+ID4gPiA+IGNvbW1lbnRzLiBQYXRjaCBpczoKPiA+ID4gPiBSZXZpZXdlZC1ieTogUWlhbmcg
WXUgPHl1cTgyNUBnbWFpbC5jb20+Cj4gPiA+ID4KPiA+ID4gPiBJJ2xsIGFwcGx5IHRoaXMgcGF0
Y2ggdG8gZHJtLW1pc2MtbmV4dC4KPiA+ID4gPgo+ID4gPiA+IEN1cnJlbnQga2VybmVsIHJlbGVh
c2UgaXMgNS4zLXJjOCwgaXMgaXQgdG9vIGxhdGUgZm9yIHRoaXMgZml4IHRvIGdvCj4gPiA+ID4g
aW50byB0aGUgbWFpbmxpbmUgNS4zIHJlbGVhc2U/Cj4gPiA+ID4gSSdkIGxpa2UgdG8ga25vdyBo
b3cgdG8gYXBwbHkgdGhpcyBmaXggZm9yIGN1cnJlbnQgcmMga2VybmVscywgYnkKPiA+ID4gPiBk
cm0tbWlzYy1maXhlcz8gQ2FuIEkgcHVzaAo+ID4gPiA+IHRvIGRybS1taXNjLWZpeGVzIGJ5IGRp
bSBvciBJIGNhbiBvbmx5IHB1c2ggdG8gZHJtLW1pc2MtbmV4dCBhbmQKPiA+ID4gPiBkcm0tbWlz
YyBtYWludGFpbmVyIHdpbGwKPiA+ID4gPiBwaWNrIGZpeGVzIGZyb20gaXQgdG8gZHJtLW1pc2Mt
Zml4ZXM/Cj4gPiA+Cj4gPiA+IGRybS1taXNjLWZpeGVzIGdldHMgbWVyZ2VkIGludG8gZHJtLW1p
c2MtbmV4dCBieSBtYWludGFpbmVycyByZWd1bGFybHksCj4gPiA+IHNvIEkgX3RoaW5rXyB5b3Ug
c2hvdWxkIGFwcGx5IHRoZSBmaXgtcGF0Y2ggdG8gZHJtLW1pc2MtZml4ZXMgZmlyc3QuCj4gPiA+
IFtJIGFsc28gYWx3YXlzIGhhdmUgdG8gcmVhZCB0aGUgZG9jdW1lbnRhdGlvbiA7LSkgXQo+ID4g
Pgo+ID4gPiBJbiBhbnkgY2FzZSB5b3UgbWlnaHQgd2FudCB0byBhZGQgYSAiRml4ZXM6IC4uLi4u
IiB0YWcgYXMgd2VsbCBhcyBhCj4gPiA+ICJDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZyIgdGFn
LCBzbyBpdCBjYW4gYmUgYmFja3BvcnRlZCB0byBzdGFibGUKPiA+ID4ga2VybmVscyBpZiBhcHBs
aWNhYmxlLgo+ID4KPiA+IENjOiBzdGFibGUgaXMgYWxyZWFkeSBoZXJlLCBidXQgSSB0aGluayBp
dCBzdGlsbCBuZWVkcyAiRml4ZXM6ICIgdGFnLgo+ID4KPiA+IFFpYW5nLCBjYW4geW91IGFkZCBp
dCBhdCB5b3VyIHNpZGUgb3IgeW91IHdhbnQgbWUgdG8gcmVzZW5kIHRoZSBwYXRjaD8KPiA+Cj4g
PiA+Cj4gPiA+IEhlaWtvCj4gPiA+Cj4gPiA+ID4gT24gU3VuLCBTZXAgOCwgMjAxOSBhdCAxMDo0
OCBBTSBWYXNpbHkgS2hvcnV6aGljayA8YW5hcnNvdWxAZ21haWwuY29tPiB3cm90ZToKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBkcm1fZ2VtX3Jlc2VydmF0aW9uX29iamVjdF93YWl0KCkgcmV0dXJucyAw
IGlmIGl0IHN1Y2NlZWRzIGFuZCAtRVRJTUUKPiA+ID4gPiA+IGlmIGl0IHRpbWVvdXRzLCBidXQg
bGltYSBkcml2ZXIgYXNzdW1lZCB0aGF0IDAgaXMgZXJyb3IuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFZhc2ls
eSBLaG9ydXpoaWNrIDxhbmFyc291bEBnbWFpbC5jb20+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+
ICBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jIHwgMiArLQo+ID4gPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiA+ID4KPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5jIGIvZHJpdmVy
cy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYwo+ID4gPiA+ID4gaW5kZXggNDc3YzBmNzY2NjYzLi5i
NjA5ZGMwMzBkNmMgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9s
aW1hX2dlbS5jCj4gPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dlbS5j
Cj4gPiA+ID4gPiBAQCAtMzQyLDcgKzM0Miw3IEBAIGludCBsaW1hX2dlbV93YWl0KHN0cnVjdCBk
cm1fZmlsZSAqZmlsZSwgdTMyIGhhbmRsZSwgdTMyIG9wLCBzNjQgdGltZW91dF9ucykKPiA+ID4g
PiA+ICAgICAgICAgdGltZW91dCA9IGRybV90aW1lb3V0X2Fic190b19qaWZmaWVzKHRpbWVvdXRf
bnMpOwo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgICAgICAgcmV0ID0gZHJtX2dlbV9yZXNlcnZhdGlv
bl9vYmplY3Rfd2FpdChmaWxlLCBoYW5kbGUsIHdyaXRlLCB0aW1lb3V0KTsKPiA+ID4gPiA+IC0g
ICAgICAgaWYgKHJldCA9PSAwKQo+ID4gPiA+ID4gKyAgICAgICBpZiAocmV0ID09IC1FVElNRSkK
PiA+ID4gPiA+ICAgICAgICAgICAgICAgICByZXQgPSB0aW1lb3V0ID8gLUVUSU1FRE9VVCA6IC1F
QlVTWTsKPiA+ID4gPiA+Cj4gPiA+ID4gPiAgICAgICAgIHJldHVybiByZXQ7Cj4gPiA+ID4gPiAt
LQo+ID4gPiA+ID4gMi4yMy4wCj4gPiA+ID4gPgo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4gbGltYSBtYWlsaW5nIGxpc3QKPiA+
ID4gPiBsaW1hQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gPiA+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbGltYQo+ID4gPgo+ID4gPgo+ID4gPgo+ID4g
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
