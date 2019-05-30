Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F8A2FECD
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 17:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ACD46E386;
	Thu, 30 May 2019 15:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A66486E386;
 Thu, 30 May 2019 15:04:24 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id u78so4184956wmu.5;
 Thu, 30 May 2019 08:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Jxfe6EBhsHWfKfT2gECsARWTDEiIbgLEs/NNt1uvwb8=;
 b=Ki06O38wbLUviZWSttTZdp5MBmTYaw7Z7ChF704yyk1+vOjW+h9rviZ2i4RZuwLbrx
 Yd4zq/XLOjjvXtrvaooxrsHtDK2ybdKYUTiwCII52Sfeh9pl3pIMesHDAKaBf5cVAL8H
 w1S3ql2BTTk3PzaHjfDS6t0fAc00tFSpQY3cd+l6mFmfFWda1+Joc1QXL1OGAOkqC9uD
 pNf3/9hnAjmZLo6bYfGFBYEMi6cHNzSCsk2e4Nn+AY6KHpEOLgDLLtxBvxz0Uj5UrqNO
 9/gU+bli8561h0s62AuCEHyZFlNwgYQIlsRpyoa5MGEqz3YqTzLnFqU5F/R5sCvhh3ZP
 PDpg==
X-Gm-Message-State: APjAAAVZdNkzMgG6rM0AxurszoifEK7SD5slhonhroCiDIQ7Lh7sg8yy
 QT62r6ngoUv9Mkfj8ySVdUHwPkpd
X-Google-Smtp-Source: APXvYqw5kHOUzEZiJ0/D2dT2iqjgXiRinuyg4BdGqAnK4RW2cvrAHkDJPrYMBeWSnnmQgUL/XvXPmw==
X-Received: by 2002:a7b:c8d7:: with SMTP id f23mr1419020wml.4.1559228662688;
 Thu, 30 May 2019 08:04:22 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id b10sm8042927wrh.59.2019.05.30.08.04.21
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 May 2019 08:04:21 -0700 (PDT)
Subject: Re: [PATCH] drm/sched: Fix make htmldocs warnings.
To: Daniel Vetter <daniel@ffwll.ch>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
References: <1559140180-6762-1-git-send-email-andrey.grodzovsky@amd.com>
 <CADnq5_PoQ-+rmbr4Rq_DefyPcw+gUz8a5nL_YUEbHhXmzGQc=g@mail.gmail.com>
 <aafdf860-4f83-1830-cbf4-855f97a56fb0@amd.com>
 <20190529193615.GX21222@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <bc79d169-0768-9671-660f-ffe4ceee4b47@gmail.com>
Date: Thu, 30 May 2019 17:04:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529193615.GX21222@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Jxfe6EBhsHWfKfT2gECsARWTDEiIbgLEs/NNt1uvwb8=;
 b=TgDXpGI2N8ss6iDsvp6WD5q9r6KDnUvK+HEeDgVXKMFcHdvU9XASPuOfJsQRv4iOfZ
 7PXRKGaFY3jrL6fyFbqDDYF9PsQbBY5qh8hNN3kmSNzAcRYuUawBG3VDVKoglWfL23EI
 iTbfrWwuBQ2+baxizwujNOcRiI8aJqPqmxGb7bJaNM/ajMl/h7zugYRGMsXFSLR4W4b9
 LLvLobgvSM+0yMEPiRKzZ4ZRh1WUearfwj80HSfYcEKfe2YESVgMpu7JaP+m4Hs2C2uM
 0iFp9ycNG6PsTvILCRA99GffnIV1Jrhqe6LzEVxskqLqiOliJfZFoO7c9uRaG5VPUUrn
 Capg==
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
Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjkuMDUuMTkgdW0gMjE6MzYgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFdlZCwgTWF5
IDI5LCAyMDE5IGF0IDA0OjQzOjQ1UE0gKzAwMDAsIEdyb2R6b3Zza3ksIEFuZHJleSB3cm90ZToK
Pj4gSSBkb24ndCwgc29ycnkuCj4gU2hvdWxkIHdlIGZpeCB0aGF0PyBTZWVtcyBsaWtlIHlvdSBk
byBwbGVudHkgb2Ygc2NoZWR1bGVyIHN0dWZmLCBzbyB3b3VsZAo+IG1ha2Ugc2Vuc2UgSSBndWVz
cyAuLi4KClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+IGZvciB0aGUgcGF0Y2guCgpBbmQgKzEgZm9yIGdpdmluZyBBbmRyZXkgY29tbWl0IHJp
Z2h0cyB0byBkcm0tbWlzYy1uZXh0LgoKQ2hyaXN0aWFuLgoKPiAtRGFuaWVsCj4KPj4gQW5kcmV5
Cj4+Cj4+IE9uIDUvMjkvMTkgMTI6NDIgUE0sIEFsZXggRGV1Y2hlciB3cm90ZToKPj4+IE9uIFdl
ZCwgTWF5IDI5LCAyMDE5IGF0IDEwOjI5IEFNIEFuZHJleSBHcm9kem92c2t5Cj4+PiA8YW5kcmV5
Lmdyb2R6b3Zza3lAYW1kLmNvbT4gd3JvdGU6Cj4+Pj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEdy
b2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+PiBSZXZpZXdlZC1ieTogQWxl
eCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgo+Pj4KPj4+IEknbGwgcHVzaCBp
dCB0byBkcm0tbWlzYyBpbiBhIG1pbnV0ZSB1bmxlc3MgeW91IGhhdmUgY29tbWl0IHJpZ2h0cy4K
Pj4+Cj4+PiBBbGV4Cj4+Pgo+Pj4+IC0tLQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jIHwgMiArKwo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3Nj
aGVkX21haW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfbWFpbi5jCj4+Pj4g
aW5kZXggNDllN2QwNy4uYzEwNThlZSAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
c2NoZWR1bGVyL3NjaGVkX21haW4uYwo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zY2hlZHVs
ZXIvc2NoZWRfbWFpbi5jCj4+Pj4gQEAgLTM1Myw2ICszNTMsNyBAQCBFWFBPUlRfU1lNQk9MKGRy
bV9zY2hlZF9pbmNyZWFzZV9rYXJtYSk7Cj4+Pj4gICAgICogZHJtX3NjaGVkX3N0b3AgLSBzdG9w
IHRoZSBzY2hlZHVsZXIKPj4+PiAgICAgKgo+Pj4+ICAgICAqIEBzY2hlZDogc2NoZWR1bGVyIGlu
c3RhbmNlCj4+Pj4gKyAqIEBiYWQ6IGpvYiB3aGljaCBjYXVzZWQgdGhlIHRpbWUgb3V0Cj4+Pj4g
ICAgICoKPj4+PiAgICAgKiBTdG9wIHRoZSBzY2hlZHVsZXIgYW5kIGFsc28gcmVtb3ZlcyBhbmQg
ZnJlZXMgYWxsIGNvbXBsZXRlZCBqb2JzLgo+Pj4+ICAgICAqIE5vdGU6IGJhZCBqb2Igd2lsbCBu
b3QgYmUgZnJlZWQgYXMgaXQgbWlnaHQgYmUgdXNlZCBsYXRlciBhbmQgc28gaXQncwo+Pj4+IEBA
IC00MjIsNiArNDIzLDcgQEAgRVhQT1JUX1NZTUJPTChkcm1fc2NoZWRfc3RvcCk7Cj4+Pj4gICAg
ICogZHJtX3NjaGVkX2pvYl9yZWNvdmVyeSAtIHJlY292ZXIgam9icyBhZnRlciBhIHJlc2V0Cj4+
Pj4gICAgICoKPj4+PiAgICAgKiBAc2NoZWQ6IHNjaGVkdWxlciBpbnN0YW5jZQo+Pj4+ICsgKiBA
ZnVsbF9yZWNvdmVyeTogcHJvY2VlZCB3aXRoIGNvbXBsZXRlIHNjaGVkIHJlc3RhcnQKPj4+PiAg
ICAgKgo+Pj4+ICAgICAqLwo+Pj4+ICAgIHZvaWQgZHJtX3NjaGVkX3N0YXJ0KHN0cnVjdCBkcm1f
Z3B1X3NjaGVkdWxlciAqc2NoZWQsIGJvb2wgZnVsbF9yZWNvdmVyeSkKPj4+PiAtLQo+Pj4+IDIu
Ny40Cj4+Pj4KPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
