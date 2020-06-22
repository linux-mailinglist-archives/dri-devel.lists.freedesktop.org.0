Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEF6204095
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 21:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BABF6E8CD;
	Mon, 22 Jun 2020 19:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E68E6E056;
 Mon, 22 Jun 2020 19:37:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id j18so678194wmi.3;
 Mon, 22 Jun 2020 12:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=yfDv9JCUfuGZuDOZIeOoXkpVzqBPdplJ9uEWZBqAisc=;
 b=LvTR42cK2gta9SN/GIxv3yN6aYXrfI4t4DYPar8Q0/+UPs5SY8pV91hMmudmko/Rzg
 t/08idsNmZJ2POJIJroEgz9lqr3B3mFFcEYxf83DUWlH8YmiD1j1likYVjBg9bQw1ExX
 SUhrxOYhJl1Hsjp6ueL+h74YKjrpXYl8jfCSZNxFgaI8OH455OwSuGu9BwC62TETParP
 Vul/C5IeGR5FTivIxypQdOOFpbd1VX7lt0GQ4VGPk5g/QYyMPUyaFm2y5/V9KGzDsh6O
 IOVIAVJou6fgYEIgTJ7h0xNsUevA/NKPgfRK924/WGUCXI55zbYBPgeXy4Y1aqr4TzL5
 5INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=yfDv9JCUfuGZuDOZIeOoXkpVzqBPdplJ9uEWZBqAisc=;
 b=DO6ESyDCP1i7702pzmliCVjAHsK6pts8YuQo4pmKHihNnRgReLwgK/DZkxWbK1sviP
 3KxBfn8YUtH7dfKpUazm1yNXKk1N5MJCgBgQzpRXCREQTXQqcnWd27lBMIYmCtkDt/kV
 8HcKjlPUfXQfLo8VCZ0WgjaDPYo/vgYwBGCN7FzY8OYGDi7W52mIxZikmB5woPs42qAr
 L+LVqh4tEr91es3R0Kyzwzrvvf9CytIdPQJguYUSVGnstIxwBSoeaM3FmSnlcwTL3dgB
 +bp7k+d12HhWnUeD381p6YeQOYjcby5DnueqeTX12fYboDQEiNAkK5hgEifm27o3Upsf
 NfqA==
X-Gm-Message-State: AOAM533ahXL467hrQ4Q/FimZdeJfUbOIo4BZbOdDlNDKzHrSEDoeoNUf
 1xWYSLByNkZaDM90K9eJ9ww=
X-Google-Smtp-Source: ABdhPJyPw8nSBWGHtLvvWbBGpypUdQCQATtA/nKKaTsQnEOrBDMZYIXfAZIpxJju6K3AwfP94lXsMg==
X-Received: by 2002:a7b:c30a:: with SMTP id k10mr15928334wmj.44.1592854661184; 
 Mon, 22 Jun 2020 12:37:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id y196sm708846wmd.11.2020.06.22.12.37.39
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Jun 2020 12:37:40 -0700 (PDT)
Subject: Re: [PATCH v2 3/8] drm/ttm: Add unampping of the entire device
 address space
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <1592719388-13819-1-git-send-email-andrey.grodzovsky@amd.com>
 <1592719388-13819-4-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <92f0cc9d-32c1-c86d-60ff-622144251e2a@gmail.com>
Date: Mon, 22 Jun 2020 21:37:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1592719388-13819-4-git-send-email-andrey.grodzovsky@amd.com>
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
Cc: daniel.vetter@ffwll.ch, michel@daenzer.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjEuMDYuMjAgdW0gMDg6MDMgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBIZWxwZXIg
ZnVuY3Rpb24gdG8gYmUgdXNlZCB0byBpbnZhbGlkYXRlIGFsbCBCT3MgQ1BVIG1hcHBpbmdzCj4g
b25jZSBkZXZpY2UgaXMgcmVtb3ZlZC4KPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBHcm9kem92
c2t5IDxhbmRyZXkuZ3JvZHpvdnNreUBhbWQuY29tPgoKUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBL
w7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KCj4gLS0tCj4gICBkcml2ZXJzL2dwdS9k
cm0vdHRtL3R0bV9iby5jICAgIHwgOCArKysrKystLQo+ICAgaW5jbHVkZS9kcm0vdHRtL3R0bV9i
b19kcml2ZXIuaCB8IDcgKysrKysrKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gaW5kZXggYzViNTE2Zi4u
OTI2YTM2NSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+IEBAIC0xNzUwLDEwICsxNzUwLDE0IEBA
IHZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWwoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykK
PiAgIAl0dG1fYm9fdW5tYXBfdmlydHVhbF9sb2NrZWQoYm8pOwo+ICAgCXR0bV9tZW1faW9fdW5s
b2NrKG1hbik7Cj4gICB9Cj4gLQo+IC0KPiAgIEVYUE9SVF9TWU1CT0wodHRtX2JvX3VubWFwX3Zp
cnR1YWwpOwo+ICAgCj4gK3ZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZShz
dHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldikKPiArewo+ICsJdW5tYXBfbWFwcGluZ19yYW5nZShi
ZGV2LT5kZXZfbWFwcGluZywgMCwgMCwgMSk7Cj4gK30KPiArRVhQT1JUX1NZTUJPTCh0dG1fYm9f
dW5tYXBfdmlydHVhbF9hZGRyZXNzX3NwYWNlKTsKPiArCj4gICBpbnQgdHRtX2JvX3dhaXQoc3Ry
dWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKPiAgIAkJYm9vbCBpbnRlcnJ1cHRpYmxlLCBib29s
IG5vX3dhaXQpCj4gICB7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fZHJp
dmVyLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4gaW5kZXggYzllMGZkMC4u
MzllYTQ0ZiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2RyaXZlci5oCj4g
KysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19kcml2ZXIuaAo+IEBAIC02MDEsNiArNjAxLDEz
IEBAIGludCB0dG1fYm9fZGV2aWNlX2luaXQoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCj4g
ICB2b2lkIHR0bV9ib191bm1hcF92aXJ0dWFsKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8p
Owo+ICAgCj4gICAvKioKPiArICogdHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVzc19zcGFjZQo+
ICsgKgo+ICsgKiBAYmRldjogdGVhciBkb3duIGFsbCB0aGUgdmlydHVhbCBtYXBwaW5ncyBmb3Ig
dGhpcyBkZXZpY2UKPiArICovCj4gK3ZvaWQgdHRtX2JvX3VubWFwX3ZpcnR1YWxfYWRkcmVzc19z
cGFjZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldik7Cj4gKwo+ICsvKioKPiAgICAqIHR0bV9i
b191bm1hcF92aXJ0dWFsCj4gICAgKgo+ICAgICogQGJvOiB0ZWFyIGRvd24gdGhlIHZpcnR1YWwg
bWFwcGluZ3MgZm9yIHRoaXMgQk8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
