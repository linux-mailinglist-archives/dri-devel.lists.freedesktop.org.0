Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF49E51A78
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 20:25:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE1C89CB3;
	Mon, 24 Jun 2019 18:25:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F7C89CBA
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 18:25:00 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id e189so10484130oib.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 11:25:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NsFsqmCeB4cJxbUvEFO6xcZSO/kARHjBGNTe6zm2OGk=;
 b=k8C7T2btx5Baj3ZK+ZghLxdR0QjA+6ISAROFh7dKMchle0aL0sVKjZEPn3fUo4yEO7
 SEUK/xt0AVO5nvVVIxTLUBJarwA3RMm+nvlzbBHq63x0Era1Q/okOL8WBvv1fPFPdNAi
 RMcXVm5MjGb2FX+yY9tAwlnbyOHahU7Xe94HBSWqCpPYNRsr1svTXDN3eyUxkaLuOqB6
 brZlpcprn4kMKImDKwoeJDUBTiT53YR5KiCHxZNfLSoQjnUuSAMNemaafBfUgnSruin2
 b4syf6+qOWJ6hw/LNcLxUXCXmdwmippkQPka3Pi8U+It5V/VaIvkLi+WCbemvGnV8tEi
 At8w==
X-Gm-Message-State: APjAAAXwQFldtYzD3IY4jfHyLRiX2+nlw+vDchMmvUZHw9PQAEUq3UGq
 wcxu/dJ1f/ZU4yipk473hbGQFq60oEEUkXdGABI71g==
X-Google-Smtp-Source: APXvYqxMfIu+2D2MtYcv2E7EXzI2zB57kKNYjO9p4H9g9zR42W2XzhT13YcbI1eS8VOBT1jN50QqXbLB+mAAmyIYdBg=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr11696883oii.0.1561400699583; 
 Mon, 24 Jun 2019 11:24:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-6-hch@lst.de>
 <20190620191733.GH12083@dhcp22.suse.cz>
In-Reply-To: <20190620191733.GH12083@dhcp22.suse.cz>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 24 Jun 2019 11:24:48 -0700
Message-ID: <CAPcyv4h9+Ha4FVrvDAe-YAr1wBOjc4yi7CAzVuASv=JCxPcFaw@mail.gmail.com>
Subject: Re: [PATCH 05/22] mm: export alloc_pages_vma
To: Michal Hocko <mhocko@kernel.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=NsFsqmCeB4cJxbUvEFO6xcZSO/kARHjBGNTe6zm2OGk=;
 b=ISIKS+QlpEyn1hNfgdDi5hMHKw8iit0945EcE3yN7j+0wsgacWlTs5VS/2eHyNPn4P
 zFzHaSyW66Yiy2RhkTwuJ3InCkBlGpTPkGdBxkYOWHXgUlVbX7KrnXrnxhmbl79B80YX
 fCQYLMQ6T4q3GxjWwuuuag5EPhpGhA+skRXUiofVA4jxcOoybEtzKs47HHrVewo4aeOH
 xEgr2mAYq4kDK9twlyulxuXtH8x20UgS6h2b36rjnfm3Zpe3kyRxJhg0wXN2sl5N3Gx9
 a1ANzgYTbnIct0aX4IAsj7uocTALXH4slbfh3ZtWL5Y9qp3yWn0Ovu6E52I1ME72busN
 XZfQ==
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgMTI6MTcgUE0gTWljaGFsIEhvY2tvIDxtaG9ja29Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUgMTMtMDYtMTkgMTE6NDM6MDgsIENocmlzdG9waCBI
ZWxsd2lnIHdyb3RlOgo+ID4gbm92ZWF1IGlzIGN1cnJlbnRseSB1c2luZyB0aGlzIHRocm91Z2gg
YW4gb2RkIGhtbSB3cmFwcGVyLCBhbmQgSSBwbGFuCj4gPiB0byBzd2l0Y2ggaXQgdG8gdGhlIHJl
YWwgdGhpbmcgbGF0ZXIgaW4gdGhpcyBzZXJpZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiAtLS0KPiA+ICBtbS9tZW1wb2xpY3kuYyB8
IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4KPiA+IGRpZmYgLS1n
aXQgYS9tbS9tZW1wb2xpY3kuYyBiL21tL21lbXBvbGljeS5jCj4gPiBpbmRleCAwMTYwMGQ4MGFl
MDEuLmY5MDIzYjVmYmEzNyAxMDA2NDQKPiA+IC0tLSBhL21tL21lbXBvbGljeS5jCj4gPiArKysg
Yi9tbS9tZW1wb2xpY3kuYwo+ID4gQEAgLTIwOTgsNiArMjA5OCw3IEBAIGFsbG9jX3BhZ2VzX3Zt
YShnZnBfdCBnZnAsIGludCBvcmRlciwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gPiAg
b3V0Ogo+ID4gICAgICAgcmV0dXJuIHBhZ2U7Cj4gPiAgfQo+ID4gK0VYUE9SVF9TWU1CT0xfR1BM
KGFsbG9jX3BhZ2VzX3ZtYSk7Cj4KPiBBbGwgYWxsb2NhdG9yIGV4cG9ydGVkIHN5bWJvbHMgYXJl
IEVYUE9SVF9TWU1CT0wsIHdoYXQgaXMgYSByZWFzb24gdG8KPiBoYXZlIHRoaXMgb25lIHNwZWNp
YWw/CgpJIGFza2VkIGZvciB0aGlzIHNpbXBseSBiZWNhdXNlIGl0IHdhcyBub3QgZXhwb3J0ZWQg
aGlzdG9yaWNhbGx5LiBJbgpnZW5lcmFsIEkgd2FudCB0byBlc3RhYmxpc2ggZXhwbGljaXQgZXhw
b3J0LXR5cGUgY3JpdGVyaWEgc28gdGhlCmNvbW11bml0eSBjYW4gc3BlbmQgbGVzcyB0aW1lIGRl
YmF0aW5nIHdoZW4gdG8gdXNlIEVYUE9SVF9TWU1CT0xfR1BMClsxXS4KClRoZSB0aG91Z2h0IGlu
IHRoaXMgaW5zdGFuY2UgaXMgdGhhdCBpdCBpcyBub3QgaGlzdG9yaWNhbGx5IGV4cG9ydGVkCnRv
IG1vZHVsZXMgYW5kIGl0IGlzIHNhZmVyIGZyb20gYSBtYWludGVuYW5jZSBwZXJzcGVjdGl2ZSB0
byBzdGFydAp3aXRoIEdQTC1vbmx5IGZvciBuZXcgc3ltYm9scyBpbiBjYXNlIHdlIGRvbid0IHdh
bnQgdG8gbWFpbnRhaW4gdGhhdAppbnRlcmZhY2UgbG9uZy10ZXJtIGZvciBvdXQtb2YtdHJlZSBt
b2R1bGVzLgoKWWVzLCB3ZSBhbHdheXMgcmVzZXJ2ZSB0aGUgcmlnaHQgdG8gcmVtb3ZlIC8gY2hh
bmdlIGludGVyZmFjZXMKcmVnYXJkbGVzcyBvZiB0aGUgZXhwb3J0IHR5cGUsIGJ1dCBoaXN0b3J5
IGhhcyBzaG93biB0aGF0IGV4dGVybmFsCnByZXNzdXJlIHRvIGtlZXAgYW4gaW50ZXJmYWNlIHN0
YWJsZSAoY29udHJhcnkgdG8KRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N0YWJsZS1hcGktbm9uc2Vu
c2UucnN0KSB0ZW5kcyB0byBiZSBsZXNzIGZvcgpHUEwtb25seSBleHBvcnRzLgoKWzFdOiBodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvcGlwZXJtYWlsL2tzdW1taXQtZGlzY3Vzcy8y
MDE4LVNlcHRlbWJlci8wMDU2ODguaHRtbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
