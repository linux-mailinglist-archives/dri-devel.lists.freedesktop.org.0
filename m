Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13A8474F3
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E6B8920F;
	Sun, 16 Jun 2019 14:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A997896C7;
 Fri, 14 Jun 2019 12:11:42 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id d17so2414730oth.5;
 Fri, 14 Jun 2019 05:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Wo132hdWCXIwgcpI+BIESFxrDjp3/snXhazBuY1tTH4=;
 b=pakWPuSlVvFhm2R7qJSVqO96/XAGG8uLtsI/s1izDz14ixkJE2SThKWHljHWDHG5vf
 RpNFrwvOVfx3CEgw1eDaBu9SMn467sGghlr5foaM0wH9BJgW6UjjfWhTxIlRdtq3v8fw
 /vaV1wZ5RfFe3GJ4wLaK20T5IqgJ31ePIFSnFPK6MHQmlFe0joElgvwQF8eLHxAPcrBg
 f8okKaeUTmmUoNRWp6QJan1uhus+1jE5/fzKMnIHxylVoODXNvHxMHKpIl6IOc3x/1T/
 ztb7FdFyBGGsuzSO2s+U8aeNi9o/7mmlc0gFtuCk7T+RoZIy2QG609dpXR1hrxrlA0+9
 YRWQ==
X-Gm-Message-State: APjAAAX7PH+8yTL/2FKYGz2zH7jfGVFplzBFU+xwMlxuB1r3Li+DowtP
 eXUtofjyGhk6z5Cy3m5bC6dGkHLKOT/wS+Idl1Q=
X-Google-Smtp-Source: APXvYqxAfLD66F7IClYkztopo8Tbd60ou3yrpfc0M8vDEfmErWhwSsEtxFcJg20RM+/aBedSdH0UTvhaCMxDy3Xea4c=
X-Received: by 2002:a05:6830:12c7:: with SMTP id
 a7mr1325643otq.284.1560514301184; 
 Fri, 14 Jun 2019 05:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190114202652.15204-1-malat@debian.org>
 <20190117204047.1262-1-malat@debian.org>
In-Reply-To: <20190117204047.1262-1-malat@debian.org>
From: Mathieu Malaterre <malat@debian.org>
Date: Fri, 14 Jun 2019 14:11:27 +0200
Message-ID: <CA+7wUswrBF6k0xv8tPzJbZHj0s0O+KfFBdToyX8UjHwDxQGMhw@mail.gmail.com>
Subject: Re: [PATCH v2] drm: radeon: add a missing break in
 evergreen_cs_handle_reg
To: Alex Deucher <alexander.deucher@amd.com>
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKYW4gMTcsIDIwMTkgYXQgOTo0MCBQTSBNYXRoaWV1IE1hbGF0ZXJyZSA8bWFsYXRA
ZGViaWFuLm9yZz4gd3JvdGU6Cj4KPiBJbiBjb21taXQgZGQyMjBhMDBlOGJkICgiZHJtL3JhZGVv
bi9rbXM6IGFkZCBzdXBwb3J0IGZvciBzdHJlYW1vdXQgdjciKQo+IGNhc2Ugc3RhdGVtZW50cyB3
ZXJlIGFkZGVkIHdpdGhvdXQgYSB0ZXJtaW5hdGluZyBicmVhayBzdGF0ZW1lbnQuIFRoaXMKPiBj
b21taXQgYWRkcyB0aGUgbWlzc2luZyBicmVhay4gVGhpcyB3YXMgZGlzY292ZXJlZCBkdXJpbmcg
YSBjb21waWxhdGlvbgo+IHdpdGggVz0xLgo+Cj4gVGhpcyBjb21taXQgcmVtb3ZlcyB0aGUgZm9s
bG93aW5nIHdhcm5pbmc6Cj4KPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2Nz
LmM6MTMwMToxMTogd2FybmluZzogdGhpcyBzdGF0ZW1lbnQgbWF5IGZhbGwgdGhyb3VnaCBbLVdp
bXBsaWNpdC1mYWxsdGhyb3VnaD1dCj4KPiBTdWdnZXN0ZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KPiBGaXhlczogZGQyMjBhMDBlOGJkICgiZHJtL3JhZGVv
bi9rbXM6IGFkZCBzdXBwb3J0IGZvciBzdHJlYW1vdXQgdjciKQo+IFNpZ25lZC1vZmYtYnk6IE1h
dGhpZXUgTWFsYXRlcnJlIDxtYWxhdEBkZWJpYW4ub3JnPgo+IC0tLQo+IHYyOiBBZGQgbWlzc2lu
ZyBicmVhayBzdGF0ZW1lbnQsIGluc3RlYWQgb2YgbWFya2luZyBpdCBhcyBmYWxsIHRocm91Z2gK
ClJlcGxhY2VkIGJ5OgoKY2M1MDM0YTVkMjkzIGRybS9yYWRlb24vZXZlcmdyZWVuX2NzOiBmaXgg
bWlzc2luZyBicmVhayBpbiBzd2l0Y2ggc3RhdGVtZW50Cgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL2V2ZXJncmVlbl9jcy5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2NzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL2V2ZXJncmVlbl9jcy5jCj4gaW5kZXggZjQ3MTUzN2M4
NTJmLi4xZTE0YzY5MjE0NTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9l
dmVyZ3JlZW5fY3MuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vZXZlcmdyZWVuX2Nz
LmMKPiBAQCAtMTI5OSw2ICsxMjk5LDcgQEAgc3RhdGljIGludCBldmVyZ3JlZW5fY3NfaGFuZGxl
X3JlZyhzdHJ1Y3QgcmFkZW9uX2NzX3BhcnNlciAqcCwgdTMyIHJlZywgdTMyIGlkeCkKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiAgICAgICAgICAgICAgICAgfQo+
ICAgICAgICAgICAgICAgICBpYltpZHhdICs9ICh1MzIpKChyZWxvYy0+Z3B1X29mZnNldCA+PiA4
KSAmIDB4ZmZmZmZmZmYpOwo+ICsgICAgICAgICAgICAgICBicmVhazsKPiAgICAgICAgIGNhc2Ug
Q0JfVEFSR0VUX01BU0s6Cj4gICAgICAgICAgICAgICAgIHRyYWNrLT5jYl90YXJnZXRfbWFzayA9
IHJhZGVvbl9nZXRfaWJfdmFsdWUocCwgaWR4KTsKPiAgICAgICAgICAgICAgICAgdHJhY2stPmNi
X2RpcnR5ID0gdHJ1ZTsKPiAtLQo+IDIuMTkuMgo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
