Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7814D03C7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 01:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F2F6E8A6;
	Tue,  8 Oct 2019 23:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC3F46E8A6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 23:05:54 +0000 (UTC)
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-mFedWFhEM4qT2eVfsqeRpA-1; Tue, 08 Oct 2019 19:05:49 -0400
Received: by mail-qk1-f198.google.com with SMTP id 11so201425qkh.15
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 16:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=Fq6yDTKTHco4hTZC6OqmE7hIJdr6B4kCmfzy662kYNY=;
 b=E/8qI5fxUNm9Zto3YUFz8U3bZQe92sIuvMdj+Xg+zl+PUyG3csbhj+rvzJro3YYwCz
 dgvMfeHOoK2kbla0EwEybb+7i2ZMJVloW2HmBhBW30Ly9Qd5X0EGPlMI8+2pNnI5afu0
 fP47pKX1fijXYjnyMa7IkvtRHBhU4vyVbfX1vHVB46UXw3lWmr8Ry7pFboGCLG+PTIEU
 N2Hp9w5FtoLO9+8+Uigejzi5zj0FO7karAKOCYXBrqQMP8BjYl2zSir76UU3qeSgUZx+
 XHmoeEg/eqFEw37jl/b2SLyLJ/AG/JXp+dDHsuJv8Pp6jHlTSaxJoE17W40FGPFGCEEZ
 /acw==
X-Gm-Message-State: APjAAAV97r9bEOkqFmk7ZN29WjcX4CUJ5VP9xL1SKAxFXA28+MnI3qlX
 poqNl6goLeVJO3ru0iTuc9MkMK+1s/aKbtiR+KCTMCrmqaGbq0VXm/kaYJuPjrPfJTmU8aflRpF
 sKGmLM4PpwuHJzhTXbtUIoSBZ1dOB
X-Received: by 2002:ac8:3917:: with SMTP id s23mr432281qtb.23.1570575949155;
 Tue, 08 Oct 2019 16:05:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzkUzmsys3OiEAI6na0qzAcQAU1NjNe+FUk8gLf3sl5fQI9rPmOnsPSH2FHjCW0JKKy9l3i1Q==
X-Received: by 2002:ac8:3917:: with SMTP id s23mr432246qtb.23.1570575948682;
 Tue, 08 Oct 2019 16:05:48 -0700 (PDT)
Received: from dhcp-10-20-1-34.bss.redhat.com ([144.121.20.162])
 by smtp.gmail.com with ESMTPSA id t17sm317910qtt.57.2019.10.08.16.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 16:05:47 -0700 (PDT)
Message-ID: <c3482f12164137bc0cfc2cffa52db70b2a27a30c.camel@redhat.com>
Subject: Re: [PATCH v2 00/21] drm/dp: Various helper improvements and cleanups
From: Lyude Paul <lyude@redhat.com>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Date: Tue, 08 Oct 2019 19:05:46 -0400
In-Reply-To: <20190920160004.GE10973@ulmo>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
 <20190920160004.GE10973@ulmo>
Organization: Red Hat
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30)
MIME-Version: 1.0
X-MC-Unique: mFedWFhEM4qT2eVfsqeRpA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1570575953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q6pdUz7NAVLxfNLuycqS+bN+dNEfnm7r091c8QBtkxk=;
 b=SqLAOSV/xxALbiRopC0qbyM3OmzCPRVNh0yLc54NN4N2UlfH1S11+YiR5P0n3/CqwvASGh
 Z3cJ0LhT3Nb0ZJudYS2QYFpc60rDs7ywOqW49XAQ+L9G4yMOv/JfBluHzx8yElAEYETI8f
 /o9hMXpHb9l5rd3LWwc++JkC9funoq0=
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkhIGEgY291cGxlIHBlb3BsZSBwb2tlZCBtZSB0byB0YWtlIGEgbG9vayBhdCB0aGlzLCBob3Bl
ZnVsbHkgSSBjYW4gcHJvdmlkZQpzb21lIGhlbHBmdWwgaW5zaWdodCBoZXJlLgoKU286IEkndmUg
dHJpZWQgYSBfbG90XyBvZiB2YXJpb3VzIHJlZGVzaWducyB3aXRoIE1TVCBhbmQgc29tZSBwb3J0
aW9ucyBvZiB0aGUKRFAgaGVscGVycy4gSSBhY3R1YWxseSB3YXMgZ29pbmcgdG8gdHJ5IHRvIHdy
aXRlIHVwIHNvbWUgY29tbW9uIGhlbHBlcnMgZm9yCmhhbmRsaW5nIGxpbmsgdHJhaW5pbmcgYWNy
b3NzIGRyaXZlcnMsIGJ1dCB3aGVuIEkgc3RhcnRlZCB0cnlpbmcgdG8gaW1wbGVtZW50CnRoZW0g
KGlyb25pY2FsbHksIEkgdGhpbmsgaXQgd2FzIGluIGk5MTUhKSBJIHJlYWxpemVkIEkgd2Fzbid0
IGdldHRpbmcgcmlkIG9mCm5lYXJseSBhcyBtdWNoIGNvZGUgYXMgSSB0aG91Z2h0IEkgd2FzIGdv
aW5nIHRvLgoKTm93LUknZCBsb3ZlIHRvIHRlbGwgeW91IGlmIHRoaXMgc2VyaWVzIGlzIGdvb2Qg
b3IgYmFkLCBidXQgSSdtIG5vdCBlbnRpcmVseQpzdXJlIG15c2VsZiBlaXRoZXIuIFNvbWV0aW1l
cyBJIHdvbmRlciBteXNlbGYgaWYgSSdtIG92ZXJjb21wbGljYXRpbmcgdGhpbmdzCndpdGggTVNU
LiBUaGUgb25seSB3YXkgSSd2ZSByZWFsbHkgZm91bmQgb2YgZmlndXJpbmcgb3V0IHdoZXRoZXIg
b3Igbm90CmhlbHBlcnMgbGlrZSB0aGlzIGFyZSBvdmVya2lsbCBpcyB0byBqdXN0IGltcGxlbWVu
dCB0aGVtIGV2ZXJ5d2hlcmUuIFdpdGggbXkKYXRvbWljIFZDUEkgaGVscGVycyBmb3IgTVNULCBJ
IHRyaWVkIGltcGxlbWVudGluZyB0aGVtIGV2ZXJ5d2hlcmUgSSBjb3VsZAooZXhjZXB0IGZvciBh
bWRncHUsIGJ1dCBJIF9kaWRfIHRyeSB0aGVyZSBvcmlnaW5hbGx5ISkgdG8gc2VlIGhvdyBhd2t3
YXJkIHRoZXkKd2VyZSB0byB1c2UuIEkgdGhpbmsgaWYgdGhlcmUncyBxdWVzdGlvbnMgdG8gaG93
IHVzZWZ1bCB0aGlzIHNlcmllcyBpcywgaXQnZApwcm9iYWJseSBiZSBnb29kIHRvIHRyeSBpbXBs
ZW1lbnRpbmcgdGhlc2UgaGVscGVycyBpbiBkcml2ZXJzIGxpa2UgaTkxNSB0byBzZWUKaG93IHRo
aW5ncyBwbGF5IG91dC4KCkl0IHNob3VsZCBhbHNvIGJlIG5vdGVkIHRoYXQgSSBkaWQgYWN0dWFs
bHkgdHJ5IHRvIGNvbWUgdXAgd2l0aCBjb21tb24gbGluawpyYXRlIGhlbHBlcnMgbGlrZSB0aGlz
IG9uZSwgYnV0IEkgZW5kZWQgdXAgcmVhbGl6aW5nIEkgd2FzIGFkZGluZyBmYXIgbW9yZQpjb2Rl
IHRoZW4gSSB3YXMgZ2V0dGluZyByaWQgb2YgYWZ0ZXIgSSB0cmllZCBpbXBsZW1lbnRpbmcgdGhl
bSBpbiBpOTE1Cihpcm9uaWMsIGh1aD8pLiBUaGluZ3MgZ290IGV2ZW4gbW9yZSBjb21wbGljYXRl
ZCB3aGVuIEkgbG9va2VkIGF0IGhvdwpub3V2ZWF1L252aWRpYSBoYXJkd2FyZSBkb2VzIGxpbmsg
dHJhaW5pbmcuCgpPbiBGcmksIDIwMTktMDktMjAgYXQgMTg6MDAgKzAyMDAsIFRoaWVycnkgUmVk
aW5nIHdyb3RlOgo+IE9uIE1vbiwgU2VwIDAyLCAyMDE5IGF0IDAxOjMxOjAwUE0gKzAyMDAsIFRo
aWVycnkgUmVkaW5nIHdyb3RlOgo+ID4gRnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZp
ZGlhLmNvbT4KPiA+IAo+ID4gSGksCj4gPiAKPiA+IHRoaXMgc2VyaWVzIG9mIHBhdGNoZXMgaW1w
cm92ZXMgdGhlIERQIGhlbHBlcnMgYSBiaXQgYW5kIGNsZWFucyB1cCBzb21lCj4gPiBpbmNvbnNp
c3RlbmNpZXMgYWxvbmcgdGhlIHdheS4KPiA+IAo+ID4gdjIgaW5jb3Jwb3JhdGVzIGFsbCByZXZp
ZXcgY29tbWVudHMgYWRkIGNvbGxlY3RzIFJldmlld2VkLWJ5cyBmcm9tIHYxLgo+ID4gCj4gPiBU
aGllcnJ5Cj4gPiAKPiA+IFRoaWVycnkgUmVkaW5nICgyMSk6Cj4gPiAgIGRybS9kcDogU29ydCBp
bmNsdWRlcyBhbHBoYWJldGljYWxseQo+ID4gICBkcm0vZHA6IEFkZCBtaXNzaW5nIGtlcm5lbGRv
YyBmb3Igc3RydWN0IGRybV9kcF9saW5rCj4gPiAgIGRybS9kcDogQWRkIGRybV9kcF9saW5rX3Jl
c2V0KCkgaW1wbGVtZW50YXRpb24KPiA+ICAgZHJtL2RwOiBUcmFjayBsaW5rIGNhcGFiaWxpdGll
cyBhbG9uZ3NpZGUgc2V0dGluZ3MKPiA+ICAgZHJtL2RwOiBUdXJuIGxpbmsgY2FwYWJpbGl0aWVz
IGludG8gYm9vbGVhbnMKPiA+ICAgZHJtL2RwOiBQcm9iZSBsaW5rIHVzaW5nIGV4aXN0aW5nIHBh
cnNpbmcgaGVscGVycwo+ID4gICBkcm0vZHA6IFJlYWQgZmFzdCB0cmFpbmluZyBjYXBhYmlsaXR5
IGZyb20gbGluawo+ID4gICBkcm0vZHA6IFJlYWQgVFBTMyBjYXBhYmlsaXR5IGZyb20gc2luawo+
ID4gICBkcm0vZHA6IFJlYWQgY2hhbm5lbCBjb2RpbmcgY2FwYWJpbGl0eSBmcm9tIHNpbmsKPiA+
ICAgZHJtL2RwOiBSZWFkIGFsdGVybmF0ZSBzY3JhbWJsZXIgcmVzZXQgY2FwYWJpbGl0eSBmcm9t
IHNpbmsKPiA+ICAgZHJtL2RwOiBSZWFkIGVEUCB2ZXJzaW9uIGZyb20gRFBDRAo+ID4gICBkcm0v
ZHA6IFJlYWQgQVVYIHJlYWQgaW50ZXJ2YWwgZnJvbSBEUENECj4gPiAgIGRybS9kcDogRG8gbm90
IGJ1c3ktbG9vcCBkdXJpbmcgbGluayB0cmFpbmluZwo+ID4gICBkcm0vZHA6IFVzZSBkcm1fZHBf
YXV4X3JkX2ludGVydmFsKCkKPiA+ICAgZHJtL2RwOiBBZGQgaGVscGVyIHRvIGdldCBwb3N0LWN1
cnNvciBhZGp1c3RtZW50cwo+ID4gICBkcm0vZHA6IFNldCBjaGFubmVsIGNvZGluZyBvbiBsaW5r
IGNvbmZpZ3VyYXRpb24KPiA+ICAgZHJtL2RwOiBFbmFibGUgYWx0ZXJuYXRlIHNjcmFtYmxlciBy
ZXNldCB3aGVuIHN1cHBvcnRlZAo+ID4gICBkcm0vZHA6IEFkZCBkcm1fZHBfbGlua19jaG9vc2Uo
KSBoZWxwZXIKPiA+ICAgZHJtL2RwOiBBZGQgc3VwcG9ydCBmb3IgZURQIGxpbmsgcmF0ZXMKPiA+
ICAgZHJtL2RwOiBSZW1vdmUgYSBncmF0dWl0dW91cyBibGFuayBsaW5lCj4gPiAgIGRybS9icmlk
Z2U6IHRjMzU4NzY3OiBVc2UgRFAgbm9tZW5jbGF0dXJlCj4gCj4gQW55b25lIGludGVyZXN0ZWQg
aW4gcmV2aWV3aW5nIHRoZXNlPwo+IAo+IFRoaWVycnkKPiAKPiA+ICBkcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL3RjMzU4NzY3LmMgICAgICB8ICAyMiArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfaGVscGVyLmMgICAgICAgIHwgMzI3ICsrKysrKysrKysrKysrKysrKysrKystLS0KPiA+ICBk
cml2ZXJzL2dwdS9kcm0vbXNtL2VkcC9lZHBfY3RybC5jICAgICB8ICAxMiArLQo+ID4gIGRyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9jZG4tZHAtY29yZS5jIHwgICA4ICstCj4gPiAgZHJpdmVycy9n
cHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1yZWcuYyAgfCAgMTMgKy0KPiA+ICBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvZHBhdXguYyAgICAgICAgICB8ICAgOCArLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS90
ZWdyYS9zb3IuYyAgICAgICAgICAgIHwgIDMyICstLQo+ID4gIGluY2x1ZGUvZHJtL2RybV9kcF9o
ZWxwZXIuaCAgICAgICAgICAgIHwgMTI0ICsrKysrKysrKy0KPiA+ICA4IGZpbGVzIGNoYW5nZWQs
IDQ1OSBpbnNlcnRpb25zKCspLCA4NyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gLS0gCj4gPiAyLjIy
LjAKPiA+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAotLSAKQ2hlZXJzLAoJTHl1ZGUgUGF1bAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
