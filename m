Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AAA26BE43
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 09:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB7176E2F3;
	Wed, 16 Sep 2020 07:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF466E2F3;
 Wed, 16 Sep 2020 07:38:38 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id c2so5040662ljj.12;
 Wed, 16 Sep 2020 00:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=/Ve+uN77l2mNjSGSgchzbGo6elSRLw4c+esXt/wG3n8=;
 b=qfJOIvaWp0ltvhKrrA/Qb3zKGpq6LMq5IucxqsOYjGKBEHE282iCaS3duAGkufnxIy
 yroKYAoaD4QcvSsAFQScxnOdrPvAPdveBzEHfdqUTDNp2eryQpcj7PD3xBbV3PjrOvgl
 /siK36295K0OBgg9JXKmPTSdTu1MNv0iJYOcb2fSJHYr5YeUTau8dnKA9HFOKXtvRKrK
 f1hRtFa5tEwaektfwHpHJC2r/V1XCH0OErpsof22px2Y3cV6qxgUV8tudTONmEXnohjf
 cY9/XWzXvJSJiQNe8PyHICqxxib8he4KCMsCU+djAsYLFno5O7Dkqc0fg2/BPf54r0ve
 QJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=/Ve+uN77l2mNjSGSgchzbGo6elSRLw4c+esXt/wG3n8=;
 b=dARhLncE0YhDFWOBqdbvvjiJvQFnLScnrCp/pjSklM0DCb0gFZU1i7Fd8RI4IzjLN/
 JDBTqReXeOF7gIfXpQRGvd5LfNkjbJlHDVbU6gbAltHthIxMc6XiU4Lfmd4J4webU4ZX
 zE/vurHGTjX68zP7JpJTd/8df9c3JdFTbnhGpjsBZOmwu9CbeTdHw/TGPDsKrVlfwVF0
 aeHMm/nBu3pnfzyI+FavRrDJrEYvr1VrzHPQm2Ouk8GHPyI+0bU+AHKcFdPtHkG4HH4g
 mEzL+bJHhTGjI0aacHkwhrPByPkaTPL7NoArJaBP3f4mt7wD9HliHKJ1GoMWMt7NqUql
 ikmQ==
X-Gm-Message-State: AOAM5317F+u09jLLgVeJtBeK9bwmCY3ggy+IqZydQ9K4L0mURaGkPx2/
 ntLAjR1rtMmJro+18pjXtVY=
X-Google-Smtp-Source: ABdhPJwJbGNg9ljapuYPbuUtj0KvB1atxCILhskbIHoedwzAIw9tKZs2o0vx5QnfLSEpKIncKq74Lg==
X-Received: by 2002:a05:651c:1307:: with SMTP id
 u7mr8617236lja.267.1600241917282; 
 Wed, 16 Sep 2020 00:38:37 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id m203sm4405724lfd.195.2020.09.16.00.38.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Sep 2020 00:38:36 -0700 (PDT)
Subject: Re: [PATCH -next 0/8] drm/amd/amdgpu: fix comparison pointer to bool
 warning
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Alex Deucher <alexdeucher@gmail.com>
References: <20200909130720.105234-1-zhengbin13@huawei.com>
 <1fce0f2a-3777-e6d8-5a09-30261f843cfd@amd.com>
 <CADnq5_NoeFbBAMT6s_ictVXsUc2tx1U48MLxnMbAr2Sd58jyYA@mail.gmail.com>
 <20200915193549.GP6112@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <6658f89f-6957-e6ea-af41-7625f1fd3cb1@gmail.com>
Date: Wed, 16 Sep 2020 09:38:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915193549.GP6112@intel.com>
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
Cc: yi.zhang@huawei.com, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Zheng Bin <zhengbin13@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDkuMjAgdW0gMjE6MzUgc2NocmllYiBWaWxsZSBTeXJqw6Rsw6Q6Cj4gT24gVHVlLCBT
ZXAgMTUsIDIwMjAgYXQgMDM6MTY6MzJQTSAtMDQwMCwgQWxleCBEZXVjaGVyIHdyb3RlOgo+PiBJ
IHF1ZXN0aW9uIHRoZSB2YWx1ZSBvZiB0aGVzZSB3YXJuaW5ncy4gIFdoeSBldmVuIGhhdmUgYSBi
b29sZWFuIHR5cGUKPj4gaWYgeW91IGFyZSBnb2luZyB0byBnZXQgd2FybmluZ3Mgd2hlbiB5b3Ug
dXNlIHRoZW0uLi4KPj4gVGhhdCBzYWlkLCBhcHBsaWVkIHRvIGF2b2lkIGdldHRpbmcgdGhlc2Ug
cGF0Y2hlcyBhZ2FpbiBhbmQgYWdhaW4KPj4gZXZlcnkgdGltZSBzb21lb25lIHNlZXMgdGhpcy4K
PiBpZiAodGhpc19pc19zcGFydGEpCj4gaWYgKHRoaXNfaXNfc3BhcnRhID09IHRydWUpCj4gaWYg
KHRoaXNfaXNfc3BhcnRhICE9IGZhbHNlKQo+Cj4gSSB0aGluayB0aGUgZmlyc3Qgb25lIHJlYWRz
IHRoZSBiZXN0LCBhbmQgYXZvaWRzIGhhdmluZyB0bwo+IGRlY2lkZSBiZXR3ZWVuIHRydXRoIGFu
ZCBmYWxzZWhvb2QgOikKCisxCgpDaHJpc3RpYW4uCgo+Cj4+IEFsZXgKPj4KPj4gT24gV2VkLCBT
ZXAgOSwgMjAyMCBhdCA5OjIxIEFNIENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4gd3JvdGU6Cj4+PiBBY2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFu
LmtvZW5pZ0BhbWQuY29tPiBmb3IgdGhlIHNlcmllcy4KPj4+Cj4+PiBBbSAwOS4wOS4yMCB1bSAx
NTowNyBzY2hyaWViIFpoZW5nIEJpbjoKPj4+PiBaaGVuZyBCaW4gKDgpOgo+Pj4+ICAgICBkcm0v
YW1kL2FtZGdwdTogZml4IGNvbXBhcmlzb24gcG9pbnRlciB0byBib29sIHdhcm5pbmcgaW4gZ2Z4
X3Y5XzAuYwo+Pj4+ICAgICBkcm0vYW1kL2FtZGdwdTogZml4IGNvbXBhcmlzb24gcG9pbnRlciB0
byBib29sIHdhcm5pbmcgaW4gZ2Z4X3YxMF8wLmMKPj4+PiAgICAgZHJtL2FtZC9hbWRncHU6IGZp
eCBjb21wYXJpc29uIHBvaW50ZXIgdG8gYm9vbCB3YXJuaW5nIGluIHNkbWFfdjVfMC5jCj4+Pj4g
ICAgIGRybS9hbWQvYW1kZ3B1OiBmaXggY29tcGFyaXNvbiBwb2ludGVyIHRvIGJvb2wgd2Fybmlu
ZyBpbiBzZG1hX3Y1XzIuYwo+Pj4+ICAgICBkcm0vYW1kL2FtZGdwdTogZml4IGNvbXBhcmlzb24g
cG9pbnRlciB0byBib29sIHdhcm5pbmcgaW4gc2kuYwo+Pj4+ICAgICBkcm0vYW1kL2FtZGdwdTog
Zml4IGNvbXBhcmlzb24gcG9pbnRlciB0byBib29sIHdhcm5pbmcgaW4gdXZkX3Y2XzAuYwo+Pj4+
ICAgICBkcm0vYW1kL2FtZGdwdTogZml4IGNvbXBhcmlzb24gcG9pbnRlciB0byBib29sIHdhcm5p
bmcgaW4KPj4+PiAgICAgICBhbWRncHVfYXRweF9oYW5kbGVyLmMKPj4+PiAgICAgZHJtL2FtZC9h
bWRncHU6IGZpeCBjb21wYXJpc29uIHBvaW50ZXIgdG8gYm9vbCB3YXJuaW5nIGluIHNkbWFfdjRf
MC5jCj4+Pj4KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRweF9o
YW5kbGVyLmMgfCA0ICsrLS0KPj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9nZnhf
djEwXzAuYyAgICAgICAgICAgfCAyICstCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRn
cHUvZ2Z4X3Y5XzAuYyAgICAgICAgICAgIHwgMiArLQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L3NkbWFfdjRfMC5jICAgICAgICAgICB8IDQgKystLQo+Pj4+ICAgIGRyaXZlcnMv
Z3B1L2RybS9hbWQvYW1kZ3B1L3NkbWFfdjVfMC5jICAgICAgICAgICB8IDIgKy0KPj4+PiAgICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zZG1hX3Y1XzIuYyAgICAgICAgICAgfCAyICstCj4+
Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvc2kuYyAgICAgICAgICAgICAgICAgIHwg
MiArLQo+Pj4+ICAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3V2ZF92Nl8wLmMgICAgICAg
ICAgICB8IDQgKystLQo+Pj4+ICAgIDggZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCj4+Pj4KPj4+PiAtLQo+Pj4+IDIuMjYuMC4xMDYuZzlmYWRlZGQKPj4+
Pgo+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+
IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4+PiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4
Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IGRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
