Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CF42EAFC5
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 17:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6971489D73;
	Tue,  5 Jan 2021 16:11:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com
 [209.85.217.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0586F89A44;
 Tue,  5 Jan 2021 16:11:48 +0000 (UTC)
Received: by mail-vs1-f47.google.com with SMTP id s85so199223vsc.3;
 Tue, 05 Jan 2021 08:11:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YKZ4xYRhDSu2DhCjvtXkOokAzr15+nlnfXlfiKslrrY=;
 b=SxJgLCVmAiV5JuQjaVITfejn1qA/kvdhz9qhYJEdQ0T9rS3l6ul58rfUmD4UEi3ukt
 Ijs+ys/a2P1YKNBojkIawL/wCK2p/U4HADwkYOUHrQuuyB5YauCP5rxCwBYodqAxpouJ
 rcQ4TEC0SgdYDYrqgDHfsz2bZ/fAohGGkKbtDA+2/0ZHO1Ll6N7WlIl64tyJFzJCdRtL
 YE04gZwn25DrytMXILaY2Eu757qahjyM5mmQj3L13lFUNbenmWLq6nJV8Gu8e8cQolFZ
 S/Cefb4twd1osvSNaChkKVzk/lPoDBwRUZOL5oEgoIltm3uXejFsyeNh7YaplayPjv9G
 3fDg==
X-Gm-Message-State: AOAM5316M78d0y4Vs9nVbQWFKoWceEdzoCxy6kgCm+UJBLtran9D2HWZ
 I+sJHiKcWYgQ8jq2aKwil+BJkTBN4XGXx4CJA9A=
X-Google-Smtp-Source: ABdhPJxoSLFz8Dd7wYubvom3orPgOVoBQrS+cRwXKLv/WQ3RJsErbtcru/7MlPQfn43FY+yA0EIP05ZreLahAz7FoMo=
X-Received: by 2002:a05:6102:394:: with SMTP id
 m20mr177150vsq.50.1609863107202; 
 Tue, 05 Jan 2021 08:11:47 -0800 (PST)
MIME-Version: 1.0
References: <20210105134404.1545-1-christian.koenig@amd.com>
 <20210105134404.1545-5-christian.koenig@amd.com>
In-Reply-To: <20210105134404.1545-5-christian.koenig@amd.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Tue, 5 Jan 2021 11:11:31 -0500
Message-ID: <CAKb7UvhUXKTVp9bXmbkU4VR8WQVZ16LNvk8QKkqiOUTKC8DVQg@mail.gmail.com>
Subject: Re: [PATCH 4/4] PCI: add a REBAR size quirk for Sapphire RX 5600 XT
 Pulse.
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, devspam@moreofthesa.me.uk,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKYW4gNSwgMjAyMSBhdCA4OjQ0IEFNIENocmlzdGlhbiBLw7ZuaWcKPGNrb2VuaWcu
bGVpY2h0enVtZXJrZW5AZ21haWwuY29tPiB3cm90ZToKPgo+IE90aGVyd2lzZSB0aGUgQ1BVIGNh
bid0IGZ1bGx5IGFjY2VzcyB0aGUgQkFSLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3BjaS9wY2ku
YyB8IDkgKysrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BjaS9wY2kuYyBiL2RyaXZlcnMvcGNp
L3BjaS5jCj4gaW5kZXggMTYyMTYxODZiNTFjLi5iNjZlNDcwM2MyMTQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9wY2kvcGNpLmMKPiArKysgYi9kcml2ZXJzL3BjaS9wY2kuYwo+IEBAIC0zNTc3LDcg
KzM1NzcsMTQgQEAgdTMyIHBjaV9yZWJhcl9nZXRfcG9zc2libGVfc2l6ZXMoc3RydWN0IHBjaV9k
ZXYgKnBkZXYsIGludCBiYXIpCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gICAgICAg
ICBwY2lfcmVhZF9jb25maWdfZHdvcmQocGRldiwgcG9zICsgUENJX1JFQkFSX0NBUCwgJmNhcCk7
Cj4gLSAgICAgICByZXR1cm4gKGNhcCAmIFBDSV9SRUJBUl9DQVBfU0laRVMpID4+IDQ7Cj4gKyAg
ICAgICBjYXAgPSAoY2FwICYgUENJX1JFQkFSX0NBUF9TSVpFUykgPj4gNDsKPiArCj4gKyAgICAg
ICAvKiBTYXBwaGlyZSBSWCA1NjAwIFhUIFB1bHNlIGhhcyBhbiBpbnZhbGlkIGNhcCBkd29yZCBm
b3IgQkFSIDAgKi8KPiArICAgICAgIGlmIChwZGV2LT52ZW5kb3IgPT0gUENJX1ZFTkRPUl9JRF9B
VEkgJiYgcGRldi0+ZGV2aWNlID09IDB4NzMxZiAmJgo+ICsgICAgICAgICAgIGJhciA9PSAwICYm
IGNhcCA9PSAweDcwMCkKPiArICAgICAgICAgICAgICAgY2FwID09IDB4N2YwMDsKClBlcmhhcHMg
eW91IG1lYW50IGNhcCA9IDB4N2YwMD8KCj4gKwo+ICsgICAgICAgcmV0dXJuIGNhcDsKPiAgfQo+
ICBFWFBPUlRfU1lNQk9MKHBjaV9yZWJhcl9nZXRfcG9zc2libGVfc2l6ZXMpOwo+Cj4gLS0KPiAy
LjI1LjEKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
