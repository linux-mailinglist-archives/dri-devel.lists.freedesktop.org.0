Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B46DF24605
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 04:33:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615D989260;
	Tue, 21 May 2019 02:33:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FC98925C;
 Tue, 21 May 2019 02:33:02 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id c66so1213328wme.0;
 Mon, 20 May 2019 19:33:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Kd6dZtuJ+zXIoXi0n4Wghz44M25gXh6ZLX+Zm5Oue7o=;
 b=aLBQf7CxxJrWmRWc+et+kmFclyYDcHQfpPga7AcOQJB4hGUBkqadopnNzFNFfi9TJ2
 n1MOdQayGNy7UaUS420apfOxdT5NmiPrd5kxON52lr9DNNkdMqL0SJr1trMXIAkyBlCF
 t8otyRcAtxHCW/01B7ij1wu9vFIQkprDCjk7AAnII89lL6G8kjzE3Cweb7tvoyIsVGwu
 dKxTgdnoV72Grlxpx1lKul3SFhXvx2QPrUNn7P+DTsVyrpxADReEnEiEfeuI+MTGDhR1
 7RPSPQW0lbeGzWAK8ibx0elIsDe2xBNUohOarWSgRGlYPvr932kFpl9FZICtTv2LLTEc
 ZILg==
X-Gm-Message-State: APjAAAVf2zX7eoHYJxU1rlzG95jjIKHC2zM+cFAUXY7YWqs5KqFryg3P
 FRnn1rdxAJaeGx2CJ85Z4qwR3silDVB2gQNQje8=
X-Google-Smtp-Source: APXvYqzU58B+S9LHz4pIUbyimpv6Pckn8KO/PCbUQXILGb6Ru4V304Tj4cXpG8ftONJXo9AShaQy9DZ/k6ldGQYvGIE=
X-Received: by 2002:a1c:f009:: with SMTP id a9mr1359554wmb.110.1558405981000; 
 Mon, 20 May 2019 19:33:01 -0700 (PDT)
MIME-Version: 1.0
References: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
 <SN6PR12MB2800A7AEC22121C8704CBB09870B0@SN6PR12MB2800.namprd12.prod.outlook.com>
 <20190520162807.GE21222@phenom.ffwll.local>
 <SN6PR12MB28007ED8F5C6838F2C25A9D587060@SN6PR12MB2800.namprd12.prod.outlook.com>
In-Reply-To: <SN6PR12MB28007ED8F5C6838F2C25A9D587060@SN6PR12MB2800.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 20 May 2019 22:32:49 -0400
Message-ID: <CADnq5_O=PAK3qZJ-kHUX9jQDkmEYOX+iOhOX7gNaaXp+tC7nUg@mail.gmail.com>
Subject: Re: [PATCH] gpu: drm: use struct_size() in kmalloc()
To: "Pan, Xinhui" <Xinhui.Pan@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Kd6dZtuJ+zXIoXi0n4Wghz44M25gXh6ZLX+Zm5Oue7o=;
 b=QkcRhCCxjWn7ooDTcuWtWeD4PwQRkjapE24t6b2y2+/FMNepC2urjqAcEfUEeaHLPg
 BkmnrJJK3srOj91fNZISPcEf1SeroEn26oxUJ/9jYp5OGFrD5QSg431lE5yZiXc3pGJi
 sbrGI1ooHvbIJXFFa0p0oSs6Xzs8wavTSCmp8gDqW3M519qmd2P9Fckvbf4Sr4Z/2DSF
 Ob/0wusSyie8A5rvkpy0RcH9SfXztzVdeJax9zlufiHZMS+kH4SjjUxhOtOn4s/5/8Hu
 /GQL7tuaXn9MtA6bh3UjSxa0CPw5UG3G/7OFL+jkZ7CEEtwyBNRMPLrs1tJFhGhLTaP3
 2LxQ==
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, xiaolinkui <xiaolinkui@kylinos.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgNzoxOSBQTSBQYW4sIFhpbmh1aSA8WGluaHVpLlBhbkBh
bWQuY29tPiB3cm90ZToKPgo+IERhbmllbCwgd2hhdCB5b3UgYXJlIHRhbGtpbmcgYWJvdXQgaXMg
dG90YWxseSB3cm9uZy4KPiAxKSBBRkFJSywgb25seSBvbmUgemVyby1zaXplIGFycmF5IGNhbiBi
ZSBpbiB0aGUgZW5kIG9mIGEgc3RydWN0Lgo+IDIpIHR3byBzdHJ1Y3Rfc2l6ZSB3aWxsIGFkZCB1
cCBzdHJ1Y3QgaXRzZWxmIHR3aWNlLiB0aGUgc3VtIGlzIHdyb25nIHRoZW4uCj4KPiBObyBvZmZl
bnNlLiBJIGNhbid0IGhlbHAgZmVlbGluZyBsdWNreSB0aGF0IHlvdSBhcmUgaW4gaW50ZWwuCgpY
aW5odWksCgpQbGVhc2Uga2VlcCB0aGluZ3MgY2l2aWwuICBUaGVyZSBpcyBubyBuZWVkIGZvciBj
b21tZW50cyBsaWtlIHRoaXMuCgpBbGV4Cgo+Cj4KPiDlj5Hku7bkuro6IERhbmllbCBWZXR0ZXIg
PGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+IOS7o+ihqCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+Cj4g5Y+R6YCB5pe26Ze0OiAyMDE55bm0NeaciDIx5pelIDA6MjgKPiDmlLbku7bkuro6
IFBhbiwgWGluaHVpCj4g5oqE6YCBOiBEZXVjaGVyLCBBbGV4YW5kZXI7IEtvZW5pZywgQ2hyaXN0
aWFuOyBaaG91LCBEYXZpZChDaHVuTWluZyk7IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZnds
bC5jaDsgUXVhbiwgRXZhbjsgeGlhb2xpbmt1aTsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcKPiDkuLvpopg6IFJlOiBbUEFUQ0hdIGdwdTogZHJtOiB1c2Ugc3RydWN0X3NpemUo
KSBpbiBrbWFsbG9jKCkKPgo+IFtDQVVUSU9OOiBFeHRlcm5hbCBFbWFpbF0KPgo+IE9uIEZyaSwg
TWF5IDE3LCAyMDE5IGF0IDA0OjQ0OjMwUE0gKzAwMDAsIFBhbiwgWGluaHVpIHdyb3RlOgo+ID4g
SSBhbSBnb2luZyB0byBwdXQgbW9yZSBtZW1iZXJzIHdoaWNoIGFyZSBhbHNvIGFycmF5IGFmdGVy
IHRoaXMgc3RydWN0LAo+ID4gbm90IG9ubHkgb2JqW10uICBMb29rcyBsaWtlIHRoaXMgc3RydWN0
X3NpemUgZGlkIG5vdCBoZWxwIG9uIG11bHRpcGxlCj4gPiBhcnJheSBjYXNlLiBUaGFua3MgYW55
d2F5LiAgX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPgo+IFlvdSBjYW4gdGhlbiBh
ZGQgdGhlbSB1cCwgZS5nLiBrbWFsbG9jKHN0cnVjdF9zaXplKCkrc3RydWN0X3NpemUoKSwKPiBH
RlBfS0VSTkVMKSwgc28gdGhpcyBwYXRjaCBoZXJlIHN0aWxsIGxvb2tzIGxpa2UgYSBnb29kIGlk
ZWEuCj4KPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5j
aD4KPgo+IENoZWVycywgRGFuaWVsCj4KPiA+IEZyb206IHhpYW9saW5rdWkgPHhpYW9saW5rdWlA
a3lsaW5vcy5jbj4KPiA+IFNlbnQ6IEZyaWRheSwgTWF5IDE3LCAyMDE5IDQ6NDY6MDAgUE0KPiA+
IFRvOiBEZXVjaGVyLCBBbGV4YW5kZXI7IEtvZW5pZywgQ2hyaXN0aWFuOyBaaG91LCBEYXZpZChD
aHVuTWluZyk7IGFpcmxpZWRAbGludXguaWU7IGRhbmllbEBmZndsbC5jaDsgUGFuLCBYaW5odWk7
IFF1YW4sIEV2YW4KPiA+IENjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsg
eGlhb2xpbmt1aUBreWxpbm9zLmNuCj4gPiBTdWJqZWN0OiBbUEFUQ0hdIGdwdTogZHJtOiB1c2Ug
c3RydWN0X3NpemUoKSBpbiBrbWFsbG9jKCkKPiA+Cj4gPiBbQ0FVVElPTjogRXh0ZXJuYWwgRW1h
aWxdCj4gPgo+ID4gVXNlIHN0cnVjdF9zaXplKCkgaGVscGVyIHRvIGtlZXAgY29kZSBzaW1wbGUu
Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogeGlhb2xpbmt1aSA8eGlhb2xpbmt1aUBreWxpbm9zLmNu
Pgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3Jhcy5jIHwg
MyArLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9y
YXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9yYXMuYwo+ID4gaW5kZXgg
MjJiZDIxZS4uNDcxN2E2NCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9yYXMuYwo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3Jhcy5jCj4gPiBAQCAtMTM3NSw4ICsxMzc1LDcgQEAgaW50IGFtZGdwdV9yYXNfaW5pdChz
dHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKPiA+ICAgICAgICAgaWYgKGNvbikKPiA+ICAgICAg
ICAgICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiAtICAgICAgIGNvbiA9IGttYWxsb2Moc2l6ZW9m
KHN0cnVjdCBhbWRncHVfcmFzKSArCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yo
c3RydWN0IHJhc19tYW5hZ2VyKSAqIEFNREdQVV9SQVNfQkxPQ0tfQ09VTlQsCj4gPiArICAgICAg
IGNvbiA9IGttYWxsb2Moc3RydWN0X3NpemUoY29uLCBvYmpzLCBBTURHUFVfUkFTX0JMT0NLX0NP
VU5UKSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIEdGUF9LRVJORUx8X19HRlBfWkVSTyk7
Cj4gPiAgICAgICAgIGlmICghY29uKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiAtRU5PTUVN
Owo+ID4gLS0KPiA+IDIuNy40Cj4gPgo+ID4KPiA+Cj4KPiAtLQo+IERhbmllbCBWZXR0ZXIKPiBT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8vYmxvZy5mZndsbC5j
aAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1k
LWdmeCBtYWlsaW5nIGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
