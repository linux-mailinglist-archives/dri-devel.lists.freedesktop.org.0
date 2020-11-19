Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F022E2B900F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 11:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E4636E5AE;
	Thu, 19 Nov 2020 10:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7826E5AE
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 10:26:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id a3so6239009wmb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 02:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=c23Edl6AfajHTlT5A6Obc1CCSUISJptEb8tnXWiS9oA=;
 b=F59CCLbOviJO/poY/ftXNOXj8zRuXdO2jihqFDmKycw2obSwIcYjurJ2AH9S22aL3A
 Z69VIdjRUCDbWoyU6g+eCz5wNXYFNhz1aBzlKqS3Cxc6LkHMVoFjD0108ewsAV6Hzht1
 nwjtEvIkGvZeG+k2P3F4CBpBQRYlTwseV94PQ3TYyIa/Fmijj1iNMNIzTZ20HgAKDYI7
 nIzRBY860YGYELzf4z1m7ppzZPQ68QubEb97PfzOscOb+Hqiw3GfnF4nHMpLsBDpZnTU
 txKo1EbXbVoc45UhQRb3TC0hkO21iWKLqPYSXab41RvpFUeFiYvFcjXnxEkDgbQ5n2Ef
 ZXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=c23Edl6AfajHTlT5A6Obc1CCSUISJptEb8tnXWiS9oA=;
 b=WU2Rac0eTffIx6nXgjpdnRCpoV4hZQPgZIsmHGF4ssLvVnTIBg/AzDjeK6ViW3tC3P
 mfqE3bWdtv/dF4DYISt8qYyta1QElJYQ3fpFObQtbgyKZ9mfddvEX9FkbMF8nq17XPpI
 rFmBAoeWpWjuak8CXG7R0Et37ishnKhQwhs4eiCx9FOrkJJyP7TqD1GFetUl7TJdrXP5
 q+Onc38THZt5s1kugYcOCTbRKVAJHrCFiQQPI5B2Zk6fT6TJrtAzyWei3M0s2RT5Bhtd
 ia12aZZzbu2PwBwx1lnGK/oqyDFTKdTnzIxhgOTm0HC9ctLxdetoK0hswBkeP7YIRoZt
 PZ+A==
X-Gm-Message-State: AOAM531+6WyIEnRuTLRxPcF0jKXFVtHsF3MltaGmQtWcdXL0YqVUa9IG
 3S+DY7a4IhY5iuYiv/iVBLpH9w==
X-Google-Smtp-Source: ABdhPJwUNc/HHD2R3ATImu0UwqysJ22sEb0lkl6ROiVf+cU84lVWuhIghlMG9N0Gs6h+NKLHOaYtZA==
X-Received: by 2002:a1c:9652:: with SMTP id y79mr3898100wmd.71.1605781608373; 
 Thu, 19 Nov 2020 02:26:48 -0800 (PST)
Received: from ?IPv6:2a01:e35:2ec0:82b0:3daa:7c69:63d6:7d7d?
 ([2a01:e35:2ec0:82b0:3daa:7c69:63d6:7d7d])
 by smtp.gmail.com with ESMTPSA id z3sm36786852wrw.87.2020.11.19.02.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 02:26:47 -0800 (PST)
Subject: Re: next/master bisection: baseline.dmesg.emerg on meson-gxbb-p200
To: Marc Zyngier <maz@kernel.org>,
 Guillaume Tucker <guillaume.tucker@collabora.com>
References: <5fb5e094.1c69fb81.a2014.2e62@mx.google.com>
 <a0bec7c4-9bec-8858-4879-52f4688d9992@collabora.com>
 <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <3f54de27-0fef-c5a1-8991-0a0614c90667@baylibre.com>
Date: Thu, 19 Nov 2020 11:26:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <630e00e83cdd07ee5a0eaba9d3479554@kernel.org>
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
Cc: kernelci-results@groups.io,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTkvMTEvMjAyMCAxMToyMCwgTWFyYyBaeW5naWVyIHdyb3RlOgo+IE9uIDIwMjAtMTEtMTkg
MDg6NTAsIEd1aWxsYXVtZSBUdWNrZXIgd3JvdGU6Cj4+IFBsZWFzZSBzZWUgdGhlIGF1dG9tYXRl
ZCBiaXNlY3Rpb24gcmVwb3J0IGJlbG93IGFib3V0IHNvbWUga2VybmVsCj4+IGVycm9ycyBvbiBt
ZXNvbi1neGJiLXAyMDAuCj4+Cj4+IFJlcG9ydHMgYXJlbid0IGF1dG9tYXRpY2FsbHkgc2VudCB0
byB0aGUgcHVibGljIHdoaWxlIHdlJ3JlCj4+IHRyaWFsaW5nIG5ldyBiaXNlY3Rpb24gZmVhdHVy
ZXMgb24ga2VybmVsY2kub3JnLCBob3dldmVyIHRoaXMgb25lCj4+IGxvb2tzIHZhbGlkLgo+Pgo+
PiBUaGUgYmlzZWN0aW9uIHN0YXJ0ZWQgd2l0aCBuZXh0LTIwMjAxMTE4IGJ1dCB0aGUgZXJyb3Jz
IGFyZSBzdGlsbAo+PiBwcmVzZW50IGluIG5leHQtMjAyMDExMTkuwqAgRGV0YWlscyBmb3IgdGhp
cyByZWdyZXNzaW9uOgo+Pgo+PiDCoCBodHRwczovL2tlcm5lbGNpLm9yZy90ZXN0L2Nhc2UvaWQv
NWZiNjE5NmJmZDAxMjdmZDY4ZDhkOTAyLwo+Pgo+PiBUaGUgZmlyc3QgZXJyb3IgaXM6Cj4+Cj4+
IMKgIFvCoMKgIDE0Ljc1NzQ4OV0gSW50ZXJuYWwgZXJyb3I6IHN5bmNocm9ub3VzIGV4dGVybmFs
IGFib3J0OiA5NjAwMDIxMAo+PiBbIzFdIFBSRUVNUFQgU01QCj4gCj4gTG9va3MgbGlrZSB5ZXQg
YW5vdGhlciBjbG9jayBvcmRlcmluZyBzZXR1cC4gSSBndWVzcyBkaWZmZXJlbnQgQW1sb2dpYwo+
IHBsYXRmb3JtcyBoYXZlIHNsaWdodGx5IGRpZmZlcmVudCBvcmRlcmluZyByZXF1aXJlbWVudHMu
Cj4gCj4gTmVpbCwgZG8geW91IGhhdmUgYW55IGlkZWEgb2Ygd2hpY2ggcGxhdGZvcm0gcmVxdWly
ZXMgd2hpY2ggb3JkZXJpbmc/Cj4gVGhlIHZhcmlhYmlsaXR5IGluIERUIGFuZCBwbGF0Zm9ybXMg
aXMgcHJldHR5IGRpZmZpY3VsdCB0byBmb2xsb3cgKGFuZAo+IEkgZG9uJ3QgdGhpbmsgSSBoYXZl
IHN1Y2ggYm9hcmQgYXJvdW5kKS4KClRoZSByZXF1aXJlbWVudHMgc2hvdWxkIGJlIHRoZSBzYW1l
LCBoZXJlIHRoZSBpbml0IHdhcyBkb25lIGJlZm9yZSBjYWxsaW5nCmR3X2hkbWlfcHJvYmUgdG8g
YmUgc3VyZSB0aGUgY2xvY2tzIGFuZCBpbnRlcm5hbHMgcmVzZXRzIHdlcmUgZGVhc3NlcnRlZC4K
QnV0IHNpbmNlIHlvdSBib290IGZyb20gdS1ib290IGFscmVhZHkgZW5hYmxpbmcgdGhlc2UsIGl0
J3MgYWxyZWFkeSBhY3RpdmUuCgpUaGUgc29sdXRpb24gd291bGQgYmUgdG8gcmV2ZXJ0IGFuZCBk
byBzb21lIGNoZWNrIGluIG1lc29uX2R3X2hkbWlfaW5pdCgpIHRvCmNoZWNrIGlmIGFscmVhZHkg
ZW5hYmxlZCBhbmQgZG8gbm90aGluZy4KCk5laWwKCj4gCj4gVGhhbmtzLAo+IAo+IMKgwqDCoMKg
wqDCoMKgIE0uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
