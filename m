Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C42F9A0D0
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2019 22:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BDB96EAD0;
	Thu, 22 Aug 2019 20:08:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117486EAD0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 20:08:35 +0000 (UTC)
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 916DB756
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 20:08:34 +0000 (UTC)
Received: by mail-qt1-f199.google.com with SMTP id r10so7735288qte.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2019 13:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=1HwbjAImq/TuNotWvdcVoa3mGdNn5Egs5qx+SREdsro=;
 b=OJTT5xmtcwAD/pC7lzffwtxbtS7RVLrzs0bUt063ul2R13FpvHWOLlLNybnNo3vJr3
 Dkw/aSPCvskte4fYBQ9stwSU1L0fMBoVs6IWFSbnGyY4YTqlHasyzpJPfbClSPy+zFZq
 88YUfDIl8zrV4zbDq7Ue7tg2XLc1EdIluTaWN7a4sxZTzEG8CpFNq3DM1hPbr8Np4HuE
 xFkbTFhswZl0AIr+WgyRy40y6z3IP34j+rD5bgQO/XFbo0ckyeca+8WhL0UNzg+dhQq4
 yuCFckN2Ct1BIUBtADeKDzjoMSgym0oqaC1vwds12h1TEd3xDLjZn2WFJgOz9cwq6QNg
 zGcg==
X-Gm-Message-State: APjAAAVOnpMEz4xHPWG/aqXIbrG0fZtA6t034BC/Z4g7npivgam3yUnN
 PvwX8w11STNOX/RUYOgvKdEI79Ek3y2qI32tfdhdG+z7cOwWPXFNvfQdyV04A/R2M2eGTAvZ+bo
 6m+O6OKkANMlnRqyad0K0xQlaF7pJ
X-Received: by 2002:a0c:f705:: with SMTP id w5mr1127284qvn.30.1566504513810;
 Thu, 22 Aug 2019 13:08:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqySAr9fq99xeRHVctr7dbn1oR0ZIEu7ZH+DhlXQ9brutHrwUpQWUX8SjTWCzm4JZgh88CbFEQ==
X-Received: by 2002:a0c:f705:: with SMTP id w5mr1127254qvn.30.1566504513494;
 Thu, 22 Aug 2019 13:08:33 -0700 (PDT)
Received: from dhcp-10-20-1-11.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id n14sm391037qkk.75.2019.08.22.13.08.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2019 13:08:33 -0700 (PDT)
Message-ID: <c90348c9b569bebe2efbf21c53c155756f592988.camel@redhat.com>
Subject: Re: [PATCH] drm/i915: Call dma_set_max_seg_size() in
 i915_ggtt_probe_hw()
From: Lyude Paul <lyude@redhat.com>
To: intel-gfx@lists.freedesktop.org
Date: Thu, 22 Aug 2019 16:08:32 -0400
In-Reply-To: <20190822200420.23485-1-lyude@redhat.com>
References: <20190822200420.23485-1-lyude@redhat.com>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Li4ud2hvb3BzLgoKSWdub3JlIHRoaXMgcGF0Y2gtQ2hyaXMgV2lsc29uIGhhZCByZXF1ZXN0ZWQg
dGhhdCBJIHNlbmQgYSBwYXRjaCBhbG9uZyB3aXRoCnRoaXMgb25lIHRvIGVuYWJsZSBDT05GSUdf
RE1BX0FQSV9ERUJVR19TRyBpbiBDSSwgYnV0IEkgY29tcGxldGVseSBmb3Jnb3QgdG8KZG8gdGhh
dCBiZWZvcmUgc2VuZGluZy4gV2lsbCBzZW5kIG91dCBhIHJlcm9sbCB3aXRoIHRoYXQgaW4ganVz
dCBhIG1vbWVudAoKT24gVGh1LCAyMDE5LTA4LTIyIGF0IDE2OjA0IC0wNDAwLCBMeXVkZSBQYXVs
IHdyb3RlOgo+IEN1cnJlbnRseSwgd2UgZG9uJ3QgY2FsbCBkbWFfc2V0X21heF9zZWdfc2l6ZSgp
IGZvciBpOTE1IGJlY2F1c2Ugd2UKPiBpbnRlbnRpb25hbGx5IGRvIG5vdCBsaW1pdCB0aGUgc2Vn
bWVudCBsZW5ndGggdGhhdCB0aGUgZGV2aWNlIHN1cHBvcnRzLgo+IEhvd2V2ZXIsIHRoaXMgcmVz
dWx0cyBpbiBhIHdhcm5pbmcgYmVpbmcgZW1pdHRlZCBpZiB3ZSB0cnkgdG8gbWFwCj4gYW55dGhp
bmcgbGFyZ2VyIHRoYW4gU1pfNjRLIG9uIGEga2VybmVsIHdpdGggQ09ORklHX0RNQV9BUElfREVC
VUdfU0cKPiBlbmFibGVkOgo+IAo+IFsgICAgNy43NTE5MjZdIERNQS1BUEk6IGk5MTUgMDAwMDow
MDowMi4wOiBtYXBwaW5nIHNnIHNlZ21lbnQgbG9uZ2VyCj4gdGhhbiBkZXZpY2UgY2xhaW1zIHRv
IHN1cHBvcnQgW2xlbj05ODMwNF0gW21heD02NTUzNl0KPiBbICAgIDcuNzUxOTM0XSBXQVJOSU5H
OiBDUFU6IDUgUElEOiA0NzQgYXQga2VybmVsL2RtYS9kZWJ1Zy5jOjEyMjAKPiBkZWJ1Z19kbWFf
bWFwX3NnKzB4MjBmLzB4MzQwCj4gCj4gVGhpcyB3YXMgb3JpZ2luYWxseSBicm91Z2h0IHVwIG9u
Cj4gaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA4NTE3ICwg
YW5kIHRoZSBjb25zZW5zdXMKPiB0aGVyZSB3YXMgaXQgd2Fzbid0IHJlYWxseSB1c2VmdWwgdG8g
c2V0IGEgbGltaXQgKGFuZCB0aGF0IGRtYS1kZWJ1Zwo+IGlzbid0IHJlYWxseSBhbGwgdGhhdCB1
c2VmdWwgZm9yIGk5MTUgaW4gdGhlIGZpcnN0IHBsYWNlKS4gVW5mb3J0dW5hdGVseQo+IHRob3Vn
aCwgQ09ORklHX0RNQV9BUElfREVCVUdfU0cgaXMgZW5hYmxlZCBpbiB0aGUgZGVidWcgY29uZmln
cyBmb3IKPiB2YXJpb3VzIGRpc3RybyBrZXJuZWxzLiBTaW5jZSBhIFdBUk5fT04oKSB3aWxsIGRp
c2FibGUgYXV0b21hdGljIHByb2JsZW0KPiByZXBvcnRpbmcgKGFuZCBjYXVzZSBhbnkgQ0kgd2l0
aCBzYWlkIG9wdGlvbiBlbmFibGVkIHRvIHN0YXJ0Cj4gY29tcGxhaW5pbmcpLCB3ZSByZWFsbHkg
c2hvdWxkIGp1c3QgZml4IHRoZSBwcm9ibGVtLgo+IAo+IE5vdGUgdGhhdCBhcyBtZSBhbmQgQ2hy
aXMgV2lsc29uIGRpc2N1c3NlZCwgdGhlIG90aGVyIHNvbHV0aW9uIGZvciB0aGlzCj4gd291bGQg
YmUgdG8gbWFrZSBETUEtQVBJIG5vdCBtYWtlIHN1Y2ggYXNzdW1wdGlvbnMgd2hlbiBhIGRyaXZl
ciBoYXNuJ3QKPiBleHBsaWNpdGx5IHNldCBhIG1heGltdW0gc2VnbWVudCBzaXplLiBCdXQsIHRh
a2luZyBhIGxvb2sgYXQgdGhlIGNvbW1pdAo+IHdoaWNoIG9yaWdpbmFsbHkgaW50cm9kdWNlZCB0
aGlzIGJlaGF2aW9yLCBjb21taXQgNzhjNDc4MzBhNWNiCj4gKCJkbWEtZGVidWc6IGNoZWNrIHNj
YXR0ZXJsaXN0IHNlZ21lbnRzIiksIHRoZXJlIGlzIGFuIGV4cGxpY2l0IG1lbnRpb24KPiBvZiB0
aGlzIGFzc3VtcHRpb24gYW5kIGhvdyBpdCBhcHBsaWVzIHRvIGRldmljZXMgd2l0aCBubyBzZWdt
ZW50IHNpemU6Cj4gCj4gCUNvbnZlcnNlbHksIGRldmljZXMgd2hpY2ggYXJlIGxlc3MgbGltaXRl
ZCB0aGFuIHRoZSByYXRoZXIKPiAJY29uc2VydmF0aXZlIGRlZmF1bHRzLCBvciBpbmRlZWQgaGF2
ZSBubyBsaW1pdGF0aW9ucyBhdCBhbGwKPiAJKGUuZy4gR1BVcyB3aXRoIHRoZWlyIG93biBpbnRl
cm5hbCBNTVUpLCBzaG91bGQgYmUgZW5jb3VyYWdlZCB0bwo+IAlzZXQgYXBwcm9wcmlhdGUgZG1h
X3Bhcm1zLCBhcyB0aGV5IG1heSBnZXQgbW9yZSBlZmZpY2llbnQgRE1BCj4gCW1hcHBpbmcgcGVy
Zm9ybWFuY2Ugb3V0IG9mIGl0Lgo+IAo+IFNvIHVubGVzcyB0aGVyZSdzIGFueSBjb25jZXJucyAo
SSdtIG9wZW4gdG8gZGlzY3Vzc2lvbiEpLCBsZXQncyBqdXN0Cj4gZm9sbG93IHN1aXRlIGFuZCBj
YWxsIGRtYV9zZXRfbWF4X3NlZ19zaXplKCkgd2l0aCBVSU5UX01BWCBhcyBvdXIgbGltaXQKPiB0
byBzaWxlbmNlIGFueSB3YXJuaW5ncy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxs
eXVkZUByZWRoYXQuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjQuMTgrCj4gLS0tCj4gIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jIHwgNSArKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZ2VtX2d0dC5jCj4gYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pOTE1X2dlbV9ndHQu
Ywo+IGluZGV4IDBiODFlMGI2NDM5My4uYTE0NzUwMzlkMTgyIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2k5MTVfZ2VtX2d0dC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV9nZW1fZ3R0LmMKPiBAQCAtMzE1Miw2ICszMTUyLDExIEBAIHN0YXRpYyBpbnQgZ2d0
dF9wcm9iZV9odyhzdHJ1Y3QgaTkxNV9nZ3R0ICpnZ3R0LAo+IHN0cnVjdCBpbnRlbF9ndCAqZ3Qp
Cj4gIAlpZiAocmV0KQo+ICAJCXJldHVybiByZXQ7Cj4gIAo+ICsJLyogV2UgZG9uJ3QgaGF2ZSBh
IG1heCBzZWdtZW50IHNpemUsIHNvIHNldCBpdCB0byB0aGUgbWF4IHNvIHNnJ3MKPiArCSAqIGRl
YnVnZ2luZyBsYXllciBkb2Vzbid0IGNvbXBsYWluCj4gKwkgKi8KPiArCWRtYV9zZXRfbWF4X3Nl
Z19zaXplKGdndHQtPnZtLmRtYSwgVUlOVF9NQVgpOwo+ICsKPiAgCWlmICgoZ2d0dC0+dm0udG90
YWwgLSAxKSA+PiAzMikgewo+ICAJCURSTV9FUlJPUigiV2UgbmV2ZXIgZXhwZWN0ZWQgYSBHbG9i
YWwgR1RUIHdpdGggbW9yZSB0aGFuCj4gMzJiaXRzIgo+ICAJCQkgICIgb2YgYWRkcmVzcyBzcGFj
ZSEgRm91bmQgJWxsZE0hXG4iLAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
