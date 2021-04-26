Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0F036BA3E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 21:47:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8D289CD8;
	Mon, 26 Apr 2021 19:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9545E89CD8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 19:47:20 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id i24so7577969edy.8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 12:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=GX8W7VKitY33Z3gVOCMtn+bpTrU86ddhe4G/2IMvG/U=;
 b=lCqjHCmTeQlAzkx2RhVWEL0/gQtmSAOkf5qOUOqrUGoYBBs9T/g1RVsn+16+BgAswA
 edDZToYoa8Cd/iVrDFA5aL1yA5vDPtCRxnYpyXETHGJgOWkuuKQ1LVKX4Ikh0SOY/tTW
 qa6GuqHw8xcLOHnWpJY4stxdCVJqyEYJe+NYVOvLjWZfGSTyk6bcYZlPm+QH/AtMlPdW
 TQHjVSqxrBqdgMoD8hkhaA1oIMoXW5wxmTSLVwSIissHrgmrtKD7t+kLAZ0bnlHsUJAF
 rx3RX9ZTVsXRU6Z9+vAZbIsYADeRWsgkPH8pkMexP/W/pnuvE7UG560m+cn+/7Z7BJ/j
 rmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=GX8W7VKitY33Z3gVOCMtn+bpTrU86ddhe4G/2IMvG/U=;
 b=Zxcp44ktKZKkPRUyng/roWmfkppqzM75nboAgIyGvlnJgJHg7gDxlAC7/MHtU39MFF
 XvAMrVqZdnAiEdCIwVepUxI/mN/DJE0mENq8NNHYsS11oMmvkzZfo8UKmIQPvn8sZMvv
 uRVPTBTpUhRtcpdqZaYyoR4mWsRWTwprWtVhWqZtn5v7/kSBOskjNYHJYnvJ3DhnmlIu
 oAfdqYqtF5UMNPkKnEpaplmcrylJVPET2q5bbN0K7PybsK0FVUOtN8i1oxxvkkAqoifH
 8Zy9Q/NMHxN1JAJgnaSb/KMtStxbg1jJr/M0m2Hqlu7zdUjg8Pp2QisDYk6eKt82pz92
 N7Ew==
X-Gm-Message-State: AOAM531gcLEMMvdZUxk/CrXaPl+b83ChoZhQc9Xpa4GhyXYk6Fw0mOBW
 8440jqaIEXXSP0Ud8w7ZqWA=
X-Google-Smtp-Source: ABdhPJypPdtLyoNry6ggitdgtm/gf2QruZaatorvsFbddXKvuHm+iTPjCk/1LvSaq/K4llF4tIHYeQ==
X-Received: by 2002:a50:eb45:: with SMTP id z5mr328551edp.243.1619466439423;
 Mon, 26 Apr 2021 12:47:19 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:341f:e41b:d3f1:a3b5?
 ([2a02:908:1252:fb60:341f:e41b:d3f1:a3b5])
 by smtp.gmail.com with ESMTPSA id gt33sm11928421ejc.89.2021.04.26.12.47.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 12:47:19 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: cleanup ttm_agp_backend
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20210426175824.122557-1-christian.koenig@amd.com>
 <f245337776cb4949b2f36e1bb2d24c51@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <12493c6f-303a-6fc0-3219-2dbaae210c47@gmail.com>
Date: Mon, 26 Apr 2021 21:47:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <f245337776cb4949b2f36e1bb2d24c51@intel.com>
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
Cc: "bskeggs@redhat.com" <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAyNi4wNC4yMSB1bSAyMTozNiBzY2hyaWViIFJ1aGwsIE1pY2hhZWwgSjoKPj4gLS0tLS1P
cmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTogZHJpLWRldmVsIDxkcmktZGV2ZWwtYm91bmNl
c0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZgo+PiBDaHJpc3RpYW4gS8O2bmln
Cj4+IFNlbnQ6IE1vbmRheSwgQXByaWwgMjYsIDIwMjEgMTo1OCBQTQo+PiBUbzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+PiBDYzogYnNrZWdnc0ByZWRoYXQuY29tCj4+IFN1Ympl
Y3Q6IFtQQVRDSF0gZHJtL3R0bTogY2xlYW51cCB0dG1fYWdwX2JhY2tlbmQKPj4KPj4gQXVkaXQg
dGhlIGluY2x1ZGVzIGFuZCBzdG9wIGFjY2Vzc2luZyB0aGUgaW50ZXJuYWwgZHJtX21tX25vZGUu
Cj4+Cj4+IFRoZSB0dG1fcmVzb3VyY2U6OnN0YXJ0IHNob3VsZCBiZSB0aGUgc2FtZSB2YWx1ZSBh
cyB0aGUKPj4gZHJtX21tX25vZGU6OnN0YXJ0Lgo+ICJzaG91bGQgYmUiPwo+Cj4gQXJlIHlvdSBz
dXJlPyAg8J+YigoKTm9wZSwgdGhhdCdzIHdoeSBCZW4gaXMgb24gQ0MuIEhlIGV4cGxpY2l0bHkg
Y2hhbmdlZCB0aGF0IGZvciBub3V2ZWF1IAphYm91dCAxMCB5ZWFycyBhZ28gOikKCkJ1dCBJJ20g
cHJldHR5IHN1cmUgdGhhdCB0aGlzIGlzIGNvbXBsZXRlbHkgb3V0ZGF0ZWQgYW5kIG5vdCBuZWNl
c3NhcnkgCmFueSBtb3JlLgoKPiBJZiBpdCBpc24ndCwgaXMgdGhlcmUgYW4gaXNzdWU/Cj4KPiBJ
ZiB0aGV5IGFyZSB0aGUgc2FtZSAoc2V0IGluIHR0bV9yYW5nZV9tYW5fYWxsb2M/KSwgbWF5YmU6
Cj4KPiBUaGUgdHRtX3Jlc291cmNlOjpzdGFydCBpcyB0aGUgc2FtZSB2YWx1ZSBhcyB0aGUgZHJt
X21tX25vZGU6OnN0YXJ0LgoKWWVzLCBhcyBmYXIgYXMgSSBjYW4gc2VlIHRoYXQgaXMgdHJ1ZSBm
b3IgYWxsIGN1cnJlbnQgY29kZSBwYXRocy4gR29pbmcgCnRvIHVwZGF0ZSB0aGUgY29tbWl0IG1l
c3NhZ2UuCgo+Cj4gV2l0aCB0aGF0IGNoYW5nZToKPgo+IFJldmlld2VkLWJ5OiBNaWNoYWVsIEou
IFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4KClRoYW5rcywKQ2hyaXN0aWFuLgoKPgo+
IE0KPgo+PiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+Cj4+IC0tLQo+PiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9hZ3BfYmFja2VuZC5j
IHwgOCArKysrLS0tLQo+PiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYWdwX2Jh
Y2tlbmQuYwo+PiBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2FncF9iYWNrZW5kLmMKPj4gaW5k
ZXggMDIyNmFlNjlkM2FiLi42ZGRjMTZmMGZlMmIgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2FncF9iYWNrZW5kLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYWdwX2JhY2tlbmQuYwo+PiBAQCAtMzIsOCArMzIsOSBAQAo+Pgo+PiAjZGVmaW5lIHByX2Zt
dChmbXQpICJbVFRNXSAiIGZtdAo+Pgo+PiAtI2luY2x1ZGUgPGRybS90dG0vdHRtX2JvX2RyaXZl
ci5oPgo+PiAtI2luY2x1ZGUgPGRybS90dG0vdHRtX3BsYWNlbWVudC5oPgo+PiArI2luY2x1ZGUg
PGRybS90dG0vdHRtX2RldmljZS5oPgo+PiArI2luY2x1ZGUgPGRybS90dG0vdHRtX3R0Lmg+Cj4+
ICsjaW5jbHVkZSA8ZHJtL3R0bS90dG1fcmVzb3VyY2UuaD4KPj4gI2luY2x1ZGUgPGxpbnV4L2Fn
cF9iYWNrZW5kLmg+Cj4+ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KPj4gI2luY2x1ZGUgPGxp
bnV4L3NsYWIuaD4KPj4gQEAgLTUwLDcgKzUxLDYgQEAgaW50IHR0bV9hZ3BfYmluZChzdHJ1Y3Qg
dHRtX3R0ICp0dG0sIHN0cnVjdAo+PiB0dG1fcmVzb3VyY2UgKmJvX21lbSkKPj4gewo+PiAJc3Ry
dWN0IHR0bV9hZ3BfYmFja2VuZCAqYWdwX2JlID0gY29udGFpbmVyX29mKHR0bSwgc3RydWN0Cj4+
IHR0bV9hZ3BfYmFja2VuZCwgdHRtKTsKPj4gCXN0cnVjdCBwYWdlICpkdW1teV9yZWFkX3BhZ2Ug
PSB0dG1fZ2xvYi5kdW1teV9yZWFkX3BhZ2U7Cj4+IC0Jc3RydWN0IGRybV9tbV9ub2RlICpub2Rl
ID0gYm9fbWVtLT5tbV9ub2RlOwo+PiAJc3RydWN0IGFncF9tZW1vcnkgKm1lbTsKPj4gCWludCBy
ZXQsIGNhY2hlZCA9IHR0bS0+Y2FjaGluZyA9PSB0dG1fY2FjaGVkOwo+PiAJdW5zaWduZWQgaTsK
Pj4gQEAgLTc2LDcgKzc2LDcgQEAgaW50IHR0bV9hZ3BfYmluZChzdHJ1Y3QgdHRtX3R0ICp0dG0s
IHN0cnVjdAo+PiB0dG1fcmVzb3VyY2UgKmJvX21lbSkKPj4gCW1lbS0+aXNfZmx1c2hlZCA9IDE7
Cj4+IAltZW0tPnR5cGUgPSAoY2FjaGVkKSA/IEFHUF9VU0VSX0NBQ0hFRF9NRU1PUlkgOgo+PiBB
R1BfVVNFUl9NRU1PUlk7Cj4+Cj4+IC0JcmV0ID0gYWdwX2JpbmRfbWVtb3J5KG1lbSwgbm9kZS0+
c3RhcnQpOwo+PiArCXJldCA9IGFncF9iaW5kX21lbW9yeShtZW0sIGJvX21lbS0+c3RhcnQpOwo+
PiAJaWYgKHJldCkKPj4gCQlwcl9lcnIoIkFHUCBCaW5kIG1lbW9yeSBmYWlsZWRcbiIpOwo+Pgo+
PiAtLQo+PiAyLjI1LjEKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
