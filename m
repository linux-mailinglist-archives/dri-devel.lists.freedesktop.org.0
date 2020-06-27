Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA7F20CA61
	for <lists+dri-devel@lfdr.de>; Sun, 28 Jun 2020 22:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCD56E3AA;
	Sun, 28 Jun 2020 20:36:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C61016E18F
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 22:32:03 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y18so6984666lfh.11
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 15:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KI0QLmVCjjTMq/liju5LuAbZSO1DU/M8HGIKzvnZfZA=;
 b=AqdsbRdrumFb5omQ54zZ/ZMuSu6PWS1wyma5Kowy/H7iXUYC5t+Yn4WkAgSfDWQfaK
 VyAfCFBZQDixCaa/rflKPaOPO2g8l/XtH9PXE7AZZjJVAKosoGNrWnf3B4u+KucbrK/y
 4cpo9eEkdcsebW2CC63QFf4xjFlJPkm7s7JGXTMCeDlcwUb46z9kvMro+sbbQZKUgzRu
 qblWJ8HtWJffT8GKNt16HDQ+5qECUVGoyWMgGXEBfizcpL1sRqzZUgGeQm13mZTR6luq
 HvtZJ++THOWm1vBHVkdknhrW+NomNXNtYLS5gR5buIqhHH3OF8qehZWg48IeuLPjL2mM
 wbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KI0QLmVCjjTMq/liju5LuAbZSO1DU/M8HGIKzvnZfZA=;
 b=uiPHPrIxkUyNjUvS6P5zpm7Cc4otQFy6Pz6w/hcdPOPqYJ7RrEckKg+okudWT5hEmw
 uOM9piM6xvdmxL5+Ly50CpoHXT8xsNHZq/XpQaoNV24uXscdjd5+H4J6/2eoeXtIWOlA
 jkI5/UdtyVf3SrGkYJwhYzTK6HjhvyqF7RInvqLXRyvkmtZo21T2OF98YEhYafoc09Xu
 GFLCJF5h5GdS8jfNVqGJutDYJyp6aP2QZeWVEU9juHvapEayEL3KeVVcbjPY0NWHl+p7
 hc8MHRkjvOvtzynysbQQ4F43UXYsw8Zy66msK7aBbc/FC2kOOFMD/Me2ui8YS3SJVAnD
 gl0g==
X-Gm-Message-State: AOAM531m7r/xQpyleJDY5v9oaqZKF2qAJxSPjFT4EUfNYJ4Kb9xn+HK4
 0Ua3/B4HUKaobmCe3n4/0cc=
X-Google-Smtp-Source: ABdhPJwptYMmsgc+XFwI8cVVRMC/GMyQh++1AuGgHnkvFWOM8oeAqqgisonrCpYywqUd+dbSmj/wSg==
X-Received: by 2002:a05:6512:4c6:: with SMTP id
 w6mr3250609lfq.76.1593297122246; 
 Sat, 27 Jun 2020 15:32:02 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id z84sm6078108lfa.54.2020.06.27.15.32.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Jun 2020 15:32:01 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (drm_tegra_submit_command)
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <f31fbe3b-3fc5-2ece-4c2c-9ff4e99995d6@gmail.com>
Date: Sun, 28 Jun 2020 01:32:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 28 Jun 2020 20:36:36 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gLyogQ29tbWFu
ZCBpcyBhbiBvcGNvZGUgZ2F0aGVyIGZyb20gYSBHRU0gaGFuZGxlICovCj4gI2RlZmluZSBEUk1f
VEVHUkFfU1VCTUlUX0NPTU1BTkRfR0FUSEVSwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIDAKPiAv
KiBDb21tYW5kIGlzIGFuIG9wY29kZSBnYXRoZXIgZnJvbSBhIHVzZXIgcG9pbnRlciAqLwo+ICNk
ZWZpbmUgRFJNX1RFR1JBX1NVQk1JVF9DT01NQU5EX0dBVEhFUl9VUFRSwqDCoMKgwqDCoMKgwqAg
MQo+IC8qIENvbW1hbmQgaXMgYSB3YWl0IGZvciBzeW5jcHQgZmVuY2UgY29tcGxldGlvbiAqLwo+
ICNkZWZpbmUgRFJNX1RFR1JBX1NVQk1JVF9DT01NQU5EX1dBSVRfU1lOQ1BUwqDCoMKgwqDCoMKg
wqAgMgo+IC8qIENvbW1hbmQgaXMgYSB3YWl0IGZvciBTWU5DX0ZJTEUgRkQgY29tcGxldGlvbiAq
Lwo+ICNkZWZpbmUgRFJNX1RFR1JBX1NVQk1JVF9DT01NQU5EX1dBSVRfU1lOQ19GSUxFwqDCoMKg
wqAgMwo+IC8qIENvbW1hbmQgaXMgYSB3YWl0IGZvciBEUk0gc3luY29iaiBjb21wbGV0aW9uICov
Cj4gI2RlZmluZSBEUk1fVEVHUkFfU1VCTUlUX0NPTU1BTkRfV0FJVF9TWU5DT0JKwqDCoMKgwqDC
oMKgIDQKPiAKPiAvKgo+IMKgKiBBbGxvdyBkcml2ZXIgdG8gc2tpcCBjb21tYW5kIGV4ZWN1dGlv
biBpZiBlbmdpbmUKPiDCoCogd2FzIG5vdCBhY2Nlc3NlZCBieSBhbm90aGVyIGNoYW5uZWwgYmV0
d2Vlbgo+IMKgKiBzdWJtaXNzaW9ucy4KPiDCoCovCj4gI2RlZmluZSBEUk1fVEVHUkFfU1VCTUlU
X0NPTlRFWFRfU0VUVVDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgICgxPDwwKQo+IAo+IHN0cnVjdCBkcm1fdGVncmFfc3VibWl0X2NvbW1hbmQgewo+IMKgwqDC
oMKgwqDCoMKgIF9fdTE2IHR5cGU7Cj4gwqDCoMKgwqDCoMKgwqAgX191MTYgZmxhZ3M7CgpTaG91
bGRuJ3QgdGhlICJwYWNrZWQiIGF0dHJpYnV0ZSBiZSBuZWVkZWQgaWYgYSBub24tMzJiaXQgYWxp
Z25lZCBmaWVsZHMKYXJlIHVzZWQ/Cgo+IMKgwqDCoMKgwqDCoMKgIHVuaW9uIHsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHsKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCAvKiBHRU0gaGFuZGxlICovCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgX191MzIgaGFuZGxlOwo+IAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC8qCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIE9mZnNldCBpbnRvIEdFTSBvYmplY3QgaW4gYnl0ZXMuCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIE11c3QgYmUgYWxpZ25lZCBieSA0Lgo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX3U2NCBvZmZzZXQ7Cgo2NGJpdHMgZm9yIGEgZ2F0
aGVyIG9mZnNldCBpcyBhIGJpdCB0b28gbXVjaCwgaW4gbW9zdCBjYXNlcyBnYXRoZXJzIGFyZQp1
bmRlciA0Sy4KCnUzMiBzaG91bGQgYmUgbW9yZSB0aGFuIGVub3VnaCAobWF5YmUgZXZlbiB1MTYg
aWYgb2Zmc2V0IGlzIGdpdmVuIGluIGEKZHdvcmQgZ3JhbnVsYXJpdHkpLgoKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAvKgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiBMZW5ndGggb2YgZ2F0aGVyIGluIGJ5dGVzLgo+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBNdXN0IGJlIGFsaWduZWQgYnkgNC4K
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX191NjQgbGVuZ3RoOwoKdTMyLzE2Cgo+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9IGdhdGhlcjsKCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBfX3UzMiByZXNlcnZlZFsxXTsKPiAKPiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogUG9pbnRlciB0byBnYXRoZXIgZGF0YS4KPiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBNdXN0IGJl
IGFsaWduZWQgYnkgNCBieXRlcy4KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIF9fdTY0IGJhc2U7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAvKgo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIExlbmd0aCBvZiBnYXRoZXIgaW4gYnl0ZXMuCj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogTXVzdCBiZSBhbGlnbmVkIGJ5IDQu
Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4g
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBfX3U2NCBsZW5n
dGg7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0gZ2F0aGVyX3VwdHI7CgpXaGF0
IGFib3V0IHRvIGlubGluZSB0aGUgVVBUUiBnYXRoZXIgZGF0YSBhbmQgcmVsb2NzIGludG8gdGhl
CmRybV90ZWdyYV9zdWJtaXRfY29tbWFuZFtdIGJ1ZmZlcjoKCnN0cnVjdCBkcm1fdGVncmFfc3Vi
bWl0X2NvbW1hbmQgewoJc3RydWN0IHsKCQl1MTYgbnVtX3dvcmRzOwoJCXUxNiBudW1fcmVsb2Nz
OwoKCQlnYXRoZXJfZGF0YVtdOwoJCWRybV90ZWdyYV9zdWJtaXRfcmVsb2NhdGlvbiByZWxvY3Nb
XTsKCX0gZ2F0aGVyX3VwdHI7Cn07CgpzdHJ1Y3QgZHJtX3RlZ3JhX2NoYW5uZWxfc3VibWl0IHsK
ICAgICAgICBfX3UzMiBudW1fc3luY3B0X2luY3JzOwogICAgICAgIF9fdTMyIHN5bmNwdF9pZHg7
CgogICAgICAgIF9fdTY0IGNvbW1hbmRzX3B0cjsKCV9fdTMyIGNvbW1hbmRzX3NpemU7Ci4uLgp9
OwoKc3RydWN0IGRybV90ZWdyYV9zdWJtaXRfY29tbWFuZCBleGFtcGxlW10gPSB7CgljbWQuZ2F0
aGVyX3VwdHJ7fSwKCS4uLgoJZ2F0aGVyX2RhdGFbXSwKCWdhdGhlcl9yZWxvY3NbXSwKCWNtZC53
YWl0X3N5bmNwdHt9LAoJLi4uCn07CgpUaGlzIHdheSB3ZSB3aWxsIGhhdmUgb25seSBhIHNpbmds
ZSBjb3B5X2Zyb21fdXNlcigpIGZvciB0aGUgd2hvbGUKY21kc3RyZWFtLCB3aGljaCBzaG91bGQg
YmUgbW9yZSBlZmZpY2llbnQgdG8gZG8gYW5kIG5pY2VyIGZyb20gYm90aAp1c2Vyc3BhY2UgYW5k
IGtlcm5lbCBwZXJzcGVjdGl2ZXMgaW4gcmVnYXJkcyB0byBmb3JtaW5nIGFuZCBwYXJzaW5nIHRo
ZQpjb21tYW5kcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
