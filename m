Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 824BD7482F
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 09:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4446E688;
	Thu, 25 Jul 2019 07:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CADF6E658
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 21:16:43 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z1so48411455wru.13
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 14:16:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=W1jFeugsJ0oirRWmWhC8GQwi5V7rmQsow/rL22Dmte8=;
 b=oRFgwD82kNif1RzmGrVl/6aw9rfY4mGgTVgC9511gwpPBqeVqNICaHBCANHfI0NNqX
 Ot22yrasR7zowj1KvvN0xp0I4GAaBKL9fXRPK2hw+Cw+YsLNEZ2xMY4aCfcBAfJE2e7w
 OhVjL++lQIporScn2eWrTsidCMb0zFmkcb8j3IV4eQtVuNMl4Vfn8jIvdIwRISw8FdJ8
 qHKVwCq5zF2INkVuB2uQpUG70wsnbn7ZPkoO5WNiisJOGsW6maZ5BiqJ3ZeF5hrRBmmD
 lrG+1PaGRFYHAIAnzNs2dL3hHBCtaqYbYeNMgelQFtsuWqiG3T+1Suag6P406VUqbe61
 NlhA==
X-Gm-Message-State: APjAAAVvU+dSS5rHtlwabjR4N7f/AuHDRAu7/U1RNX4RMGIZbhtDOwsD
 PyfScQmPfnAFfyF2oI5VGD8=
X-Google-Smtp-Source: APXvYqzogvYFojqU+LiKW5qZ/iRZn2RtP8P4IXNz/56oAvGgeGNR0S8kfcjgs2G7ekuiKhVfW3tn5A==
X-Received: by 2002:adf:ea8b:: with SMTP id s11mr88132670wrm.100.1564003002083; 
 Wed, 24 Jul 2019 14:16:42 -0700 (PDT)
Received: from [192.168.1.19] (bko238.neoplus.adsl.tpnet.pl. [83.28.182.238])
 by smtp.gmail.com with ESMTPSA id
 y6sm58524363wmd.16.2019.07.24.14.16.40
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Jul 2019 14:16:41 -0700 (PDT)
Subject: Re: [PATCH] Enable backlight when trigger is activated
To: Pavel Machek <pavel@ucw.cz>
References: <20190718190849.GA11409@amd>
 <22d7eca4ad8aa2e73933c4f83c92221ce6e0945a.camel@collabora.com>
 <20190722075032.GA27524@amd> <6fc6af89-1455-7665-47e7-0568ecd87c9c@gmail.com>
 <20190724083355.GA27716@amd>
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=jacek.anaszewski@gmail.com; prefer-encrypt=mutual; keydata=
 mQINBFWjfaEBEADd66EQbd6yd8YjG0kbEDT2QIkx8C7BqMXR8AdmA1OMApbfSvEZFT1D/ECR
 eWFBS8XtApKQx1xAs1j5z70k3zebk2eeNs5ahxi6vM4Qh89vBM46biSKeeX5fLcv7asmGb/a
 FnHPAfQaKFyG/Bj9V+//ef67hpjJWR3s74C6LZCFLcbZM0z/wTH+baA5Jwcnqr4h/ygosvhP
 X3gkRzJLSFYekmEv+WHieeKXLrJdsUPUvPJTZtvi3ELUxHNOZwX2oRJStWpmL2QGMwPokRNQ
 29GvnueQdQrIl2ylhul6TSrClMrKZqOajDFng7TLgvNfyVZE8WQwmrkTrdzBLfu3kScjE14Q
 Volq8OtQpTsw5570D4plVKh2ahlhrwXdneSot0STk9Dh1grEB/Jfw8dknvqkdjALUrrM45eF
 FM4FSMxIlNV8WxueHDss9vXRbCUxzGw37Ck9JWYo0EpcpcvwPf33yntYCbnt+RQRjv7vy3w5
 osVwRR4hpbL/fWt1AnZ+RvbP4kYSptOCPQ+Pp1tCw16BOaPjtlqSTcrlD2fo2IbaB5D21SUa
 IsdZ/XkD+V2S9jCrN1yyK2iKgxtDoUkWiqlfRgH2Ep1tZtb4NLF/S0oCr7rNLO7WbqLZQh1q
 ShfZR16h7YW//1/NFwnyCVaG1CP/L/io719dPWgEd/sVSKT2TwARAQABtC1KYWNlayBBbmFz
 emV3c2tpIDxqYWNlay5hbmFzemV3c2tpQGdtYWlsLmNvbT6JAj4EEwEIACgCGwMHCwkIBwMC
 AQYVCAIJCgsDFgIBAh4BAheABQJVo39tBQkJZgNMAAoJEL1qUBy3i3wmxLQQAK8QEQ0JqZEv
 5hrxiwT+Qtkx1TULYriK9sYcY9zbi18YxbKB0C4Znh5iP5o7k26WnPGLM+w4qWvTAkHjuAI7
 aBrvb4nGRvE5s14PQ9IHgL7iL3zAAHT1azIZng9dUCCSontB+vQZu1x/Un0lVlVCvsvO7QVt
 hAZUlT3iucNMO0jpCiS3raZkNfab8M+JWP/iplaV0Kn+O7LX3A/RdLmx5ZhuT+zvyHwl2c3K
 T56UHaQnjkuHB2Ytk8HtOjNXGNYnm4nLx3ok3jEN1nWDRV/DeiPn8zz4Zebsp686OH9vvX/0
 R4dk2YEjUCY/S7CbJxXzUnLjboUAGmtTVOu/uJ7y11iS9XEoJ09HEzijQwWctJXLojcTXCFw
 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
 eGGiEQ==
Message-ID: <f00d99cb-da32-05b3-bf49-447cb8bd33e0@gmail.com>
Date: Wed, 24 Jul 2019 23:16:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724083355.GA27716@amd>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 25 Jul 2019 07:29:33 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=W1jFeugsJ0oirRWmWhC8GQwi5V7rmQsow/rL22Dmte8=;
 b=usVr2ZwLIZQWZ7AIbj+TxyWWjwYj+Qp44q3aXgoV9E2Tqt/vYxz4oCR/lSjLaXfDta
 JOZ1NftN2dnDfnAD6PYTMvQYUD0igLbjcAGsnG7CK1TWLuw9ddtV2gpjDHq8MGUxsduG
 T9TTeXMSVtJ3To5rElilFQXBgSSOa0AXot8M9Ihi6R7+xomcyz0ztq3HKX/SrcKz7eW8
 AvzsPtuRLrvSFmFhFihwRslqM0LIgVigxV0fCgaFG1RHbfKNbjCXMQ9UBsmu4BPo11DN
 eGrBU4X5KYvEJOSFct2TrbXIY2bgA1Fn/JazB7SKpUVdfMiJTdCrDbMv4WQDlYHUci8a
 y/1Q==
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
Cc: linux-fbdev@vger.kernel.org, mpartap@gmx.net, b.zolnierkie@samsung.com,
 tony@atomide.com, merlijn@wizzup.org,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 sre@kernel.org, nekit1000@gmail.com, linux-leds@vger.kernel.org,
 linux-omap@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yNC8xOSAxMDozMyBBTSwgUGF2ZWwgTWFjaGVrIHdyb3RlOgo+IEhpIQo+IAo+Pj4+PiAr
KysgYi9kcml2ZXJzL2xlZHMvdHJpZ2dlci9sZWR0cmlnLWJhY2tsaWdodC5jCj4+Pj4+IEBAIC0x
MTQsNiArMTE0LDggQEAgc3RhdGljIGludCBibF90cmlnX2FjdGl2YXRlKHN0cnVjdCBsZWRfY2xh
c3NkZXYgKmxlZCkKPj4+Pj4gIAluLT5vbGRfc3RhdHVzID0gVU5CTEFOSzsKPj4+Pj4gIAluLT5u
b3RpZmllci5ub3RpZmllcl9jYWxsID0gZmJfbm90aWZpZXJfY2FsbGJhY2s7Cj4+Pj4+ICAKPj4+
Pj4gKwlsZWRfc2V0X2JyaWdodG5lc3MobGVkLCBMRURfT04pOwo+Pj4+PiArCj4+Pj4KPj4+PiBU
aGlzIGxvb2tzIGZpc2h5Lgo+Pj4+Cj4+Pj4gTWF5YmUgeW91IHNob3VsZCB1c2UgYSBkZWZhdWx0
LXN0YXRlID0gImtlZXAiIGluc3RlYWQ/IChhbmQgeW91J2xsIGhhdmUKPj4+PiB0byBzdXBwb3J0
IGl0IGluIHRoZSBMRUQgZHJpdmVyKS4KPj4+Pgo+Pj4+IFRoYXQnbGwgZ2l2ZSB5b3UgcHJvcGVy
ICJkb24ndCB0b3VjaCB0aGUgTEVEIGlmIGl0IHdhcyB0dXJuZWQgb24iIGJlaGF2aW9yLAo+Pj4+
IHdoaWNoIGlzIHdoYXQgeW91IHNlZW0gdG8gd2FudC4KPj4+Cj4+PiBBY3R1YWxseSBubywgdGhh
dCdzIG5vdCB3aGF0IEkgd2FudC4gTEVEIHNob3VsZCBnbyBvbiBpZiB0aGUgZGlzcGxheQo+Pj4g
aXMgYWN0aXZlLCBhcyBzb29uIGFzIHRyaWdnZXIgaXMgYWN0aXZhdGVkLgo+Pj4KPj4+IFVuZm9y
dHVuYXRlbHksIEkgaGF2ZSBzZWUgbm8gZ29vZCB3YXkgdG8gdGVsbCBpZiB0aGUgZGlzcGxheSBp
cwo+Pj4gYWN0aXZlIChhbmQgZGlzcGxheSBpcyB1c3VhbGx5IGFjdGl2ZSB3aGVuIHRyaWdnZXIg
aXMgYWN0aXZhdGVkKS4KPj4KPj4gZGVmYXVsdC1zdGF0ZSBEVCBwcm9wZXJ0eSBjYW4gYmUgYWxz
byBzZXQgdG8gIm9uIgo+PiAoc2VlIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9s
ZWRzL2NvbW1vbi50eHQpLgo+IAo+IFllcywgZXhjZXB0IHRoYXQgaXQgZG9lcyBub3Qgd29yayB3
aXRoIGFsbCBkcml2ZXJzIDotKC4gSW4gcGFydGljdWxhciwKPiBpdCBkb2VzIG5vdCB3b3JrIHdp
dGggbG0zNTMyLgo+IAo+IFdlIHNob3VsZCByZWFsbHkgbW92ZSBtb3JlIG9mIHRoZSBkZXZpY2Ug
dHJlZSBwYXJzaW5nIGludG8gY29yZSwgc28KPiB0aGF0IHRoZXJlJ3Mgb25lIHBsYWNlIHRvIGZp
eC4uLgoKUmlnaHQuIFdlIGNvdWxkIGhhdmUgc29tZXRoaW5nIHNpbWlsYXIgdG8gbGVkX2dldF9k
ZWZhdWx0X3BhdHRlcm4oKS4KbGVkX2dldF9kZWZhdWx0X3N0YXRlKCkgPwoKLS0gCkJlc3QgcmVn
YXJkcywKSmFjZWsgQW5hc3pld3NraQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
