Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDE41FC752
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 09:27:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD1A96EAA1;
	Wed, 17 Jun 2020 07:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886D86E8C7
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 14:14:04 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y11so23770864ljm.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 07:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hek6dP2hX1DkgDYCqdcoJnb8OPxCsTSvr04uC6UyePo=;
 b=MtLodwT052MO77CtPzvAlxsDAVhljp+66ljgns+U6+ZxI4qknX8gYGhnCMtG2gNZmr
 NvRJ4uE5JLC41sk8ZjlywfNqcp1nxJrEmfbPpWkcwLvmez97GufcfRqa8slpX8cRZqOi
 CZ/a2qI64/L8aeu1VTFEESTz546IYV3UJ50oEzANxAOj5NZPK3TSsrUJM3xuifnIYDKq
 57h3HwrehB3endNr4326TQHFamVzsJoP//q8MPBdCk5wKezG+Knc2WaW3Z2IXDIuVIWT
 dXsmDzBeJc6U08yJdOJxWTQj5qoFzlyC7plimVT7Wy2XRSrGmAJnqyah4KDx9xy0jcI1
 Uoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hek6dP2hX1DkgDYCqdcoJnb8OPxCsTSvr04uC6UyePo=;
 b=QL/O2VtPv1Q7OAEep3zRZ+7AEW6itaGp3wFPyvkyyeDETygksPZMTFlGVJPGqr7RoW
 uYAs5SWytWsC5pQ2h9BMDqi1kyhkhtdZoxBMoQ0Z0Kenvyeg0dEClvgKAQ+aGo1J2fU+
 d8/IpUzS+5KsDlKqf7TlZoiU+wlRnUD2VzFlp6JLcvHbIKlk59Ub8szJnqpmJpkBSs8p
 YIwwOnRuh7LOnAU9N7lnxCmGqS1/HTVcTvqRM7sXkn2+yoz1WuvVuPD2M+LeRjDvDQ8L
 1gyjJMX2oRZr2MxZMzNlee3zORWJUWB7rsM4TcZivS4DTjTuyWNw/fK6PEkHALL5PC0H
 K+ZQ==
X-Gm-Message-State: AOAM532/S3Kj5fItNYibQIhW2s24FZAqq2bglE6Sw0LKrHUKz37k1Bez
 23hEpr1wK7c3BXqE2NB3SF0Nuo+A
X-Google-Smtp-Source: ABdhPJw6i3nzmi8i8Yhv4m5YwTiNhrHSw2RE3pRuemxQAi1F/wEPq9D9lvAR1eJoOW8I3RYe4DtHGQ==
X-Received: by 2002:a2e:571b:: with SMTP id l27mr1663467ljb.308.1592316842693; 
 Tue, 16 Jun 2020 07:14:02 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id h24sm4411484lji.115.2020.06.16.07.14.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Jun 2020 07:14:01 -0700 (PDT)
Subject: Re: [PATCH v7 1/6] of_graph: add of_graph_get_local_port()
From: Dmitry Osipenko <digetx@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200614172234.8856-1-digetx@gmail.com>
 <20200614172234.8856-2-digetx@gmail.com>
 <20200616012111.GE1629@pendragon.ideasonboard.com>
 <20200616012513.GF1629@pendragon.ideasonboard.com>
 <8b7c6395-edd8-cecd-7004-e9f3f22d61f2@gmail.com>
Message-ID: <7c40f145-f31b-8397-ac23-601828c9f013@gmail.com>
Date: Tue, 16 Jun 2020 17:14:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <8b7c6395-edd8-cecd-7004-e9f3f22d61f2@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 17 Jun 2020 07:26:02 +0000
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMDYuMjAyMCAxNjo1NiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMTYuMDYuMjAy
MCAwNDoyNSwgTGF1cmVudCBQaW5jaGFydCDQv9C40YjQtdGCOgo+PiBPbiBUdWUsIEp1biAxNiwg
MjAyMCBhdCAwNDoyMToxMkFNICswMzAwLCBMYXVyZW50IFBpbmNoYXJ0IHdyb3RlOgo+Pj4gSGkg
RG1pdHJ5LAo+Pj4KPj4+IFRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgo+Pj4KPj4+IE9uIFN1biwg
SnVuIDE0LCAyMDIwIGF0IDA4OjIyOjI5UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToK
Pj4+PiBJbiBzb21lIGNhc2UsIGxpa2UgYSBEUk0gZGlzcGxheSBjb2RlIGZvciBleGFtcGxlLCBp
dCdzIHVzZWZ1bCB0byBzaWxlbnRseQo+Pj4+IGNoZWNrIHdoZXRoZXIgcG9ydCBub2RlIGV4aXN0
cyBhdCBhbGwgaW4gYSBkZXZpY2UtdHJlZSBiZWZvcmUgcHJvY2VlZGluZwo+Pj4+IHdpdGggcGFy
c2luZyB0aGUgZ3JhcGguCj4+Pj4KPj4+PiBUaGlzIHBhdGNoIGFkZHMgb2ZfZ3JhcGhfZ2V0X2xv
Y2FsX3BvcnQoKSB3aGljaCByZXR1cm5zIHBvaW50ZXIgdG8gYSBsb2NhbAo+Pj4+IHBvcnQgbm9k
ZSwgb3IgTlVMTCBpZiBncmFwaCBpc24ndCBzcGVjaWZpZWQgaW4gYSBkZXZpY2UtdHJlZSBmb3Ig
YSBnaXZlbgo+Pj4+IGRldmljZSBub2RlLgo+Pj4+Cj4+Pj4gUmV2aWV3ZWQtYnk6IFJvYiBIZXJy
aW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4+Pj4gUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0
eEBnbWFpbC5jb20+Cj4+Pj4gLS0tCj4+Pj4gIGRyaXZlcnMvb2YvcHJvcGVydHkuYyAgICB8IDMy
ICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tCj4+Pj4gIGluY2x1ZGUvbGludXgvb2Zf
Z3JhcGguaCB8ICA3ICsrKysrKysKPj4+PiAgMiBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25z
KCspLCA5IGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvcHJv
cGVydHkuYyBiL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+Pj4+IGluZGV4IDFmMjA4NmY0ZTdjZS4u
MDVjNWY2MTliOGJiIDEwMDY0NAo+Pj4+IC0tLSBhL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+Pj4+
ICsrKyBiL2RyaXZlcnMvb2YvcHJvcGVydHkuYwo+Pj4+IEBAIC02MDgsMTUgKzYwOCw3IEBAIHN0
cnVjdCBkZXZpY2Vfbm9kZSAqb2ZfZ3JhcGhfZ2V0X25leHRfZW5kcG9pbnQoY29uc3Qgc3RydWN0
IGRldmljZV9ub2RlICpwYXJlbnQsCj4+Pj4gIAkgKiBwYXJlbnQgcG9ydCBub2RlLgo+Pj4+ICAJ
ICovCj4+Pj4gIAlpZiAoIXByZXYpIHsKPj4+PiAtCQlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGU7
Cj4+Pj4gLQo+Pj4+IC0JCW5vZGUgPSBvZl9nZXRfY2hpbGRfYnlfbmFtZShwYXJlbnQsICJwb3J0
cyIpOwo+Pj4+IC0JCWlmIChub2RlKQo+Pj4+IC0JCQlwYXJlbnQgPSBub2RlOwo+Pj4+IC0KPj4+
PiAtCQlwb3J0ID0gb2ZfZ2V0X2NoaWxkX2J5X25hbWUocGFyZW50LCAicG9ydCIpOwo+Pj4+IC0J
CW9mX25vZGVfcHV0KG5vZGUpOwo+Pj4+IC0KPj4+PiArCQlwb3J0ID0gb2ZfZ3JhcGhfZ2V0X2xv
Y2FsX3BvcnQocGFyZW50KTsKPj4+PiAgCQlpZiAoIXBvcnQpIHsKPj4+PiAgCQkJcHJfZXJyKCJn
cmFwaDogbm8gcG9ydCBub2RlIGZvdW5kIGluICVwT0ZcbiIsIHBhcmVudCk7Cj4+Pj4gIAkJCXJl
dHVybiBOVUxMOwo+Pj4+IEBAIC03NjUsNiArNzU3LDI4IEBAIHN0cnVjdCBkZXZpY2Vfbm9kZSAq
b2ZfZ3JhcGhfZ2V0X3JlbW90ZV9wb3J0KGNvbnN0IHN0cnVjdCBkZXZpY2Vfbm9kZSAqbm9kZSkK
Pj4+PiAgfQo+Pj4+ICBFWFBPUlRfU1lNQk9MKG9mX2dyYXBoX2dldF9yZW1vdGVfcG9ydCk7Cj4+
Pj4gIAo+Pj4+ICsvKioKPj4+PiArICogb2ZfZ3JhcGhfZ2V0X2xvY2FsX3BvcnQoKSAtIGdldCBs
b2NhbCBwb3J0IG5vZGUKPj4+PiArICogQG5vZGU6IHBvaW50ZXIgdG8gYSBsb2NhbCBlbmRwb2lu
dCBkZXZpY2Vfbm9kZQo+Pj4+ICsgKgo+Pj4+ICsgKiBSZXR1cm46IEZpcnN0IGxvY2FsIHBvcnQg
bm9kZSBhc3NvY2lhdGVkIHdpdGggbG9jYWwgZW5kcG9pbnQgbm9kZSBsaW5rZWQKPj4+PiArICoJ
ICAgdG8gQG5vZGUuIFVzZSBvZl9ub2RlX3B1dCgpIG9uIGl0IHdoZW4gZG9uZS4KPj4+PiArICov
Cj4+Pj4gK3N0cnVjdCBkZXZpY2Vfbm9kZSAqb2ZfZ3JhcGhfZ2V0X2xvY2FsX3BvcnQoY29uc3Qg
c3RydWN0IGRldmljZV9ub2RlICpub2RlKQo+Pgo+PiBJIGZvcmdvdCB0byBtZW50aW9uIHRoYXQs
IGdpdmVuIHRoYXQgdGhlcmUgY291bGQgYmUgbXVsdGlwbGUgJ3BvcnQnCj4+IG5vZGVzLCB0aGlz
IGZ1bmN0aW9uIHdvdWxkIGJlIGJldHRlciBuYW1lZAo+PiBvZl9ncmFwaF9nZXRfZmlyc3RfbG9j
YWxfcG9ydCgpLiAnZmlyc3QnIGhlcmUgd291bGQgcmVmZXIgdG8gdGhlIG5vZGVzCj4+IG9yZGVy
IGluIHRoZSBkZXZpY2UgdHJlZSwgd2hpY2ggSSBiZWxpZXZlIG1heSBub3QgbWF0Y2ggdGhlIHBv
cnQgbnVtYmVyLgo+PiBGb3IgaW5zdGFuY2UsIGluIHRoZSBmb2xsb3dpbmcgY2FzZQo+Pgo+PiAJ
cG9ydHMgewo+PiAJCSNhZGRyZXNzLWNlbGxzID0gPDE+Owo+PiAJCSNzaXplLWNlbGxzID0gPDE+
Owo+PiAJCXBvcnRAMSB7Cj4+IAkJCXJlZyA9IDwxPjsKPj4gCQl9Owo+PiAJCXBvcnRAMCB7Cj4+
IAkJCXJlZyA9IDwwPjsKPj4gCQl9Owo+PiAJfTsKPj4KPj4gdGhlIGZ1bmN0aW9uIHdvdWxkIEkg
YmVsaWV2ZSByZXR1cm4gcG9ydEAxLiBJdCBtYXkgYmUgYSBnb29kIGlkZWEgdG8KPj4gZXhwbGFp
biB0aGlzIGluIHRoZSBkb2N1bWVudGF0aW9uLgo+IAo+IEhlbGxvIExhdXJlbnQsCj4gCj4gSXQn
cyBjb3JyZWN0IHRoYXQgdGhlIHBvcnRAMSB3aWxsIGJlIHJldHVybmVkIGluIHlvdXJzIGV4YW1w
bGUuCj4gCj4gSSdsbCBpbXByb3ZlIHRoZSBkb2MgYW5kIHRoZSBmdW5jdGlvbidzIG5hbWUgaW4g
dGhlIG5leHQgcmV2aXNpb24sIHRoYW5rCj4geW91IGZvciB0aGUgc3VnZ2VzdGlvbnMhCj4gCj4+
IERlcGVuZGluZyBvbiBob3cgeW91IHVzZSB0aGlzCj4+IGZ1bmN0aW9uLCBpZiB5b3VyIG9ubHkg
dXNlIGNhc2UgaXMgdG8gdGVzdCBmb3IgdGhlIHByZXNlbmNlIG9mIHBvcnQKPj4gbm9kZXMsIGl0
IG1heSBiZSBiZXN0IHRvIHJldHVybiBhIGJvb2wgYW5kIG5hbWUgaXQgb2ZfZ3JhcGhfaGFzX3Bv
cnQoKQo+PiBvciBzb21ldGhpbmcgc2ltaWxhci4KPj4KPj4+PiArewo+Pj4+ICsJc3RydWN0IGRl
dmljZV9ub2RlICpwb3J0cywgKnBvcnQ7Cj4+Pj4gKwo+Pj4+ICsJcG9ydHMgPSBvZl9nZXRfY2hp
bGRfYnlfbmFtZShub2RlLCAicG9ydHMiKTsKPj4+PiArCWlmIChwb3J0cykKPj4+PiArCQlub2Rl
ID0gcG9ydHM7Cj4+Pj4gKwo+Pj4+ICsJcG9ydCA9IG9mX2dldF9jaGlsZF9ieV9uYW1lKG5vZGUs
ICJwb3J0Iik7Cj4+Pj4gKwlvZl9ub2RlX3B1dChwb3J0cyk7Cj4+Pj4gKwo+Pj4+ICsJcmV0dXJu
IHBvcnQ7Cj4+Pgo+Pj4gVGhlIGltcGxlbWVudGF0aW9uIGRvZXNuJ3Qgc2VlbSB0byBtYXRjaCB0
aGUgZG9jdW1lbnRhdGlvbi4gSWYgbm9kZSBpcyBhCj4+PiBwb2ludGVyIHRvIGFuIGVuZHBvaW50
LCBpdCBzaG91bGQgbm90IGhhdmUgYW55IHBvcnRzIGNoaWxkLgo+IAo+IFJpZ2h0LCBJJ2xsIHJl
d29yZCB0aGUgZG9jIGluIHY4LiBUaGlzIGZ1bmN0aW9uIGRvZXNuJ3QgZGlmZmVyZW50aWF0ZQo+
IGJldHdlZW4gc3RhcnQgLyBlbmQgcG9pbnRzLiBJdCdzIHVwIHRvIGEgdXNlciBvZiB0aGlzIGZ1
bmN0aW9uIHRvIGNoZWNrCj4gd2hldGhlciBub2RlIGlzIGVuZHBvaW50IG9yIHNvbWV0aGluZyBl
bHNlIGlmIG5lZWRlZC4KPiAKPiBUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgY29tbWVudHMh
Cj4gCgpBbHRob3VnaCwgSSByZS1yZWFkIHRoZSBkb2MgY29tbWVudCBhbmQgY29tcGFyZWQgaXQg
dG8gdGhlIHdvcmRpbmcgb2YKdGhlIG90aGVyIG9mX2dyYXBoXyooKSBmdW5jdGlvbnMgYW5kIGl0
J3MgYWxyZWFkeSBnb29kIGFzLWlzIHRvIG1lCmJlY2F1c2UgdGhlIGRvYyBleHBsaWNpdGx5IHNh
eXMgdGhlICJSZXR1cm46IEZpcnN0IGxvY2FsIHBvcnQgYXNzb2NpYXRlZAp3aXRoIGxvY2FsIGVu
ZHBvaW50Li4uIiwgd2hpY2ggaXMgZXhhY3RseSB3aGF0IHRoaXMgZnVuY3Rpb24gZG9lcy4KCkJ1
dCBzdGlsbCB0aGUgZnVuY3Rpb24gbmFtZSBhbmQgaXQncyBicmllZiBkZXNjcmlwdGlvbiBjb3Vs
ZCBiZSBpbXByb3ZlZC4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
