Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37595A2957
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 00:04:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932396E221;
	Thu, 29 Aug 2019 22:04:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B393B6E220;
 Thu, 29 Aug 2019 22:04:04 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id l11so3736205lfk.6;
 Thu, 29 Aug 2019 15:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=qmQAdDRYulUDjSpMspTEPnnb4TRIYFsZQNmhOKS11AU=;
 b=f/E1XWRmmCt/0UVkDZUc1AJJJRok2ooeG1AQ1EWXZOcVUvgkXIqYlmXRxQ5ZKlXrs9
 IYS/Yo0qtbZdKcUqP4udoozqWB2fO3/XcViOs9lNX6fjqxrAIOxKwQBGwPUVsevcksBi
 vKUP44Q5aemKjI1kfk8m8ysDvtRp+dIpnfXAUZdP0vl7WrJrZxoc30tOmstOXROYUoAr
 upT6bh70iyqlpAIlrAyplEMPu1KoXbzdELpisOYvtxjG9/rlLVjE9AjGQiBYAn4zINT/
 dFetosJbxU6PqrztwjZ7K+zZMo3LVke9GZ+HVKa8SVJ+PsP84jgdUV+afQisrmIA01ZJ
 ww2A==
X-Gm-Message-State: APjAAAXxl9Lm3fbvVdwDqto0VwVCAUyK8Y0dvfgYw+M3s+VSjeW+2+fz
 ACT7ial5gFaXN79bJtiXXTE=
X-Google-Smtp-Source: APXvYqx5Rzds4epSb/bOTOocRGoYxAjXegirF5KGbnGG+NfeQNJOyfAEBiAXvG0M0ytaQNmDGCVGug==
X-Received: by 2002:a19:6a12:: with SMTP id u18mr7345008lfu.133.1567116242773; 
 Thu, 29 Aug 2019 15:04:02 -0700 (PDT)
Received: from localhost.localdomain ([178.214.243.78])
 by smtp.gmail.com with ESMTPSA id e21sm575402lfj.10.2019.08.29.15.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 15:04:02 -0700 (PDT)
Message-ID: <a07be36905f145f2fb07beee73f9d3805c285022.camel@gmail.com>
Subject: Re: gnome-shell stuck because of amdgpu driver [5.3 RC5]
From: mikhail.v.gavrilov@gmail.com
To: Daniel Vetter <daniel@ffwll.ch>, Hillf Danton <hdanton@sina.com>
Date: Fri, 30 Aug 2019 03:03:58 +0500
In-Reply-To: <20190826092408.GA2112@phenom.ffwll.local>
References: <20190825141305.13984-1-hdanton@sina.com>
 <20190826092408.GA2112@phenom.ffwll.local>
User-Agent: Evolution 3.33.91 (3.33.91-1.fc32) 
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=qmQAdDRYulUDjSpMspTEPnnb4TRIYFsZQNmhOKS11AU=;
 b=olk4Y4iZag61wP1hPA3Br9s19D+SI48mrDe97epo/a7ja3nmIUJ1UW8dDTQEudnCot
 1rnKEtiyP81Axb4ndf5Ni20lVk7FBuW1LOu7/V5wvu5s8axkfpD2k8Its1nqKDucVCrS
 S8yMPZ8Nw6GPrdw3UkBvomVkp1MQw1CgvQh8WBMnqa5qO0lAfXIzXAi50aOm1UCbg2ai
 GJ+LzdGBPdyjQ5Eb8a60J9SAQ2dB5ZNFSuvTeLhDZSArZX6uf03nNmd4KBwPQli0UcBZ
 +8Ce2PdTca8oaDWDIc6NF2csNQVP0JO+LkIGg0U7Q/tgFjsOMYp40upVHb1DBhO4Ok42
 ZRNA==
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMjUsIDIwMTkgYXQgMTA6MTM6MDVQTSArMDgwMCwgSGlsbGYgRGFudG9uIHdy
b3RlOgo+IENhbiB3ZSB0cnkgdG8gYWRkIHRoZSBmYWxsYmFjayB0aW1lciBtYW51YWxseT8KPiAK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9mZW5jZS5jCj4gQEAgLTMyMiw2ICsz
MjIsMTAgQEAgaW50IGFtZGdwdV9mZW5jZV93YWl0X2VtcHR5KHN0cnVjdCBhbWRncAo+ICAgICAg
ICAgfQo+ICAgICAgICAgcmN1X3JlYWRfdW5sb2NrKCk7Cj4gIAo+ICsgICAgICAgaWYgKCF0aW1l
cl9wZW5kaW5nKCZyaW5nLT5mZW5jZV9kcnYuZmFsbGJhY2tfdGltZXIpKQo+ICsgICAgICAgICAg
ICAgICBtb2RfdGltZXIoJnJpbmctPmZlbmNlX2Rydi5mYWxsYmFja190aW1lciwKPiArICAgICAg
ICAgICAgICAgICAgICAgICBqaWZmaWVzICsgKEFNREdQVV9GRU5DRV9KSUZGSUVTX1RJTUVPVVQg
PDwKPiAxKSk7Cj4gKwo+ICAgICAgICAgciA9IGRtYV9mZW5jZV93YWl0KGZlbmNlLCBmYWxzZSk7
Cj4gICAgICAgICBkbWFfZmVuY2VfcHV0KGZlbmNlKTsKPiAgICAgICAgIHJldHVybiByOwo+IC0t
Cj4gCj4gT3Igc2ltcGx5IHdhaXQgd2l0aCBhbiBlYXIgb24gc2lnbmFsIGFuZCB0aW1lb3V0IGlm
IGFkZGluZyB0aW1lcgo+IHNlZW1zIHRvIGdvIGEgYml0IHRvbyBmYXI/Cj4gCj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2ZlbmNlLmMKPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZmVuY2UuYwo+IEBAIC0zMjIsNyArMzIyLDEyIEBAIGlu
dCBhbWRncHVfZmVuY2Vfd2FpdF9lbXB0eShzdHJ1Y3QgYW1kZ3AKPiAgICAgICAgIH0KPiAgICAg
ICAgIHJjdV9yZWFkX3VubG9jaygpOwo+ICAKPiAtICAgICAgIHIgPSBkbWFfZmVuY2Vfd2FpdChm
ZW5jZSwgZmFsc2UpOwo+ICsgICAgICAgaWYgKDAgPCBkbWFfZmVuY2Vfd2FpdF90aW1lb3V0KGZl
bmNlLCB0cnVlLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQU1ER1BVX0ZFTkNF
X0pJRkZJRVNfVElNRU9VVCArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoQU1E
R1BVX0ZFTkNFX0pJRkZJRVNfVElNRU9VVCA+PiAzKSkpCj4gKyAgICAgICAgICAgICAgIHIgPSAw
Owo+ICsgICAgICAgZWxzZQo+ICsgICAgICAgICAgICAgICByID0gLUVJTlZBTDsKPiAgICAgICAg
IGRtYV9mZW5jZV9wdXQoZmVuY2UpOwo+ICAgICAgICAgcmV0dXJuIHI7Cj4gIH0KCkkgdGVzdGVk
IGJvdGggcGF0Y2hlcyBvbiB0b3Agb2YgNS4zIFJDNi4gRWFjaCBwYXRjaCBJIHdhcyB0ZXN0ZWQg
bW9yZQp0aGFuIDI0IGhvdXJzIGFuZCBJIGRvbid0IHNlZW4gYW55IHJlZ3Jlc3Npb25zIG9yIHBy
b2JsZW1zIHdpdGggdGhlbS4KCgpPbiBNb24sIDIwMTktMDgtMjYgYXQgMTE6MjQgKzAyMDAsIERh
bmllbCBWZXR0ZXIgd3JvdGU6Cj4gCj4gVGhpcyB3aWxsIHBhcGVyIG92ZXIgdGhlIGlzc3VlLCBi
dXQgd29uJ3QgZml4IGl0LiBkbWFfZmVuY2VzIGhhdmUgdG8KPiBjb21wbGV0ZSwgYXQgbGVhc3Qg
Zm9yIG5vcm1hbCBvcGVyYXRpb25zLCBvdGhlcndpc2UgeW91ciBkZXNrdG9wIHdpbGwKPiBzdGFy
dCBmZWVsaW5nIGxpa2UgdGhlIGdwdSBoYW5ncyBhbGwgdGhlIHRpbWUuCj4gCj4gSSB0aGluayB3
b3VsZCBiZSBtdWNoIG1vcmUgaW50ZXJlc3RpbmcgdG8gZHVtcCB3aGljaCBmZW5jZSBpc24ndAo+
IGNvbXBsZXRpbmcgaGVyZSBpbiB0aW1lLCBpLmUuIG5vdCBqdXN0IHRoZSB0aW1lb3V0LCBidXQg
bG90cyBvZiBkZWJ1Zwo+IHByaW50a3MuCj4gLURhbmllbAoKQXMgSSBhbSB1bmRlcnN0b29kIG5v
bmUgb2YgdGhlc2UgcGF0Y2hlcyBjb3VsZG4ndCBiZSBtZXJnZWQgYmVjYXVzZQp0aGV5IGRvIG5v
dCBmaXggdGhlIHJvb3QgY2F1c2UgdGhleSBlbGltaW5hdGUgb25seSB0aGUgY29uc2VxdWVuY2Vz
PwpFbGltaW5hdGluZyBjb25zZXF1ZW5jZXMgaGFzIGFueSBuZWdhdGl2ZSBlZmZlY3RzPyBBbmQg
d2Ugd2lsbCBuZXZlcgprbm93IHRoZSByb290IGNhdXNlIGJlY2F1c2Ugbm90IGhhdmluZyBlbm91
Z2ggZGVidWdnaW5nIGluZm9ybWF0aW9uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
