Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A186A24C22B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 665FE6E971;
	Thu, 20 Aug 2020 15:27:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFCD6E971;
 Thu, 20 Aug 2020 15:27:46 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z18so2393148wrm.12;
 Thu, 20 Aug 2020 08:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=mPqlvBUfw8vukR9JWsM5IjdNZByovFmBmkj5vqYjAT4=;
 b=iwCMIYBTHjYh8sTji47kI23CRk6PCVGMCSpjOk2gndYPbnx+S1S3xkxTQCmCp8y2lI
 NNf30KYRgZoMGaC/gQiL4C1P3/opic3OUUucr4LunEqp2mKLGnZi1CtNo0zmJzDoJT8A
 g76IOIo6L3M56oaAZBP47dmXOIdQOYTFhAdLUISOWOIOb1vTNsj6ucCZIBTHplvlilTT
 S+RYrWa8FtVjkjqCxQeZGIj8OnzLikJ7H/2o6Rtcp/iwnhUiviBDhE0sK5ntb9BnSKNK
 qN+v2+tBPHCQM+Rt560ULQTZMOJpJRW7h0C83jzALLqm/ctHJ+7irZQh8nIs8d+TcFH8
 j2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=mPqlvBUfw8vukR9JWsM5IjdNZByovFmBmkj5vqYjAT4=;
 b=gkncuC27tqTAajwrnCickeWnodt+VIY4BylqQs7GKLnvoKb2Qhv47iKsOExuQmU59C
 HG3LwiO2kvvjY3wenz8nOPDGDSOHSfdDXd0ReNlASK2EhMlgDBm/UYq5KqGa6wNQdq97
 hlE7t+qWdzy5dG2AQuQc3EWsOFL1xszHQaW2GiuXq3nImDddzDiTBQGgmX/2wCONPuj2
 qn7X/47VYz4dZDsg72VPGjB+la5YEFmTYiaosWyyh2k6q6xm2PImpYYLlMqC4CVbcVot
 nI3LMEJev4n/zgZKSB06JPw2Q1Tip7kQ09z6PO7B0fde433xxGFfX6qp4dWwHH9V7227
 P7MA==
X-Gm-Message-State: AOAM533N0hHDtbL0NoFoKRcU0M4+a8/5ncN2UKRsSA2mbUtGTJThcH2m
 oU1PKkpUai5Ej1dl1X3yjDm8k5Mnd74=
X-Google-Smtp-Source: ABdhPJy5CCW0R/gJGagL3rV1s2XsR2DcnVFV8TPe2l98gUbRRv1K3cjQi8l0yoMBv9dO0bT+c8Q2KQ==
X-Received: by 2002:adf:f488:: with SMTP id l8mr3668734wro.123.1597937264854; 
 Thu, 20 Aug 2020 08:27:44 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id y24sm4677490wmi.17.2020.08.20.08.27.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Aug 2020 08:27:44 -0700 (PDT)
Subject: Re: [PATCH 1/2] drm/ttm: fix broken merge between drm-next and
 drm-misc-next
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: airlied@gmail.com, skeggsb@gmail.com, dri-devel@lists.freedesktop.org,
 Nouveau@lists.freedesktop.org
References: <20200820152404.22774-1-christian.koenig@amd.com>
 <20200820152404.22774-2-christian.koenig@amd.com>
Message-ID: <479d13d3-211e-7ac3-be06-4091b746f9f1@gmail.com>
Date: Thu, 20 Aug 2020 17:27:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200820152404.22774-2-christian.koenig@amd.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGxlYXNlIGlnbm9yZSB0aGlzIG9uZSwgaXQncyB0byBob3QgaGVyZSBhbmQgSSdtIHR5cGluZyB0
byBmYXN0IDopCgpDaHJpc3RpYW4uCgpBbSAyMC4wOC4yMCB1bSAxNzoyNCBzY2hyaWViIENocmlz
dGlhbiBLw7ZuaWc6Cj4gZHJtLW5leHQgcmV2ZXJ0ZWQgdGhlIGNoYW5nZXMgdG8gdHRtX3R0X2Ny
ZWF0ZSgpIHRvIGRvIHRoZQo+IE5VTEwgY2hlY2sgaW5zaWRlIHRoZSBmdW5jdGlvbiwgYnV0IGRy
bS1taXNjLW5leHQgYWRkcyBuZXcKPiB1c2VycyBvZiB0aGlzIGFwcHJvYWNoLgo+Cj4gUmUtYXBw
bHkgdGhlIE5VTEwgY2hlY2sgY2hhbmdlIGluc2lkZSB0aGUgZnVuY3Rpb24gdG8gZml4IHRoaXMu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4gUmV2aWV3ZWQtYnk6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+Cj4g
TGluazogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzM4NjYyOC8KPiAt
LS0KPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAyICstCj4gICBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV90dC5jIHwgNCArKystCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IGluZGV4IDk3YWM2
NjJhNDdjYi4uZTM5MzFlNTE1OTA2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gQEAgLTExODAs
NyArMTE4MCw3IEBAIGludCB0dG1fYm9fdmFsaWRhdGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0
ICpibywKPiAgIAkvKgo+ICAgCSAqIFdlIG1pZ2h0IG5lZWQgdG8gYWRkIGEgVFRNLgo+ICAgCSAq
Lwo+IC0JaWYgKGJvLT5tZW0ubWVtX3R5cGUgPT0gVFRNX1BMX1NZU1RFTSAmJiBiby0+dHRtID09
IE5VTEwpIHsKPiArCWlmIChiby0+bWVtLm1lbV90eXBlID09IFRUTV9QTF9TWVNURU0pIHsKPiAg
IAkJcmV0ID0gdHRtX3R0X2NyZWF0ZShibywgdHJ1ZSk7Cj4gICAJCWlmIChyZXQpCj4gICAJCQly
ZXR1cm4gcmV0Owo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+IGluZGV4IDlhYTRmYmUzODZlNi4uMWNjZjFl
ZjA1MGQ2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4gQEAgLTUwLDYgKzUwLDkgQEAgaW50IHR0
bV90dF9jcmVhdGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9vbCB6ZXJvX2FsbG9j
KQo+ICAgCj4gICAJZG1hX3Jlc3ZfYXNzZXJ0X2hlbGQoYm8tPmJhc2UucmVzdik7Cj4gICAKPiAr
CWlmIChiby0+dHRtKQo+ICsJCXJldHVybiAwOwo+ICsKPiAgIAlpZiAoYmRldi0+bmVlZF9kbWEz
MikKPiAgIAkJcGFnZV9mbGFncyB8PSBUVE1fUEFHRV9GTEFHX0RNQTMyOwo+ICAgCj4gQEAgLTY3
LDcgKzcwLDYgQEAgaW50IHR0bV90dF9jcmVhdGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywgYm9vbCB6ZXJvX2FsbG9jKQo+ICAgCQlwYWdlX2ZsYWdzIHw9IFRUTV9QQUdFX0ZMQUdfU0c7
Cj4gICAJCWJyZWFrOwo+ICAgCWRlZmF1bHQ6Cj4gLQkJYm8tPnR0bSA9IE5VTEw7Cj4gICAJCXBy
X2VycigiSWxsZWdhbCBidWZmZXIgb2JqZWN0IHR5cGVcbiIpOwo+ICAgCQlyZXR1cm4gLUVJTlZB
TDsKPiAgIAl9CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
