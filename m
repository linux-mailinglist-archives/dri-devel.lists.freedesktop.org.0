Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FEE90503
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 17:54:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D8C6E8A3;
	Fri, 16 Aug 2019 15:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570256E8A3
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 15:54:22 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y8so1982760wrn.10
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Aug 2019 08:54:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rjwwQvzZbTAd0PumZ0fpI2ighfSvLNEfTeslgBS5o3c=;
 b=cSPG1tf13T2bVtYG5FoLQq/aLFA1SEF957nonCR8Gy68ysz6jiMrfVxx1bz3MIk7XX
 U8L+Z2w5X9z/LIG92zqWRyLVEyFftczJbl76KkQwgN7MXuyXtnBExMH6Go/z1Dr0RGi3
 +ET+WStMJMy0XzFhndOHHh613fD1lMVvpEvmE2R/SDn7mpWJWZ1wJ4KFnSnJBUGHjGps
 R5E3wNB6hPN8LvR1qrvetDAasVaYXAmkZoTOR6/w6SNAicKIHkTvMLIVv8XRsa3rOdl4
 oDc6kjgSye6zHyk9fYenzWk9lzj1rFm3x2Wb8Et8s+NKM+2q0cw/OvHbGtClFvvxARMH
 8wLQ==
X-Gm-Message-State: APjAAAV1lJEYpsQpj+ano4wKMXX6e0d16frVGXJu2YvEuSy7wZym2iE+
 qBQh2Lk+LTWpDwyC98TjM/FsgQ==
X-Google-Smtp-Source: APXvYqyQJCwfn9usponeAbAoxdPMgcDAMy29vLoOMKWyIeyL5+AvPp3pVd4OiYXh5ns0XltF0conlw==
X-Received: by 2002:a5d:4946:: with SMTP id r6mr12650102wrs.266.1565970860895; 
 Fri, 16 Aug 2019 08:54:20 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.googlemail.com with ESMTPSA id a64sm5352000wmf.1.2019.08.16.08.54.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2019 08:54:19 -0700 (PDT)
Subject: Re: Re: [PATCH v3 2/4] backlight: Expose brightness curve type
 through sysfs
To: Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <20190709190007.91260-1-mka@chromium.org>
 <20190709190007.91260-3-mka@chromium.org>
 <20190807201528.GO250418@google.com>
From: Daniel Thompson <daniel.thompson@linaro.org>
Message-ID: <510f6d8a-71a0-fa6e-33ea-c4a4bfa96607@linaro.org>
Date: Fri, 16 Aug 2019 16:54:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190807201528.GO250418@google.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rjwwQvzZbTAd0PumZ0fpI2ighfSvLNEfTeslgBS5o3c=;
 b=zen5hFriKrgrhQt7tOYMXw7q1geHpYj6bLTDvLzZgHS0RFMztkPu7eDcJ4HcIIRAC1
 hTOFeDGYZJGX1SduUZSPtAMY4MkoCurIJoEpeCyQmGXOzkqkx0eF/BYnoJx1htseHBTl
 B22l2v/Fop1oAl5vXRu6cyfUmoLJ+ZbHwP1fj2+vbjLiYnukTeWjb+s/V3FjHnYGlG2P
 yYQ9qOQpjRFYJY/douTgJDCGa+t1O6dJ5seBUADnRGBkVeOodHv0EbUYtzkahW06UXqR
 2UEr841WsMPDcTXJccy8ruUHjE/gih5Rvnw0gMduC4KP3KoUn5co2MFMaFUI37r4nR4Q
 I+4A==
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Brian Norris <briannorris@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMDcvMDgvMjAxOSAyMToxNSwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6Cj4gT24gVHVlLCBK
dWwgMDksIDIwMTkgYXQgMTI6MDA6MDVQTSAtMDcwMCwgTWF0dGhpYXMgS2FlaGxja2Ugd3JvdGU6
Cj4+IEJhY2tsaWdodCBicmlnaHRuZXNzIGN1cnZlcyBjYW4gaGF2ZSBkaWZmZXJlbnQgc2hhcGVz
LiBUaGUgdHdvIG1haW4KPj4gdHlwZXMgYXJlIGxpbmVhciBhbmQgbm9uLWxpbmVhciBjdXJ2ZXMu
IFRoZSBodW1hbiBleWUgZG9lc24ndAo+PiBwZXJjZWl2ZSBsaW5lYXJseSBpbmNyZWFzaW5nL2Rl
Y3JlYXNpbmcgYnJpZ2h0bmVzcyBhcyBsaW5lYXIgKHNlZQo+PiBhbHNvIDg4YmE5NWJlZGI3OSAi
YmFja2xpZ2h0OiBwd21fYmw6IENvbXB1dGUgYnJpZ2h0bmVzcyBvZiBMRUQKPj4gbGluZWFybHkg
dG8gaHVtYW4gZXllIiksIGhlbmNlIG1hbnkgYmFja2xpZ2h0cyB1c2Ugbm9uLWxpbmVhciAob2Z0
ZW4KPj4gbG9nYXJpdGhtaWMpIGJyaWdodG5lc3MgY3VydmVzLiBUaGUgdHlwZSBvZiBjdXJ2ZSBj
dXJyZW50bHkgaXMgb3BhcXVlCj4+IHRvIHVzZXJzcGFjZSwgc28gdXNlcnNwYWNlIG9mdGVuIHVz
ZXMgbW9yZSBvciBsZXNzIHJlbGlhYmxlIGhldXJpc3RpY3MKPj4gKGxpa2UgdGhlIG51bWJlciBv
ZiBicmlnaHRuZXNzIGxldmVscykgdG8gZGVjaWRlIHdoZXRoZXIgdG8gdHJlYXQgYQo+PiBiYWNr
bGlnaHQgZGV2aWNlIGFzIGxpbmVhciBvciBub24tbGluZWFyLgo+Pgo+PiBFeHBvcnQgdGhlIHR5
cGUgb2YgdGhlIGJyaWdodG5lc3MgY3VydmUgdmlhIHRoZSBuZXcgc3lzZnMgYXR0cmlidXRlCj4+
ICdzY2FsZScuIFRoZSB2YWx1ZSBvZiB0aGUgYXR0cmlidXRlIGNhbiBiZSAnbGluZWFyJywgJ25v
bi1saW5lYXInIG9yCj4+ICd1bmtub3duJy4gRm9yIGRldmljZXMgdGhhdCBkb24ndCBwcm92aWRl
IGluZm9ybWF0aW9uIGFib3V0IHRoZSBzY2FsZQo+PiBvZiB0aGVpciBicmlnaHRuZXNzIGN1cnZl
IHRoZSB2YWx1ZSBvZiB0aGUgJ3NjYWxlJyBhdHRyaWJ1dGUgaXMgJ3Vua25vd24nLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBNYXR0aGlhcyBLYWVobGNrZSA8bWthQGNocm9taXVtLm9yZz4KPiAKPiBE
YW5pZWwgKGV0IGFsKTogZG8geW91IGhhdmUgYW55IG1vcmUgY29tbWVudHMgb24gdGhpcyBwYXRj
aC9zZXJpZXMgb3IKPiBpcyBpdCByZWFkeSB0byBsYW5kPwoKSSBkZWNpZGVkIHRvIGxlYXZlIGl0
IGZvciBhIGxvbmcgd2hpbGUgZm9yIG90aGVycyB0byByZXZpZXcgc2luY2UgSSdtIApzdGlsbCBh
IHRpbnkgYml0IHVuZWFzeSBhYm91dCB0aGUgbGluZWFyL25vbi1saW5lYXIgdGVybWlub2xvZ3ku
CgpIb3dldmVyIHRoYXQncyBteSBvbmx5IGNvbmNlcm4sIGl0cyBmYWlybHkgbWlub3IgYW5kIEkn
dmUgZHJhZ2dlZCBieSAKZmVldCBmb3IgbW9yZSB0aGVuIGxvbmcgZW5vdWdoLCBzbzoKUmV2aWV3
ZWQtYnk6IERhbmllbCBUaG9tcHNvbiA8ZGFuaWVsLnRob21wc29uQGxpbmFyby5vcmc+CgoKRGFu
aWVsLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
