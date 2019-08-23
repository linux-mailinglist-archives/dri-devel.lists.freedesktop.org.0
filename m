Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8DD9B1E3
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 16:26:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAB216ECAC;
	Fri, 23 Aug 2019 14:26:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F05BA6ECAC
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 14:26:42 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A10BB233FE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 14:26:42 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id u190so8343655qkh.5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2019 07:26:42 -0700 (PDT)
X-Gm-Message-State: APjAAAU06+5xlkUowsr1gy4EgJay5UXJOJpneY63cTKkguxzFaUj9UFG
 WXk4xGjQvvHMlyL07HdwseR2BTdw8rgc4AtZKg==
X-Google-Smtp-Source: APXvYqy3LJJpTh8U1F6a/bYacT71u6WcOb1VvxCwPS/jdnXDy39YNn6FEhVapC37qoDwlbP1nNAQnyFYm1npd5ZPyDQ=
X-Received: by 2002:a37:4941:: with SMTP id w62mr3940961qka.119.1566570401715; 
 Fri, 23 Aug 2019 07:26:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190823021216.5862-1-robh@kernel.org>
 <20190823021216.5862-9-robh@kernel.org>
 <39a16722-9ab2-b7ca-1c28-dd733c1b193a@arm.com>
 <CAL_JsqKeUBUw3JmCyc5Ui5Ou_shmizyEzFA-UQ-zXHCsPDv0DQ@mail.gmail.com>
 <b45dc9fc-be55-ec91-74c4-dad5e2ed4917@arm.com>
In-Reply-To: <b45dc9fc-be55-ec91-74c4-dad5e2ed4917@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 23 Aug 2019 09:26:29 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJgjdw9WVXYPtxA4F0B8NfXVQ00NWqcM_bW582QbQjp9w@mail.gmail.com>
Message-ID: <CAL_JsqJgjdw9WVXYPtxA4F0B8NfXVQ00NWqcM_bW582QbQjp9w@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] drm/panfrost: Remove unnecessary flushing from
 tlb_inv_context
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566570402;
 bh=Eicz11z7vIGAzqNxYFvmGRohSACB3fZHxbEHq5x0/tI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=15L4hcUMY/F5AOjztJW1MjB7d20MXCrw32lyXcJEA4T+T19cRhCCkkx9TO9S2JB6i
 rBo56jtIqaygQYdJJzgfEI4/UPjapihQX9XQpyzpm5Rn4zeZLU0RE/0WpP0j4sKAJm
 RXme+iTZJESmHJEdHgncIJnbuYpNH2/S5nOoKQ9w=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgOTowNSBBTSBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPiB3cm90ZToKPgo+IE9uIDIzLzA4LzIwMTkgMTQ6MTgsIFJvYiBIZXJyaW5nIHdy
b3RlOgo+ID4gT24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgNzo1NiBBTSBSb2JpbiBNdXJwaHkgPHJv
YmluLm11cnBoeUBhcm0uY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIzLzA4LzIwMTkgMDM6MTIs
IFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4+PiB0bGJfaW52X2NvbnRleHQoKSBob29rIGlzIG9ubHkg
Y2FsbGVkIHdoZW4gZnJlZWluZyB0aGUgcGFnZSB0YWJsZXMuIFRoZXJlJ3MKPiA+Pj4gbm8gcG9p
bnQgaW4gZmx1c2hpbmcgb25seSB0byBmcmVlIHRoZSBwYWdlIHRhYmxlcyBpbW1lZGlhdGVseSBm
b2xsb3dpbmcuCj4gPj4KPiA+PiBGV0lXLCBpbiBnZW5lcmFsIHRoZSBwb2ludCBvZiBmbHVzaGlu
ZyBpcyAqYmVjYXVzZSogd2UncmUgYWJvdXQgdG8gZnJlZQo+ID4+IHRoZSBwYWdldGFibGVzIC0g
aWYgdGhlcmUncyBhbnkgcG9zc2liaWxpdHkgdGhhdCB0aGUgaGFyZHdhcmUgY291bGQKPiA+PiBj
b250aW51ZSB0byBpc3N1ZSB0cmFuc2xhdGlvbiB0YWJsZSB3YWxrcyAoc3BlY3VsYXRpdmUgb3Ig
b3RoZXJ3aXNlKQo+ID4+IGFmdGVyIHRob3NlIHBhZ2VzIGhhdmUgYmVlbiByZXVzZWQgYnkgc29t
ZW9uZSBlbHNlLCBUTEIgYmFkbmVzcyBtYXkgZW5zdWUuCj4gPj4KPiA+PiBGb3IgcGFuZnJvc3Qg
aW4gcGFydGljdWxhciBJIHN1c3BlY3Qgd2UgY2FuIHByb2JhYmx5IGdldCBhd2F5IHdpdGhvdXQK
PiA+PiBpdCwgYXQgbGVhc3QgZm9yIHRoZSBtb21lbnQsIGJ1dCBpdCBtaWdodCBiZSB3b3J0aCBt
b3ZpbmcgdGhlIGZsdXNoIHRvCj4gPj4gbW11X2Rpc2FibGUoKSBmb3IgY29tcGxldGUgcGVhY2Ug
b2YgbWluZCAod2hpY2gga2luZCBvZiBwcmVlbXB0cyB0aGUKPiA+PiBzb3J0IG9mIHRoaW5nIHRo
YXQgcGVyLXByb2Nlc3MgQVMgc3dpdGNoaW5nIHdpbGwgd2FudCBhbnl3YXkpLgo+ID4KPiA+IFRo
ZXJlJ3MgYmlnZ2VyIHByb2JsZW0gdGhhdCBtbXVfZGlzYWJsZSgpIGlzIHN0aWxsIG9ubHkgY2Fs
bGVkIGZvciBBUzAKPiA+IGFuZCBvbmx5IGZvciBkcml2ZXIgdW5sb2FkLgo+Cj4gU3VyZSwgYnV0
IEFTMCBpcyB0aGUgb25seSBvbmUgd2UgZXZlciBlbmFibGUsIGFuZCBjb25jZXB0dWFsbHkgd2Ug
ZG8KPiB0aGF0IG9uY2UgYXQgcHJvYmUgdGltZSAoQUZBSUNTIGl0IHN0YXlzIG5vbWluYWxseSBs
aXZlIHRocm91Z2ggcmVzZXRzCj4gYW5kIHJlc3VtZXMpLCBzbyB3aGlsZSBpdCBtYXkgYmUgdGhl
IGxlYXN0LWNsZXZlciBBUyB1c2FnZSBwb3NzaWJsZSBpdCdzCj4gYXQgbGVhc3Qgc2VsZi1jb25z
aXN0ZW50LiBBbmQgYXQgdGhlIG1vbWVudCB0aGUgb25seSB0aW1lIHdlJ2xsIGNhbGwKPiAudGxi
X2ludl9jb250ZXh0IGlzIGZyb20gcGFuZnJvc3RfbW11X2ZpbmkoKSB3aGVuIHdlJ3JlIHVuY29u
ZGl0aW9uYWxseQo+IHBva2luZyByZWdpc3RlcnMgYW55d2F5LCBzbyBlaXRoZXIgd2F5IEkgZG9u
J3QgdGhpbmsgdGhlcmUncyBhbnkgYWN0dWFsCj4gcHJvYmxlbSB0b2RheSAtIEknbSB2aWV3aW5n
IHRoaXMgcGF0Y2ggYXMgZ2V0dGluZyB0aGluZ3Mgc3RyYWlnaHQgaW4KPiBwcmVwYXJhdGlvbiBm
b3IgdGhlIGZ1dHVyZS4KCkl0IHdhcyBvbmx5IEFTMCwgYnV0IHdlIG5vdyBoYXZlIHBlciBGRCBB
Uy4KCj4gPiBJIGd1ZXNzIHdlIHNob3VsZCBmaXggdGhhdCBhbmQgdGhlbiBmaWd1cmUKPiA+IG91
dCB3aGVyZSBhIGZsdXNoIGlzIG5lZWRlZCBpZiBhdCBhbGwuIEkgd291bGQgdGhpbmsgY2hhbmdp
bmcgdGhlIFRUQlIKPiA+IHdvdWxkIGJlIGVub3VnaCB0byBxdWllc2NlIHRoZSBoL3cgYW5kIFRM
QnMuIFRoYXQgc2VlbXMgdG8gYmUgdGhlIGNhc2UKPiA+IGluIG15IHRlc3Rpbmcgb2Ygc3dpdGNo
aW5nIGFkZHJlc3Mgc3BhY2VzLgo+Cj4gIEZyb20gYSBxdWljayBzY2FuIHRocm91Z2gga2Jhc2Us
IGtiYXNlX21tdV9kaXNhYmxlKCkgYXBwZWFycyB0byBwZXJmb3JtCj4gYW4gZnVsbCBGTFVTSF9N
RU0gYmVmb3JlIHJld3JpdGluZyBUUkFOU1RBQiwgYW5kIGl0IGxvb2tzIGxpa2UgdGhhdCBkb2Vz
Cj4gZ2V0IGNhbGxlZCB3aGVuIHNjaGVkdWxpbmcgb3V0IGEgY29udGV4dC4gVGhhdCdzIGluIGxp
bmUgd2l0aCB3aGF0IEkgd2FzCj4gaW1hZ2luaW5nLCBzbyB1bmxlc3Mgd2Uga25vdyBiZXR0ZXIg
Zm9yIHN1cmUsIHdlIG1heSBhcyB3ZWxsIHBsYXkgaXQKPiBzYWZlIGFuZCBmb2xsb3cgdGhlIHNh
bWUgcGF0dGVybi4KCkFncmVlZC4KClJvYgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
