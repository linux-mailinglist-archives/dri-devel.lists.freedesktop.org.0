Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 377EE83935
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 20:59:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A203D6E2F9;
	Tue,  6 Aug 2019 18:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7346E2F9;
 Tue,  6 Aug 2019 18:59:11 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id n1so2631034wrw.12;
 Tue, 06 Aug 2019 11:59:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KdYR5EY08dTrABja8SUaSb/bjYgZpuHfqWAB/BpsnN0=;
 b=awzOsuEF3YOWspN1CEjPPFAlE53avcMJGZL599qZXJISNRGWmU195UOPaoI0jBRXuK
 qzZag9sXQtytGdPdOlCbmWVhfp4RERkGGVBal8oIX3Q7pg4JeP5IEti6W9Qyvk1I67bt
 MOEu+NrRq9kl0AvHLlAEJpRKqhcLXX0QdKTRE5dJQ8DeVK1FpbBBuzBgIPm/EpdcKJ/q
 S6xASiWS99y1xY1xbIJTqIt4X+my+klJJn3yGx0ORuEnyivbb6VSxMj6VWiRrzYRqMkU
 yAsla61BWMaxWacJj8Q6qoayLNlokHJyOyq1oSc7jDKlQSTJUSByc2yB1PCdVZYG0MRv
 kWxQ==
X-Gm-Message-State: APjAAAWl3T4E3RHioV3J+mEQduUMcb6ScawZpRAoJliIA6Rj4zlmIZbm
 cSSIcUADmqZSX9cD3EUuxCNEgA2HMvuWQPxdtB4=
X-Google-Smtp-Source: APXvYqyvIOyL3ta7PNqlaft8AIjrG08VwxtlFNFvdOLUq+AjfF7aZKuWk+kMq57BwYyz3aJneYaERa/Thq7ouYxDQUo=
X-Received: by 2002:adf:dfc5:: with SMTP id q5mr6393234wrn.142.1565117950081; 
 Tue, 06 Aug 2019 11:59:10 -0700 (PDT)
MIME-Version: 1.0
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-16-hch@lst.de>
 <20190806174437.GK11627@ziepe.ca>
 <587b1c3c-83c4-7de9-242f-6516528049f4@amd.com>
In-Reply-To: <587b1c3c-83c4-7de9-242f-6516528049f4@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 6 Aug 2019 14:58:58 -0400
Message-ID: <CADnq5_Puv-N=FVpNXhv7gOWZ8=tgBD2VjrKpVzEE0imWqJdD1A@mail.gmail.com>
Subject: Re: [PATCH 15/15] amdgpu: remove CONFIG_DRM_AMDGPU_USERPTR
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KdYR5EY08dTrABja8SUaSb/bjYgZpuHfqWAB/BpsnN0=;
 b=KzkDXYOptvkwojTFBCmVBlV+3tIliyzrdwY+53s8Esprf/Qgz2f1eCQC0QZw//ozZE
 RcNDjvbJB0Cq3mVPeQ15pOOzXvlweppXj6YAayOw27YWsleceaonHnL4Nzg52TLIthMV
 rYjlL0699xdOcqu7sevttzOxuBg4lN0lkzV2K+uunyzS+RpjhuoPhqdSTlnWnb+T7JCY
 HjZ7JWiEwVAUgYx71nCzkRtYctAe5o7uJNxjGtB37j8Kd+2mGvXbEYuFLbnlo+SIJTJp
 +5YjsJV6IoI9YUlqfsHsDvbDUa1C/1KA3eKWNZE2oqsn4qlL+cyH/WoPyn6i66w9Lttj
 o0FA==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxOjUxIFBNIEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3Vl
aGxpbmdAYW1kLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDE5LTA4LTA2IDEzOjQ0LCBKYXNvbiBHdW50
aG9ycGUgd3JvdGU6Cj4gPiBPbiBUdWUsIEF1ZyAwNiwgMjAxOSBhdCAwNzowNTo1M1BNICswMzAw
LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+PiBUaGUgb3B0aW9uIGlzIGp1c3QgdXNlZCB0
byBzZWxlY3QgSE1NIG1pcnJvciBzdXBwb3J0IGFuZCBoYXMgYSB2ZXJ5Cj4gPj4gY29uZnVzaW5n
IGhlbHAgdGV4dC4gIEp1c3QgcHVsbCBpbiB0aGUgSE1NIG1pcnJvciBjb2RlIGJ5IGRlZmF1bHQK
PiA+PiBpbnN0ZWFkLgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcg
PGhjaEBsc3QuZGU+Cj4gPj4gLS0tCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAg
ICAgICAgICAgICAgfCAgMiArKwo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvS2Nv
bmZpZyAgICAgIHwgMTAgLS0tLS0tLS0tLQo+ID4+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvYW1kZ3B1X3R0bS5jIHwgIDYgLS0tLS0tCj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfdHRtLmggfCAxMiAtLS0tLS0tLS0tLS0KPiA+PiAgIDQgZmlsZXMgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyOCBkZWxldGlvbnMoLSkKPiA+IEZlbGl4LCB3YXMgdGhpcyBh
biBlZmZvcnQgdG8gYXZvaWQgdGhlIGFyY2ggcmVzdHJpY3Rpb24gb24gaG1tIG9yCj4gPiBzb21l
dGhpbmc/IEFsc28gY2FuJ3Qgc2VlIHdoeSB0aGlzIHdhcyBsaWtlIHRoaXMuCj4KPiBUaGlzIG9w
dGlvbiBwcmVkYXRlcyBLRkQncyBzdXBwb3J0IG9mIHVzZXJwdHJzLCB3aGljaCBpbiB0dXJuIHBy
ZWRhdGVzCj4gSE1NLiBSYWRlb24gaGFzIHRoZSBzYW1lIGtpbmQgb2Ygb3B0aW9uLCB0aG91Z2gg
aXQgZG9lc24ndCBhZmZlY3QgSE1NIGluCj4gdGhhdCBjYXNlLgo+Cj4gQWxleCwgQ2hyaXN0aWFu
LCBjYW4geW91IHRoaW5rIG9mIGEgZ29vZCByZWFzb24gdG8gbWFpbnRhaW4gdXNlcnB0cgo+IHN1
cHBvcnQgYXMgYW4gb3B0aW9uIGluIGFtZGdwdT8gSSBzdXNwZWN0IGl0IHdhcyBvcmlnaW5hbGx5
IG1lYW50IGFzIGEKPiB3YXkgdG8gYWxsb3cga2VybmVscyB3aXRoIGFtZGdwdSB3aXRob3V0IE1N
VSBub3RpZmllcnMuIE5vdyBpdCB3b3VsZAo+IGFsbG93IGEga2VybmVsIHdpdGggYW1kZ3B1IHdp
dGhvdXQgSE1NIG9yIE1NVSBub3RpZmllcnMuIEkgZG9uJ3Qga25vdyBpZgo+IHRoaXMgaXMgYSB1
c2VmdWwgdGhpbmcgdG8gaGF2ZS4KClJpZ2h0LiAgVGhlcmUgd2VyZSBwZW9wbGUgdGhhdCBkaWRu
J3QgaGF2ZSBNTVUgbm90aWZpZXJzIHRoYXQgd2FudGVkCnN1cHBvcnQgZm9yIHRoZSBHUFUuICBG
b3IgYSBsb3Qgb2Ygb2xkZXIgQVBJcywgYSBsYWNrIG9mIHVzZXJwdHIKc3VwcG9ydCB3YXMgbm90
IGEgYmlnIGRlYWwgKGl0IGp1c3QgZGlzYWJsZWQgc29tZSBvcHRpbWl6YXRpb25zIGFuZApBUEkg
ZXh0ZW5zaW9ucyksIGJ1dCBhcyBpdCBiZWNvbWVzIG1vcmUgcmVsZXZhbnQgaXQgbWF5IG1ha2Ug
c2Vuc2UgdG8KanVzdCBtYWtlIGl0IGEgcmVxdWlyZW1lbnQuCgpBbGV4Cgo+Cj4gUmVnYXJkcywK
PiAgICBGZWxpeAo+Cj4gPgo+ID4gUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1l
bGxhbm94LmNvbT4KPiA+Cj4gPiBKYXNvbgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vYW1kLWdmeApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
