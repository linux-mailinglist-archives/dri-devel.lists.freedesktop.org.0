Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6198A845F7
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B346E690;
	Wed,  7 Aug 2019 07:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 971FB6E41D
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 16:24:02 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id s184so67451598oie.9
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 09:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fbj+u+KrqZW21/tW+cx/lMPBDdiJJVlER4tKrQPMhTU=;
 b=o3t2dn34NmnWbvrYYabTkn6xCv1LtFty6jsck9FGx+VBeEybD5U0tRpzjxJ4oYUs4B
 hGhWzJbLBnTLpeQETh/3ZpNxIcZhq/x9RrnYU3aEFPKrkB4KWVaMetQ6R7NHxOgLY0lM
 9ofcHSvutWOo0nLkWCdWOv1fNfj49VCfq7Rsh0GyzuL4iEN4S3WWKG6xGMZE+oeniEzv
 psWKEh72GV5YJYIpwL0gv//+ckliNBCk9G6HJDttljK9uaTnB5pUIvOt0ecXsAXxxR1O
 n1k8zV/sAAtl/ywhMDLUmhSIAWiZjUUH9KgVbhtLqXvUIDPdiuEQ3fjBIRnaxg8Zt5mz
 T9IA==
X-Gm-Message-State: APjAAAU8gv3/TQsp7iWxyvSGQ+Uu6QTOUgCgQWHWrOuuOffNi8aOtMV/
 CIqVfNtFZNlg0JqQATQp6Ui+xLqLCo6+BsWb4mA/3g==
X-Google-Smtp-Source: APXvYqyfP29xHh3wHXQf3kayoVgPfPlXWuIwnV/InXQ1VuBpOGOPWgtJVmYL0bZSvY7/FfjsJEoRXu6p5LXQCNopOtE=
X-Received: by 2002:a02:c549:: with SMTP id g9mr5009331jaj.14.1565108641886;
 Tue, 06 Aug 2019 09:24:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190805211451.20176-1-robdclark@gmail.com>
 <20190806084821.GA17129@lst.de>
 <CAJs_Fx6eh1w7c=crMoD5XyEOMzP6orLhqUewErE51cPGYmObBQ@mail.gmail.com>
 <20190806155044.GC25050@lst.de>
In-Reply-To: <20190806155044.GC25050@lst.de>
From: Rob Clark <robdclark@chromium.org>
Date: Tue, 6 Aug 2019 09:23:51 -0700
Message-ID: <CAJs_Fx6uztwDy2PqRy3Tc9p12k8r_ovS2tAcsMV6HqnAp=Ggug@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: add cache support for arm64
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=Fbj+u+KrqZW21/tW+cx/lMPBDdiJJVlER4tKrQPMhTU=;
 b=K34U5YzvYaD1O3TWt3DKuJv0E7xfxFYasGVJmvfC3bMJWdUxjUg+tT/VSSTZurCvVa
 iovFc4oxIYrAcjIw6g7JmWJGjsqZqOvT+JpgTMJo4I6dVtpKFZSjyxhtp719Ua7sfhOP
 MDgeCWp2jWMGu9BPGfva1iVe+gQRtEb8DMqWY=
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
Cc: Sean Paul <sean@poorly.run>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Catalin Marinas <catalin.marinas@arm.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCA4OjUwIEFNIENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0
LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgQXVnIDA2LCAyMDE5IGF0IDA3OjExOjQxQU0gLTA3MDAs
IFJvYiBDbGFyayB3cm90ZToKPiA+IEFncmVlZCB0aGF0IGRybV9jZmx1c2hfKiBpc24ndCBhIGdy
ZWF0IEFQSS4gIEluIHRoaXMgcGFydGljdWxhciBjYXNlCj4gPiAoSUlVQyksIEkgbmVlZCB3Yitp
bnYgc28gdGhhdCB0aGVyZSBhcmVuJ3QgZGlydHkgY2FjaGUgbGluZXMgdGhhdCBkcm9wCj4gPiBv
dXQgdG8gbWVtb3J5IGxhdGVyLCBhbmQgc28gdGhhdCBJIGRvbid0IGdldCBhIGNhY2hlIGhpdCBv
bgo+ID4gdW5jYWNoZWQvd2MgbW1hcCdpbmcuCj4KPiBTbyB3aGF0IGlzIHRoZSB1c2UgY2FzZSBo
ZXJlPyAgQWxsb2NhdGUgcGFnZXMgdXNpbmcgdGhlIHBhZ2UgYWxsb2NhdG9yCj4gKG9yIENNQSBm
b3IgdGhhdCBtYXR0ZXIpLCBhbmQgdGhlbiBtbWFwaW5nIHRoZW0gdG8gdXNlcnNwYWNlIGFuZCBu
ZXZlcgo+IHRvdWNoaW5nIHRoZW0gYWdhaW4gZnJvbSB0aGUga2VybmVsPwoKQ3VycmVudGx5LCBp
dCBpcyBwYWdlcyBjb21pbmcgZnJvbSB0bXBmcy4gIElkZWFsbHkgd2Ugd2FudCBwYWdlcyB0aGF0
CmFyZSBzd2FwcGFibGUgd2hlbiB1bnBpbm5lZC4KCkNQVSBtYXBwaW5ncyBhcmUgKm1vc3RseSog
anVzdCBtYXBwaW5nIHRvIHVzZXJzcGFjZS4gIFRoZXJlIGFyZSBhIGZldwpleGNlcHRpb25zIHRo
YXQgYXJlIHZtYXAnZCAoZmJjb24sIGFuZCByaW5nYnVmZmVyKS4KCihFdmVudHVhbGx5IEknZCBs
aWtlIHRvIHN1cHBvcnQgcGFnZXMgcGFzc2VkIGluIGZyb20gdXNlcnNwYWNlLi4gYnV0CnRoYXQg
aXMgZG93biB0aGUgcm9hZC4pCgo+ID4gVHlpbmcgaXQgaW4gdy8gaW9tbXUgc2VlbXMgYSBiaXQg
d2VpcmQgdG8gbWUuLiBidXQgbWF5YmUgdGhhdCBpcyBqdXN0Cj4gPiBtZSwgSSdtIGNlcnRhaW5s
eSB3aWxsaW5nIHRvIGNvbnNpZGVyIHByb3Bvc2FscyBvciB0byB0cnkgdGhpbmdzIGFuZAo+ID4g
c2VlIGhvdyB0aGV5IHdvcmsgb3V0Lgo+Cj4gVGhpcyB3YXMganVzdCBteSB0aHJvdWdoIGFzIHRo
ZSBmaXQgc2VlbXMgZWFzeS4gIEJ1dCBtYXliZSB5b3UnbGwKPiBuZWVkIHRvIGV4cGxhaW4geW91
ciB1c2UgY2FzZShzKSBhIGJpdCBtb3JlIHNvIHRoYXQgd2UgY2FuIGZpZ3VyZSBvdXQKPiB3aGF0
IGEgZ29vZCBoaWdoIGxldmVsIEFQSSBpcy4KClR5aW5nIGl0IHRvIGlvbW11X21hcC91bm1hcCB3
b3VsZCBiZSBhd2t3YXJkLCBhcyB3ZSBjb3VsZCBuZWVkIHRvCnNldHVwIGNwdSBtbWFwIGJlZm9y
ZSBpdCBlbmRzIHVwIG1hcHBlZCB0byBpb21tdS4gIEFuZCB0aGUgcGxhbiB0bwpzdXBwb3J0IHBl
ci1wcm9jZXNzIHBhZ2V0YWJsZXMgaW52b2x2ZWQgY3JlYXRpbmcgYW4gaW9tbXVfZG9tYWluIHBl
cgp1c2Vyc3BhY2UgZ2wgY29udGV4dC4uIHNvbWUgYnVmZmVycyB3b3VsZCBlbmQgdXAgbWFwcGVk
IGludG8gbXVsdGlwbGUKY29udGV4dHMvaW9tbXVfZG9tYWlucy4KCklmIHRoZSBjYWNoZSBvcGVy
YXRpb24gd2FzIGRldGFjaGVkIGZyb20gaW9tbXVfbWFwL3VubWFwLCB0aGVuIGl0CndvdWxkIHNl
ZW0gd2VpcmQgdG8gYmUgcGFydCBvZiB0aGUgaW9tbXUgQVBJLgoKSSBndWVzcyBJJ20gbm90IGVu
dGlyZWx5IHN1cmUgd2hhdCB5b3UgaGFkIGluIG1pbmQsIGJ1dCB0aGlzIGlzIHdoeQppb21tdSBz
ZWVtZWQgdG8gbWUgbGlrZSBhIGJhZCBmaXQuCgo+ID4gRXhwb3NpbmcgdGhlIGFyY2hfc3luY18q
IEFQSSBhbmQgdXNpbmcgdGhhdCBkaXJlY3RseSAoYnlwYXNzaW5nCj4gPiBkcm1fY2ZsdXNoXyop
IGFjdHVhbGx5IHNlZW1zIHByZXR0eSByZWFzb25hYmxlIGFuZCBwcmFnbWF0aWMuICBJIGRpZAo+
ID4gaGF2ZSBvbmUgZG91YnQsIGFzIHBoeXNfdG9fdmlydCgpIGlzIG9ubHkgdmFsaWQgZm9yIGtl
cm5lbCBkaXJlY3QKPiA+IG1hcHBlZCBtZW1vcnkgKEFGQUlVKSwgd2hhdCBoYXBwZW5zIGZvciBw
YWdlcyB0aGF0IGFyZSBub3QgaW4ga2VybmVsCj4gPiBsaW5lYXIgbWFwPyAgTWF5YmUgaXQgaXMg
b2sgdG8gaWdub3JlIHRob3NlIHBhZ2VzLCBzaW5jZSB0aGV5IHdvbid0Cj4gPiBoYXZlIGFuIGFs
aWFzZWQgbWFwcGluZz8KPgo+IFRoZXkgY291bGQgaGF2ZSBhbiBhbGlhc2VkIG1hcHBpbmcgaW4g
dm1hbGxvYy92bWFwIHNwYWNlIGZvciBleGFtcGxlLAo+IGlmIHlvdSBjcmVhdGVkIG9uZS4gIFdl
IGhhdmUgdGhlIGZsdXNoX2tlcm5lbF92bWFwX3JhbmdlIC8KPiBpbnZhbGlkYXRlX2tlcm5lbF92
bWFwX3JhbmdlIEFQSXMgZm9yIHRob3NlLCB0aGF0IGFyZSBpbXBsZW1lbnQKPiBvbiBhcmNoaXRl
Y3R1cmVzIHdpdGggVklWVCBjYWNoZXMuCgpJZiBJIG9ubHkgaGF2ZSB0byB3b3JyeSBhYm91dCBh
bGlhc2VkIG1hcHBpbmdzIHRoYXQgSSBjcmVhdGUgbXlzZWxmLAp0aGF0IGRvZXNuJ3Qgc2VlbSB0
b28gYmFkLi4gIEkgY291bGQgdHJhY2sgdGhhdCBteXNlbGYgZWFzaWx5IGVub3VnaC4KCkJSLAot
UgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
