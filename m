Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4D3116E3
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 12:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8903A8929C;
	Thu,  2 May 2019 10:07:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171F48929C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 10:07:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l2so2482420wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 03:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ln8lwyZu4d/pYnNZvNPmH5kvFZK/dwi+Vdw+/DDqqUM=;
 b=QQYoYHTjTPLOha2msiIyuHN2vds+TQMr7GWpWnxdbtADqI2CWuz0ImT4fuEi+sLP74
 UjDpCLBRzmKxm+ouT8TNXLWo7UeXb6VOKVbTFNINw8jn3Gy2q93xQTwu2c99pv57S8RO
 yj6ogsVYpnEsjPT4BQeq9wjDjKfDrIGoPr9J7uUW67GGWB6JN/Gk6SwnjvAN4YxYmdFB
 hcdOb04bi3jWR8rQ1UHw2tLaSyrp5z+2nAEgqnaeataoHC9ylpgPg3sTi2jk2hXGuPy2
 fc0IerzxWCghAb36zS+ZBAYeB/58FPjjVfxsDQDfCJtlF/YjNgFyPALPusxVVkbhlo+f
 PqxA==
X-Gm-Message-State: APjAAAW8NixPz8foRrwL199wtMOEhM70m8l6XlLRyVcmBgOsYfBs693L
 JC+lpYvx9k5uyvsKpvx0TRlLLg==
X-Google-Smtp-Source: APXvYqxCUpDRSYjyDsro/neuM3zU2yetyNE7BWDvtaVkr0uL7P4Jw8IIuS/ufxGiG+KidXro3bPrPQ==
X-Received: by 2002:adf:dd86:: with SMTP id x6mr2038651wrl.308.1556791673662; 
 Thu, 02 May 2019 03:07:53 -0700 (PDT)
Received: from holly.lan (static-84-9-17-116.vodafonexdsl.co.uk. [84.9.17.116])
 by smtp.googlemail.com with ESMTPSA id f1sm11063325wrc.93.2019.05.02.03.07.52
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 03:07:52 -0700 (PDT)
Subject: Re: [PATCH v6 1/3] backlight: lm3630a: return 0 on success in
 update_status functions
To: Brian Masney <masneyb@onstation.org>, lee.jones@linaro.org,
 jingoohan1@gmail.com, robh+dt@kernel.org
References: <20190424092505.6578-1-masneyb@onstation.org>
 <20190424092505.6578-2-masneyb@onstation.org>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <864c1ddc-1008-0041-1559-e491ca0186ef@linaro.org>
Date: Thu, 2 May 2019 11:07:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190424092505.6578-2-masneyb@onstation.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ln8lwyZu4d/pYnNZvNPmH5kvFZK/dwi+Vdw+/DDqqUM=;
 b=SjF5Jc829R673WB+uMlg9Gl5Kqt2vyeeJMJN6YGyamTtIwyOVO6IFzWM4hxrLbiiaU
 HWU5wXARUjWgTD6Mp0hN5OOGjzWJ7Cb9+BsPQsZSzKg59KQAehyH5sGvnnufdtHKHoqe
 4/H7avUgSyUolKRLZ1aGByHldQSrQYqpDU5hmbu57Vb8oP7ZBY//cpsldNrd+ru+y6gT
 DBD31XtjGaoeHMjwgHNaJFz1bBLhWk0I7UwPfKkeSXTUxXi41t7OPdenwX/GlUgdbxF/
 n9feAgCpyWmfwV9UMZFZ36sBpGV9V8//grybcYgOOene6239oM4lbuhfzND4hLgyw/J2
 93rQ==
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-fbdev@vger.kernel.org, jonathan@marek.ca, b.zolnierkie@samsung.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jacek.anaszewski@gmail.com, pavel@ucw.cz,
 Daniel Thompson <daniel@redfelineninja.org.uk>, linux-leds@vger.kernel.org,
 dmurphy@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjQvMDQvMjAxOSAxMDoyNSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IGxtMzYzMGFfYmFua19h
X3VwZGF0ZV9zdGF0dXMoKSBhbmQgbG0zNjMwYV9iYW5rX2JfdXBkYXRlX3N0YXR1cygpCj4gYm90
aCByZXR1cm4gdGhlIGJyaWdodG5lc3MgdmFsdWUgaWYgdGhlIGJyaWdodG5lc3Mgd2FzIHN1Y2Nl
c3NmdWxseQo+IHVwZGF0ZWQuIFdyaXRpbmcgdG8gdGhlc2UgYXR0cmlidXRlcyB2aWEgc3lzZnMg
d291bGQgY2F1c2UgYSAnQmFkCj4gYWRkcmVzcycgZXJyb3IgdG8gYmUgcmV0dXJuZWQuIFRoZXNl
IGZ1bmN0aW9ucyBzaG91bGQgcmV0dXJuIDAgb24KPiBzdWNjZXNzLCBzbyBsZXQncyBjaGFuZ2Ug
aXQgdG8gY29ycmVjdCB0aGF0IGVycm9yLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25l
eSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgo+IEZpeGVzOiAyOGU2NGE2OGEyZWYgKCJiYWNrbGln
aHQ6IGxtMzYzMDogYXBwbHkgY2hpcCByZXZpc2lvbiIpCj4gQWNrZWQtYnk6IFBhdmVsIE1hY2hl
ayA8cGF2ZWxAdWN3LmN6PgoKSGkgQnJpYW4sIHNvcnJ5IGZvciB0aGUgZGVsYXkuIEZvciBzb21l
IHJlYXNvbiB5b3VyIG1haWxzIGFyZSBiZWluZyAKZHVtcGVkIGJlZm9yZSB0aGV5IHJlYWNoIG1l
IHNvIEkgb25seSBkaXNjb3ZlcmVkIHRoZXNlIHBhdGNoZXMgd2hlbiBJIApwYWlkIHByb3BlciBh
dHRlbnRpb24gdG8gdGhlIHJlcGxpZXMgYW5kIGZldGNoZWQgdGhlbSBmcm9tIHBhdGNod29yay4K
CkhpIExlZSwgaXMgdGhlIHNhbWUgdGhpbmcgaGFwcGVuaW5nIGZvciB5b3U/IDstKQoKQWNrZWQt
Ynk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CgoKPiAtLS0K
PiBObyBjaGFuZ2VzIHNpbmNlIHYyIHdoZW4gdGhpcyBwYXRjaCB3YXMgb3JpZ2luYWxseSBpbnRy
b2R1Y2VkLgo+IAo+ICAgZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0zNjMwYV9ibC5jIHwgNCAr
Ky0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMgYi9k
cml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKPiBpbmRleCAyMDMwYTZiNzdhMDku
LmVmMjU1M2Y0NTJjYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2
MzBhX2JsLmMKPiArKysgYi9kcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2MzBhX2JsLmMKPiBA
QCAtMjAxLDcgKzIwMSw3IEBAIHN0YXRpYyBpbnQgbG0zNjMwYV9iYW5rX2FfdXBkYXRlX3N0YXR1
cyhzdHJ1Y3QgYmFja2xpZ2h0X2RldmljZSAqYmwpCj4gICAJCQkJICAgICAgTE0zNjMwQV9MRURB
X0VOQUJMRSwgTE0zNjMwQV9MRURBX0VOQUJMRSk7Cj4gICAJaWYgKHJldCA8IDApCj4gICAJCWdv
dG8gb3V0X2kyY19lcnI7Cj4gLQlyZXR1cm4gYmwtPnByb3BzLmJyaWdodG5lc3M7Cj4gKwlyZXR1
cm4gMDsKPiAgIAo+ICAgb3V0X2kyY19lcnI6Cj4gICAJZGV2X2VycihwY2hpcC0+ZGV2LCAiaTJj
IGZhaWxlZCB0byBhY2Nlc3NcbiIpOwo+IEBAIC0yNzgsNyArMjc4LDcgQEAgc3RhdGljIGludCBs
bTM2MzBhX2JhbmtfYl91cGRhdGVfc3RhdHVzKHN0cnVjdCBiYWNrbGlnaHRfZGV2aWNlICpibCkK
PiAgIAkJCQkgICAgICBMTTM2MzBBX0xFREJfRU5BQkxFLCBMTTM2MzBBX0xFREJfRU5BQkxFKTsK
PiAgIAlpZiAocmV0IDwgMCkKPiAgIAkJZ290byBvdXRfaTJjX2VycjsKPiAtCXJldHVybiBibC0+
cHJvcHMuYnJpZ2h0bmVzczsKPiArCXJldHVybiAwOwo+ICAgCj4gICBvdXRfaTJjX2VycjoKPiAg
IAlkZXZfZXJyKHBjaGlwLT5kZXYsICJpMmMgZmFpbGVkIHRvIGFjY2VzcyBSRUdfQ1RSTFxuIik7
Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
