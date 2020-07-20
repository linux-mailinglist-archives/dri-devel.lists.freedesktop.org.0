Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0C9227A67
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 10:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A603089CAC;
	Tue, 21 Jul 2020 08:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5ACC89E2B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 14:46:47 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a6so175432wmm.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=bMY2bd7PftOqDtQBakPHJtZ+KfpWJcFf+u/c3vx0/DI=;
 b=Ifu9G7i5rsqyLIlW6JlN5zQrTfuHUixB6ByUZF4vvPANK9lqkf1rlUeUuRb4axmBqK
 T/xX8mpLoQMQ/Y84dHCnXXyomrVzvAEDHEwZOfOAa4HgOGLNlWriAZwo+sM5dftglChk
 4FsXPV1gMjq9wU3OvYwJjj+A6Cx1UcE1FYKHN9Oa5i/Qdyum8BLuXBveD+U1TdB/roKk
 QGsn7vcNxluF+FcslZjfjgentxP59frVS3EQvWsKqaNQO7k/WltlwYvS9GPQFiG/7G0I
 A0V1GchomdB4vd/yTxcCk4cyNUkx7dY/aKhT/28j6MXzJz6T1pxqNfL62x5FzQ11DXux
 EyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=bMY2bd7PftOqDtQBakPHJtZ+KfpWJcFf+u/c3vx0/DI=;
 b=Z0GJgVH5F66b0xmWRGysN6JeUq9lei1ScH5JV2R700hKB4nSJnxeqCudJI3RhRUdLr
 OZEk4+zlrlTSuURpluz0BfQyA/5r8Co40zar/fADKogfV8ehL3iwHkxU4KBQz5COgHF4
 h1mfVxZ2jauMcz6FW0Yfu9MiLOFHYt/f3lbRClQUf8D81q92AgVxygqHLJO0FvmLboW6
 xIR/WbrhOM/opSHPuRyeoNj3xmW3zaCcCGngVTpZLUDBVN+AXulxX6gtx+xQ687nF62N
 WeprEJ5d/gX+64mhsuPsh37X+f1sP/1ARpctLwO2CR32d/g3ax+kIthVH4zKNWzCyV50
 y+/g==
X-Gm-Message-State: AOAM530wv3xQCQ7GVqE8PijeU1CDnjr5IIrotEZ4MPRxLS8bSREtKfrh
 P3m5S3kbUfcpgh1NZeQIAg==
X-Google-Smtp-Source: ABdhPJx/fqm8FZYrXJUrVv9fHFF6lRYTD7UrXijvZynTORUjibzGxBTYQQCdHqoTCQX//xqQrm8QDg==
X-Received: by 2002:a1c:98c1:: with SMTP id
 a184mr22266672wme.116.1595256406180; 
 Mon, 20 Jul 2020 07:46:46 -0700 (PDT)
Received: from [192.168.200.34] (ip5b436a54.dynamic.kabel-deutschland.de.
 [91.67.106.84])
 by smtp.gmail.com with ESMTPSA id b8sm2579413wrv.4.2020.07.20.07.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jul 2020 07:46:45 -0700 (PDT)
Subject: =?UTF-8?Q?Re=3a_=5bPATCH_2/5=5d_drm=3a_rockchip=3a_add_missing_regi?=
 =?UTF-8?B?c3RlcnMgZm9yIFJLMzE4OOOAkOivt+azqOaEj++8jOmCruS7tueUsWxpbnV4LXJv?=
 =?UTF-8?Q?ckchip-bounces+andy=2eyan=3drock-chips=2ecom=40lists=2einfradead?=
 =?UTF-8?B?Lm9yZ+S7o+WPkeOAkQ==?=
To: Andy Yan <andy.yan@rock-chips.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>
References: <20200718200323.3559-1-knaerzche@gmail.com>
 <20200718200323.3559-3-knaerzche@gmail.com>
 <871ce1ac-2d5b-c0a2-60a6-6aba0f296c18@rock-chips.com>
From: Alex Bee <knaerzche@gmail.com>
Message-ID: <12296860-d6ed-5135-7c4e-545362829051@gmail.com>
Date: Mon, 20 Jul 2020 16:46:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <871ce1ac-2d5b-c0a2-60a6-6aba0f296c18@rock-chips.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 21 Jul 2020 08:18:03 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQW5keSwKCkFtIDIwLjA3LjIwIHVtIDEwOjIyIHNjaHJpZWIgQW5keSBZYW46Cj4gSGkgQWxl
eDoKPgo+IE9uIDcvMTkvMjAgNDowMyBBTSwgQWxleCBCZWUgd3JvdGU6Cj4+IFRoaXMgcGF0Y2gg
YWRkcyBkaXRoZXJfdXAsIGRzcF9sdXRfZW4sIGRhdGFfYmxhbmsgYW5kIGRzcF9kYXRhX3N3YXAK
Pj4gcmVnaXN0ZXJzIHRvIGVuYWJsZSB0aGVpciByZXNwZWN0aXZlIGZ1bmN0aW9uYWxpdHkgZm9y
IFJLMzE4OCdzIFZPUC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQWxleCBCZWUgPGtuYWVyemNoZUBn
bWFpbC5jb20+Cj4+IC0tLQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBf
dm9wX3JlZy5jIHwgNCArKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF92b3Bf
cmVnLmMgCj4+IGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3ZvcF9yZWcuYwo+
PiBpbmRleCBiMDQ2OTEwMTI5ZmIuLjk3MWE2YmRhNzQ1OCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX3ZvcF9yZWcuYwo+PiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfdm9wX3JlZy5jCj4+IEBAIC01MTIsNiArNTEyLDEwIEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm9wX2NvbW1vbiByazMxODhfY29tbW9uID0gewo+PiDCoMKg
wqDCoMKgIC5kaXRoZXJfZG93bl9lbiA9IFZPUF9SRUcoUkszMTg4X0RTUF9DVFJMMCwgMHgxLCAx
MSksCj4+IMKgwqDCoMKgwqAgLmRpdGhlcl9kb3duX21vZGUgPSBWT1BfUkVHKFJLMzE4OF9EU1Bf
Q1RSTDAsIDB4MSwgMTApLAo+PiDCoMKgwqDCoMKgIC5kc3BfYmxhbmsgPSBWT1BfUkVHKFJLMzE4
OF9EU1BfQ1RSTDEsIDB4MywgMjQpLAo+PiArwqDCoMKgIC5kaXRoZXJfdXAgPSBWT1BfUkVHKFJL
MzE4OF9EU1BfQ1RSTDAsIDB4MSwgOSksCj4+ICvCoMKgwqAgLmRzcF9sdXRfZW4gPSBWT1BfUkVH
KFJLMzE4OF9TWVNfQ1RSTCwgMHgxLCAyOCksCj4+ICvCoMKgwqAgLmRhdGFfYmxhbmsgPSBWT1Bf
UkVHKFJLMzE4OF9EU1BfQ1RSTDEsIDB4MSwgMjUpLAo+PiArwqDCoMKgIC5kc3BfZGF0YV9zd2Fw
ID0gVk9QX1JFRyhSSzMxODhfRFNQX0NUUkwxLCAweDFmLCAyNiksCj4KPgo+Cj4gSSBjYW4ndCBm
aW5kIHRoZSBkZWZpbml0aW9uIG9mIGRzcF9kYXRhX3N3YXAsIG9yIEkgbWlzc2VkIHNvbWV0aGlu
Zz8KPgpOb3RlIHRoYXQgLmRzcF9kYXRhX3N3YXAgaXMgbm90IGRlZmluZWQgd2l0aCB0aGF0IG5h
bWUgaW4gVFJNIChhcyBpdCBpcyAKbm90IGluIFJLMzI4OC9SSzMzMjgpLCBzaW5jZSBwb3RlbnRp
YWxseSBtb3JlIHRoZSBvbmUgYml0IHdvdWxkIGhhdmUgdG8gCmJlIHNldCBmb3IgdGhpcyAoY3Vy
cmVudGx5IG9ubHkgUkJfU1dBUCAoMHgyKSBpcyBpbXBsZW1lbnRlZCBpbiB0aGUgVk9QIApkcml2
ZXIpLgoKVG8gYmUgc29tZSBraW5kIG9mIGZ1dHVyZSBwcm9vZiAoaWYgQkdfU1dBUCwgUkdfU1dB
UCwgREVMVEFfU1dBUCBvciAKRFVNTVlfU1dBUCBldmVyIGdldCBpbXBsZW1lbnRlZCkgaXQgc2hv
dWxkIGJlIGFsaWduZWQgd2l0aCB3aGF0IGlzIApkZWZpbmVkIGZvciBSSzMyODgvUkszMzI4IG5v
dyB0byBhdXRvbWF0aWNhbGx5IGJlbmVmaXQgZnJvbSB0aGF0IAphZGRpdGlvbnMuIEFuZCBpdCB3
b3VsZCwgc2luY2UgUkszMjg4X0RTUF9DVFJMMCBCSVQxMiwgQklUMTMsIEJJVDE0LCAKQklUMTUs
IEJJVDE2IGV4YWN0bHkgbWF0Y2hlcyB3aXRoIFJLMzE4OF9EU1BfQ1RSTDEgQklUMjYsIEJJVDI3
LCBCSVQyOCwgCkJJVDI5LCBCSVQzMC4KCkN1cnJlbnQgaW1wbGVtZW50YXRpb24gc2V0cyBCSVQx
MyBmb3IgUkszMjg4IGFuZCB3aXRoIHRoaXMgcGF0Y2ggQklUMjcgCmZvciBSSzMxODggdG8gZW5h
YmxlIFJCX1NXQVAuCgo+Cj4KPj4gwqAgfTsKPj4gwqAgwqAgc3RhdGljIGNvbnN0IHN0cnVjdCB2
b3Bfd2luX2RhdGEgcmszMTg4X3ZvcF93aW5fZGF0YVtdID0gewo+Cj4KUmVnYXJkcywKCkFsZXgK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
