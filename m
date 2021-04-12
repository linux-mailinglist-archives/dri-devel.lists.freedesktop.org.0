Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B9335C1A5
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C5A6E3EF;
	Mon, 12 Apr 2021 09:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06B306E083
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618220138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VSBwqzTaxJCu+qu4cycnbtHOYaiDZgjTNv/wFXF12a8=;
 b=XyctG9O8JYd8eBSf4d+h1ZSmWA9MHFVe/nM0z31O/EaxHiErXewIqfYnpcPct5Cv/qRX2E
 0K0V1u95UrIaAjtrRj2CRDAUQpIVnK/pTs7d+Qkg2mlOH0msyPtc8mgmjSxNx1CxqQx2AA
 wGoQM0oB1BkNu+iHXx3qHzvpcU2LsQQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-510-r0kj3sBWM9OPFlXsesWLmA-1; Mon, 12 Apr 2021 05:35:33 -0400
X-MC-Unique: r0kj3sBWM9OPFlXsesWLmA-1
Received: by mail-ej1-f72.google.com with SMTP id jt26so3647142ejc.18
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 02:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VSBwqzTaxJCu+qu4cycnbtHOYaiDZgjTNv/wFXF12a8=;
 b=pmjwQsGaolfJrX/DvP15ZAa+hY1knHlTIAhODfAAjvzdGsUH3jZ3F2nD/Tgt+/7+4A
 ATa/wnf/TUsoDi/aNvPFaS5PWto573+Ld7l1O9eql7BAX1TLBR8aYmWAPPzwnd8iFxz5
 vtjzEpL6UFL9qVjmnvf9L5P6Tguvsh490Jqfo6ZA+4EA/G0XspR1AJ3HqZIq3UjY7Cfi
 6IxY5tZbEF8cE0dL5VV00iygbZ4dy0Uk7zAM0aTDq4rTouej2EXl/xSPM0szzn1HRwmr
 xO++b9KO6Ns5WQUwaq9cycY/kc5sXnCu2UpOy6IoVt36/vg4Pzj/PgOt9e/WU0aqLFA/
 6yqA==
X-Gm-Message-State: AOAM531AFsXd/GBeTawHG9D4p2oHarwHCKxRllDIdzP9FjD0/bkQYRh3
 ZhRD10qIVD4kHiAhsbyPbTWN6k16iFF6uITXBG02RqKn+MhfcAzmXln1H3KiiU0d2SLTlF/0JZp
 h7MW+bLi+CfLpwT/KZomYoTCgdqhGZ96u6wVM5PK6bylnHk9X5M96aq1DNkBQa7ttx8lR2QGIU6
 OX8296
X-Received: by 2002:a05:6402:354b:: with SMTP id
 f11mr28211159edd.361.1618220132393; 
 Mon, 12 Apr 2021 02:35:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwn7qRZYXPxfgzhGVwF7935JRoKyMzn/cqk0Z6EgucAMsJP05c03hygtrohbzmmuJN321h5zw==
X-Received: by 2002:a05:6402:354b:: with SMTP id
 f11mr28211132edd.361.1618220132109; 
 Mon, 12 Apr 2021 02:35:32 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id l1sm6116331edt.59.2021.04.12.02.35.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 02:35:31 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/i915/display/vlv_dsi: Do not skip
 panel_pwr_cycle_delay when disabling the panel
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20210325114823.44922-1-hdegoede@redhat.com>
 <9cb6711d-d183-79d4-dfc1-d932b8c8fcab@redhat.com>
 <YG2mzs+/wZ5cH+7M@intel.com>
 <5f54a568-c81a-a54c-cbaf-2c111269c046@redhat.com>
 <YG26UEx8XI5vX3P0@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <709ffd0a-6336-83d8-5adf-6ce51825a424@redhat.com>
Date: Mon, 12 Apr 2021 11:35:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YG26UEx8XI5vX3P0@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA0LzcvMjEgMzo1NyBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+IE9uIFdlZCwg
QXByIDA3LCAyMDIxIGF0IDAzOjUwOjM1UE0gKzAyMDAsIEhhbnMgZGUgR29lZGUgd3JvdGU6Cj4+
IEhpLAo+Pgo+PiBPbiA0LzcvMjEgMjozNCBQTSwgVmlsbGUgU3lyasOkbMOkIHdyb3RlOgo+Pj4g
T24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMDM6NTc6MzJQTSArMDIwMCwgSGFucyBkZSBHb2VkZSB3
cm90ZToKPj4+PiBIaSwKPj4+Pgo+Pj4+IE9uIDMvMjUvMjEgMTI6NDggUE0sIEhhbnMgZGUgR29l
ZGUgd3JvdGU6Cj4+Pj4+IEFmdGVyIHRoZSByZWNlbnRseSBhZGRlZCBjb21taXQgZmUwZjFlM2Jm
ZGZlICgiZHJtL2k5MTU6IFNodXQgZG93bgo+Pj4+PiBkaXNwbGF5cyBncmFjZWZ1bGx5IG9uIHJl
Ym9vdCIpLCB0aGUgRFNJIHBhbmVsIG9uIGEgQ2hlcnJ5IFRyYWlsIGJhc2VkCj4+Pj4+IFByZWRp
YSBCYXNpYyB0YWJsZXQgd291bGQgbm8gbG9uZ2VyIHByb3Blcmx5IGxpZ2h0IHVwIGFmdGVyIHJl
Ym9vdC4KPj4+Pj4KPj4+Pj4gSSd2ZSBtYW5hZ2VkIHRvIHJlcHJvZHVjZSB0aGlzIHdpdGhvdXQg
cmVib290aW5nIGJ5IGRvaW5nOgo+Pj4+PiBjaHZ0IDM7IGVjaG8gMSA+IC9zeXMvY2xhc3MvZ3Jh
cGhpY3MvZmIwL2JsYW5rO1wKPj4+Pj4gZWNobyAwID4gL3N5cy9jbGFzcy9ncmFwaGljcy9mYjAv
YmxhbmsKPj4+Pj4KPj4+Pj4gV2hpY2ggcmFwaWRseSB0dXJucyB0aGUgcGFuZWwgb2ZmIGFuZCBi
YWNrIG9uIGFnYWluLgo+Pj4+Pgo+Pj4+PiBUaGUgdmx2X2RzaS5jIGNvZGUgdXNlcyBhbiBpbnRl
bF9kc2lfbXNsZWVwKCkgaGVscGVyIGZvciB0aGUgdmFyaW91cyBkZWxheXMKPj4+Pj4gdXNlZCBm
b3IgcGFuZWwgb24vb2ZmLCBzaW5jZSBzdGFydGluZyB3aXRoIE1JUEktc2VxdWVuY2VzIHZlcnNp
b24gPj0gMyB0aGUKPj4+Pj4gZGVsYXlzIGFyZSBhbHJlYWR5IGluY2x1ZGVkIGluc2lkZSB0aGUg
TUlQSS1zZXF1ZW5jZXMuCj4+Pj4+Cj4+Pj4+IFRoZSBwcm9ibGVtcyBleHBvc2VkIGJ5IHRoZSAi
U2h1dCBkb3duIGRpc3BsYXlzIGdyYWNlZnVsbHkgb24gcmVib290Igo+Pj4+PiBjaGFuZ2UsIHNo
b3cgdGhhdCB1c2luZyB0aGlzIGhlbHBlciBmb3IgdGhlIHBhbmVsX3B3cl9jeWNsZV9kZWxheSBp
cwo+Pj4+PiBub3QgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvLiBUaGlzIGhhcyBub3QgYmVlbiBub3Rp
Y2VkIHVudGlsIG5vdyBiZWNhdXNlCj4+Pj4+IG5vcm1hbGx5IHRoZSBwYW5lbCBuZXZlciBpcyBj
eWNsZWQgb2ZmIGFuZCBkaXJlY3RseSBvbiBhZ2FpbiBpbiBxdWljawo+Pj4+PiBzdWNjZXNzaW9u
Lgo+Pj4+Pgo+Pj4+PiBDaGFuZ2UgdGhlIG1zbGVlcCBmb3IgdGhlIHBhbmVsX3B3cl9jeWNsZV9k
ZWxheSB0byBhIG5vcm1hbCBtc2xlZXAoKQo+Pj4+PiBjYWxsIHRvIGF2b2lkIHRoZSBwYW5lbCBz
dGF5aW5nIGJsYWNrIGFmdGVyIGEgcXVpY2sgb2ZmICsgb24gY3ljbGUuCj4+Pj4+Cj4+Pj4+IENj
OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Pj4+PiBG
aXhlczogZmUwZjFlM2JmZGZlICgiZHJtL2k5MTU6IFNodXQgZG93biBkaXNwbGF5cyBncmFjZWZ1
bGx5IG9uIHJlYm9vdCIpCj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+Cj4+Pj4KPj4+PiBQaW5nPyBWaWxsZSBBRkFJQ1QgdGhpcyBpcyByZWFk
eSBmb3IgbWVyZ2luZywgY2FuIHlvdSByZXZpZXcgdGhpcyBwbGVhc2Ugc28gdGhhdCBJIGNhbiBw
dXNoIGl0IHRvIGRybS1pbnRlbC1uZXh0ID8KPj4+Cj4+PiBEaWRuJ3QgZ2V0IHRoZSBvcmlnaW5h
bCBtYWlsLCBidXQgbGd0bS4KPj4KPj4gWWVhaCwgdGhlc2UgYm91bmNlZCBJIG1lbnRpb25lZCB0
aGF0IGluIGEgcC5zLiBpbiBvbmUgb2YgdGhlIGVtYWlscwo+PiBpbiBvdXIgcHJpdmF0ZSB0aHJl
YWRzIGFib3V0IHRoZSBtYWlsIGlzc3Vlcywgd2l0aCBwYXRjaHdvcmsgbGlua3MsCj4+IGJ1dCBJ
IGd1ZXNzIHRoZSBwLnMuIHdhcyBoaWRkZW4gaW4gYWxsIHRoZSBvdGhlciBzdHVmZiBpbiB0aGF0
IHRocmVhZC4KPj4gQW55d2F5cyB0aGlzIGlzIHNvbHZlZCBub3cuCj4+Cj4+PiBSZXZpZXdlZC1i
eTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPj4KPj4g
VGhhbmsgeW91LCBub3RlIHRoaXMgaXMgcGF0Y2ggMS8yIGRvZXMgdGhlIFJldmlld2VkLWJ5IGFw
cGx5IHRvCj4+IGJvdGg/ICBQYXRjaCAyLzIgaXMgaGVyZToKPj4KPj4gaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzQyNTk4My8KPiAKPiBUaGF0IG9uZSBsb29rcyBnb29k
IGFzIHdlbGwuCj4gCj4gUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFs
YUBsaW51eC5pbnRlbC5jb20+CgpUaGFuayB5b3UuCgpJJ3ZlIHB1c2hlZCBib3RoIHRvIGRybS1p
bnRlbC1uZXh0IG5vdy4KClJlZ2FyZHMsCgpIYW5zCgoKCj4+Pj4+IC0tLQo+Pj4+PiAgZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS92bHZfZHNpLmMgfCA0ICsrLS0KPj4+Pj4gIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3Zsdl9kc2kuYyBiL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2Rpc3BsYXkvdmx2X2RzaS5jCj4+Pj4+IGluZGV4IGQ1YTNmNjljNWRmMy4u
MzhkNWExZjNkZWQ1IDEwMDY0NAo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L3Zsdl9kc2kuYwo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3Zs
dl9kc2kuYwo+Pj4+PiBAQCAtOTk2LDE0ICs5OTYsMTQgQEAgc3RhdGljIHZvaWQgaW50ZWxfZHNp
X3Bvc3RfZGlzYWJsZShzdHJ1Y3QgaW50ZWxfYXRvbWljX3N0YXRlICpzdGF0ZSwKPj4+Pj4gIAkg
KiBGSVhNRSBBcyB3ZSBkbyB3aXRoIGVEUCwganVzdCBtYWtlIGEgbm90ZSBvZiB0aGUgdGltZSBo
ZXJlCj4+Pj4+ICAJICogYW5kIHBlcmZvcm0gdGhlIHdhaXQgYmVmb3JlIHRoZSBuZXh0IHBhbmVs
IHBvd2VyIG9uLgo+Pj4+PiAgCSAqLwo+Pj4+PiAtCWludGVsX2RzaV9tc2xlZXAoaW50ZWxfZHNp
LCBpbnRlbF9kc2ktPnBhbmVsX3B3cl9jeWNsZV9kZWxheSk7Cj4+Pj4+ICsJbXNsZWVwKGludGVs
X2RzaS0+cGFuZWxfcHdyX2N5Y2xlX2RlbGF5KTsKPj4+Pj4gIH0KPj4+Pj4gIAo+Pj4+PiAgc3Rh
dGljIHZvaWQgaW50ZWxfZHNpX3NodXRkb3duKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVy
KQo+Pj4+PiAgewo+Pj4+PiAgCXN0cnVjdCBpbnRlbF9kc2kgKmludGVsX2RzaSA9IGVuY190b19p
bnRlbF9kc2koZW5jb2Rlcik7Cj4+Pj4+ICAKPj4+Pj4gLQlpbnRlbF9kc2lfbXNsZWVwKGludGVs
X2RzaSwgaW50ZWxfZHNpLT5wYW5lbF9wd3JfY3ljbGVfZGVsYXkpOwo+Pj4+PiArCW1zbGVlcChp
bnRlbF9kc2ktPnBhbmVsX3B3cl9jeWNsZV9kZWxheSk7Cj4+Pj4+ICB9Cj4+Pj4+ICAKPj4+Pj4g
IHN0YXRpYyBib29sIGludGVsX2RzaV9nZXRfaHdfc3RhdGUoc3RydWN0IGludGVsX2VuY29kZXIg
KmVuY29kZXIsCj4+Pj4+Cj4+Pgo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
