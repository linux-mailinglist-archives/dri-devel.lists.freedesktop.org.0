Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B05CF24AF31
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 08:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAAC6E8A8;
	Thu, 20 Aug 2020 06:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60E66E8A8
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 06:23:06 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z18so874302wrm.12
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 23:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Rfe5cf8ONeOtyLL1u7/RmPWIu+jJLpGbwRQ//wGFeDM=;
 b=HiW1tz0Re0iY3P915VZVsLzjSN7j7y5asxapsRDp7fVIOb5J7C5nLkBOeRcy6/JJWO
 xarF8bqLYq3w6ERx3p2kDYIik/29V6DZuGZFbqbD5Lg+FXbhz2mHa1YMfX0w+jR8rkWO
 iY0pyjp8BQL06RTpY8f2toCrB39wuV/Km9oeZE6fA14hiKCo/jtH4a/0KPCO7r1qhWRU
 FNAOnALWdwnBpDjDXJ0Be/jxzmHL7udncEIr+KW82c4+7cIdVG/nvqcHm4Io6Wnqmi6X
 s9pknqLptsmCuiGKZ+/gnKAYSR5v+OYRENLKCsp47kxlDJ8MR5JGEw5rgYU26AzZeeiJ
 glnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Rfe5cf8ONeOtyLL1u7/RmPWIu+jJLpGbwRQ//wGFeDM=;
 b=BciQ0j1O+MRUr4LZ2gg4udZIv5EL5jOm7hRAGR1JQKZxPuTD9iwWovGTetGjzleH9f
 +yMZ/aqR3Ku8brnL6EHsU8TSIOVJC7pDIqtyZ27Rdnu55UdL9wtyWtXN4nJM7cR3Yf4U
 YCD3gsbpuZ4WesySu6RdxZEqzBFDvZbx3iStzWZmWw1EhXreDP5tOiOJAZVZWBPQWgix
 bC+YMyHu1RMLZzHlj+Mv6Qyo1o6xou+WFG69kgybt8GCox2+EtA6Q0UI9Ik9ln8VrCXR
 nxneYUJxO+KMZyMrEsBmtqvBb5qzoVW0/TPbXOHRJ4ATtXjk50ZUO5PV7GzFG7d6SxxP
 y/Bw==
X-Gm-Message-State: AOAM532lrhDJtSBnoSGjoRTDIYpNm7pRq6gfFt+wBvzdjBWA093IlxGo
 yzkB/2AhRaFkaoj47d4z6S9QYg==
X-Google-Smtp-Source: ABdhPJzrNMIAs3RWwn1qW6NmluXvS0ZXgMLj8VZFmRCLMLi1HODyj9WHOhedRDqWOEublp+0scrmyQ==
X-Received: by 2002:adf:e506:: with SMTP id j6mr1495836wrm.287.1597904585322; 
 Wed, 19 Aug 2020 23:23:05 -0700 (PDT)
Received: from dell ([95.149.164.62])
 by smtp.gmail.com with ESMTPSA id t189sm2308285wmf.47.2020.08.19.23.23.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2020 23:23:04 -0700 (PDT)
Date: Thu, 20 Aug 2020 07:23:01 +0100
From: Lee Jones <lee.jones@linaro.org>
To: dinghao.liu@zju.edu.cn
Subject: Re: Re: [PATCH] video: backlight: sky81452-backlight: Fix reference
 count imbalance on error
Message-ID: <20200820062301.GD3248864@dell>
References: <321fb03d-2307-7f60-f437-cfb99184dfd6@web.de>
 <20200819165702.GC3248864@dell>
 <217e3c0c.b58c.17409fd7496.Coremail.dinghao.liu@zju.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <217e3c0c.b58c.17409fd7496.Coremail.dinghao.liu@zju.edu.cn>
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Gyungoh Yoo <jack.yoo@skyworksinc.com>, Bryan Wu <cooloney@gmail.com>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Markus Elfring <Markus.Elfring@web.de>,
 Jingoo Han <jingoohan1@gmail.com>, Kangjie Lu <kjlu@umn.edu>,
 Daniel Thompson <daniel.thompson@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCAyMCBBdWcgMjAyMCwgZGluZ2hhby5saXVAemp1LmVkdS5jbiB3cm90ZToKCj4gPiBP
biBXZWQsIDE5IEF1ZyAyMDIwLCBNYXJrdXMgRWxmcmluZyB3cm90ZToKPiA+IAo+ID4gPiA+IFdo
ZW4gb2ZfcHJvcGVydHlfcmVhZF91MzJfYXJyYXkoKSByZXR1cm5zIGFuIGVycm9yIGNvZGUsCj4g
PiA+ID4gYSBwYWlyaW5nIHJlZmNvdW50IGRlY3JlbWVudCBpcyBuZWVkZWQgdG8ga2VlcCBucCdz
IHJlZmNvdW50IGJhbGFuY2VkLgo+ID4gPiAKPiA+ID4gQ2FuIGFub3RoZXIgaW1wZXJhdGl2ZSB3
b3JkaW5nIGJlIGhlbHBmdWwgZm9yIHRoZSBjaGFuZ2UgZGVzY3JpcHRpb24/Cj4gPiA+IGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4
LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJvY2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2lk
PTE4NDQ1YmY0MDVjYjMzMTExN2JjOTg0MjdiMWJhNmYxMjQxOGFkMTcjbjE1MQo+ID4gPiAKPiA+
ID4gV291bGQgYW4gb3RoZXIgY29tbWl0IG1lc3NhZ2UgYmUgYSBiaXQgbmljZXI/Cj4gPiA+IAo+
ID4gPiAKPiA+ID4g4oCmCj4gPiA+ID4gKysrIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvc2t5
ODE0NTItYmFja2xpZ2h0LmMKPiA+ID4gPiBAQCAtMjE3LDYgKzIxNyw3IEBAIHN0YXRpYyBzdHJ1
Y3Qgc2t5ODE0NTJfYmxfcGxhdGZvcm1fZGF0YSAqc2t5ODE0NTJfYmxfcGFyc2VfZHQoCj4gPiA+
ID4gIAkJCQkJbnVtX2VudHJ5KTsKPiA+ID4gPiAgCQlpZiAocmV0IDwgMCkgewo+ID4gPiA+ICAJ
CQlkZXZfZXJyKGRldiwgImxlZC1zb3VyY2VzIG5vZGUgaXMgaW52YWxpZC5cbiIpOwo+ID4gPiA+
ICsJCQlvZl9ub2RlX3B1dChucCk7Cj4gPiA+ID4gIAkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwp
Owo+ID4gPiA+ICAJCX0KPiA+ID4gCj4gPiA+IEkgcHJvcG9zZSB0byBhZGQgdGhlIGp1bXAgdGFy
Z2V0IOKAnHB1dF9ub2Rl4oCdIHNvIHRoYXQgYSBiaXQgb2YgY29tbW9uIGV4Y2VwdGlvbgo+ID4g
PiBoYW5kbGluZyBjb2RlIGNhbiBiZSBiZXR0ZXIgcmV1c2VkIGF0IHRoZSBlbmQgb2YgdGhpcyBm
dW5jdGlvbiBpbXBsZW1lbnRhdGlvbi4KPiA+ID4gCj4gPiA+IFJlZ2FyZHMsCj4gPiA+IE1hcmt1
cwo+ID4gCj4gPiBZb3UgY2FuIHNhZmVseSBpZ25vcmUgYW55IHJldmlldyBjb21tZW50cyBmcm9t
IE1hcmt1cyEKPiA+IAo+ID4gSG93ZXZlciwgdGhpcyBwYXRjaCBkb2Vzbid0IGFwcGVhciB0byBi
ZSBpbiBteSBpbmJveC4KPiA+IAo+ID4gQW55IGlkZWFzIGFzIHRvIHdoeT8KPiA+IAo+IAo+IFRo
YW5rIHlvdSBmb3IgeW91ciBhZHZpY2UuIE15IG91dGJveCBzaG93cyB0aGF0IHRoaXMgcGF0Y2gK
PiBoYXMgcmVhY2hlZCB5b3VyIGVtYWlsIHNlcnZlciBzdWNjZXNzZnVsbHkuIE1heWJlIHRoaXMK
PiBlbmRlZCB1cCBpbiB5b3VyIGp1bmsgbWFpbCBmaWxlPwoKVGhpcyBoYXMgaGFwcGVuZWQgcmVj
ZW50bHksIHNvIEkgd2FzIHN1cmUgdG8gY2hlY2suCgpOb3QgdGhlcmUgZWl0aGVyIHVuZm9ydHVu
YXRlbHkuCgpXb3VsZCB5b3UgYmUga2luZCBlbm91Z2ggdG8gYm91bmNlL3Jlc2VuZCBwbGVhc2U/
CgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClNlbmlvciBUZWNobmljYWwgTGVhZCAtIERldmVs
b3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQXJt
IFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
