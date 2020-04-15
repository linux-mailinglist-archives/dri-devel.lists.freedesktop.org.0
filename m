Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2D81A9E68
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 13:57:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E1056E1B9;
	Wed, 15 Apr 2020 11:57:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37F36E1B9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 11:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586951817;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=enQTAmhT9AYwnga6mBO7ZxqTlHb44gCIUp/EN8RNu3I=;
 b=AUp5CN3aU25DMGA3VxlcFowj5XvZQcGO+NePmzDCFEIp2Swp/xG6Gft/Wo0TjmouCL1Dr0
 /+P4ZUqbe5GNU7zzSHeyy6DtHMrDPM5C1u00uXU93Y5gAisvtInw2OpdK8vzYjjbgYzLUR
 TIM58rEjfBXGxX8fXRPhDWeKJqsIsLc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-323-mATdWbbPMkCleMNFbiiA0w-1; Wed, 15 Apr 2020 07:56:54 -0400
X-MC-Unique: mATdWbbPMkCleMNFbiiA0w-1
Received: by mail-wm1-f69.google.com with SMTP id n127so4833603wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 04:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tpc5jgDPCOYbJVv+ktdgEXXe6wkyAzx6zD444mXkpDg=;
 b=Vax6xNFoHWDkvgemrIedAb31CoAFwFT+8eBFTE/F+wRoKUDOHEBj48XwC1iqiS0z/9
 BoC3Ml8fUVQv6gkD1rZwjrXZX2Fhb5eKUNogaBa0ildeHHR3T2piGNwHCCfumAD0E9UM
 6H4pV9RvFNoCaC8Nqf9CsKcU5z1OFgxKobJxIrJIl89tersWAjNWS8qiTiZ/WIaCEdum
 nYbDm0+crehHZqjH+0RQaoUQIvzlZhNHxtKyFPuXTIgfTJ6TJaWvOn+p1fNFJsLVqFht
 LBrpEVLlODKi+CiQKDR9lkgEv+OYmeEtOjqPn9vTwYeddR0PCQzQfwQWe3HlyRj1xMDK
 mS4g==
X-Gm-Message-State: AGi0PuYKz90OXrgM92CAco9qLpFVEHkffj9b5OMv7mZ9fVa3iTM3EyLs
 Kn3RtlUChdTC/Ule7aDlUMc2vujShFJIweYyJmH86WESU7TOH6rF3OCwVHehP6jtUNwIKyHAPPb
 oBx25tJGChNP2jmSc+4LrTTGOFcs7
X-Received: by 2002:a1c:8049:: with SMTP id b70mr4925557wmd.162.1586951812865; 
 Wed, 15 Apr 2020 04:56:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypKeFdDvup84d5O9/s3ktykzB+oNVmBRcDc+gyPmAxrAk/wJLK3DsC4CR3V8W9bQKtRCDav78g==
X-Received: by 2002:a1c:8049:: with SMTP id b70mr4925529wmd.162.1586951812626; 
 Wed, 15 Apr 2020 04:56:52 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id 91sm9117719wra.37.2020.04.15.04.56.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Apr 2020 04:56:52 -0700 (PDT)
Subject: Re: RFC: Drm-connector properties managed by another driver / privacy
 screen support
From: Hans de Goede <hdegoede@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>
References: <783240e9-e8d1-fc28-6c11-14c8f8e35cfa@redhat.com>
 <CAKMK7uFzA-2GEvAftNEysHZvPovxfXC2eC8y5VSa8RAUjMWoYg@mail.gmail.com>
 <a2516eed-d7a7-c0a4-d287-5927aadf1d18@redhat.com>
 <CAKMK7uESUVHLwMDujCDvapOBZ+Lnp1k-5juxQxcsNj+1QuN0Ww@mail.gmail.com>
 <a053e2a7-77c8-8874-eaf8-afe970ad8f9c@redhat.com>
Message-ID: <e91b5d9b-6f7a-92f4-7a9b-babf4209eed2@redhat.com>
Date: Wed, 15 Apr 2020 13:56:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a053e2a7-77c8-8874-eaf8-afe970ad8f9c@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Benjamin Berg <bberg@redhat.com>, David Airlie <airlied@linux.ie>,
 Christian Kellner <ckellner@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Nitin Joshi1 <njoshi1@lenovo.com>,
 Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiA0LzE1LzIwIDE6MzkgUE0sIEhhbnMgZGUgR29lZGUgd3JvdGU6Cgo8c25pcD4KPj4+
IC8qIEFkZCBjb21tZW50IGV4cGxhaW5pbmcgd2h5IHdlIG5lZWQgdGhpcyBtZXNzeSBzdHVmZiBo
ZXJlICovCj4+PiBjb25zdCBjaGFyICogY29uc3Qgc2hhZG93X3Byb3ZpZGVyc1tdID0gewo+Pj4g
I2lmZGVmIENPTkZJR19USElOS1BBRF9BQ1BJX01PRFVMRQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCAi
dGhpbmtwYWRfYWNwaSIsCj4+PiAjZW5kaWYKPj4+ICNpZmRlZiBDT05GSUdfT1RIRVJfTU9EVUxF
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgICJvdGhlciIsCj4+PiAjZW5kaWYKPj4+IMKgwqDCoMKgwqDC
oMKgwqAgTlVMTAo+Pj4gfTsKPj4+Cj4+PiBpbnQgbW9kdWxlX2luaXQodm9pZCkKPj4+IHsKPj4+
IMKgwqDCoMKgwqDCoMKgwqAgLyogZG8gYWN0dWFsIHNldHVwIG9mIHRoZSA/Y2xhc3M/ICovCj4+
Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBzaGFkb3dfcHJvdmlkZXJzW2ldOyBp
KyspCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXF1ZXN0X21vZHVsZShz
aGFkb3dfcHJvdmlkZXJzW2ldKTsKPj4+Cj4+PiDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+
Pj4gfQo+Pgo+PiBIbSBJIHRoaW5rIGV4cGxpY2l0bHkgbG9hZGluZyBkcml2ZXJzIGZlZWxzIHZl
cnkgbXVjaCBub3QgZGV2aWNlIG1vZGVsCj4+IGxpa2UuIERvbid0IHRoZXNlIGRyaXZlcnMgYXV0
by1sb2FkLCBtYXRjaGluZyBvbiBhY3BpIGZ1bmN0aW9ucz8KPiAKPiB0aGlua3BhZF9hY3BpIGRv
ZXMgYXV0b2xvYWQgYmFzZWQgb24gYSBudW1iZXIgb2YgQUNQSSBkZXZpY2UtaWRzLAo+IHRoZSBp
ZGVhIGJlaGluZCB0aGUgYWJvdmUgcmVxdWVzdF9tb2R1bGUgaXMgdG8gYXZvaWQgdGhlIG5lZWQK
PiB0byBoYXZlIHRoZSBhY3BpLW1hdGNoIGZ1bmN0aW9uIHlvdSBtZW50aW9uZWQgYWJvdmUuCj4g
Cj4gQmFzaWNhbGx5IHdoYXQgd291bGQgaGFwcGVuIGlzIGUuZy4gOgo+IAo+IDEuIGk5MTUgbG9h
ZHMsIGNhbGxzIGxjZHNoYWRvd19nZXQoZGV2LCAiZURQLTEiKTsKPiAyLiBpZiB0aGlzIGlzIHRo
ZSBmaXJzdCBsY2RzaGFkb3dfZ2V0KCkgY2FsbCB0aGVuCj4gIMKgwqAgdGhlIGxjZHNoYWRvdyBj
b3JlIHdpbGwgZG8gdGhlIHJlcXVlc3RfbW9kdWxlIGNhbGxzLAo+ICDCoMKgIGFsbG93aW5nIGFu
eSBvZiB0aGVzZSBtb2R1bGVzIHRvIGdldCBsb2FkZWQgKyBwcm9iZWQgYW5kCj4gIMKgwqAgY2Fs
bCBlLmcuIGxjZHNoYWRvd19yZWdpc3RlcigmbXlsY2RzaGFkb3dkZXYsIDxnZngtYWRhcHRlci1k
ZXYtbmFtZT4sICJlRFAtMSIpOwo+IDMuIEFmdGVyIHRoZSByZXF1ZXN0IG1vZHVsZXMgdGhlIGxj
ZHNoYWRvd19nZXQoKSB3aWxsIHdhbGsgb3Zlcgo+ICDCoMKgIHRoZSBsaXN0IG9mIHJlZ2lzdGVy
ZWQgZGV2aWNlcywgaW5jbHVkaW5nIHRoZSBvbmVzIGp1c3QgcmVnaXN0ZXJlZAo+ICDCoMKgIGJ5
IHRoZSByZXF1ZXN0X21vZHVsZSBjYWxscyBhbmQgdGhlbiBob3BlZnVsbHkgZmluZCBhIG1hdGNo
Cj4gCj4gU28gYnkgZG9pbmcgdGhlIHJlcXVlc3QtbW9kdWxlIGNhbGxzIGJlZm9yZSBjaGVja2lu
ZyBmb3IKPiBhIG1hdGNoaW5nIGxjZHNoYWRvdyBkZXYsIHdlIGF2b2lkIHRoZSBuZWVkIG9mIGhh
dmluZyBzb21lIG9mCj4gdGhlIGtub3dsZWRnZSBjdXJyZW50bHkgYWJzdHJhY3RlZCBhd2F5IGlu
IHRoZSB0aGlua3BhZF9hY3BpIGRyaXZlcgo+IGR1cGxpY2F0ZWQgaW5zaWRlIHRoZSBkcm0gY29k
ZSBzb21ld2hlcmUuCj4gCj4+IEkgZ3Vlc3MgaWYgdGhhdCBkb2Vzbid0IGV4aXN0LCB0aGVuIHdl
J2QgbmVlZCB0byBmaXggdGhhdCBvbmUgZmlyc3QgOi0vCj4+IEluIGdlbmVyYWwgbm8gcmVxdWVz
dF9tb2R1bGUgcGxlYXNlLCB0aGF0IHNob3VsZG4ndCBiZSBuZWVkZWQgZWl0aGVyLgo+Pgo+PiBU
aGUgdHJvdWJsZSB3aXRoIHJlcXVlc3RfbW9kdWxlIGlzIGFsc28gdGhhdCAoYWZhaXVpKSBpdCBk
b2Vzbid0Cj4+IHJlYWxseSB3b3JrIHdlbGwgd2l0aCBwYXJhbGxlbCBtb2R1bGUgbG9hZCBhbmQg
YWxsIHRoYXQsIGZvcgo+PiBFUFJPQkVfREVGRVIgdG8gd29yayB3ZSBkbyBuZWVkIHRvIGJlIGFi
bGUgdG8gYW5zd2VyICJzaG91bGQgd2UgaGF2ZSBhCj4+IGRyaXZlcj8iIGluZGVwZW5kZW50bHkg
b2Ygd2hldGhlciB0aGF0IGRyaXZlciBoYXMgbG9hZGVkIGFscmVhZHkgb3IKPj4gbm90Lgo+IAo+
IFRoZSBpZGVhIGhlcmUgaXMgdG8gYXZvaWQgdXNpbmcgRVBST0JFX0RFRkVSIChvbiB4ODYgYXQg
bGVhc3QpCj4gYW5kIGVpdGhlciBkaXJlY3RseSByZXR1cm4gdGhlIGxjZHNoYWRvd19kZXYgb3Ig
RU5PRU5ULiBBbHNvCj4gc2VlIGJlbG93LgoKPHNuaXA+Cgo+IEFzc3VtaW5nIHdlIGFyZSBnb2lu
ZyB0byBhZGQgc29tZSBkZXZpY2UvbW9kZWwgc3BlY2lmaWMKPiBsY2RzaGFkb3cga25vd2xlZGdl
IGluc2lkZSB0aGUgbGNkc2hhZG93IGNvcmUgYXMgeW91Cj4gc3VnZ2VzdGVkIHdpdGggeW91ciAi
c21hbGwgYWNwaSBtYXRjaCBmdW5jdGlvbiIgYWJvdmUsCj4gd2UgY291bGQgZG8gc29tZXRoaW5n
IHNpbWlsYXIgdG8gd2hhdCB0aGUgdmdhX3N3aXRjaGVyb28KPiBjb2RlIGlzIGRvaW5nIGZvciB0
aGlzIGFuZCBoYXZlIGEgbGNkc2hhZG93X2RlZmVyX3Byb2JlKCkKPiBoZWxwZXIgYW5kIGNhbGwg
dGhhdCByZWFsbHkgZWFybHkgaW4gaTkxNV9wY2lfcHJvYmUoKSwKPiB3aGljaCBjdXJyZW50bHkg
YWxyZWFkeSBoYXMgdGhpcyBmb3IgdGhlIHZnYXN3aXRjaGVyb28gY2FzZToKPiAKPiAgwqDCoMKg
wqDCoMKgwqAgaWYgKHZnYV9zd2l0Y2hlcm9vX2NsaWVudF9wcm9iZV9kZWZlcihwZGV2KSkKPiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRVBST0JFX0RFRkVSOwoKU28g
dGhpbmtpbmcgbW9yZSBhYm91dCB0aGlzIGFuZCBnaXZlbiB0aGUgdG90YWwgbGFjayBvZgpFUFJP
QkVfREVGRVIgaGFuZGxpbmcgaW4gdGhlIDMgbWFqb3IgWDg2IEdQVS9rbXMgZHJpdmVycwpJIHRo
aW5rIHRoYXQgYWRkaW5nIGEgbGNkc2hhZG93X2RlZmVyX3Byb2JlKCkgaGVscGVyIGlzCnRoZSB3
YXkgdG8gZ28uIFRoaXMgd2lsbCBhbHNvIGF2b2lkIHRoZSBuZWVkIGZvciBkdXBsaWNhdGluZwp0
aGUgbGNkc2hhZG93IGRldGVjdCBmdW5jdGlvbmFsaXR5IGluIHRoZSBzbWFsbCBBQ1BJLW1hdGNo
CmZ1bmN0aW9ucyB5b3UgbWVudGlvbmVkIChhbHRob3VnaCB0aGF0IG1pZ2h0IHN0aWxsIGJlCmlu
dGVyZXN0aW5nIHRvIHNwZWVkdXAgdGhlIGJvb3QpLgoKV2hlbiBldmVyeXRoaW5nIGlzIGJ1aWx0
aW4gdGhlbiBlYWNoIGVuYWJsZWQgIm1vZHVsZSItcwptb2R1bGVfaW5pdCBmdW5jdGlvbiB3aWxs
IGdldCBjYWxsZWQsIHdlIGNhbiBjYWxsIGEKbGNkc2hhZG93X3Byb2JlX2RvbmUoIm1vZHVsZS1u
YW1lIikgZnVuY3Rpb24gZnJvbSB0aG9zZQphbmQgdGhlIGxjZHNoYWRvdyBjb3JlIGNhbiB0aGVu
IHRyYWNrIGlmIGFsbCBwb3RlbnRpYWwKbGNkaGFkb3cgcHJvdmlkZXJzIGhhdmUgaW5pdGlhbGl6
ZWQgYmVmb3JlIGl0IHN0b3BzCnJldHVybmluZyBub24gMCBmcm9tIGxjZHNoYWRvd19kZWZlcl9w
cm9iZSgpLgoKT3IgaWYgd2Ugc3RpbGwgZG8gdGhlIHNtYWxsIG1hdGNoIGZ1bmN0aW9ucyBpdCBj
b3VsZApiZSBldmVuIHNtYXJ0ZXIgd2l0aCB0aGlzLi4uCgpBbmQgZm9yIHRoZSBtb2R1bGFyIGNh
c2UgaXQgY2FuIGNhbGwgcmVxdWVzdF9tb2R1bGUgb24KYWxsIChlbmFibGVkIGFzIG1vZHVsZSkg
cG90ZW50aWFsIGxjZGhhZG93IHByb3ZpZGVycwoob3IgYWdhaW4gd2UgY291bGQgcmVseSBvbiB0
aGUgc21hbGwgbWF0Y2ggZnVuY3Rpb24KaW5zdGVhZCkuCgpUaGVuIChvbiB4ODYgYXQgbGVhc3Qp
IHdlIGNhbiBoYXZlIGxjZHNoYWRvd19nZXQgbmV2ZXIKcmV0dXJuIC1FUFJPQkVfREVGRVIgYW5k
IGF2b2lkIHRoZSBuZWVkIHRvIHNvbHZlIHRoZQpsYWNrIG9mIEVQUk9CRV9ERUZFUiBzdXBwb3J0
IGluIHRoZSAzIG1ham9yIHg4NiBkcml2ZXJzLgoKQW5kIHRoaXMgaXMgYWxsIGtlcm5lbCBpbnRl
cm5hbCwgc28gaWYgdGhhdCBsYWNrIG9mCkVQUk9CRV9ERUZFUiBzdXBwb3J0IGV2ZXIgZ2V0cyBm
aXhlZCB0aGVuIHdlIGNhbiBkcm9wCnRoZSBsY2RzaGFkb3dfZGVmZXJfcHJvYmUoKSBoYWNrIGFu
ZCBtYWtlCmxjZHNoYWRvd19nZXQgYWxzbyByZXR1cm4gLUVQUk9CRV9ERUZFUiBvbiB4ODYgaW4K
c29tZSBjYXNlcy4KClJlZ2FyZHMsCgpIYW5zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
