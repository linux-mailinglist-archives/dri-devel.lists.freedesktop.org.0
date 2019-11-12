Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0409F8BF6
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 10:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F39B16EAD1;
	Tue, 12 Nov 2019 09:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642896EAD1
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 09:36:57 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z19so2151665wmk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 01:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M6f+nEC9fy5i36j1N2cKLyO9ENzn62Nzb0Hx3U0HbRY=;
 b=m46L2IEv5cZ7L7Pb2iSfOr4G7dty/5Q/rEwdfZiwJ8RmXaDlhykl9q50nuRAA1ri1/
 qdJLSp378fTV+NeAogi4SzMcxIQmvGKl6F2Qrmv6kl8k5Pe5NN51D5zgMDAQ11c39gyg
 gsUnZ1+3Yqay2W0MGvva80w/FGoVym/3ld5X7iOYap85YUoe0X3rxgYn+PlyD/foItC0
 BZmwsdZ5b12ar+rq9COfxGD457Bu+zhY5YMv+xquQSq97E/2j7bEqopaos1GAhR3yaqi
 LhVN8Ikz1FeYhwCmvMExK0q+T+ZRGtuhyVNDmnuanQCMOx7vBseDM7f8Wd+CVe8mNebK
 6EGw==
X-Gm-Message-State: APjAAAXevB9kwQJi1Ebm2LA4rwWOdQBWHGmZOamZAyp4JCNVmQzLeXTT
 I6kYY9Yu8G4Qb2muMxtY8zRhygySBrL6yA==
X-Google-Smtp-Source: APXvYqyQ6ezNF1VO0ccdBVZK16c8DtD0llaUV+gCIxzK5HEucdhoa+rNBeo/6h5lu2Xg3wiHVmMhgQ==
X-Received: by 2002:a1c:2e8f:: with SMTP id u137mr3061638wmu.105.1573551415667; 
 Tue, 12 Nov 2019 01:36:55 -0800 (PST)
Received: from [10.1.2.12] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id b3sm3462942wmh.17.2019.11.12.01.36.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 Nov 2019 01:36:55 -0800 (PST)
Subject: Re: [PATCH 2/2] drm/edid: Add alternate clock for SMPTE 4K
To: Wayne Lin <Wayne.Lin@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20191112075307.12574-1-Wayne.Lin@amd.com>
 <20191112075307.12574-2-Wayne.Lin@amd.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <75d0e827-25b2-ceae-0484-a98af7b8b693@baylibre.com>
Date: Tue, 12 Nov 2019 10:36:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191112075307.12574-2-Wayne.Lin@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:openpgp:autocrypt:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=M6f+nEC9fy5i36j1N2cKLyO9ENzn62Nzb0Hx3U0HbRY=;
 b=oHu1Fj7iUODfYd+3OfqH0fRZmp1V0Aq3UA6fq2+r5dOCkp73oXoVkKcCsGnvOVJ4LX
 4lkVXwn7mAIBnYrzsVeDXnGoO4k+zPkgT9ee14qBR74cN6z1wW1+1D/2gD1c2HoqAdmu
 AG0r+cioPDbaS8DNgWPwRoCnqAugVjGaDx2pQjfxGhqElalPzYLOlSeSC4uCRCPMmkCI
 g/jOarG+JCK8B9PjGGKBIWd+4VpDERpUcXRqVGVaXgRhMcNXwMEuCMW3pzvjjlK88oEU
 DBJ3Qxk9sfu4zTDckc6yZmFS905m8n59sTZYn50OtCmnCXRbPRmxhXgwMkNaxUcbe3vO
 Im2w==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMTEvMjAxOSAwODo1MywgV2F5bmUgTGluIHdyb3RlOgo+IFtXaHldCj4gSW4gaGRtaV9t
b2RlX2FsdGVybmF0ZV9jbG9jaygpLCBpdCBhZGRzIGFuIGV4Y2VwdGlvbiBmb3IgVklDIDQKPiBt
b2RlICg0MDk2eDIxNjBAMjQpIGR1ZSB0byB0aGVyZSBpcyBubyBhbHRlcm5hdGUgY2xvY2sgZGVm
aW5lZCBmb3IKPiB0aGF0IG1vZGUgaW4gSERNSTEuNGIuIEJ1dCBIRE1JMi4wIGFkZHMgMjMuOThI
eiBmb3IgdGhhdCBtb2RlLgo+IAo+IFtIb3ddCj4gUmVtb3ZlIHRoZSBleGNlcHRpb24KClNob3Vs
ZG4ndCBpdCBiZSBvbmx5IGJ5cGFzc2VkIHdoZW4gdGhlIHNpbmsgaXMgSERNSTIgPwoKTmVpbAoK
PiAKPiBTaWduZWQtb2ZmLWJ5OiBXYXluZSBMaW4gPFdheW5lLkxpbkBhbWQuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDMgLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAz
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCj4gaW5kZXggZmNkN2FlMjkwNDlkLi5lZDI3
ODJjNTNhOTMgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYwo+IEBAIC0zMTI2LDkgKzMxMjYsNiBAQCBzdGF0
aWMgZW51bSBoZG1pX3BpY3R1cmVfYXNwZWN0IGRybV9nZXRfaGRtaV9hc3BlY3RfcmF0aW8oY29u
c3QgdTggdmlkZW9fY29kZSkKPiAgc3RhdGljIHVuc2lnbmVkIGludAo+ICBoZG1pX21vZGVfYWx0
ZXJuYXRlX2Nsb2NrKGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlICpoZG1pX21vZGUpCj4g
IHsKPiAtCWlmIChoZG1pX21vZGUtPnZkaXNwbGF5ID09IDQwOTYgJiYgaGRtaV9tb2RlLT5oZGlz
cGxheSA9PSAyMTYwKQo+IC0JCXJldHVybiBoZG1pX21vZGUtPmNsb2NrOwo+IC0KPiAgCXJldHVy
biBjZWFfbW9kZV9hbHRlcm5hdGVfY2xvY2soaGRtaV9tb2RlKTsKPiAgfQo+ICAKPiAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
