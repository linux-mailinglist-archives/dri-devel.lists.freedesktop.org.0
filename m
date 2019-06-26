Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8108556E3B
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 18:01:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970896E486;
	Wed, 26 Jun 2019 16:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98FC56E486
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 16:00:59 +0000 (UTC)
Received: by mail-oi1-x243.google.com with SMTP id m202so2323949oig.6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 09:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r/963AMc32TjFW8pz2sb81LGtvemWumKWmOSWi/w+uo=;
 b=qhoqPXTO+SxHKCxIiXebyyHhBIoSH+tzigTBemW0PJRVhE4+UOAzY83xHU9YmI8PuN
 /HKAKnQIMPlmIBvpxe5tu97lQk6QIY2TBr84WzmqJzxfwh733qdrffJxNxvv8M8Ikp19
 IUIrkt40v2uQouyRBFpxY3UFOFlH3sxAXbCooTakxH+uTzPajBvCUtbbeTMwGsCCYnYw
 /WrgUKXU5MK27+BhiPujF2jMjJxWtiCxBROFqhfQk1sypLf8Jzxb7+8/fz7kMZomuwDE
 r8Y/ULnflk5NRKpu4j91CR9oqyWmqVz9ST+/CcQFwfXhjheeFEegF7XFGgkzkv8DcQKI
 iDbQ==
X-Gm-Message-State: APjAAAVS9lnjCkbaX4R6M1Cj0DxyAOc01S407JmNnszi2o2kbM+e3ciU
 rhTJnigYYLkbez3TIcIEPBLhw0JlXetGG2eBBPP3iw==
X-Google-Smtp-Source: APXvYqw+HKEk3o1E4qvsumKbcYL8DeGoSSUg6kQouoUdfkWJuiZCSiMJzuF3+UevbQqRwbob+TxTsET5oJi5oxrpxxs=
X-Received: by 2002:aca:fc50:: with SMTP id a77mr2276731oii.0.1561564858765;
 Wed, 26 Jun 2019 09:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-5-hch@lst.de>
In-Reply-To: <20190626122724.13313-5-hch@lst.de>
From: Dan Williams <dan.j.williams@intel.com>
Date: Wed, 26 Jun 2019 09:00:47 -0700
Message-ID: <CAPcyv4gTOf+EWzSGrFrh2GrTZt5HVR=e+xicUKEpiy57px8J+w@mail.gmail.com>
Subject: Re: [PATCH 04/25] mm: remove MEMORY_DEVICE_PUBLIC support
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=r/963AMc32TjFW8pz2sb81LGtvemWumKWmOSWi/w+uo=;
 b=FEqk4AyqvI2SzCotbI6w47r7lIg1pbMai4XViymaBkOSAtj0NfKwJKshzu/N8BPJFi
 PPN0xns9/GQ3UjW0F9OUD+lLQxT0bLvpRO6rEeExsKdp48k3oiJcMS1RfpUHWI3YgQSe
 P3swXsvQ9fmeXBT6oobBozcpVgRGWN23FavhhN4cCEGhqIdsUZ+QWbmxpT1xgQhmYaLI
 wRlJBZOCxG1HxsggNiXJVMbdqx15uDTKnIMPx8OZYBLCprh9CGs/eCgDPe7/TAMtVU5d
 oafpIZj3xnh4RTWYjvBCXah4DbVlLssHna403/2Qrtq8aZqQJ+EBDW0IKrQkvHB1zCgf
 +PXw==
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
Cc: Michal Hocko <mhocko@suse.com>, linux-nvdimm <linux-nvdimm@lists.01.org>,
 nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, "Weiny, Ira" <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WyBhZGQgSXJhIF0KCk9uIFdlZCwgSnVuIDI2LCAyMDE5IGF0IDU6MjcgQU0gQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+IHdyb3RlOgo+Cj4gVGhlIGNvZGUgaGFzbid0IGJlZW4gdXNlZCBz
aW5jZSBpdCB3YXMgYWRkZWQgdG8gdGhlIHRyZWUsIGFuZCBkb2Vzbid0Cj4gYXBwZWFyIHRvIGFj
dHVhbGx5IGJlIHVzYWJsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgo+IFJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5j
b20+Cj4gQWNrZWQtYnk6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpbLi5dCj4gZGlm
ZiAtLWdpdCBhL21tL3N3YXAuYyBiL21tL3N3YXAuYwo+IGluZGV4IDdlZGUzZWRkYzEyYS4uODMx
MDc0MTBkMjlmIDEwMDY0NAo+IC0tLSBhL21tL3N3YXAuYwo+ICsrKyBiL21tL3N3YXAuYwo+IEBA
IC03NDAsMTcgKzc0MCw2IEBAIHZvaWQgcmVsZWFzZV9wYWdlcyhzdHJ1Y3QgcGFnZSAqKnBhZ2Vz
LCBpbnQgbnIpCj4gICAgICAgICAgICAgICAgIGlmIChpc19odWdlX3plcm9fcGFnZShwYWdlKSkK
PiAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPgo+IC0gICAgICAgICAgICAgICAv
KiBEZXZpY2UgcHVibGljIHBhZ2UgY2FuIG5vdCBiZSBodWdlIHBhZ2UgKi8KPiAtICAgICAgICAg
ICAgICAgaWYgKGlzX2RldmljZV9wdWJsaWNfcGFnZShwYWdlKSkgewo+IC0gICAgICAgICAgICAg
ICAgICAgICAgIGlmIChsb2NrZWRfcGdkYXQpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmxvY2tlZF9wZ2RhdC0+bHJ1X2xvY2ssCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZs
YWdzKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxvY2tlZF9wZ2RhdCA9IE5V
TEw7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgfQo+IC0gICAgICAgICAgICAgICAgICAgICAg
IHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHBhZ2UpOwo+IC0gICAgICAgICAgICAgICAgICAgICAg
IGNvbnRpbnVlOwo+IC0gICAgICAgICAgICAgICB9Cj4gLQoKVGhpcyBjb2xsaWRlcyB3aXRoIEly
YSdzIGJ1ZyBmaXggWzFdLiBUaGUgTUVNT1JZX0RFVklDRV9GU0RBWCBjYXNlCm5lZWRzIHRoaXMg
dG8gYmUgY29udmVydGVkIHRvIGJlIGluZGVwZW5kZW50IG9mICJwdWJsaWMiIHBhZ2VzLgpQZXJo
YXBzIGl0IHNob3VsZCBiZSBwdWxsZWQgb3V0IG9mIC1tbSBhbmQgaW5jb3Jwb3JhdGVkIGluIHRo
aXMKc2VyaWVzLgoKWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwNjA1MjE0
OTIyLjE3Njg0LTEtaXJhLndlaW55QGludGVsLmNvbS8KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
