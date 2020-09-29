Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A933727C107
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563F26E197;
	Tue, 29 Sep 2020 09:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE746E197
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:25:21 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s12so4497459wrw.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 02:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=y3xolV07ydwiw9pUIR05O0Dg9ONWaFEj7NSliXEkK4k=;
 b=09LRUYPf5E3HT1ePfqHdRNpFuhMBuHfzWoqQUrGt72jvG43leqeYwggHXQjbzZE2A0
 I5lzoUN3tsKq3YrPdhOFdpIisJ0Z9FWuqEyHKn4A7uJDRW8z9eC3wR7coTScxPghduL0
 J8XqR3zHsafTLvoQR0tjEbzBGstCy8r2am45QBrCuij8PdOqqo13E5bsxEn5Ymzb8hYO
 oXbWRPuYJSFl7SB3NU5Y6gu2rLq0rP9byYVMqVtaESS39smsCzOmaPYHjdK3L3R3Bl5B
 Vy+3FFX5t4BEYfzLOW52oZ1u7sH4MIAqN/wBzkxBH4NR3hjL5sw9N11b54X5t9qBsb4y
 A/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=y3xolV07ydwiw9pUIR05O0Dg9ONWaFEj7NSliXEkK4k=;
 b=b/pgV9WgGdnq30vyWAyt8D3XDJzbCZiLVcl/f1C1tKtxfpAGc5In+0mCvoOrWS7DSy
 gn7PIOWQq9tsNGXH8D8XOLBiZKoRAUD1GK4D6SzVAmBsyaa14XK8+ldU93DJfvYCkjzq
 8lcpSv16weUF85bOf0BI9aPVvqz1S9g2UBfbA4wa/sdfwWHIeJSw75dKdtCj+u+FOyzz
 GXlvHCdmVoj24NdOEgiIS2+nhCPs+A2m+2lRsYzeIlEORglv81k60/HqGjIYAObvUldn
 gGmGZfoEOUs/QqjN/26mKphQ2alriczpllIXJKLRrIJj3d68LCfyRIrdBWRkHAeB+C+z
 WEiw==
X-Gm-Message-State: AOAM531w4kpfshRp3HjskA2DGfSpzjFp2Gd7mBYR8oot4oTBRO8YdqTH
 vomwnjkHpEwlSGlqXnRlZUde3g==
X-Google-Smtp-Source: ABdhPJywsO6BQatT62evnpEoaM/A8pOnCNGKmgU7+YSJiK4b0Bfq8OxEhegzFOq1ZHMLDX/5zZSB8A==
X-Received: by 2002:adf:e802:: with SMTP id o2mr3097872wrm.309.1601371519895; 
 Tue, 29 Sep 2020 02:25:19 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:d50c:1ee4:fec5:ad12?
 ([2a01:e35:2ec0:82b0:d50c:1ee4:fec5:ad12])
 by smtp.gmail.com with ESMTPSA id y68sm4800251wmd.39.2020.09.29.02.25.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Sep 2020 02:25:18 -0700 (PDT)
Subject: Re: [PATCH v4 0/4] drm: panel: add support for TDO tl070wsh30 panel
To: thierry.reding@gmail.com, sam@ravnborg.org
References: <20200915121912.4347-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <9f720791-2718-205f-d101-0811a679f54e@baylibre.com>
Date: Tue, 29 Sep 2020 11:25:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200915121912.4347-1-narmstrong@baylibre.com>
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgU2FtLAoKSXMgdGhlcmUgYW55dGhpbmcgbW9yZSB0byBjaGFuZ2UgPwoKVGhhbmtzLApOZWls
CgpPbiAxNS8wOS8yMDIwIDE0OjE5LCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBUaGlzIGFkZHMg
c3VwcG9ydCBiaW5kaW5ncyBhbmQgc3VwcG9ydCBmb3IgdGhlIFRETyBUTDA3MFdTSDMwIFRGVC1M
Q0QgcGFuZWwKPiBtb2R1bGUgc2hpcHBlZCB3aXRoIHRoZSBBbWxvZ2ljIFM0MDAgRGV2ZWxvcG1l
bnQgS2l0Lgo+IFRoZSBwYW5lbCBoYXMgYSAxMDI0w5c2MDAgcmVzb2x1dGlvbiBhbmQgdXNlcyAy
NCBiaXQgUkdCIHBlciBwaXhlbC4KPiBJdCBwcm92aWRlcyBhIE1JUEkgRFNJIGludGVyZmFjZSB0
byB0aGUgaG9zdCwgYSBidWlsdC1pbiBMRUQgYmFja2xpZ2h0Cj4gYW5kIHRvdWNoIGNvbnRyb2xs
ZXIuCj4gCj4gQ2hhbmdlcyBzaW5jZSB2MyBhdCBbM106Cj4gLSByZW9yZGVyZWQgdGRvIHZlbmRv
ciBwcmVmaXgKPiAKPiBDaGFuZ2VzIHNpbmNlIHYyIGF0IFsyXToKPiAtIGFkZGVkIHJlc2V0IGdw
aW8gdG8gcGFuZWwtc2ltcGxlLWRzaSBiaW5kaW5ncwo+IC0gbW92ZWQgYmluZGluZ3MgdG8gcGFu
ZWwtc2ltcGxlCj4gLSByZS1vcmRlcmVkIHByZXBhcmUvdW5wcmVwYXJlCj4gLSBhZGRlZCBiYWNr
IHJlZnJlc2ggcHJpbnQKPiAtIG1vdmVkIHJlZ3VsYXRvci9yZXNldCBoYW5kbGluZyBpbiBwcmVw
YXJlL3VucHJlcGFyZQo+IC0gYWxpZ25lZCByZW1vdmUvc2h1dGRvd24gd2l0aCBwYW5lbC1zaW1w
bGUKPiAtIGFkZGVkIHNlbnRpbmVsIGNvbW1lbnQgaW50byBkdCBtYXRjaCB0YWJsZQo+IAo+IENo
YW5nZXMgc2luY2UgdjEgYXQgWzFdOgo+IC0gYWRkZWQgbWlzc2luZyB2ZW5kb3ItcHJlZml4ZXMg
cGF0Y2gKPiAtIHJlbW92ZWQgdnJlZnJlc2gKPiAtIGZpeGVkIHdhcm5pbmcgb24gYWRkX3BhbmVs
IHJldHVybgo+IC0gcmVtb3ZlZCBEUk0gbG9nZ2luZwo+IAo+IFsxXSBodHRwczovL3BhdGNod29y
ay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzgxMzc2LyNyZXYxCj4gWzJdIGh0dHBzOi8vcGF0Y2h3
b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvODEzNzYvI3JldjIKPiBbM10gaHR0cHM6Ly9wYXRj
aHdvcmsuZnJlZWRlc2t0b3Aub3JnL3Nlcmllcy84MTM3Ni8jcmV2Mwo+IAo+IE5laWwgQXJtc3Ry
b25nICg0KToKPiAgIGR0LWJpbmRpbmdzOiB2ZW5kb3ItcHJlZml4ZXM6IEFkZCBTaGFuZ2hhaSBU
b3AgRGlzcGxheQo+ICAgICBPcHRvbGVsZWN0cm9uaWNzIHZlbmRvciBwcmVmaXgKPiAgIGR0LWJp
bmRpbmdzOiBkaXNwbGF5OiBwYW5lbC1zaW1wbGUtZHNpOiBhZGQgb3B0aW9uYWwgcmVzZXQgZ3Bp
bwo+ICAgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBhbmVsLXNpbXBsZS1kc2k6IGFkZCBURE8gVEww
NzBXU0gzMCBEU0kgcGFuZWwKPiAgICAgYmluZGluZ3MKPiAgIGRybTogcGFuZWw6IGFkZCBURE8g
dGwwNzB3c2gzMCBwYW5lbCBkcml2ZXIKPiAKPiAgLi4uL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2lt
cGxlLWRzaS55YW1sICAgICAgIHwgICAzICsKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvdmVu
ZG9yLXByZWZpeGVzLnlhbWwgIHwgICAyICsKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL0tjb25m
aWcgICAgICAgICAgICAgICAgIHwgIDExICsKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL01ha2Vm
aWxlICAgICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXRkby10bDA3MHdzaDMwLmMgIHwgMjUwICsrKysrKysrKysrKysrKysrKwo+ICA1IGZpbGVzIGNo
YW5nZWQsIDI2NyBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtdGRvLXRsMDcwd3NoMzAuYwo+IAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
