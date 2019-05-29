Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B082E28B
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 18:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0946E129;
	Wed, 29 May 2019 16:50:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E2E6E129
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 16:50:53 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id y2so1048573ybo.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 09:50:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lzducq5pLtOJc/QJvOl/HHEtxGv47/FgH9ba1qcuqXE=;
 b=XCDPVsbHwdZaKQnkv8zBB4iiYvMw5TA+YxQA95Hs4UT8u70lbqxgGm31/PKaHTVqY8
 lsrUkLw8eixGTa3NYxkT6JHmPaE2IKjbpfrsBk/nCiOZCW//ZPMZ3/u1QUH1ZFsiKiLq
 t63R8ayMTLj8BSijpfC1ByorCDIq3UTy7mprtcyMHY3nIw9Zt+UIdKXFYK1WOgRExR8v
 eIIhE17Wx1tvmXpioFXyOtrCbOY6UbhnCqMzbN9e1BtUgyNbwXYKNrhDmC3Gjvw6jMln
 VFtNeW0rO2PrWX72b9Iq1hNFklzd85kAFdd+SIMe8p9NP+t/mf0q3OMxmqLnceYYoQb3
 KruQ==
X-Gm-Message-State: APjAAAUjyRZR2nToSAgSggiHphzO03VSxnXGAxng9FU9vgOqc23tVndA
 it8S/ETGzUt6oDZF9MKfGDNeAagkyWX472Fkeg2Cigz6
X-Google-Smtp-Source: APXvYqzbB+dNJX5lNlF1kmBmT52yTRYmejda5xWOy68c85e+AZWK94O6JAR8vMEjgYZgnBSsjIEH+sWxLdKHiKZ13WQ=
X-Received: by 2002:a25:e647:: with SMTP id d68mr16459118ybh.422.1559148652397; 
 Wed, 29 May 2019 09:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190529110204.2384-1-ville.syrjala@linux.intel.com>
 <20190529110204.2384-2-ville.syrjala@linux.intel.com>
 <CADnq5_OC_fOj6RAagFp2-LuBYp4o3KZJ5NPScKwiu0MY1H1EVw@mail.gmail.com>
In-Reply-To: <CADnq5_OC_fOj6RAagFp2-LuBYp4o3KZJ5NPScKwiu0MY1H1EVw@mail.gmail.com>
From: Mario Kleiner <mario.kleiner.de@gmail.com>
Date: Wed, 29 May 2019 18:50:40 +0200
Message-ID: <CAEsyxyig_2YappaFkekMEWBnG-L9pJULPWj0p-vooVV8BdqHiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/edid: Ignore "DFP 1.x" bit for EDID 1.2 and
 earlier
To: Alex Deucher <alexdeucher@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lzducq5pLtOJc/QJvOl/HHEtxGv47/FgH9ba1qcuqXE=;
 b=t3HQhfjiECA11zVXk4jm2Ah2gzgEqi1aU8rBWpEqMJevZcBj4e9pcIrO+WCEBtcKA+
 I2UZXtNaQa9AHHk4FI8xf5/g/n1swctBXh1aL1rScep5GTiP9ecBWux4zKlehQG6dEPX
 1oChS0NhHaSHGc0qS+/iFfu6Q5+muZ9gTuNt9NCnYOPAQK5pFL1ckZkb5ufg1KgmBHvR
 GKMTAygrtkMlYjpAQq9RtbxO06666n+PfGltEP3SfY+9ayF91+0R2nw4aele4JHLQi3f
 r0GM5DYLOJkr2oppKCxvMzX69gUeunek2vPkpFaL2dewrj/a2Gcxjj1XyP9AnsDD8tVj
 iZBQ==
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgNzowMiBBTSBWaWxsZSBTeXJqYWxhCjx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZp
bGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+Cj4gRnJvbSBWRVNBIEVESUQgaW1wbGVtZW50
YXRpb24gZ3VpZGUgdjEuMDoKPiAiRm9yIEVESUQgdmVyc2lvbiAxIHJldmlzaW9uIDIgb3IgZWFy
bGllciBkYXRhIHN0cnVjdHVyZXMgd2hlbiBvZmZzZXQgMTRoCj4gIGJpdCA3IGlzIHNldCB0byBv
bmUsIHRoZSB2YWx1ZSBvZiBiaXRzIDYtMCBhcmUgdW5kZWZpbmVkLCBhbmQgdGhlcmVmb3JlCj4g
IGNhbm5vdCBiZSBpbnRlcnByZXRlZCB0byBtZWFuIGFueXRoaW5nLiIKPgo+IEFuZCBzaW5jZSBF
RElEIDEuNCByZWRlZmluZXMgdGhhdCBiaXQgbGV0J3MgY29uc3VsdCBpdCBvbmx5IGZvcgo+IEVE
SUQgMS4zLgo+Cj4gQ2M6IE1hcmlvIEtsZWluZXIgPG1hcmlvLmtsZWluZXIuZGVAZ21haWwuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+CgpZZXMuIFNlcmllcyBpczoKUmV2aWV3ZWQtYnk6IE1hcmlvIEtsZWluZXIgPG1h
cmlvLmtsZWluZXIuZGVAZ21haWwuY29tPgoKLW1hcmlvCgpPbiBXZWQsIE1heSAyOSwgMjAxOSBh
dCAzOjUwIFBNIEFsZXggRGV1Y2hlciA8YWxleGRldWNoZXJAZ21haWwuY29tPiB3cm90ZToKPgo+
IE9uIFdlZCwgTWF5IDI5LCAyMDE5IGF0IDc6MDIgQU0gVmlsbGUgU3lyamFsYQo+IDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gRnJvbTogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+Cj4gPiBGcm9tIFZFU0EgRURJ
RCBpbXBsZW1lbnRhdGlvbiBndWlkZSB2MS4wOgo+ID4gIkZvciBFRElEIHZlcnNpb24gMSByZXZp
c2lvbiAyIG9yIGVhcmxpZXIgZGF0YSBzdHJ1Y3R1cmVzIHdoZW4gb2Zmc2V0IDE0aAo+ID4gIGJp
dCA3IGlzIHNldCB0byBvbmUsIHRoZSB2YWx1ZSBvZiBiaXRzIDYtMCBhcmUgdW5kZWZpbmVkLCBh
bmQgdGhlcmVmb3JlCj4gPiAgY2Fubm90IGJlIGludGVycHJldGVkIHRvIG1lYW4gYW55dGhpbmcu
Igo+ID4KPiA+IEFuZCBzaW5jZSBFRElEIDEuNCByZWRlZmluZXMgdGhhdCBiaXQgbGV0J3MgY29u
c3VsdCBpdCBvbmx5IGZvcgo+ID4gRURJRCAxLjMuCj4gPgo+ID4gQ2M6IE1hcmlvIEtsZWluZXIg
PG1hcmlvLmtsZWluZXIuZGVAZ21haWwuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPgo+IFNlcmllcyBpczoKPiBS
ZXZpZXdlZC1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+Cj4g
PiAtLS0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDQgKystLQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkLmMKPiA+IGluZGV4IGRkNjAxZWQ2YTMwZS4uYzMyOTZhNzJmZmY5IDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZWRpZC5jCj4gPiBAQCAtNDU2OSw4ICs0NTY5LDggQEAgdTMyIGRybV9hZGRfZGlzcGxheV9p
bmZvKHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsIGNvbnN0IHN0cnVjdCBlZGlkICpl
ZGkKPiA+ICAgICAgICAgICogdGVsbHMgdXMgdG8gYXNzdW1lIDggYnBjIGNvbG9yIGRlcHRoIGlm
IHRoZSBFRElEIGRvZXNuJ3QgaGF2ZQo+ID4gICAgICAgICAgKiBleHRlbnNpb25zIHdoaWNoIHRl
bGwgb3RoZXJ3aXNlLgo+ID4gICAgICAgICAgKi8KPiA+IC0gICAgICAgaWYgKChpbmZvLT5icGMg
PT0gMCkgJiYgKGVkaWQtPnJldmlzaW9uIDwgNCkgJiYKPiA+IC0gICAgICAgICAgIChlZGlkLT5p
bnB1dCAmIERSTV9FRElEX0RJR0lUQUxfREZQXzFfWCkpIHsKPiA+ICsgICAgICAgaWYgKGluZm8t
PmJwYyA9PSAwICYmIGVkaWQtPnJldmlzaW9uID09IDMgJiYKPiA+ICsgICAgICAgICAgIGVkaWQt
PmlucHV0ICYgRFJNX0VESURfRElHSVRBTF9ERlBfMV9YKSB7Cj4gPiAgICAgICAgICAgICAgICAg
aW5mby0+YnBjID0gODsKPiA+ICAgICAgICAgICAgICAgICBEUk1fREVCVUcoIiVzOiBBc3NpZ25p
bmcgREZQIHNpbmsgY29sb3IgZGVwdGggYXMgJWQgYnBjLlxuIiwKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29ubmVjdG9yLT5uYW1lLCBpbmZvLT5icGMpOwo+ID4gLS0KPiA+IDIuMjEu
MAo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
