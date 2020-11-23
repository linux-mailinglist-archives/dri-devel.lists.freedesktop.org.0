Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E59BD2C1584
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 21:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E15FD89C0A;
	Mon, 23 Nov 2020 20:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0C89C0A;
 Mon, 23 Nov 2020 20:20:04 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id k9so10343395ejc.11;
 Mon, 23 Nov 2020 12:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=8JSMIsOy0AyZyAetkv26+u/9hp8Eqpg6ovnXL0MjUz0=;
 b=RKAXRwRMks7CRNEEY2uki6yhoxEaXklAvwdeUTpSW1GLr/V+4e0Me7LNx196n0/3bZ
 h5CKdFA3h6u8wYJWa7RPv6nvZQfzb51H+Bb3xbfYsqE0NHQ/ZrbVSXs/Kt1DBSXcZSFP
 zEeTciL+qoD5xutpxIuA2FAAHPNw4qlniWQvAxralpsZR7BigYYxz3uMJFqGvF+tCKVp
 nayGd4vRgIgNyMeGd5wxIq/RB1pKF/qRvIoI3sXAD2yihflkMleyOsjxWFo1yXuYLzD6
 Tp92hHVy+TG3Sdb+0W5urFNWW5fIRvgs1tWCoxrlOhAle1dxAtfKk0WzXFccGJ3u1WJ7
 YoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=8JSMIsOy0AyZyAetkv26+u/9hp8Eqpg6ovnXL0MjUz0=;
 b=ujt+7lcjiFT7XeipIWfoj4Drla1N0i1PwkFE7Lqajb8XPlw1I/jEMxGGVbnV5dx1y0
 9MCVlSj3UjQpxZzRfR760dXCgIHDy3wzb9blp0heP1uX8eyARPlA8p84zGI/89766b5k
 4BNsN0yYSJZFSLXXxMJfcDPvtQL45u2J1AAdIf5ckdYu+lHUlP6gYgR56SLKQmZ8jtIb
 pjETgy4geaPjM7YvT35cru7bqndzReqqgqJ+lJja6lcjBy1MvAwyu9vaaqEVFxsj7GFF
 lUDvqkHvrKv7ohDEWV1KgvB7RW50/fO2746pPozSsezYXpBOz1NjfcROI1UGTx9f6VEX
 371w==
X-Gm-Message-State: AOAM531o1mv4uXK4HHMLHWNKKUG6gU+vLFGLQa0PC14P+TC1wMhfWn+i
 iWglV7QmlSxyD7xZBhs/xhQ=
X-Google-Smtp-Source: ABdhPJwUlg1eEuI6RhRMFWqF3dHJAi5Hj2rkcEZa/6IWlfpSmNCzvKUEcyoQRXtUbfrn+es7+gOOTw==
X-Received: by 2002:a17:906:17d1:: with SMTP id
 u17mr1230827eje.6.1606162802653; 
 Mon, 23 Nov 2020 12:20:02 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id f24sm5658181edx.90.2020.11.23.12.20.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 12:20:02 -0800 (PST)
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>, christian.koenig@amd.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
Date: Mon, 23 Nov 2020 21:20:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
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

QW0gMjMuMTEuMjAgdW0gMjE6MDUgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDEx
LzI1LzIwIDU6NDIgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDIxLjExLjIwIHVt
IDA2OjIxIHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+PiBJdCdzIG5lZWRlZCB0byBkcm9w
IGlvbW11IGJhY2tlZCBwYWdlcyBvbiBkZXZpY2UgdW5wbHVnCj4+PiBiZWZvcmUgZGV2aWNlJ3Mg
SU9NTVUgZ3JvdXAgaXMgcmVsZWFzZWQuCj4+Cj4+IEl0IHdvdWxkIGJlIGNsZWFuZXIgaWYgd2Ug
Y291bGQgZG8gdGhlIHdob2xlIGhhbmRsaW5nIGluIFRUTS4gSSBhbHNvIAo+PiBuZWVkIHRvIGRv
dWJsZSBjaGVjayB3aGF0IHlvdSBhcmUgZG9pbmcgd2l0aCB0aGlzIGZ1bmN0aW9uLgo+Pgo+PiBD
aHJpc3RpYW4uCj4KPgo+IENoZWNrIHBhdGNoICJkcm0vYW1kZ3B1OiBSZWdpc3RlciBJT01NVSB0
b3BvbG9neSBub3RpZmllciBwZXIgZGV2aWNlLiIgCj4gdG8gc2VlCj4gaG93IGkgdXNlIGl0LiBJ
IGRvbid0IHNlZSB3aHkgdGhpcyBzaG91bGQgZ28gaW50byBUVE0gbWlkLWxheWVyIC0gdGhlIAo+
IHN0dWZmIEkgZG8gaW5zaWRlCj4gaXMgdmVuZG9yIHNwZWNpZmljIGFuZCBhbHNvIEkgZG9uJ3Qg
dGhpbmsgVFRNIGlzIGV4cGxpY2l0bHkgYXdhcmUgb2YgCj4gSU9NTVUgPwo+IERvIHlvdSBtZWFu
IHlvdSBwcmVmZXIgdGhlIElPTU1VIG5vdGlmaWVyIHRvIGJlIHJlZ2lzdGVyZWQgZnJvbSB3aXRo
aW4gCj4gVFRNCj4gYW5kIHRoZW4gdXNlIGEgaG9vayB0byBjYWxsIGludG8gdmVuZG9yIHNwZWNp
ZmljIGhhbmRsZXIgPwoKTm8sIHRoYXQgaXMgcmVhbGx5IHZlbmRvciBzcGVjaWZpYy4KCldoYXQg
SSBtZWFudCBpcyB0byBoYXZlIGEgZnVuY3Rpb24gbGlrZSB0dG1fcmVzb3VyY2VfbWFuYWdlcl9l
dmljdF9hbGwoKSAKd2hpY2ggeW91IG9ubHkgbmVlZCB0byBjYWxsIGFuZCBhbGwgdHQgb2JqZWN0
cyBhcmUgdW5wb3B1bGF0ZWQuCgpHaXZlIG1lIGEgZGF5IG9yIHR3byB0byBsb29rIGludG8gdGhp
cy4KCkNocmlzdGlhbi4KCj4KPiBBbmRyZXkKPgo+Cj4+Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV5IEdyb2R6b3Zza3kgPGFuZHJleS5ncm9kem92c2t5QGFtZC5jb20+Cj4+PiAtLS0KPj4+
IMKgIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgfCAxICsKPj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV90dC5jIAo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCj4+PiBpbmRl
eCAxY2NmMWVmLi4yOTI0OGE1IDEwMDY0NAo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fdHQuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwo+Pj4gQEAgLTQ5
NSwzICs0OTUsNCBAQCB2b2lkIHR0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fdHQgKnR0bSkK
Pj4+IMKgwqDCoMKgwqAgZWxzZQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHR0bV9wb29sX3VucG9w
dWxhdGUodHRtKTsKPj4+IMKgIH0KPj4+ICtFWFBPUlRfU1lNQk9MKHR0bV90dF91bnBvcHVsYXRl
KTsKPj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
