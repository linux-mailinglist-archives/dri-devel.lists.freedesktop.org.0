Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F572DBC6F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 09:04:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA61C895E2;
	Wed, 16 Dec 2020 08:04:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8D38957D;
 Wed, 16 Dec 2020 08:04:53 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id j16so1395421edr.0;
 Wed, 16 Dec 2020 00:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=7DmJJRh4diloReM0yDZbvYPcm1Z4lsGzyVJjs9A7PNE=;
 b=LrIX6/yXDtvbNZCxua67rwZzGvELKC/lkE9HSbvFvcKDq+fLChfOQ0zgxrV+SoAVSR
 8N9ilx/rJ4ANNHk5o2GOgUnt0ghLr+Z+ASsXKYf7n87ZFChOD+9g+5GQ+2k9TLywWufo
 qrc5oPf6ZbNOYFec5+ZK+foY6tJ4PhRurWiswZaIm0C8VCpYL80vEcKT6avcSacMzmLf
 vG0zK5Igo3s6C0FGA6+ld+DaCsV5/uvyVl/seyrLRgmUfNVfenk2bzhXiG3Afu4Eb6gi
 a6beP0NE7G/QWig58XofGpFMiHEqTSe0yuR1t7S/gWZWY/vitYuUS4HBEbpKTNQqdZRU
 NZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=7DmJJRh4diloReM0yDZbvYPcm1Z4lsGzyVJjs9A7PNE=;
 b=dhdT0wSk8gaMUojNRmTStaAM6HF5o6Nyo3Li0xIr5BnmAa1gU6AKRumh2S8yTZOqzo
 e9xxN/BEQh8WYF/CAQb2KwVrG+9v3yQWhzik4PrM5r8UiUKKwjJm7IB9bmKbF8IGUHhK
 gtjt+Y4lCS+t3dqP5vgUPkpbFMnhY4A3VrAYtKUdEqrXhmsxwLQZbHWRGXNXf1IUJfSJ
 rE1V/zzdpKTT/kZb4A3EtOlNqGjFvYVcTFavHi9OaRek1LcNLtdYy4LUCGHgGyzOjL4P
 SxaQVrsrOlrDRI065OxnCu7tBUJWYTubYD1Y8RxmRttM7jRHxfViAEkDLNFSaPQ2A3sh
 YoSQ==
X-Gm-Message-State: AOAM533cozbRjyFFZMzWEFgwvdPy9q4TqoDU3yfLkzNIfBTh+ngxZxIA
 omsyL2Abp1dIRZlPMZB+zu8=
X-Google-Smtp-Source: ABdhPJxq1c/V43VGkvby7AwAHO1T9ZGRTtLfm92UIn0y8hprZtvDPq+QmXPYql4sL1LXYVfhEQxnIw==
X-Received: by 2002:aa7:c886:: with SMTP id p6mr33237696eds.207.1608105892214; 
 Wed, 16 Dec 2020 00:04:52 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f17sm20198319edv.5.2020.12.16.00.04.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Dec 2020 00:04:51 -0800 (PST)
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, christian.koenig@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
Date: Wed, 16 Dec 2020 09:04:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMTIuMjAgdW0gMjE6MTggc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBbU05JUF0K
Pj4+Cj4+PiBXaGlsZSB3ZSBjYW4ndCBjb250cm9sIHVzZXIgYXBwbGljYXRpb24gYWNjZXNzZXMg
dG8gdGhlIG1hcHBlZCAKPj4+IGJ1ZmZlcnMgZXhwbGljaXRseSBhbmQgaGVuY2Ugd2UgdXNlIHBh
Z2UgZmF1bHQgcmVyb3V0aW5nCj4+PiBJIGFtIHRoaW5raW5nIHRoYXQgaW4gdGhpc8KgIGNhc2Ug
d2UgbWF5IGJlIGFibGUgdG8gc3ByaW5rbGUgCj4+PiBkcm1fZGV2X2VudGVyL2V4aXQgaW4gYW55
IHN1Y2ggc2Vuc2l0aXZlIHBsYWNlIHdlcmUgd2UgbWlnaHQKPj4+IENQVSBhY2Nlc3MgYSBETUEg
YnVmZmVyIGZyb20gdGhlIGtlcm5lbCA/Cj4+Cj4+IFllcywgSSBmZWFyIHdlIGFyZSBnb2luZyB0
byBuZWVkIHRoYXQuCj4+Cj4+PiBUaGluZ3MgbGlrZSBDUFUgcGFnZSB0YWJsZSB1cGRhdGVzLCBy
aW5nIGJ1ZmZlciBhY2Nlc3NlcyBhbmQgRlcgCj4+PiBtZW1jcHkgPyBJcyB0aGVyZSBvdGhlciBw
bGFjZXMgPwo+Pgo+PiBQdWgsIGdvb2QgcXVlc3Rpb24uIEkgaGF2ZSBubyBpZGVhLgo+Pgo+Pj4g
QW5vdGhlciBwb2ludCBpcyB0aGF0IGF0IHRoaXMgcG9pbnQgdGhlIGRyaXZlciBzaG91bGRuJ3Qg
YWNjZXNzIGFueSAKPj4+IHN1Y2ggYnVmZmVycyBhcyB3ZSBhcmUgYXQgdGhlIHByb2Nlc3MgZmlu
aXNoaW5nIHRoZSBkZXZpY2UuCj4+PiBBRkFJSyB0aGVyZSBpcyBubyBwYWdlIGZhdWx0IG1lY2hh
bmlzbSBmb3Iga2VybmVsIG1hcHBpbmdzIHNvIEkgCj4+PiBkb24ndCB0aGluayB0aGVyZSBpcyBh
bnl0aGluZyBlbHNlIHRvIGRvID8KPj4KPj4gV2VsbCB0aGVyZSBpcyBhIHBhZ2UgZmF1bHQgaGFu
ZGxlciBmb3Iga2VybmVsIG1hcHBpbmdzLCBidXQgdGhhdCBvbmUgCj4+IGp1c3QgcHJpbnRzIHRo
ZSBzdGFjayB0cmFjZSBpbnRvIHRoZSBzeXN0ZW0gbG9nIGFuZCBjYWxscyBCVUcoKTsgOikKPj4K
Pj4gTG9uZyBzdG9yeSBzaG9ydCB3ZSBuZWVkIHRvIGF2b2lkIGFueSBhY2Nlc3MgdG8gcmVsZWFz
ZWQgcGFnZXMgYWZ0ZXIgCj4+IHVucGx1Zy4gTm8gbWF0dGVyIGlmIGl0J3MgZnJvbSB0aGUga2Vy
bmVsIG9yIHVzZXJzcGFjZS4KPgo+Cj4gSSB3YXMganVzdCBhYm91dCB0byBzdGFydCBndWFyZGlu
ZyB3aXRoIGRybV9kZXZfZW50ZXIvZXhpdCBDUFUgCj4gYWNjZXNzZXMgZnJvbSBrZXJuZWwgdG8g
R1RUIG90IFZSQU0gYnVmZmVycyBidXQgdGhlbiBpIGxvb2tlZCBtb3JlIGluIAo+IHRoZSBjb2Rl
Cj4gYW5kIHNlZW1zIGxpa2UgdHRtX3R0X3VucG9wdWxhdGUganVzdCBkZWxldGVzIERNQSBtYXBw
aW5ncyAoZm9yIHRoZSAKPiBzYWtlIG9mIGRldmljZSB0byBtYWluIG1lbW9yeSBhY2Nlc3MpLiBL
ZXJuZWwgcGFnZSB0YWJsZSBpcyBub3QgdG91Y2hlZAo+IHVudGlsIGxhc3QgYm8gcmVmY291bnQg
aXMgZHJvcHBlZCBhbmQgdGhlIGJvIGlzIHJlbGVhc2VkIAo+ICh0dG1fYm9fcmVsZWFzZS0+ZGVz
dHJveS0+YW1kZ3B1X2JvX2Rlc3Ryb3ktPmFtZGdwdV9ib19rdW5tYXApLiBUaGlzIAo+IGlzIGJv
dGgKPiBmb3IgR1RUIEJPcyBtYXBlZCB0byBrZXJuZWwgYnkga21hcCAob3Igdm1hcCkgYW5kIGZv
ciBWUkFNIEJPcyBtYXBwZWQgCj4gYnkgaW9yZW1hcC4gU28gYXMgaSBzZWUgaXQsIG5vdGhpbmcg
d2lsbCBiYWQgd2lsbCBoYXBwZW4gYWZ0ZXIgd2UKPiB1bnBvcHVsYXRlIGEgQk8gd2hpbGUgd2Ug
c3RpbGwgdHJ5IHRvIHVzZSBhIGtlcm5lbCBtYXBwaW5nIGZvciBpdCwgCj4gc3lzdGVtIG1lbW9y
eSBwYWdlcyBiYWNraW5nIEdUVCBCT3MgYXJlIHN0aWxsIG1hcHBlZCBhbmQgbm90IGZyZWVkIGFu
ZCAKPiBmb3IKPiBWUkFNIEJPcyBzYW1lIGlzIGZvciB0aGUgSU8gcGh5c2ljYWwgcmFuZ2VzIG1h
cHBlZCBpbnRvIHRoZSBrZXJuZWwgCj4gcGFnZSB0YWJsZSBzaW5jZSBpb3VubWFwIHdhc24ndCBj
YWxsZWQgeWV0LgoKVGhlIHByb2JsZW0gaXMgdGhlIHN5c3RlbSBwYWdlcyB3b3VsZCBiZSBmcmVl
ZCBhbmQgaWYgd2Uga2VybmVsIGRyaXZlciAKc3RpbGwgaGFwcGlseSB3cml0ZSB0byB0aGVtIHdl
IGFyZSBwcmV0dHkgbXVjaCBidXN0ZWQgYmVjYXVzZSB3ZSB3cml0ZSAKdG8gZnJlZWQgdXAgbWVt
b3J5LgoKQ2hyaXN0aWFuLgoKPiBJIGxvYWRlZCB0aGUgZHJpdmVyIHdpdGggdm1fdXBkYXRlX21v
ZGU9Mwo+IG1lYW5pbmcgYWxsIFZNIHVwZGF0ZXMgZG9uZSB1c2luZyBDUFUgYW5kIGhhc24ndCBz
ZWVuIGFueSBPT1BzIGFmdGVyIAo+IHJlbW92aW5nIHRoZSBkZXZpY2UuIEkgZ3Vlc3MgaSBjYW4g
dGVzdCBpdCBtb3JlIGJ5IGFsbG9jYXRpbmcgR1RUIGFuZCAKPiBWUkFNIEJPcwo+IGFuZCB0cnlp
bmcgdG8gcmVhZC93cml0ZSB0byB0aGVtIGFmdGVyIGRldmljZSBpcyByZW1vdmVkLgo+Cj4gQW5k
cmV5Cj4KPgo+Pgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+Pgo+Pj4gQW5kcmV5Cj4+
Cj4+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBh
bWQtZ2Z4IG1haWxpbmcgbGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4CgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
