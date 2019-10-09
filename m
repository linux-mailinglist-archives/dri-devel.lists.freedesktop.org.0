Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7857D2138
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 08:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFEA6EAA3;
	Thu, 10 Oct 2019 06:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08F246E342
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 21:43:12 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id o18so4897924wrv.13
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2019 14:43:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=JxXn52RmjLWCw4xeyAmS1iJdiMsWzbnLw4FLqKyxesQ=;
 b=gfNO1p0HC+SWJODh1W09RHKe8dt+8jOr+1XauWNnjEGuTnrbh0MNtdfc/RErssAJ3B
 rUkKKMlrnH8VCkHHOSdZ4IRT/C8GFBJuNeGZuSsTghhRVXrCfbQcuInejpViys8hkQsH
 yw5VlkzGAWSoD8pnOWQ0amBX3BxKQzwO1ZYQ9Fsecwazf7s23zRjRYC6IarKa+zVFsQD
 uPYY6w9no8bzsivklKIdB5u56eLCQGtebdwJhP4lxSFBEOk9+Lb8bynRzkk7ndqsTO/w
 DtyEi/6hK5CL0TiBELugfBbdhq3HJub+efSsleUfbV7McY0JU4gG12QBWVnJHVEwsY0R
 EieQ==
X-Gm-Message-State: APjAAAXXIhc7Obi06yTiKxteAr0SPFOP5QOlCrY90wkFXcqaesfoUBQw
 zq/yuIKou+TfP1LEwqg1Dmsczh3p
X-Google-Smtp-Source: APXvYqxRSE0Ompy8v5/Pma72p/bfeXutYUG1yOROcGWgnjDzx/oVdTas4gY69ojgbU+WuWPKiNUYjQ==
X-Received: by 2002:adf:f68f:: with SMTP id v15mr4601190wrp.234.1570657390161; 
 Wed, 09 Oct 2019 14:43:10 -0700 (PDT)
Received: from [10.67.50.53] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id f8sm3726689wmb.37.2019.10.09.14.43.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Oct 2019 14:43:09 -0700 (PDT)
Subject: Re: [PATCH] Revert "ARM: bcm283x: Switch V3D over to using the PM
 driver instead of firmware."
To: Stefan Wahren <wahrenst@gmx.net>, Florian Fainelli
 <f.fainelli@gmail.com>, Eric Anholt <eric@anholt.net>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 boris.brezillon@bootlin.com
References: <1567957493-4567-1-git-send-email-wahrenst@gmx.net>
 <26e101ad-8b5b-edef-4437-778bc57ae81f@gmail.com>
 <077547f9-e0ec-29a6-6264-0281dac6b8c8@gmx.net>
From: Florian Fainelli <f.fainelli@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <877621f0-2fbc-55d1-391e-b2ffbce186ac@gmail.com>
Date: Wed, 9 Oct 2019 14:42:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <077547f9-e0ec-29a6-6264-0281dac6b8c8@gmx.net>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 10 Oct 2019 06:55:06 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JxXn52RmjLWCw4xeyAmS1iJdiMsWzbnLw4FLqKyxesQ=;
 b=C2EKTh9TBVlGXf7aRoBDi1XwWRRJL0ebHRcegYiVJPQuUEETwtgBQahm/NKK4tHeQh
 463WTMfhpzBVIuJfp6emit4RD+uZr33fcaCZSZRnILZHugzcEXxhVbHjnV62a+yodxcv
 iG2BfooPqxs+JnK2FwiiFkkZMJDHjHeyFnl5IlL1eIMEovtmXcGR2Eel90LzeYWFfrai
 nnJxfTjIcOkZgcTH6Y+fvzHgcFtIV5K8xH0pHJXNTIUOEm2Vd2Rfzcxbzs2YdfIPBdqO
 sWHo/L7kiEuP+du9tPZN+8GVSmggNLkT41Ig8nx7n2dbV8PUtyaP2J7DqcvzIvn4Uq+q
 IvQg==
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
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvOS8xOSAyOjMzIFBNLCBTdGVmYW4gV2FocmVuIHdyb3RlOgo+IEhpIEZsb3JpYW4sCj4g
Cj4gQW0gMjMuMDkuMTkgdW0gMjA6NTYgc2NocmllYiBGbG9yaWFuIEZhaW5lbGxpOgo+Pgo+PiBP
biA5LzgvMjAxOSA4OjQ0IEFNLCBTdGVmYW4gV2FocmVuIHdyb3RlOgo+Pj4gU2luY2UgcmVsZWFz
ZSBvZiB0aGUgbmV3IEJDTTI4MzUgUE0gZHJpdmVyIHRoZXJlIGhhcyBiZWVuIHNldmVyYWwgcmVw
b3J0cwo+Pj4gb2YgVjNEIHByb2JpbmcgaXNzdWVzLiBUaGlzIGlzIGNhdXNlZCBieSB0aW1lb3V0
cyBkdXJpbmcgcG93ZXJpbmctdXAgdGhlCj4+PiBHUkFGWCBQTSBkb21haW46Cj4+Pgo+Pj4gICBi
Y20yODM1LXBvd2VyOiBUaW1lb3V0IHdhaXRpbmcgZm9yIGdyYWZ4IHBvd2VyIE9LCj4+Pgo+Pj4g
SSB3YXMgYWJsZSB0byByZXByb2R1Y2UgdGhpcyByZWxpYWJsZSBvbiBteSBSYXNwYmVycnkgUGkg
M0IrIGFmdGVyIHNldHRpbmcKPj4+IGZvcmNlX3R1cmJvPTEgaW4gdGhlIGZpcm13YXJlIGNvbmZp
Z3VyYXRpb24uIFNpbmNlIHRoZXJlIGFyZSBubyBpc3N1ZXMKPj4+IHVzaW5nIHRoZSBmaXJtd2Fy
ZSBQTSBkcml2ZXIgd2l0aCB0aGUgc2FtZSBzZXR1cCwgdGhlcmUgbXVzdCBiZSBhbiBpc3N1ZQo+
Pj4gaW4gdGhlIEJDTTI4MzUgUE0gZHJpdmVyLgo+Pj4KPj4+IFVuZm9ydHVuYXRlbHkgdGhlcmUg
aGFzbid0IGJlZW4gbXVjaCBwcm9ncmVzcyBpbiBpZGVudGlmeWluZyB0aGUgcm9vdCBjYXVzZQo+
Pj4gc2luY2UgSnVuZSAobW9zdGx5IGluIHRoZSBsYWNrIG9mIGRvY3VtZW50YXRpb24pLCBzbyBp
IGRlY2lkZWQgdG8gc3dpdGNoCj4+PiBiYWNrIHVudGlsIHRoZSBpc3N1ZSBpbiB0aGUgQkNNMjgz
NSBQTSBkcml2ZXIgaXMgZml4ZWQuCj4+Pgo+Pj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3Jh
c3BiZXJyeXBpL2xpbnV4L2lzc3Vlcy8zMDQ2Cj4+PiBGaXhlczogZTFkYzJiMmUxYmVmICgiIEFS
TTogYmNtMjgzeDogU3dpdGNoIFYzRCBvdmVyIHRvIHVzaW5nIHRoZSBQTSBkcml2ZXIgaW5zdGVh
ZCBvZiBmaXJtd2FyZS4iKQo+Pj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4+IFNpZ25l
ZC1vZmYtYnk6IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+Cj4+IEFwcGxpZWQgdG8g
ZGV2aWNldHJlZS9maXhlcywgdGhhbmtzIQo+IAo+IGkgbm90aWNlZCB0aGF0IFggaGFuZ3Mgd2l0
aCByZWNlbnQgUmFzcGJpYW4gYW5kIExpbnV4IDUuNC1yYzIgYWZ0ZXIgdGhpcwo+IHJldmVydCBo
YXMgYmVlbiBhcHBsaWVkLgo+IAo+IElzIHRoZXJlIGEgY2hhbmNlIHRvIGRyb3AgdGhlIHJldmVy
dD8KCkkgaGF2ZSBub3Qgc2VudCBhbnl0aGluZyB5ZXQgYXMgSSB3YW50ZWQgdG8gZ2V0IHNvbWUg
dGVzdGluZyBkb25lIG9uCm90aGVyIHBsYXRmb3Jtcywgc28geWVzLCBJIGNhbiBkZWZpbml0aXZl
bHkgZHJvcCB0aGF0IHBhcnRpY3VsYXIgY2hhbmdlcwpmcm9tIGRldmljZXRyZWUvZml4ZXMgYW5k
IG5vdCBzZW5kIGl0IGZvciBhIDUuNC1yYzMgcHVsbCByZXF1ZXN0LiBEb2VzCnRoYXQgd29yayBm
b3IgeW91PwotLSAKRmxvcmlhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
