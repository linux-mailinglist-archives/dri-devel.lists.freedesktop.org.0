Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F8E25FC7
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 10:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E5488EAA;
	Wed, 22 May 2019 08:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C43688EAA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 08:49:53 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id 7so1285069wmo.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 01:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=XkHFIOWrEzpXLUiqalMJfXXfNEtXqxO5XiPioqkS/qA=;
 b=L9lUl9dICTBBwCaqiRWYzD7p33IUF1pt1kVvYlJ+jjo2+y4vp0CrBok++0ttTmtvgM
 EkG/8vK8HnSqr0ApXfozxe/YHGfEA6IhWmqiyEjmsDF/HfQq2ABz/yTEt1Px9hm9EFLp
 bGNpnQ2RRE0pCAMNbF5cmsMh6EoFXxCboTxTqC85fjI1dPkTs1Zkm46o8plNSPsIAjj1
 y6NMf7YSioy9QzFh8W6yCsVfgq6os2AZDjFnqfa61koeFG1ktNu2qxMZ6P+iHx9JbaIA
 l8eG10z1XkBu+VS6b0vdt3LimjdxSlGJtvfXCFbKgxbFFy1btR5dXnIJBWvmT1eon8hH
 DyNA==
X-Gm-Message-State: APjAAAUJGRhymhqBMraFEm+11lFq4sKzD00WuzOwjixIextmCxd2qsKE
 X5BsFlJ82+r/F8+LuDDQD0bbCoTw
X-Google-Smtp-Source: APXvYqwqaB2woq4vouYdhnnKl58OfHOJ3d4+v9VCLjnmVRQuUOdnCm6avzEdTEhYDMwbVHZoUeL4xg==
X-Received: by 2002:a1c:414:: with SMTP id 20mr6424143wme.84.1558514991849;
 Wed, 22 May 2019 01:49:51 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id h12sm16348923wre.14.2019.05.22.01.49.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 01:49:51 -0700 (PDT)
Subject: Re: [PATCH 1/6] dma-buf: add dynamic DMA-buf handling v8
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190515143831.1639-1-christian.koenig@amd.com>
 <20190522081949.GU21222@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c7324bd8-e003-207e-af80-96bcbdf8870a@gmail.com>
Date: Wed, 22 May 2019 10:49:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522081949.GU21222@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=XkHFIOWrEzpXLUiqalMJfXXfNEtXqxO5XiPioqkS/qA=;
 b=FIxGYDUUZsWXsm6867cNdL80F67Cgjs4uoyyncjl2GkXJ/epdDj8JeRW2DOSEwyo+d
 eMAnS6r3lLUz7qNL2qoFvm056mgpBFxqx7KyKxqabOkKqAQ3sJtGiuvte7vtX15oVSNf
 yHhiyjr7TkUCZLDw+V1NJPKwGSMXWEqepwDNg1S7BRQJYIGALLRirGOiaxoRpBAYY/bG
 sMsXfSOKP82vMRt2uQ2I4J57uhRlc5PT0Mj80vM/dE1EfAS3TdJA11DIksaMIkAHn72R
 SzYuFNrkoJCvI24S9roe+CNabPihEQ3q4O+x2yyKFg36QTU6DaQv1TTD5bdePsh0kcge
 nfeg==
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
Reply-To: christian.koenig@amd.com
Cc: dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjIuMDUuMTkgdW0gMTA6MTkgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgTWF5
IDE1LCAyMDE5IGF0IDA0OjM4OjI2UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4g
W1NOQVBdCj4gSnVzdCB0aGlzIGZ1bmN0aW9uYWwgY29tbWVudCwgc2luY2UgSSB0aGluayBhcGkg
ZGV0YWlsIHBvbGlzaGluZyBpcwo+IHByZW1hdHVyZSBpZiB3ZSdyZSBub3QgeWV0IGF3YXJlIG9m
IGhvdyB0aGlzIHdvcmtzLgo+Cj4+ICsJLyogV2hlbiB0aGUgaW1wb3J0ZXIgaXMgZHluYW1pYyBi
dXQgdGhlIGV4cG9ydGVyIGlzbid0IHdlIG5lZWQgdG8gY2FjaGUKPj4gKwkgKiB0aGUgbWFwcGlu
ZyBvciBvdGhlcndpc2Ugd291bGQgcnVuIGludG8gaXNzdWVzIHdpdGggdGhlIHJlc2VydmF0aW9u
Cj4+ICsJICogb2JqZWN0IGxvY2suCj4+ICsJICovCj4+ICsJaWYgKGRtYV9idWZfYXR0YWNobWVu
dF9pc19keW5hbWljKGF0dGFjaCkgJiYKPj4gKwkgICAgIWRtYV9idWZfaXNfZHluYW1pYyhkbWFi
dWYpKSB7Cj4gSXNuJ3QgdGhpcyB0aGUgd3Jvbmcgd2F5IHJvdW5kPyBkeW5hbWljIGltcG9ydGVy
cyBzaG91bGQgYmUgcGVyZmVjdGx5IGZpbmUKPiB3aXRoIHRoZSByZXNlcnZhdGlvbiBsb2NrcyBp
biB0aGVpciBtYXAvdW5tYXAgcGF0aHMsIGl0J3MgaW1wb3J0ZXJzCj4gY2FsbGluZyBleHBvcnRl
cnMgdGhlcmUuCj4KPiBUaGUgcmVhbCBwcm9ibGVtIGlzIGEgbm90LWR5bmFtaWMgaW1wb3J0ZXIs
IHdoaWNoIGhhc24ndCBiZSBhZGp1c3RlZCB0bwo+IGFsbG93IHRoZSByZXNlcnZhdGlvbiBsb2Nr
IGluIHRoZWlyIHBhdGhzIHdoZXJlIHRoZXkgbWFwL3VubWFwIGEgYnVmZmVyLAo+IHdpdGggYSBk
eW5hbWljIGV4cG9ydGVyLiBUaGF0J3Mgd2hlcmUgd2UgbmVlZCB0byBjYWNoZSB0aGUgbWFwcGlu
ZyB0bwo+IGF2b2lkIHRoZSBkZWFkbG9jayAob3IgaGF2aW5nIHRvIGNoYW5nZSBldmVyeW9uZSkK
CldlbGwgY291bGQgYmUgdGhhdCB0aGlzIGlzIGFsc28gYSBwcm9ibGVtLCBidXQgSSBhY3R1YWxs
eSBkb24ndCB0aGluayBzby4KClRoZSBjYXNlIEknbSBkZXNjcmliaW5nIGhlcmUgY2VydGFpbmx5
IGlzIHRoZSBtb3JlIG9idmlvdXMgcHJvYmxlbSAKYmVjYXVzZSB0aGUgaW1wb3J0ZXIgaXMgYWxy
ZWFkeSBob2xkaW5nIHRoZSBsb2NrIHRoZSBleHBvcnRlciB3YW50cyB0byB0YWtlLgoKT24gdGhl
IG90aGVyIGhhbmQgd2UgY291bGQgcmF0aGVyIGVhc2lseSBjaGFuZ2UgdGhhdCBjaGVjayB0byAK
ZG1hX2J1Zl9hdHRhY2htZW50X2lzX2R5bmFtaWMoKSAhPSBkbWFfYnVmX2lzX2R5bmFtaWMoKSBp
ZiB0aGF0IGlzIAppbmRlZWQgYSBwcm9ibGVtLgoKPj4gKwkJc3RydWN0IHNnX3RhYmxlICpzZ3Q7
Cj4+ICsKPj4gKwkJc2d0ID0gZG1hYnVmLT5vcHMtPm1hcF9kbWFfYnVmKGF0dGFjaCwgRE1BX0JJ
RElSRUNUSU9OQUwpOwo+IEFuZCB1bmZvcnR1bmF0ZWx5IHRoZSBub24tZHluYW1pYywgaS5lLiBs
ZWdhY3kvY3VycmVudCBjb2RlIGltcG9ydGVyIGlzCj4gYWxzbyB0aGUgb25lIHdoaWNoIHVzZXMg
b3RoZXIgZmxhZ3MgdGhhbiBETUFfQklESVJFQ1RJT05BTC4gQXQgbGVhc3Qgb24KPiBBUk0sIGFu
ZCB0aGF0J3MgdGhlIG9ubHkgcGxhY2Ugd2hlcmUgdGhpcyBtYXR0ZXJzIGJlY2F1c2UgdGhlcmUg
dGhlIGRtYQo+IGFwaSBtaWdodCBkbyBjYWNoZSBmbHVzaGluZy4KCldlbGwgdGhlIG9ubHkgaW1w
bGVtZW50ZXIgZm9yIG5vdyBpcyBhbWRncHUsIGFuZCBhbWRncHUgYWx3YXlzIHJlcXVpcmVzIAph
IGNvaGVyZW50IGJpZGlyZWN0aW9uYWwgbWFwcGluZy4KClNvIHRoaXMgd29uJ3QgYmUgYSBwcm9i
bGVtIHVubGVzcyB0aGUgQVJNIGRyaXZlcnMgc3RhcnQgdG8gaW1wbGVtZW50IApkeW5hbWljIERN
QS1idWYgaGFuZGxpbmcgdGhlbXNlbHZlcyBvciBzdGFydCB0byB0YWxrIHRvIGFtZGdwdSAod2hp
Y2ggCndvdWxkbid0IGhhdmUgd29ya2VkIGJlZm9yZSBhbnl3YXkpLgoKQ2hyaXN0aWFuLgoKPiBD
aGVlcnMsIERhbmllbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
