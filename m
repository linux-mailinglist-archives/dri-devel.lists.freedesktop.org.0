Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAF58E6F0
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 10:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C576E913;
	Thu, 15 Aug 2019 08:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D73B6E872
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 23:35:03 +0000 (UTC)
Received: from mail-qt1-f200.google.com ([209.85.160.200])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <alex.hung@canonical.com>)
 id 1hy2nF-0008WC-Ge
 for dri-devel@lists.freedesktop.org; Wed, 14 Aug 2019 23:35:01 +0000
Received: by mail-qt1-f200.google.com with SMTP id b9so820131qti.20
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 16:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VyFhDO1eWcBeMeihOWCBNHAWrS5d5d9jzD5/Lieum7w=;
 b=kB4bgfB+nqHOQ80q+nQ7zcec8jbFcxQCkmlKC8e8XCEZivtNWet+3akyPegnDApx6i
 hvyhH9kb0rpshRQzWLy6Gj7lvOL9SW2dJDb4S8TBsnOuOAQATrFlzEOsPimhJbgbpY6+
 i5g7qSJhge7vBAKItbZmzytAwqlDxtoc28WyFrnkhm9Pz9Y5vyTDs1EfmQyuk6mlfz0p
 k/ujTLJV/JxvYEyLB9tk2+52/lbEsNlOp9CgVGZVjMLYA0DIj68b022HKGNtF1FkBulI
 +rH8s8oBOfxmQAhPTa+WIcKvk56P5br7RjGlHGVFy/2EtCRu/2IN1cR/X/AQ7SEGd17D
 U/tg==
X-Gm-Message-State: APjAAAUAQaHtMMH73gkJERqYeQM++i+W2Gx/3DpXHyN+KUhH0OM9uK6B
 JlbB/rC23H139sacXrF7HuvU04chVsprz8NXSOpoytmLRWFxXrGq9MxAaizjYWJef0puNWl8NM0
 KqS4VY6/VWHpuz7+l+W/4GPJxsd/83GAbGzJSs1jsni6VciSz8Eg9PerARBAr5A==
X-Received: by 2002:a0c:f6ce:: with SMTP id d14mr1525095qvo.56.1565825700753; 
 Wed, 14 Aug 2019 16:35:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxE+6MV13gPzPrDixW9IwdnT+USgnWkWtGUiu6QcUgWCmd75vba/3ZYWWy4K18nZ+ZMC4zhsyMCvvjKOohDSj4=
X-Received: by 2002:a0c:f6ce:: with SMTP id d14mr1525085qvo.56.1565825700594; 
 Wed, 14 Aug 2019 16:35:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-4-kherbst@redhat.com>
In-Reply-To: <20190814213118.28473-4-kherbst@redhat.com>
From: Alex Hung <alex.hung@canonical.com>
Date: Wed, 14 Aug 2019 17:34:49 -0600
Message-ID: <CAJ=jquaVcWisQ3Qw-_GMktcOq4zqFmeYXztfwNAVKZJO=_+yLA@mail.gmail.com>
Subject: Re: [PATCH 3/7] Revert "ACPI / OSI: Add OEM _OSI strings to disable
 NVidia RTD3"
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Approved-At: Thu, 15 Aug 2019 08:34:58 +0000
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
Cc: nouveau@lists.freedesktop.org,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMTQsIDIwMTkgYXQgMzozMSBQTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHJldmVydHMgY29tbWl0IDkyNTFhNzFkYjYyY2E5Y2M3
ZTdjZjM2NDIxODYxMGIwZjAxOGMyOTEuCj4KPiBUaGlzIHdhcyBuZXZlciBkaXNjdXNzZWQgd2l0
aCBhbnlib2R5IE5vdXZlYXUgcmVsYXRlZCBhbmQgd2Ugd291bGQgaGF2ZSBOQUNLZWQKPiB0aGlz
IGNoYW5nZSBpbW1lZGlhdGVseS4KPgo+IFdlIGhhdmUgYSBiZXR0ZXIgd29ya2Fyb3VuZCwgd2hp
Y2ggbWFrZXMgaXQgYWN0dWFsbHkgd29yayB3aXRoIE5vdXZlYXUuIE5vIGlkZWEKPiB3aHkgdGhl
IGNvbW1lbnQgbWVudGlvbnMgdGhlIE52aWRpYSBkcml2ZXIgYW5kIGFzc3VtZXMgaXQgZ2l2ZXMg
YW55IHdlaWdodCB0bwo+IHRoZSByZWFzb25pbmcuLi4uIHdlIGRvbid0IGNhcmUgYWJvdXQgb3V0
IG9mIHRyZWUgZHJpdmVycy4KPgo+IE5vdXZlYXUgZG9lcyBzdXBwb3J0IFJURDMsIGJ1dCB3ZSBo
YWQgc29tZSBpc3N1ZXMgd2l0aCB0aGF0LiBBbmQgd2UgZXZlbiBoYXZlCj4gYSBiZXR0ZXIgZml4
IGZvciB0aGlzIGlzc3VlLiBBbHNvLCBjYW4gd2UgX3BsZWFzZV8gZG8gaXQgaW4gYSB3YXkgd29y
dGh5IG9mIGFuCj4gdXBzdHJlYW0gY29tbXVuaXR5IHRoZSBuZXh0IHRpbWU/Cj4KPiBJZiBzb21l
IGRpc3RyaWJ1dGlvbiBmZWVscyBsaWtlIHRoZXkgaGF2ZSB0byBwbGVhc2UgY29tcGFuaWVzIG5v
dCB3YW50aW5nIHRvCj4gYmUgcGFydCBvZiB0aGUgbGludXggY29tbXVuaXR5LCBwbGVhc2UgZG8g
c28gZG93bnN0cmVhbSBhbmQgZG9uJ3QgdHJ5IHRvIHB1c2gKPiBzb21ldGhpbmcgbGlrZSB0aGlz
IHVwc3RyZWFtLgoKSGkgS2Fyb2wsCgpBIGxvdCBvZiBhcHByZWNpYXRpb24gZm9yIHlvdXIgaGFy
ZC13b3JrIG9uIHRoaXMgaXNzdWUsIGJ1dCB1bmZyaWVuZGx5CmNvbW1lbnRzIGFyZW4ndCBuZWNl
c3NhcnkuIEF0IHRoZSB0aW1lIHRoaXMgd2FzIGRpc2N1c3NlZCB3aXRoCmhhcmR3YXJlIHZlbmRv
cnMgYW5kIHBsYXRmb3JtIHZlbmRvcnMgYW5kIGl0IHdvcmtlZCBmb3IgbWFueSBzeXN0ZW1zCmFu
ZCBiZW5lZml0IGZvciBtYW55IHBlb3BsZSBidXlpbmcgdGhlc2UgcGxhdGZvcm1zLiBMYXN0IGJ1
dCBub3QKbGVhc3QsIEkgZG8gYXBwcmVjaWF0ZSBiZXR0ZXIgZml4ZXMgYW5kIHdhbnQgdG8gcmV0
aXJlIHRoZSBoYWNrcyB0b28uCgpJIGFtIGdvaW5nIHRvIG5vdGlmeSBoYXJkd2FyZSBvd25lcnMg
dG8gdGVzdCB0aGVzZSBwYXRjaGVzIG9uIHRoZQpvcmlnaW5hbCBpbnRlbmRlZCBzeXN0ZW1zLCBh
bmQgd2lsbCByZXBvcnQgd2hldGhlciB0aGVyZSBhcmUKcmVncmVzc2lvbnMuCgoKPgo+IFNpZ25l
ZC1vZmYtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgo+IENDOiBBbGV4IEh1
bmcgPGFsZXguaHVuZ0BjYW5vbmljYWwuY29tPgo+IENDOiBSYWZhZWwgSi4gV3lzb2NraSA8cmFm
YWVsLmoud3lzb2NraUBpbnRlbC5jb20+Cj4gQ0M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhh
dC5jb20+Cj4gQ0M6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+Cj4gQ0M6IEJlbiBTa2Vn
Z3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJpdmVycy9hY3BpL29zaS5jIHwgOSAt
LS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9hY3BpL29zaS5jIGIvZHJpdmVycy9hY3BpL29zaS5jCj4gaW5kZXggNTZjYzk1
YjZiNzI0Li5mNWQ1NTlhMmZmMTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9hY3BpL29zaS5jCj4g
KysrIGIvZHJpdmVycy9hY3BpL29zaS5jCj4gQEAgLTQ0LDE1ICs0NCw2IEBAIG9zaV9zZXR1cF9l
bnRyaWVzW09TSV9TVFJJTkdfRU5UUklFU19NQVhdIF9faW5pdGRhdGEgPSB7Cj4gICAgICAgICB7
IlByb2Nlc3NvciBEZXZpY2UiLCB0cnVlfSwKPiAgICAgICAgIHsiMy4wIF9TQ1AgRXh0ZW5zaW9u
cyIsIHRydWV9LAo+ICAgICAgICAgeyJQcm9jZXNzb3IgQWdncmVnYXRvciBEZXZpY2UiLCB0cnVl
fSwKPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBMaW51eC1EZWxsLVZpZGVvIGlzIHVzZWQgYnkg
QklPUyB0byBkaXNhYmxlIFJURDMgZm9yIE5WaWRpYSBncmFwaGljcwo+IC0gICAgICAgICogY2Fy
ZHMgYXMgUlREMyBpcyBub3Qgc3VwcG9ydGVkIGJ5IGRyaXZlcnMgbm93LiAgU3lzdGVtcyB3aXRo
IE5WaWRpYQo+IC0gICAgICAgICogY2FyZHMgd2lsbCBoYW5nIHdpdGhvdXQgUlREMyBkaXNhYmxl
ZC4KPiAtICAgICAgICAqCj4gLSAgICAgICAgKiBPbmNlIE5WaWRpYSBkcml2ZXJzIG9mZmljaWFs
bHkgc3VwcG9ydCBSVEQzLCB0aGlzIF9PU0kgc3RyaW5ncyBjYW4KPiAtICAgICAgICAqIGJlIHJl
bW92ZWQgaWYgYm90aCBuZXcgYW5kIG9sZCBncmFwaGljcyBjYXJkcyBhcmUgc3VwcG9ydGVkLgo+
IC0gICAgICAgICovCj4gLSAgICAgICB7IkxpbnV4LURlbGwtVmlkZW8iLCB0cnVlfSwKPiAgfTsK
Pgo+ICBzdGF0aWMgdTMyIGFjcGlfb3NpX2hhbmRsZXIoYWNwaV9zdHJpbmcgaW50ZXJmYWNlLCB1
MzIgc3VwcG9ydGVkKQo+IC0tCj4gMi4yMS4wCj4KCgotLQpDaGVlcnMsCkFsZXggSHVuZwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
