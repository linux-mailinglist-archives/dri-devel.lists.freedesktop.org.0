Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B12ABF75
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 20:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53552891AD;
	Fri,  6 Sep 2019 18:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAE1891AD
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 18:33:06 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c19so7104862edy.10
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Sep 2019 11:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=0j4As149O/AcDStq8NFIpMi0kbwMOjNmh5eyQT+/nys=;
 b=b55A8UH6p95FJBQBFjXp2dFF3DJS0JMOkCWvFYsBL/na8WEXq6M10aA5vb7OYhAljE
 cPFlk9D9Z3+bzwalJhSNqCe8tbdIXrRszzVN8thzFA1GNA0Tb7BsZkJyhk1w8YbaCagW
 MtoRx23/s0tIdfFhs1F7e4aO04WHhuaZouyt9F8B6eDfv56q8pOQRs8YGqvXpateaI4N
 OnQLnN1HAD4aHyNGwUTB118WTxFbGrwCxEUMXJ387TeYDe9uOhWRePFzczstJReTS2rw
 //KLAHHImRRcQMDTdggIHQD1OfF7TuUDFUBVHYBWBrpPaQVNtpW+FVovxAGIoeRDa7tv
 mj9Q==
X-Gm-Message-State: APjAAAWLSz/HuQyP4AgU7CceFm2o2KU/S+mbvWVk0+yqKPDlXvUlkhYE
 FMLooNNkAejhU2dy/r10PwCe5w==
X-Google-Smtp-Source: APXvYqwAoayGADcCbyY9xRIsI/e3RRzbUNAjFFTDrX4g2TEqgzRFx8BQyckbMSlSeDgCogelgDQp7g==
X-Received: by 2002:a50:d552:: with SMTP id f18mr11439305edj.36.1567794784768; 
 Fri, 06 Sep 2019 11:33:04 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id v8sm642298ejk.29.2019.09.06.11.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Sep 2019 11:33:04 -0700 (PDT)
Date: Fri, 6 Sep 2019 20:33:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 0/4] Implement lazy unmapping for GEM VRAM buffers
Message-ID: <20190906183301.GG3958@phenom.ffwll.local>
References: <20190906122056.32018-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906122056.32018-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=0j4As149O/AcDStq8NFIpMi0kbwMOjNmh5eyQT+/nys=;
 b=VXeBAgPKHOmE0bwoM9WFvxCtwO9KYtfpx/xzBc0anoKPEYsvDFYnu92Id5e+GtPnk8
 5AtS7tcylxW+i24jIrbVB5TnS/+hWoPXPvHYxxKomlnPaZ68jBCvMmr9AKuVT1GT2KLi
 7zNk5u1FLJ+Cb2mmWUh/4Sx5KNuHG/PG2ZkDI=
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
Cc: feng.tang@intel.com, dave@stgolabs.net, rong.a.chen@intel.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, maxime.ripard@bootlin.com,
 kraxel@redhat.com, ying.huang@intel.com, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBTZXAgMDYsIDIwMTkgYXQgMDI6MjA6NTJQTSArMDIwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gR2VuZXJpYyBmYmRldiBlbXVsYXRpb24gbWFwcyBhbmQgdW5tYXBzIHRoZSBj
b25zb2xlIEJPIGZvciB1cGRhdGluZyBpdCdzCj4gY29udGVudCBmcm9tIHRoZSBzaGFkb3cgYnVm
ZmVyLiBJZiB0aGlzIGludm9sdmVzIGFuIGFjdHVhbCBtYXBwaW5nCj4gb3BlcmF0aW9uIChpbnN0
ZWFkIG9mIHJldXNpbmcgYW4gZXhpc3RpbmcgbWFwcGluZyksIGxvdHMgb2YgZGVidWcgbWVzc2Fn
ZXMKPiBtYXkgYmUgcHJpbnRlZCwgc3VjaCBhcwo+IAo+ICAgeDg2L1BBVDogT3ZlcmxhcCBhdCAw
eGQwMDAwMDAwLTB4ZDEwMDAwMDAKPiAgIHg4Ni9QQVQ6IHJlc2VydmVfbWVtdHlwZSBhZGRlZCBb
bWVtIDB4ZDAwMDAwMDAtMHhkMDJmZmZmZl0sIHRyYWNrIHdyaXRlLWNvbWJpbmluZywgcmVxIHdy
aXRlLWNvbWJpbmluZywgcmV0IHdyaXRlLWNvbWJpbmluZwo+ICAgeDg2L1BBVDogZnJlZV9tZW10
eXBlIHJlcXVlc3QgW21lbSAweGQwMDAwMDAwLTB4ZDAyZmZmZmZdCj4gCj4gYXMgcmVwb3J0ZWQg
YXQgWzFdLiBEcml2ZXJzIHVzaW5nIFZSQU0gaGVscGVycyBtYXkgYWxzbyBzZWUgcmVkdWNlZAo+
IHBlcmZvcm1hbmNlIGFzIHRoZSBtYXBwaW5nIG9wZXJhdGlvbnMgY2FuIGNyZWF0ZSBvdmVyaGVh
ZC4KPiAKPiBJbiB2MyBhbmQgbGF0ZXIgb2YgdGhlIHBhdGNoIHNldCwgdGhpcyBwcm9ibGVtIGlz
IGJlaW5nIHNvbHZlZCBieSBsYXppbHkKPiB1bm1hcHBpbmcgdGhlIGJ1ZmZlciBhcyBzdWdnZXN0
ZWQgYnkgR2VyZC4gVW5tYXBwaW5nIHdpdGggZHJtX2dlbV92cmFtX2t1bm1hcCgpCj4gb25seSBj
aGFuZ2VzIGEgcmVmZXJlbmNlIGNvdW50ZXIuIFZSQU0gaGVscGVycyBsYXRlciBwZXJmb3JtIHRo
ZSB1bm1hcHBpbmcKPiBvcGVyYXRpb24gd2hlbiBUVE0gZXZpY3RzIHRoZSBidWZmZXIgb2JqZWN0
IGZyb20gaXRzIGN1cnJlbnQgbG9jYXRpb24uIElmCj4gdGhlIGJ1ZmZlciBpcyBuZXZlciBldmlj
dGVkLCB0aGUgZXhpc3RpbmcgbWFwcGluZyBpcyByZXVzZWQgYnkgbGF0ZXIgY2FsbHMKPiB0byBk
cm1fZ2VtX3ZyYW1fa21hcCgpLgo+IAo+IHY0Ogo+IAkqIGxvY2sga21hcCB3aXRoIHR0bV9ib19y
ZXNlcnZlKCkKPiAJKiBhY3F1aXJlIGxvY2sgb25seSBvbmNlIGZvciB2bWFwKCkKPiAJKiB3YXJu
IGFib3V0IHN0YWxlIG1hcHBpbmdzIGR1cmluZyBidWZmZXIgY2xlYW51cAo+IHYzOgo+ICAgICAg
IAkqIGltcGxlbWVudCBsYXp5IHVubWFwcGluZwo+IHYyOgo+IAkqIGZpeGVkIGNvbW1lbnQgdHlw
b3MKPiAKPiBbMV0gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvYXJjaGl2ZXMvZHJpLWRl
dmVsLzIwMTktU2VwdGVtYmVyLzIzNDMwOC5odG1sCgpPbiB0aGUgc2VyaWVzOiBBY2tlZC1ieTog
RGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLURhbmllbAoKPiAKPiBUaG9t
YXMgWmltbWVybWFubiAoNCk6Cj4gICBkcm0vdnJhbTogQWRkIGttYXAgcmVmLWNvdW50aW5nIHRv
IEdFTSBWUkFNIG9iamVjdHMKPiAgIGRybS92cmFtOiBBY3F1aXJlIGxvY2sgb25seSBvbmNlIHBl
ciBjYWxsIHRvIHZtYXAoKS92dW5tYXAoKQo+ICAgZHJtL3ZyYW06IEFkZCBpbmZyYXN0cnVjdHVy
ZSBmb3IgbW92ZV9ub3RpZnkoKQo+ICAgZHJtL3ZyYW06IEltcGxlbWVudCBsYXp5IHVubWFwcGlu
ZyBmb3IgR0VNIFZSQU0gYnVmZmVycwo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFt
X2hlbHBlci5jIHwgMjI5ICsrKysrKysrKysrKysrKysrKy0tLS0tLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9kcm1fdnJhbV9tbV9oZWxwZXIuYyAgfCAgMTIgKysKPiAgaW5jbHVkZS9kcm0vZHJtX2dl
bV92cmFtX2hlbHBlci5oICAgICB8ICAxOCArKwo+ICBpbmNsdWRlL2RybS9kcm1fdnJhbV9tbV9o
ZWxwZXIuaCAgICAgIHwgICA0ICsKPiAgNCBmaWxlcyBjaGFuZ2VkLCAxOTggaW5zZXJ0aW9ucygr
KSwgNjUgZGVsZXRpb25zKC0pCj4gCj4gLS0KPiAyLjIzLjAKPiAKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
