Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C443177117
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66BCC6EA32;
	Tue,  3 Mar 2020 08:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A39E6E4AF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 03:29:52 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id o10so1795062qtr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 19:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xa1levQOnetXdgOAGPkdyir7uY3HWmbFgfGCDI8dF5Q=;
 b=OvZxpYDSqgDR/2S2mfX09uK9KjdmQRaBRIdH+HYcn7xg8xcWSUb34T/yducyzyhBzW
 Ga7QRaz/WDYt2bhVXpg0pYcVGadJw0BwYtu7D+gRweTWh9ivYjIGzlXkLYJpMASa/IZx
 mdpyWK/M/nsJxX158hL7VToScRrHZD4W867f6uM4NF8JI4D7pP0o1xx6jJVzuQxsFnQX
 WKPbo61jQNyEV5TsgO2+3mSmVUKTEqU7/1VJQMEEJ1WP49jJAIA/bv2awpuLvkJVA68L
 A5xo+t7wYWnhFGRDygqsp/EIHXFfgsPd91WwOnOZyi4HkWMeg5AzP2orWJ07t6g6C5w6
 Eu8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xa1levQOnetXdgOAGPkdyir7uY3HWmbFgfGCDI8dF5Q=;
 b=f/seAqqFTd9zsvh95d8dw+1L19VgCK6VmX5VsmQaLICOM4o4dsu9GdCrEnwZx0EQFQ
 C8Ovk+Pi04T9SxqXBNqfZXJPzjqZ37Zs1t2g/mZtnqLBEQ3lWPMhTMRLzrh7MGAyc+q2
 IAL/aM5ck7hz62TaRNDjQMtD/q1aUnjAN1GzL33AaCQknxhFIqMF37Tduz4+9gwYACr0
 Z3f/Z534Rt9S764xbmKtgm6CuUghaCWaLkFzfwqpOWpnom2QVOWH3/mTJ5SyC8YYVlaQ
 tMSJM8v8jCmLrYhOkrVpJG7FrNL2ZdF2zMgU6ArAchQ9oI7EbWhEOY9KZGZ+l6VJ1+AR
 /z7Q==
X-Gm-Message-State: ANhLgQ3rMjWcc6xojnKaJq6ed6qziqXQyyRxSOPauEoW7kd/AajwrvDK
 6A764ihz82cv4lr3ecgxJl/1Fw==
X-Google-Smtp-Source: ADFU+vtUaAePBl9W4trjwNEI4tfYek6RSUoFepTTMhqQGcVuAWfg5tNfqOTREwyFaGuaW9zkUqW/2w==
X-Received: by 2002:aed:35d4:: with SMTP id d20mr2682075qte.181.1583206191589; 
 Mon, 02 Mar 2020 19:29:51 -0800 (PST)
Received: from [192.168.0.189] ([147.253.86.153])
 by smtp.gmail.com with ESMTPSA id z4sm4377754qkz.85.2020.03.02.19.29.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Mar 2020 19:29:51 -0800 (PST)
Subject: Re: [PATCH 33/33] drm/panel-simple: Fix dotclock for LG ACX467AKM-7
To: Brian Masney <masneyb@onstation.org>
References: <20200302203452.17977-1-ville.syrjala@linux.intel.com>
 <20200302203452.17977-34-ville.syrjala@linux.intel.com>
 <db82d02d-c484-2bcd-3c6c-205c8655262b@marek.ca>
 <20200303031335.GA7208@onstation.org>
From: Jonathan Marek <jonathan@marek.ca>
Message-ID: <8f47109f-796e-8cd5-d05e-8cdf2d0665ed@marek.ca>
Date: Mon, 2 Mar 2020 22:28:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200303031335.GA7208@onstation.org>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 03 Mar 2020 08:24:06 +0000
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
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMi8yMCAxMDoxMyBQTSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IE9uIE1vbiwgTWFyIDAy
LCAyMDIwIGF0IDAzOjQ4OjIyUE0gLTA1MDAsIEpvbmF0aGFuIE1hcmVrIHdyb3RlOgo+PiBIaSwK
Pj4KPj4gVGhpcyBpcyBhIGNvbW1hbmQgbW9kZSBwYW5lbCBhbmQgdGhlIHRoZSBtc20vbWRwNSBk
cml2ZXIgdXNlcyB0aGUgdnJlZnJlc2gKPj4gZmllbGQgZm9yIHRoZSBhY3R1YWwgcmVmcmVzaCBy
YXRlLCB3aGlsZSB0aGUgZG90Y2xvY2sgZmllbGQgaXMgdXNlZCBmb3IgdGhlCj4+IERTSSBjbG9j
a3MuIFRoZSBkb3RjbG9jayBuZWVkZWQgdG8gYmUgYSBiaXQgaGlnaGVyIHRoYW4gbmVjZXNzYXJ5
IG90aGVyd2lzZQo+PiB0aGUgcGFuZWwgd291bGQgbm90IHdvcmsuCj4+Cj4+IElmIHlvdSB3YW50
IHRvIGdldCByaWQgb2YgdGhlIHNlcGFyYXRlIGNsb2NrL3ZyZWZyZXNoIGZpZWxkcyB0aGVyZSB3
b3VsZAo+PiBuZWVkIHRvIGJlIHNvbWUgY2hhbmdlcyB0byBtc20gZHJpdmVyLgo+Pgo+PiAobm90
ZSBJIGhhZG4ndCBtYWRlIHRoZSBwYXRjaCB3aXRoIHVwc3RyZWFtaW5nIGluIG1pbmQsIHRoZSAx
NTAwMDAgdmFsdWUgaXMKPj4gbGlrZWx5IG5vdCBvcHRpbWFsLCBqdXN0IHNvbWV0aGluZyB0aGF0
IHdvcmtlZCwgdGhpcyBpcyBzb21ldGhpbmcgdGhhdAo+PiBzaG91bGQgaGF2ZSBiZWVuIGNoZWNr
ZWQgd2l0aCB0aGUgZG93bnN0cmVhbSBkcml2ZXIpCj4gCj4gSXMgdGhpcyB0aGUgcmlnaHQgY2xv
Y2sgZnJlcXVlbmN5IGluIHRoZSBkb3duc3RyZWFtIE1TTSAzLjQga2VybmVsIHRoYXQKPiB5b3Un
cmUgdGFsa2luZyBhYm91dD8KPiAKPiBodHRwczovL2dpdGh1Yi5jb20vQUlDUC9rZXJuZWxfbGdl
X2hhbW1lcmhlYWQvYmxvYi9uNy4xL2FyY2gvYXJtL21hY2gtbXNtL2Nsb2NrLTg5NzQuYyNMMzMy
Ngo+IAoKTm8sIEknbSB0YWxraW5nIGFib3V0IHRoZSBEU0kgY2xvY2sgKHRoZSBkcml2ZXIgZm9y
IGl0IGlzIGluIApkcm0vbXNtL2RzaS8pLiBGb3IgYSBjb21tYW5kIG1vZGUgcGFuZWwgdGhlIGZy
b250L2JhY2sgcG9yY2hlcyBhcmVuJ3QgCnJlbGV2YW50LCBidXQgdGhlIGRzaSBwaXhlbC9ieXRl
IGNsb2NrIG5lZWQgdG8gYmUgYSBiaXQgaGlnaGVyIHRoYW4gCjE5MjB4MTA4MHg2MC4gU2luY2Ug
MTI1NDk4IGlzIGEgbGl0dGxlIGhpZ2hlciB0aGFuIDEyNDQxNiB0aGF0IG1pZ2h0IGJlIAplbm91
Z2ggKHRoZXJlIGlzIGFsc28gcm91bmRpbmcgb2YgdGhlIGNsb2NrIHZhbHVlcyB0byBjb25zaWRl
cikuCgo+IEkgZG9uJ3Qgc2VlIGFueSBvYnZpb3VzIGNsb2NrIHZhbHVlcyBpbiB0aGUgZG93bnN0
cmVhbSBjb21tYW5kIG1vZGUKPiBwYW5lbCBjb25maWd1cmF0aW9uOgo+IAo+IGh0dHBzOi8vZ2l0
aHViLmNvbS9BSUNQL2tlcm5lbF9sZ2VfaGFtbWVyaGVhZC9ibG9iL243LjEvYXJjaC9hcm0vYm9v
dC9kdHMvbXNtODk3NC1oYW1tZXJoZWFkL21zbTg5NzQtaGFtbWVyaGVhZC1wYW5lbC5kdHNpI0w1
OTEKPiAKPiBBbnl3YXlzLCBJIHRyaWVkIFZpbGxlJ3MgcGF0Y2ggd2l0aCB0aGUgZnJhbWVidWZm
ZXIsIGttc2N1YmUsIGFuZCBYMTEKPiBhbmQgZXZlcnl0aGluZyBhcHBlYXJzIHRvIGJlIHdvcmtp
bmcgZmluZS4gWW91IGNhbiBhZGQgbXkgVGVzdGVkLWJ5IGlmCj4geW91IGVuZCB1cCBhcHBseWlu
ZyB0aGlzLgo+IAo+IFRlc3RlZC1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5v
cmc+Cj4gCj4gQnJpYW4KPiAKPiAKPj4gT24gMy8yLzIwIDM6MzQgUE0sIFZpbGxlIFN5cmphbGEg
d3JvdGU6Cj4+PiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50
ZWwuY29tPgo+Pj4KPj4+IFRoZSBjdXJyZW50bHkgbGlzdGVkIGRvdGNsb2NrIGRpc2FncmVlcyB3
aXRoIHRoZSBjdXJyZW50bHkKPj4+IGxpc3RlZCB2cmVmcmVzaCByYXRlLiBDaGFuZ2UgdGhlIGRv
dGNsb2NrIHRvIG1hdGNoIHRoZSB2cmVmcmVzaC4KPj4+Cj4+PiBTb21lb25lIHRlbGwgbWUgd2hp
Y2ggKGlmIGVpdGhlcikgb2YgdGhlIGRvdGNsb2NrIG9yIHZyZXJlc2ggaXMKPj4+IGNvcnJlY3Q/
Cj4+Pgo+Pj4gQ2M6IEpvbmF0aGFuIE1hcmVrIDxqb25hdGhhbkBtYXJlay5jYT4KPj4+IENjOiBC
cmlhbiBNYXNuZXkgPG1hc25leWJAb25zdGF0aW9uLm9yZz4KPj4+IENjOiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Pj4gLS0tCj4+PiAgICBkcml2
ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCAyICstCj4+PiAgICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jIGIvZHJpdmVycy9ncHUvZHJtL3Bh
bmVsL3BhbmVsLXNpbXBsZS5jCj4+PiBpbmRleCBiMjRmZGYyMzk0NDAuLmY5NThkOGRmZDc2MCAx
MDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwo+Pj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCj4+PiBAQCAtMzk5Niw3
ICszOTk2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjX2RzaSBwYW5hc29uaWNf
dnZ4MTBmMDA0YjAwID0gewo+Pj4gICAgfTsKPj4+ICAgIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2Rpc3BsYXlfbW9kZSBsZ19hY3g0Njdha21fN19tb2RlID0gewo+Pj4gLQkuY2xvY2sgPSAxNTAw
MDAsCj4+PiArCS5jbG9jayA9IDEyNTQ5OCwKPj4+ICAgIAkuaGRpc3BsYXkgPSAxMDgwLAo+Pj4g
ICAgCS5oc3luY19zdGFydCA9IDEwODAgKyAyLAo+Pj4gICAgCS5oc3luY19lbmQgPSAxMDgwICsg
MiArIDIsCj4+PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
