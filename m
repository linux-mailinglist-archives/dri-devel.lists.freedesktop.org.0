Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1609A51993
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 19:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E301689C28;
	Mon, 24 Jun 2019 17:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A68C89C28;
 Mon, 24 Jun 2019 17:31:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p13so14777327wru.10;
 Mon, 24 Jun 2019 10:31:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=NfqTzTK7U1vhmZcFA1kQk8dp4zFCjJ1FmPQVmQA2jDk=;
 b=TAcDhQI8VonQ+qdZgrgdaJFXQfbrlqsnh88xjJlXL1QyD8fGmXOPL7cdzf8RsczQgZ
 m1Ynj4SIZPH6ZQlXv9cMNmSaVxTDHOrQPwltdeQpCbqpXKD4Vx1hpMWjzvBf3tTAqYGv
 u3UpklUMSp/S5dW9pIr995HQ1FvQVYKBnK6OrmaCX4J3l5lTewxvwzBlyeBBFzRW6a5l
 dGXOkdPa80NR5tHRb5252gkTEbF0RWoDEZfTouUe/28lsArTUlW3zrciQp3gTNKmHsoU
 GVhyx5BKoS9ReBQPzX6wEtjXybin22WCSaIoZTWlG50Es9I8mZ57+kuWf1O3nj63tZkj
 cMzg==
X-Gm-Message-State: APjAAAXapRZU8fa/THMTpZW0bMEBVLC56pV1MlvdW/da7iWRVlth61Cc
 J/RbJjO3pY/HVSwyfAkxK/5C0prQ
X-Google-Smtp-Source: APXvYqwLtqWIIJp9om0HXdveb/ghjVKsE6KceVocrUiUB21ls8B3wcJ4UMsU5rhWHAuHH+Iv/IuaPA==
X-Received: by 2002:adf:ed50:: with SMTP id u16mr18436641wro.108.1561397476677; 
 Mon, 24 Jun 2019 10:31:16 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id g11sm10802580wru.24.2019.06.24.10.31.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 10:31:16 -0700 (PDT)
Subject: Re: [PATCH libdrm 0/9] amdgpu:
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 amd-gfx@lists.freedesktop.org
References: <20190624165406.13682-1-michel@daenzer.net>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b48aae10-c1db-b76b-ddde-9c0a47028633@gmail.com>
Date: Mon, 24 Jun 2019 19:31:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190624165406.13682-1-michel@daenzer.net>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=NfqTzTK7U1vhmZcFA1kQk8dp4zFCjJ1FmPQVmQA2jDk=;
 b=AA6s+McqH1T4Mgearw34bfBYyBZE7eOsoG8T+DuJjq9DQxxUzDD9d6n2oeYVOTKjid
 cZa42+QVi3js4rrB/hXAI4bwe09DvNbaxtQ08IIF5s5FxGhpI3V7CjnlrLsyb91/5y6+
 rWzH+4gH77JgvzK/UltSWZW4Iw0lQVsaGEAI8nsu4rCi476mTgp+xde6uWR/CH3L8YDW
 EYBCbT26s3eeUPWgtZsmNPs+Ddb6+P2a9wLoieTyu1T2UQLgxFuLMdIjvqdxI6Em5yBI
 M6SAB4QGtKzpbe+YuUCJASnjx/Sgd+91KYBSfyBUhPt/3fltVFDTsnb3c/HTudIcacL3
 tKSg==
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGF0Y2hlcyAjMSAtICMzIGxvb2sgZ29vZCB0byBtZSwgYnV0IEknbSBub3Qgc3VyZSBpZiB0aGUg
cmVzdCBpcyBzdWNoIGEgCmdvb2QgaWRlYS4KCkJhc2ljYWxseSB5b3Ugbm90IG9ubHkgd2FudCB0
byB1c2UgdGhlIHNhbWUgRkQgZm9yIENTLCBidXQgYWxzbyBmb3IgCmJhc2ljYWxseSBhbGwgYnVm
ZmVyIGZ1bmN0aW9ucyBhbmQgYXMgZmFyIGFzIEkgY2FuIHNlZSB3ZSBicmVhayB0aGF0IGhlcmUu
CgpJIHdvdWxkIHJhdGhlciBhZGQgYSBuZXcgZnVuY3Rpb24gdG8gZXhwb3J0IHRoZSBLTVMgaGFu
ZGxlIGZvciBhIGNlcnRhaW4gCkJPL0ZEIHBhaXIuIEV4cG9ydGluZyB0aGUgaGFuZGxlIGJhc2Vk
IG9uIGEgdHlwZSB3YXMgYWxzbyBsaWtlIHRyeWluZyB0byAKc3F1ZWV6ZSBhIHJvdW5kIHBpZyB0
aHJvdWdoIGEgc3F1YXJlIGhvbGUgaW4gdGhlIGZpcnN0IHBsYWNlLgoKS01TLCBmbGluayBhbmQg
RE1BLWJ1ZiBmZCBhcmUgZnVuZGFtZW50YWxseSBkaWZmZXJlbnQgYW5kIHNob3VsZG4ndCBiZSAK
aGFuZGxlZCBieSB0aGUgc2FtZSBmdW5jdGlvbiBpbiB0aGUgZmlyc3QgcGxhY2UuCgpUaGUgb25s
eSB0cmlja3kgcGFydCBpbiB0aGlzIHNjZW5hcmlvIGlzIHRvIGtub3cgd2hlbiB0byBjbG9zZSB0
aGUgS01TIApoYW5kbGUgYWdhaW4uCgpDaHJpc3RpYW4uCgpBbSAyNC4wNi4xOSB1bSAxODo1MyBz
Y2hyaWViIE1pY2hlbCBEw6RuemVyOgo+IEZyb206IE1pY2hlbCBEw6RuemVyIDxtaWNoZWwuZGFl
bnplckBhbWQuY29tPgo+Cj4gVGhlIG1vdGl2YXRpb24gZm9yIHRoZXNlIHBhdGNoZXMgaXMgaHR0
cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9yZy8xMTA5MDMgLgo+Cj4gUGF0Y2hlcyAxLTMgYXJlIHBy
ZXBhcmF0b3J5Lgo+Cj4gUGF0Y2hlcyA0ICYgNSBhcmUgdGhlIGNvcmUgcGF0Y2hlcyBhbGxvd2lu
ZyB0aGUgaXNzdWVzIGRpc2N1c3NlZCBpbiB0aGUKPiBidWcgcmVwb3J0IHRvIGJlIGZpeGVkLgo+
Cj4gUGF0Y2hlcyA2LTggYXJlIGZ1cnRoZXIgb3B0aW1pemF0aW9ucyAvIGNsZWFudXBzLgo+Cj4g
UGF0Y2ggOSBpcyB0aGUgTWVzYSBwYXRjaCBtYWtpbmcgdXNlIG9mIHRoZSBuZXcKPiBhbWRncHVf
Ym9faGFuZGxlX3R5cGVfa21zX3VzZXIgQVBJIHRvIGZpeCB0aGUgdXNlciB2aXNpYmxlIHByb2Js
ZW0uCj4KPiBOb3RlIHRoYXQgdGhlIGxpYmRybSBwYXRjaGVzIG5lZWQgdG8gbGFuZCBmaXJzdCwg
YSBsaWJkcm0gcmVsZWFzZSBuZWVkcwo+IHRvIGJlIG1hZGUsIGFuZCB0aGUgTWVzYSBwYXRjaCBu
ZWVkcyB0byBidW1wIHRoZSBsaWJkcm1fYW1kZ3B1IHZlcnNpb24KPiByZXF1aXJlbWVudCB0byB0
aGF0IHJlbGVhc2UncyB2ZXJzaW9uIGJlZm9yZSBpdCBjYW4gbGFuZC4KPgo+IE1pY2hlbCBEw6Ru
emVyICg5KToKPiAgICBhbWRncHU6IFBhc3MgZmlsZSBkZXNjcmlwdG9yIGRpcmVjdGx5IHRvIGFt
ZGdwdV9jbG9zZV9rbXNfaGFuZGxlCj4gICAgYW1kZ3B1OiBBZGQgQk8gaGFuZGxlIHRvIHRhYmxl
IGluIGFtZGdwdV9ib19jcmVhdGUKPiAgICBhbWRncHU6IFJlbmFtZSBmZF9tdXRleC9saXN0IHRv
IGRldl9tdXRleC9saXN0Cj4gICAgYW1kZ3B1OiBBZGQgc3RydWN0IGFtZGdwdV9jb3JlX2Rldmlj
ZSBhbmQgYW1kZ3B1X2NvcmVfYm8KPiAgICBhbWRncHU6IEFkZCBhbWRncHVfYm9faGFuZGxlX3R5
cGVfa21zX3VzZXIKPiAgICBhbWRncHU6IFJlLXVzZSBhbiBleGlzdGluZyBhbWRncHVfZGV2aWNl
IHdoZW4gcG9zc2libGUKPiAgICBhbWRncHU6IFVzZSBub3JtYWwgaW50ZWdlcnMgZm9yIGRldmlj
ZSAvIGNvcmUgQk8gcmVmZXJlbmNlIGNvdW50aW5nCj4gICAgYW1kZ3B1OiBEcm9wIHJlZmNvdW50
IG1lbWJlciBmcm9tIHN0cnVjdCBhbWRncHVfY29yZV9iby9kZXZpY2UKPiAgICB3aW5zeXMvYW1k
Z3B1OiBVc2UgYW1kZ3B1X2JvX2hhbmRsZV90eXBlX2ttc191c2VyIGZvciBBUEkgS01TIGhhbmRs
ZXMKPgo+ICAgYW1kZ3B1L2FtZGdwdS5oICAgICAgICAgICAgICAgfCAgMTQgKy0KPiAgIGFtZGdw
dS9hbWRncHVfYXNpY19pZC5jICAgICAgIHwgICA0ICstCj4gICBhbWRncHUvYW1kZ3B1X2JvLmMg
ICAgICAgICAgICB8IDM2NyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gICBh
bWRncHUvYW1kZ3B1X2NzLmMgICAgICAgICAgICB8ICA2NCArKystLS0KPiAgIGFtZGdwdS9hbWRn
cHVfZGV2aWNlLmMgICAgICAgIHwgMjgxICsrKysrKysrKysrKystLS0tLS0tLS0tLS0tCj4gICBh
bWRncHUvYW1kZ3B1X2dwdV9pbmZvLmMgICAgICB8ICAzNSArKy0tCj4gICBhbWRncHUvYW1kZ3B1
X2ludGVybmFsLmggICAgICB8ICAzMSArKy0KPiAgIGFtZGdwdS9hbWRncHVfdmFtZ3IuYyAgICAg
ICAgIHwgICA5ICstCj4gICBhbWRncHUvYW1kZ3B1X3ZtLmMgICAgICAgICAgICB8ICAgNCArLQo+
ICAgdGVzdHMvYW1kZ3B1L2FtZGdwdV90ZXN0LmMgICAgfCAgIDIgKy0KPiAgIHRlc3RzL2FtZGdw
dS9ib190ZXN0cy5jICAgICAgIHwgICAyICstCj4gICB0ZXN0cy9hbWRncHUvY3NfdGVzdHMuYyAg
ICAgICB8ICAgOCArLQo+ICAgdGVzdHMvYW1kZ3B1L2RlYWRsb2NrX3Rlc3RzLmMgfCAgIDggKy0K
PiAgIHRlc3RzL2FtZGdwdS91dmRfZW5jX3Rlc3RzLmMgIHwgICAyICstCj4gICB0ZXN0cy9hbWRn
cHUvdmNlX3Rlc3RzLmMgICAgICB8ICAxMiArLQo+ICAgdGVzdHMvYW1kZ3B1L3Zjbl90ZXN0cy5j
ICAgICAgfCAgIDQgKy0KPiAgIHRlc3RzL2FtZGdwdS92bV90ZXN0cy5jICAgICAgIHwgICAyICst
Cj4gICAxNyBmaWxlcyBjaGFuZ2VkLCA1MDAgaW5zZXJ0aW9ucygrKSwgMzQ5IGRlbGV0aW9ucygt
KQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
