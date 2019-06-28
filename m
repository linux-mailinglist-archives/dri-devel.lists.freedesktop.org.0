Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A447159569
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 09:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F7696E88A;
	Fri, 28 Jun 2019 07:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 451716E88A
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 07:55:21 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id x4so5213317wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2019 00:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=28q0p8mfEjo9y2tYGYE8ojhpf6JJn4oHqxDJM4Zwywo=;
 b=gbkOQO1YBZUImb0oAFKgU7+rVWBuLE97Qgg+OlfjUtkS29EZyM1NuGg4U/aV4G4f3S
 nLPbDRG3JH9HA5KZppYKhf/qxtqmpSX3HowMskKRoxwMiQEdUiGQmz96RSSawzDXnpBy
 AUKj83dzJvZnTAoMiFL/DYthvSo6VwSSb7B6xDJ/V01xlo62WBjGSstJ5Z9DVBhC4w8c
 hqjikeatiiQik11O0UtlOsCIGTcf0lC9mJEVt768UDuByy+BIJN6VvdIJhegUqj7s+vZ
 ZlWq+hy3sLfzSD7ZEc4bitk5rn3/kCS094ZcJvfpvRCBasXoNYjOeedq+3lwC4deVyPm
 eHkg==
X-Gm-Message-State: APjAAAW/OsO4VUwOjOmMGYQ317pPAx8cNJEcs4S54yeLk6SCOxZRMkWr
 Q+beUkQzRZqa5xsFvO1heTBarQ==
X-Google-Smtp-Source: APXvYqyHwucMhMiFSR2RCdWM5dLpObReYHRWk+PK0l6xFWUQ6oTBpk/rv/91P2HAonWQM7F7VS+UgQ==
X-Received: by 2002:a5d:6190:: with SMTP id j16mr6969556wru.49.1561708519895; 
 Fri, 28 Jun 2019 00:55:19 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id u2sm8474802wmc.3.2019.06.28.00.55.17
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 28 Jun 2019 00:55:18 -0700 (PDT)
Date: Fri, 28 Jun 2019 08:55:16 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v2 4/4] backlight: pwm_bl: Set scale type for brightness
 curves specified in the DT
Message-ID: <20190628075516.dwev7fxz7kmox2i2@holly.lan>
References: <20190624203114.93277-1-mka@chromium.org>
 <20190624203114.93277-5-mka@chromium.org>
 <20190626145617.GB22348@xo-6d-61-c0.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626145617.GB22348@xo-6d-61-c0.localdomain>
User-Agent: NeoMutt/20180716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=28q0p8mfEjo9y2tYGYE8ojhpf6JJn4oHqxDJM4Zwywo=;
 b=YVeJdSjXyGRCdF2WmpC/ewATk5iXIkwZ/JIJisZIjk5xmVj1kn09bt61Ahn1Qe/lQg
 5i5n55RmnCX1F8SIlclZUlQA4bK9puQRh2BbQg84wLDjunKlJsXFuPcZksEstlRD35mP
 iAiT17WBFT6EcmLfR/CaS269KYwqzXA+RG0+X/74V3JcYWFQNCrKLewc8YAlk4cptNAy
 rPWHJUWZ0NRDAs79yjPu2rW2AF0Khj2gwSQiNBMmQ1lkRs2cEbOyKFxOwL1GWUXY3a4E
 1pJmhaHTGO1ODS9pjBs9K/Kkjv3AX/xWVEkTMQq310+vE/rwmqQse3mvc4C4Pp73yn5Z
 p8+A==
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Brian Norris <briannorris@chromium.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jacek Anaszewski <jacek.anaszewski@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDQ6NTY6MThQTSArMDIwMCwgUGF2ZWwgTWFjaGVrIHdy
b3RlOgo+IE9uIE1vbiAyMDE5LTA2LTI0IDEzOjMxOjEzLCBNYXR0aGlhcyBLYWVobGNrZSB3cm90
ZToKPiA+IENoZWNrIGlmIGEgYnJpZ2h0bmVzcyBjdXJ2ZSBzcGVjaWZpZWQgaW4gdGhlIGRldmlj
ZSB0cmVlIGlzIGxpbmVhciBvcgo+ID4gbm90IGFuZCBzZXQgdGhlIGNvcnJlc3BvbmRpbmcgcHJv
cGVydHkgYWNjb3JkaW5nbHkuIFRoaXMgbWFrZXMgdGhlCj4gPiBzY2FsZSB0eXBlIGF2YWlsYWJs
ZSB0byB1c2Vyc3BhY2UgdmlhIHRoZSAnc2NhbGUnIHN5c2ZzIGF0dHJpYnV0ZS4KPiA+IAo+ID4g
VG8gZGV0ZXJtaW5lIGlmIGEgY3VydmUgaXMgbGluZWFyIGl0IGlzIGNvbXBhcmVkIHRvIGEgaW50
ZXJwb2xhdGVkIGxpbmVhcgo+ID4gY3VydmUgYmV0d2VlbiBtaW4gYW5kIG1heCBicmlnaHRuZXNz
LiBUaGUgY3VydmUgaXMgY29uc2lkZXJlZCBsaW5lYXIgaWYKPiA+IG5vIHZhbHVlIGRldmlhdGVz
IG1vcmUgdGhhbiArLy01JSBvZiAke2JyaWdodG5lc3NfcmFuZ2V9IGZyb20gdGhlaXIKPiA+IGlu
dGVycG9sYXRlZCB2YWx1ZS4KPiAKPiBJIGRvbid0IHRoaW5rIHRoaXMgd29ya3MuIFNvbWUgaGFy
ZHdhcmUgZG9lcyB0YWtlcyBicmlnaHRuZXNzIGluIHBlcmNlcHR1YWwgdW5pdHMsCj4gY29udmVy
dGluZyBpdCBpbiB0aGUgTEVEIGNvbnRyb2xsZXIuCgpUaGlzIGNoZWNrIGlzIGV4Y2x1c2l2ZSB0
byBQV00gYmFja2xpZ2h0cyBzbyBJJ2QgbGlrZSB0byBkb3VibGUgY2hlY2sKdGhhdCB5b3UgYXJl
IHRoaW5raW5nIHNwZWNpZmljYWxseSBvZiBoYXJkd2FyZSB0aGF0IHRha2VzIGl0J3Mgc2lnbmFs
CmZyb20gdGhlIFBXTSBhbmQgd29ya3MgaW4gcGVyY2VwdHVhbCB1bml0cz8KCkkgZG9uJ3QgcmVj
YWxsIGFueSBleGFtcGxlcyBiZWluZyBvZmZlcmVkIHdoZW4gd2UgcmV2aWV3ZWQgdGhlCmF1dG8t
Z2VuZXJhdGVkIENJRSB0YWJsZXMgKGFsdGhvdWdoIHNpbmNlIHRoYXQgY2FuIGJlIG92ZXJyaWRl
biBieSBEVCBpdAp3YXMgbm90IG9mIHRoZSBzYW1lIGdyYXZpdHkgYW5kIHRoaXMgZXhhbXBsZSku
CgoKRGFuaWVsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
