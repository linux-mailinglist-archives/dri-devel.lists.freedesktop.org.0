Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DC3BDD49
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 13:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEF46EB9D;
	Wed, 25 Sep 2019 11:41:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9237D6EB9D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 11:41:20 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 3so4512132wmi.3
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 04:41:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NlYwZfi37MW+fG2G53m/ye4cUiGzk0pKzm2LWmwu4+Y=;
 b=DgPJZaW40fpoo3aHVFfnX4ntdpvKl+nzyPe6u76GLFUw5p8r6GUoblmt5yMcigbDwc
 /FNfZiigQy73Kg9jCXTHK0WeUqjz3uOQxf4QEqeqzrwwPTVCQCExCplK2spSAy7z9qqH
 vlX9i7HEe37R6lCpRpMwFz1PNZ9jDSHR6sO/rEf6+fUCf825BrsANlHdcEx+79gPNuC0
 FsZEq/D8gVgHqAPT2iR8cXCggbIgtwKw+35yXHf/m8aOMfzF5F/I0B8pRMl1fI5xMOjq
 dP7UJD4wefqg9ZGiN/k2jBKRg+YHU6mYLb22KdFMJF9yE1d6uT76RiiPzXVgpGXJiZB1
 jM4Q==
X-Gm-Message-State: APjAAAW0tWi61ynRR5edkjM587r3t6I8cK2bZs8bstSk9Vrk7FLjlPjf
 xDmKoa4vz6CbGm21xmRtHSjung==
X-Google-Smtp-Source: APXvYqznuQUSWw1R/GPQvgLJPp6nuq8m4FlWXAOgZppECWdwh6ybUf2fQimEoaOUtMK5oyCOX9ddAA==
X-Received: by 2002:a1c:7306:: with SMTP id d6mr7619568wmb.62.1569411678872;
 Wed, 25 Sep 2019 04:41:18 -0700 (PDT)
Received: from [192.168.1.62] (176-150-251-154.abo.bbox.fr. [176.150.251.154])
 by smtp.gmail.com with ESMTPSA id
 f83sm3735973wmf.43.2019.09.25.04.41.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 04:41:18 -0700 (PDT)
Subject: Re: [PATCH RESEND] drm/meson: vclk: use the correct G12A frac max
 value
To: dri-devel@lists.freedesktop.org
References: <20190828132311.23881-1-narmstrong@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <30fe12e7-e905-17b3-79ea-3857daa41f61@baylibre.com>
Date: Wed, 25 Sep 2019 13:41:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828132311.23881-1-narmstrong@baylibre.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=NlYwZfi37MW+fG2G53m/ye4cUiGzk0pKzm2LWmwu4+Y=;
 b=FSbSy6AV0csN/5J+L/b7vsjMly7qACDeRzIbk3Jk/Gy4SjxRkDDztmRx76ysfgA+6P
 zeRTO8Oir2AL8VmSt6LnjkpOzEz8afZQtH5xnB/fjhdayRms95fZAx3S0JTnnuBW3kPV
 K37pmKoVMJTZM5kKqVXtQGmTekVrbb+BW6Ksy7QqkxnXT+uAqsdk1lLNiVTJpNEIvlmy
 HPVefMflsnoPMAFjLThCP7+uryyb9qE4JRfhEU15/yv8R6hqEv5cnDZdD2N+VrdmLUx1
 vxfQ1ZhfRXNvGo+782axFPYTc/yJh6hMuNWeeok20/i8JZjUL4U3untUhFP40eLTETjO
 JA+A==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluZywgY291bGQgc29tZW9uZSByZXZpZXcgdGhpcyBwYXRjaCA/CgpOZWlsCgpPbiAyOC8wOC8y
MDE5IDE1OjIzLCBOZWlsIEFybXN0cm9uZyB3cm90ZToKPiBXaGVuIGNhbGN1bGF0aW5nIHRoZSBI
RE1JIFBMTCBzZXR0aW5ncyBmb3IgYSBETVQgbW9kZSBQSFkgZnJlcXVlbmN5LAo+IHVzZSB0aGUg
Y29ycmVjdCBtYXggZnJhY3Rpb25hbCBQTEwgdmFsdWUgZm9yIEcxMkEgVlBVLgo+IAo+IFdpdGgg
dGhpcyBmaXgsIHdlIGNhbiBmaW5hbGx5IHNldHVwIHRoZSAxMDI0eDc2OC02MCBtb2RlLgo+IAo+
IEZpeGVzOiAyMDJiOTgwOGY4ZWQgKCJkcm0vbWVzb246IEFkZCBHMTJBIFZpZGVvIENsb2NrIHNl
dHVwIikKPiBTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJy
ZS5jb20+Cj4gLS0tCj4gRml4ZWQgdHlwbyBpbiBjb21taXQgbG9nLCAxMDI0eDc2ID0+IDEwMjR4
NzY4Cj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMgfCA5ICsrKysrKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lc29uL21lc29uX3ZjbGsuYwo+IGluZGV4IGFjNDkxYTc4MTk1Mi4uZjY5MDc5
M2FlMmQ1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92Y2xrLmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmNsay5jCj4gQEAgLTYzOCwxMyAr
NjM4LDE4IEBAIHN0YXRpYyBib29sIG1lc29uX2hkbWlfcGxsX3ZhbGlkYXRlX3BhcmFtcyhzdHJ1
Y3QgbWVzb25fZHJtICpwcml2LAo+ICAJCWlmIChmcmFjID49IEhETUlfRlJBQ19NQVhfR1hCQikK
PiAgCQkJcmV0dXJuIGZhbHNlOwo+ICAJfSBlbHNlIGlmIChtZXNvbl92cHVfaXNfY29tcGF0aWJs
ZShwcml2LCBWUFVfQ09NUEFUSUJMRV9HWE0pIHx8Cj4gLQkJICAgbWVzb25fdnB1X2lzX2NvbXBh
dGlibGUocHJpdiwgVlBVX0NPTVBBVElCTEVfR1hMKSB8fAo+IC0JCSAgIG1lc29uX3ZwdV9pc19j
b21wYXRpYmxlKHByaXYsIFZQVV9DT01QQVRJQkxFX0cxMkEpKSB7Cj4gKwkJICAgbWVzb25fdnB1
X2lzX2NvbXBhdGlibGUocHJpdiwgVlBVX0NPTVBBVElCTEVfR1hMKSkgewo+ICAJCS8qIEVtcGly
aWMgc3VwcG9ydGVkIG1pbi9tYXggZGl2aWRlcnMgKi8KPiAgCQlpZiAobSA8IDEwNiB8fCBtID4g
MjQ3KQo+ICAJCQlyZXR1cm4gZmFsc2U7Cj4gIAkJaWYgKGZyYWMgPj0gSERNSV9GUkFDX01BWF9H
WEwpCj4gIAkJCXJldHVybiBmYWxzZTsKPiArCX0gZWxzZSBpZiAobWVzb25fdnB1X2lzX2NvbXBh
dGlibGUocHJpdiwgVlBVX0NPTVBBVElCTEVfRzEyQSkpIHsKPiArCQkvKiBFbXBpcmljIHN1cHBv
cnRlZCBtaW4vbWF4IGRpdmlkZXJzICovCj4gKwkJaWYgKG0gPCAxMDYgfHwgbSA+IDI0NykKPiAr
CQkJcmV0dXJuIGZhbHNlOwo+ICsJCWlmIChmcmFjID49IEhETUlfRlJBQ19NQVhfRzEyQSkKPiAr
CQkJcmV0dXJuIGZhbHNlOwo+ICAJfQo+ICAKPiAgCXJldHVybiB0cnVlOwo+IAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
