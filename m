Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F7A86493
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 16:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632596E851;
	Thu,  8 Aug 2019 14:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B3E6E842;
 Thu,  8 Aug 2019 14:41:42 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b3so2805581wro.4;
 Thu, 08 Aug 2019 07:41:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=6NDaOaK+lPHzVLm5kwctWvg1wxbUKGg20Vx9wAxik2g=;
 b=stdg10+P1PTMVGUgcdhyAaf4X9zT/oGzfPZ5bkiudBdRWPyVg6aZaaEVcWHOKP4v3P
 bSTs92FskT20q/9Qoo3R73A8kOLDi4bzaqbuo4eLaEVtaR8+T6pszWIrZKdROqww2/C/
 t52hGdIZiZZkNIgVUtPgUV93k9wywBt6XdAHvl0HUkhSOPfWXwcbEgqGVfEKnHNcppLF
 ALqSPR2UREEdv1cqP60yrnMhArv4GpvlDTYtwlVFnYo3tM7fuoBCqo9t6P9dGl5fHAVS
 7MkcvFWXMWAb4xLAgKwtmFqThbG8XJyWv3lPOXdADNGjFFxwohDcGFV31jIETtWS3NUT
 gp/A==
X-Gm-Message-State: APjAAAWHnss5AzE9MOkYRTVxm5eWNWD7vD97V8w9N7R05Yh8Ph9QSwKs
 Q9FVvENdSJ3yVwKJwiVINyl4kA6S
X-Google-Smtp-Source: APXvYqxHZuszQMlKeoaZhBkounSzWIdH7hVAn91In72k0rh+4vdAHYlxu1aF+KBmWN/Rjug5sAX40Q==
X-Received: by 2002:a5d:428b:: with SMTP id k11mr16707653wrq.174.1565275301627; 
 Thu, 08 Aug 2019 07:41:41 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d17sm2567868wrm.52.2019.08.08.07.41.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 08 Aug 2019 07:41:40 -0700 (PDT)
Subject: Re: [PATCH] dma-buf: make dma_fence structure a bit smaller v2
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel@ffwll.ch>
References: <20190808132243.23632-1-christian.koenig@amd.com>
Message-ID: <4e32c47b-454c-f811-67cc-6757b48918de@gmail.com>
Date: Thu, 8 Aug 2019 16:41:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190808132243.23632-1-christian.koenig@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=6NDaOaK+lPHzVLm5kwctWvg1wxbUKGg20Vx9wAxik2g=;
 b=tQCwadidqNWMDgBEj7YDWPvKUZ2DU3PfFc8+T5WswyZaCxZj4JTf3QJMk/+dZ9P7yq
 Tn9zjirPRsvpbAXFtRny0lxJz9TpJS1ZshYXdEG2BepZM7BsgO4+Oz+eiooecRiMg2y5
 cHXL0ZOfIWiXQ5Uq8x+pboB91K5K6lvwSWPMt/nclS2bCmVZhUIOrAdYgdJ4JieNj09L
 2noIj5Z6xrx/SHVyVI0/UVrsQV41DnSP5tWFBbDcSNhJZh3ai6edejHAMbGWvH9EpCHy
 aLMdc6plfNjO73Rq+xIAeNkGiixmkSDJAHlGKI6ZvL05GEGXAaCNmg+W2jRwLA9X07ZF
 Oh2A==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGFuaWVsIGFueSBtb3JlIGNvbW1lbnRzIG9uIHRoaXMgb25lPwoKSWYgbm90IEknbSBnb2luZyB0
byBwdXNoIGl0LgoKQ2hyaXN0aWFuLgoKQW0gMDguMDguMTkgdW0gMTU6MjIgc2NocmllYiBDaHJp
c3RpYW4gS8O2bmlnOgo+IFdlIGNsZWFyIHRoZSBjYWxsYmFjayBsaXN0IG9uIGtyZWZfcHV0IHNv
IHRoYXQgYnkgdGhlIHRpbWUgd2UKPiByZWxlYXNlIHRoZSBmZW5jZSBpdCBpcyB1bnVzZWQuIE5v
IG9uZSBzaG91bGQgYmUgYWRkaW5nIHRvIHRoZSBjYl9saXN0Cj4gdGhhdCB0aGV5IGRvbid0IHRo
ZW1zZWx2ZXMgaG9sZCBhIHJlZmVyZW5jZSBmb3IuCj4KPiBUaGlzIHNtYWxsIGNoYW5nZSBpcyBh
Y3R1YWxseSBtYWtpbmcgdGhlIHN0cnVjdHVyZSAxNiUgc21hbGxlci4KPgo+IHYyOiBhZGQgdGhl
IGNvbW1lbnQgdG8gdGhlIGNvZGUgYXMgd2VsbC4KPgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPiBSZXZpZXdlZC1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gLS0tCj4gICBpbmNsdWRlL2xpbnV4
L2RtYS1mZW5jZS5oIHwgMTAgKysrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2Rt
YS1mZW5jZS5oIGIvaW5jbHVkZS9saW51eC9kbWEtZmVuY2UuaAo+IGluZGV4IDA1ZDI5ZGJjN2U2
Mi4uYmVhMWQwNWNmNTFlIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLmgK
PiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS5oCj4gQEAgLTY1LDggKzY1LDE0IEBAIHN0
cnVjdCBkbWFfZmVuY2VfY2I7Cj4gICBzdHJ1Y3QgZG1hX2ZlbmNlIHsKPiAgIAlzdHJ1Y3Qga3Jl
ZiByZWZjb3VudDsKPiAgIAljb25zdCBzdHJ1Y3QgZG1hX2ZlbmNlX29wcyAqb3BzOwo+IC0Jc3Ry
dWN0IHJjdV9oZWFkIHJjdTsKPiAtCXN0cnVjdCBsaXN0X2hlYWQgY2JfbGlzdDsKPiArCS8qIFdl
IGNsZWFyIHRoZSBjYWxsYmFjayBsaXN0IG9uIGtyZWZfcHV0IHNvIHRoYXQgYnkgdGhlIHRpbWUg
d2UKPiArCSAqIHJlbGVhc2UgdGhlIGZlbmNlIGl0IGlzIHVudXNlZC4gTm8gb25lIHNob3VsZCBi
ZSBhZGRpbmcgdG8gdGhlIGNiX2xpc3QKPiArCSAqIHRoYXQgdGhleSBkb24ndCB0aGVtc2VsdmVz
IGhvbGQgYSByZWZlcmVuY2UgZm9yLgo+ICsJICovCj4gKwl1bmlvbiB7Cj4gKwkJc3RydWN0IHJj
dV9oZWFkIHJjdTsKPiArCQlzdHJ1Y3QgbGlzdF9oZWFkIGNiX2xpc3Q7Cj4gKwl9Owo+ICAgCXNw
aW5sb2NrX3QgKmxvY2s7Cj4gICAJdTY0IGNvbnRleHQ7Cj4gICAJdTY0IHNlcW5vOwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
