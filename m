Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2D092778
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345EE6E182;
	Mon, 19 Aug 2019 14:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71D86E191
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:48:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g17so9036453wrr.5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 07:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vagkGtT2jMz7T0k0vgD6q1Sjj5TnzDJFn2lBxriOeDI=;
 b=gZNU7Qpg3E4lN0BcgisGnzQ0sVcUsGOSSwp7aZzDX+cjSbdlXi8meWuL3jZOyypXVx
 aZbUy1CMJdwVAms/at9xzguWiefzB5YGAkQ177jPPPEY1ZOZ5DqMN9cgdsmYIXuJbyGw
 qhQPae8DlYnp1Z/lptkwrNCSe2Lt9tfjC4EyyG2VDNdsD4M6wvCWFMtvEQU6gD2mAiwR
 6JcER2z0fwBJAjle+/yJ/RhKCaL9hA7/MMRItIjAguqJtFTP3zuDxovyY7PtdDx9VdOY
 8Algw0uC/ru7ufYZblA8hnbG/6DUq4zGjwfC8nh9/+ovjwZ0LPrkOB9Jy6ZPQfpH6r7C
 tJCg==
X-Gm-Message-State: APjAAAXcKKd9GHX/O4dSoUqQfiPeHb0QCAGcfFe2YXBytZ57krvil92M
 pMaZmyx0M4RwhBAM3E7rCoVPzw==
X-Google-Smtp-Source: APXvYqw+6IQ7xkFNeV1Us45hRaomN8yAJoeL/1p2i2CnYEMmnC47xkGPP9DN8Eg+hUKKxGWxrM4JNg==
X-Received: by 2002:adf:bc84:: with SMTP id g4mr28127062wrh.135.1566226133002; 
 Mon, 19 Aug 2019 07:48:53 -0700 (PDT)
Received: from [10.1.3.173] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id 91sm46319107wrp.3.2019.08.19.07.48.49
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 19 Aug 2019 07:48:52 -0700 (PDT)
Subject: Re: [PATCH v7 0/9] drm: cec: convert DRM drivers to the new notifier
 API
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
References: <20190814104520.6001-1-darekm@google.com>
 <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <ad2a4af0-aeff-a81e-7885-7e9fc3c5cf90@baylibre.com>
Date: Mon, 19 Aug 2019 16:48:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <42c7ef3c-b7e5-8c63-c7c2-bfc6c56100c6@xs4all.nl>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=vagkGtT2jMz7T0k0vgD6q1Sjj5TnzDJFn2lBxriOeDI=;
 b=C4E7k4DAwRoWYCiWRqvSJ9eQVmlpNJt1wUf3a99tER9nUbwv3zq6CndZlXTzCaCmLW
 Jbb3SaCWJKKjbaBMiQLB22J42IlMRyrkBYgrFPFtR3ZWvJCdBiX+/ZUTFWj0PZPS8ue9
 zCtC6hsy2FJmr2cVAaR04/FAE3FRuq6X2ffAOeXHdWcu1mLEfPaDLYlA79KD76Rl+pzl
 ssa0XjxF4VqQ/HKKvujSI//KhN/fALMFZyfF6DUC/qbauXvLh9BWJIIk1Ebr8zlOrsmX
 KW5KIy7BKYwkpgjZLsPKHp2BkN8+M8Nhv1DGHKmJ82MqAJ9eyuxV+D/Sep1Poua5SL1I
 MitA==
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 David Francis <David.Francis@amd.com>, amd-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>,
 "Jerry \(Fangzhi\) Zuo" <Jerry.Zuo@amd.com>,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 Jonas Karlman <jonas@kwiboo.se>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, Russell King <rmk+kernel@armlinux.org.uk>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Thomas Lim <Thomas.Lim@amd.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>,
 Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Colin Ian King <colin.king@canonical.com>, Enrico Weigelt <info@metux.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFyaXVzeiwgSGFucywKCkkgY2FuIGFwcGx5IHRoZSBkdy1oZG1pIHBhdGNoZXMgaWYgbmVj
ZXNzYXJ5LgoKTmVpbAoKT24gMTkvMDgvMjAxOSAxMTozOCwgSGFucyBWZXJrdWlsIHdyb3RlOgo+
IEhpIGFsbCwKPiAKPiBUaGUgcGF0Y2hlcyBpbiB0aGlzIHNlcmllcyBjYW4gYmUgYXBwbGllZCBp
bmRlcGVuZGVudGx5IGZyb20gZWFjaCBvdGhlci4KPiAKPiBJZiB5b3UgbWFpbnRhaW4gb25lIG9m
IHRoZXNlIGRyaXZlcnMgYW5kIHlvdSB3YW50IHRvIG1lcmdlIGl0IGZvciB2NS40Cj4geW91cnNl
bGYsIHRoZW4gcGxlYXNlIGRvIHNvIGFuZCBsZXQgbWUga25vdy4gSWYgeW91IHByZWZlciBJIGNv
bW1pdCBpdAo+IHRvIGRybS1taXNjLCB0aGVuIHBsZWFzZSByZXZpZXcgYW5kIChob3BlZnVsbHkp
IEFjayB0aGUgcGF0Y2guCj4gCj4gSSB3b3VsZCByZWFsbHkgbGlrZSB0byBnZXQgdGhpcyBpbiBm
b3IgdjUuNCBzbyBJIGNhbiBnZXQgdGhlIHVzZXJzcGFjZQo+IGJpdHMgaW4gZm9yIHY1LjQgYXMg
d2VsbCB0aHJvdWdoIHRoZSBtZWRpYSBzdWJzeXN0ZW0uCj4gCj4gRGFyaXVzeiwgY2FuIHlvdSBw
b3N0IGEgdjcuMSBmb3IgcGF0Y2ggNS85IGZpeGluZyB0aGUgdHlwbz8KPiAKPiBUaGFua3MhCj4g
Cj4gCUhhbnMKPiAKPiBPbiA4LzE0LzE5IDEyOjQ0IFBNLCBEYXJpdXN6IE1hcmNpbmtpZXdpY3og
d3JvdGU6Cj4+IFRoaXMgc2VyaWVzIHVwZGF0ZXMgRFJNIGRyaXZlcnMgdG8gdXNlIG5ldyBDRUMg
bm90aWZpZXIgQVBJLgo+Pgo+PiBDaGFuZ2VzIHNpbmNlIHY2Ogo+PiAJTWFkZSBDRUMgbm90aWZp
ZXJzJyByZWdpc3RyYXRpb24gYW5kIGRlLXJlZ2lzdHJhdGlvbiBzeW1tZXRyaWMKPj4gCWluIHRk
YTk5OHggYW5kIGR3LWhkbWkgZHJpdmVycy4gQWxzbywgYWNjaWRlbnRhbGx5IGRyb3BwZWQgb25l
Cj4+IAlwYXRjaCBpbiB2NiAoY2hhbmdlIHRvIGRybV9kcF9jZWMpLCBicm91Z2h0IGl0IGJhY2sg
bm93Lgo+PiBDaGFuZ2VzIHNpbmNlIHY1Ogo+PiAgICAgICAgIEZpeGVkIGEgd2FybmluZyBhYm91
dCBhIG1pc3NpbmcgY29tbWVudCBmb3IgYSBuZXcgbWVtYmVyIG9mCj4+IAlkcm1fZHBfYXV4X2Nl
YyBzdHJ1Y3QuIFNlbmRpbmcgdG8gYSB3aWRlciBhdWRpZW5jZSwKPj4gCWluY2x1ZGluZyBtYWlu
dGFpbmVycyBvZiByZXNwZWN0aXZlIGRyaXZlcnMuCj4+IENoYW5nZXMgc2luY2UgdjQ6Cj4+IAlB
ZGRyZXNzaW5nIHJldmlldyBjb21tZW50cy4KPj4gQ2hhbmdlcyBzaW5jZSB2MzoKPj4gICAgICAg
ICBVcGRhdGVkIGFkYXB0ZXIgZmxhZ3MgaW4gZHctaGRtaS1jZWMuCj4+IENoYW5nZXMgc2luY2Ug
djI6Cj4+IAlJbmNsdWRlIGFsbCBEUk0gcGF0Y2hlcyBmcm9tICJjZWM6IGltcHJvdmUgbm90aWZp
ZXIgc3VwcG9ydCwKPj4gCWFkZCBjb25uZWN0b3IgaW5mbyBjb25uZWN0b3IgaW5mbyIgc2VyaWVz
Lgo+PiBDaGFuZ2VzIHNpbmNlIHYxOgo+PiAJVGhvc2UgcGF0Y2hlcyBkZWxheSBjcmVhdGlvbiBv
ZiBub3RpZmllcnMgdW50aWwgcmVzcGVjdGl2ZQo+PiAJY29ubmVjdG9ycyBhcmUgY29uc3RydWN0
ZWQuIEl0IHNlZW1zIHRoYXQgdGhvc2UgcGF0Y2hlcywgZm9yIGEKPj4gCWNvdXBsZSBvZiBkcml2
ZXJzLCBieSBhZGRpbmcgdGhlIGRlbGF5LCBpbnRyb2R1Y2UgYSByYWNlIGJldHdlZW4KPj4gCW5v
dGlmaWVycycgY3JlYXRpb24gYW5kIHRoZSBJUlFzIGhhbmRsaW5nIHRocmVhZHMgLSBhdCBsZWFz
dCBJCj4+IAlkb24ndCBzZWUgYW55dGhpbmcgb2J2aW91cyBpbiB0aGVyZSB0aGF0IHdvdWxkIGV4
cGxpY2l0bHkgZm9yYmlkCj4+IAlzdWNoIHJhY2VzIHRvIG9jY3VyLiB2MiBhZGRzIGEgd3JpdGUg
YmFycmllciB0byBtYWtlIHN1cmUgSVJRCj4+IAl0aHJlYWRzIHNlZSB0aGUgbm90aWZpZXIgb25j
ZSBpdCBpcyBjcmVhdGVkIChyZXBsYWNpbmcgdGhlCj4+IAlXUklURV9PTkNFIEkgcHV0IGluIHYx
KS4gVGhlIGJlc3QgdGhpbmcgdG8gZG8gaGVyZSwgSSBiZWxpZXZlLAo+PiAJd291bGQgYmUgbm90
IHRvIGhhdmUgYW55IHN5bmNocm9uaXphdGlvbiBhbmQgbWFrZSBzdXJlIHRoYXQgYW4gSVJRCj4+
IAlvbmx5IGdldHMgZW5hYmxlZCBhZnRlciB0aGUgbm90aWZpZXIgaXMgY3JlYXRlZC4KPj4gRGFy
aXVzeiBNYXJjaW5raWV3aWN6ICg5KToKPj4gICBkcm1fZHBfY2VjOiBhZGQgY29ubmVjdG9yIGlu
Zm8gc3VwcG9ydC4KPj4gICBkcm0vaTkxNS9pbnRlbF9oZG1pOiB1c2UgY2VjX25vdGlmaWVyX2Nv
bm5fKHVuKXJlZ2lzdGVyCj4+ICAgZHctaGRtaS1jZWM6IHVzZSBjZWNfbm90aWZpZXJfY2VjX2Fk
YXBfKHVuKXJlZ2lzdGVyCj4+ICAgdGRhOTk1MDogdXNlIGNlY19ub3RpZmllcl9jZWNfYWRhcF8o
dW4pcmVnaXN0ZXIKPj4gICBkcm06IHRkYTk5OHg6IHVzZSBjZWNfbm90aWZpZXJfY29ubl8odW4p
cmVnaXN0ZXIKPj4gICBkcm06IHN0aTogdXNlIGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3Rl
cgo+PiAgIGRybTogdGVncmE6IHVzZSBjZWNfbm90aWZpZXJfY29ubl8odW4pcmVnaXN0ZXIKPj4g
ICBkcm06IGR3LWhkbWk6IHVzZSBjZWNfbm90aWZpZXJfY29ubl8odW4pcmVnaXN0ZXIKPj4gICBk
cm06IGV4eW5vczogZXh5bm9zX2hkbWk6IHVzZSBjZWNfbm90aWZpZXJfY29ubl8odW4pcmVnaXN0
ZXIKPj4KPj4gIC4uLi9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fbXN0X3R5cGVzLmMgICB8
ICAyICstCj4+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LWhkbWktY2VjLmMg
fCAxMyArKystLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
ICAgICB8IDQ2ICsrKysrKysrKysrKystLS0tLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBf
Y2VjLmMgICAgICAgICAgICAgICAgICB8IDI1ICsrKysrKy0tLS0KPj4gIGRyaXZlcnMvZ3B1L2Ry
bS9leHlub3MvZXh5bm9zX2hkbWkuYyAgICAgICAgICB8IDMxICsrKysrKystLS0tLS0KPj4gIGRy
aXZlcnMvZ3B1L2RybS9pMmMvdGRhOTk1MC5jICAgICAgICAgICAgICAgICB8IDEyICsrLS0tCj4+
ICBkcml2ZXJzL2dwdS9kcm0vaTJjL3RkYTk5OHhfZHJ2LmMgICAgICAgICAgICAgfCAzNiArKysr
KysrKysrLS0tLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAg
ICAgICB8ICA0ICstCj4+ICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWku
YyAgICAgfCAxMyArKysrLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfY29u
bmVjdG9yLmMgICB8ICAzICstCj4+ICBkcml2ZXJzL2dwdS9kcm0vc3RpL3N0aV9oZG1pLmMgICAg
ICAgICAgICAgICAgfCAxOSArKysrKy0tLQo+PiAgZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1
dC5jICAgICAgICAgICAgICAgIHwgMjggKysrKysrKystLS0KPj4gIGluY2x1ZGUvZHJtL2RybV9k
cF9oZWxwZXIuaCAgICAgICAgICAgICAgICAgICB8IDE3ICsrKystLS0KPj4gIDEzIGZpbGVzIGNo
YW5nZWQsIDE1NSBpbnNlcnRpb25zKCspLCA5NCBkZWxldGlvbnMoLSkKPj4KPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
