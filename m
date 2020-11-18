Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0892B2B7D58
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 13:09:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6696E3DB;
	Wed, 18 Nov 2020 12:09:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878D56E3DB
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 12:09:55 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id k4so1763743edl.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 04:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=BVvWTIYZzpIL5aPhySWvuY8bNfMmK6T7pBoHumK+Vtw=;
 b=bWugrFus3GG6oDxdH0esDbeQTwfqsy6/eRMPZj7nHGPhapZVMvjp1Pg0N3H7DdHFHK
 21YZlHDu1nc7sBXPI5yOLdgUdkdYi3ItKeLB5O1RIlUUlI/a2q4jrC1YmT7Rr7i/GN8T
 G7MS6yRz9Ko5F3djcwufaGdtWz+4NP+ATUj9hS5Qs9DABU4JkkrOhwju+2gTdwFc4SP5
 YROrSdkEFe3/lhU62l+1v6MKljlCZs8hBeDJo66t+kpkl477cNigfS9TSLsFa5jrOP4i
 tWBZF/8mTU/NHMeLLY2RC/OhsewyjPt3QoUM6nlt4UAhdpaoyE75kOlOfRLZKnaBXlda
 T/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=BVvWTIYZzpIL5aPhySWvuY8bNfMmK6T7pBoHumK+Vtw=;
 b=a1stzTvRR6ajnZkm0sdBgID20g94YFlpw9CtWfgwEsgSManh1w4159974c2B/hs9mU
 vmPLdk0o11JkvzYV4lch1fdOQoXBnx/rsJ3olcBxVUpIxFW7EItpMxOaqhWf4X1Hy74W
 cSxjOCOK3M3gJ/UKVqIQMdZ89Nuv7mbkA/wNthuSjM+dkd/A83SHgZXVp8/G3Ci3ammT
 /pFyWua7gUJDRTYP24vuJ87EqmLWBROP5Lw50cLhGzOFCmcaYzTJUDv7+Ml/ss96FaFF
 9yhFuuFVEz/Ay7aWh5uS+QBhwrSYS12Uai4D1L5IjPAkgBud9Mg90hqLnAQRzXZzydI2
 MruA==
X-Gm-Message-State: AOAM531lMYwjwuUPIb2ODTy1TUmmdaQROQSaBwBOM9UgnDyXUprj8cJ3
 zcIOrT29Z6JVQPcqsXrMo4k=
X-Google-Smtp-Source: ABdhPJyfnAUAPKO0zkVhzhiKFaHVrTlUZkQ2jvrh8AbOaT0y1I3dRgys/4DO5UmrDpJ7o8PoKtlPjQ==
X-Received: by 2002:aa7:c448:: with SMTP id n8mr6224439edr.10.1605701394163;
 Wed, 18 Nov 2020 04:09:54 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k17sm12517436ejj.1.2020.11.18.04.09.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 04:09:53 -0800 (PST)
Subject: Re: [PATCH 3/3] drm/ttm: make up to 90% of system memory available
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>
References: <20201117140615.255887-1-christian.koenig@amd.com>
 <20201117140615.255887-3-christian.koenig@amd.com>
 <3ac0fdcd-9e2e-fcfa-aba2-e3840801f25d@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a25a789f-3105-7045-ec64-77abc56196e4@gmail.com>
Date: Wed, 18 Nov 2020 13:09:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3ac0fdcd-9e2e-fcfa-aba2-e3840801f25d@daenzer.net>
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
Reply-To: christian.koenig@amd.com
Cc: airlied@linux.ie, Felix.Kuehling@amd.com, sroland@vmware.com,
 dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMTEuMjAgdW0gMTc6Mzggc2NocmllYiBNaWNoZWwgRMOkbnplcjoKPiBPbiAyMDIwLTEx
LTE3IDM6MDYgcC5tLiwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4gSW5jcmVhc2UgdGhlIGFt
bW91bnQgb2Ygc3lzdGVtIG1lbW9yeSBkcml2ZXJzIGNhbiB1c2UgdG8gYWJvdXQgOTAlIG9mCj4+
IHRoZSB0b3RhbCBhdmFpbGFibGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gLS0tCj4+IMKgIGRyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMgfCAyICstCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKPj4gaW5kZXggYTk1ODEzNWNi
M2ZlLi4wYTkzZGY5M2RiYTQgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvLmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiBAQCAtMTI2Nyw3
ICsxMjY3LDcgQEAgc3RhdGljIGludCB0dG1fYm9fZ2xvYmFsX2luaXQodm9pZCkKPj4gwqDCoMKg
wqDCoMKgICogdGhlIGF2YWlsYWJsZSBzeXN0ZW0gbWVtb3J5Lgo+PiDCoMKgwqDCoMKgwqAgKi8K
Pj4gwqDCoMKgwqDCoCBudW1fcGFnZXMgPSAodTY0KXNpLnRvdGFscmFtICogc2kubWVtX3VuaXQ7
Cj4+IC3CoMKgwqAgbnVtX3BhZ2VzID0gKG51bV9wYWdlcyAqIDUwIC8gMTAwKSA+PiBQQUdFX1NI
SUZUOwo+PiArwqDCoMKgIG51bV9wYWdlcyA9IChudW1fcGFnZXMgKiA5MCAvIDEwMCkgPj4gUEFH
RV9TSElGVDsKPj4gwqAgwqDCoMKgwqDCoCAvKiBCdXQgZm9yIERNQTMyIHdlIGxpbWl0IG91cnNl
bGYgdG8gb25seSB1c2UgMkdpQiBtYXhpbXVtLiAqLwo+PiDCoMKgwqDCoMKgIG51bV9kbWEzMl9w
YWdlcyA9ICh1NjQpKHNpLnRvdGFscmFtIC0gc2kudG90YWxoaWdoKSAqIHNpLm1lbV91bml0Owo+
Pgo+Cj4gVGhpcyBzaG91bGQgdXBkYXRlIHRoZSBjb21tZW50IGFkZGVkIGluIHBhdGNoIDEuCgpZ
ZWFoIGluZGVlZCwgSSd2ZSB0ZXN0ZWQgdGhpcyB3aXRoIDcwLCA3NSwgODAsIDg1IGFuZCBmaW5h
bGx5IDkwIGFuZCBpdCAKbG9va3MgbGlrZSBJJ3ZlIGZvcmdvdCB0byB1cGRhdGUgdGhlIGNvbW1l
bnQgYWZ0ZXIgYSB3aGlsZS4KClRoYW5rcywKQ2hyaXN0aWFuLgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
