Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D855EAC2A
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D8CB6EDCE;
	Thu, 31 Oct 2019 09:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761056ED7C
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:26:15 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id u22so4454545lji.7
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 15:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ghyKzMOt9noacqcW8gijvIBX51lIWlQ2FC12YmCxtvQ=;
 b=G7aAXMZbqaQWlaKmPPWnfj60Ylk7qFmf2h2LOMNSZl590Fq5UE/ZXAge4LcnBp+mwT
 nZxpQGofQQVXMR5K0aYiy9eBPKAQ+wpX/93dEphAdzEbkKG4hdoztnu7vsHc5B2l6Pic
 WMG1B4UbUVAP30c5pEO6t0ADEnE99UGlN2zCom7eeEPRn0EhadIlNSHJ2PmRyEaiPbza
 rlbrNHv53H6KMw+aTqBlbbkozPWQBpUdQDvsNkhi2AS6daqwpAzcgl1XvAxQnI1VKXqt
 ZeFkYePM83jshKgeIPEN/2yuAhm2j45VfkfnopGE6aKPQJ4VKBxjHg657Ed83JHBWb39
 KaeQ==
X-Gm-Message-State: APjAAAVSnoQhUPb843CTdKTLc37lrJ6awSb/Ouwv0Bs1dVFJMj3bhI9b
 hkZzpP/TytGBo8vVSWM6nqM=
X-Google-Smtp-Source: APXvYqxKePoldR1zNVEQWFMsbOhcscgsBBrkafCI669vkMg6MuihGz3TFUtR0jB78Klpzab6EvBjiw==
X-Received: by 2002:a2e:3919:: with SMTP id g25mr1392037lja.232.1572474373677; 
 Wed, 30 Oct 2019 15:26:13 -0700 (PDT)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru.
 [94.29.10.250])
 by smtp.googlemail.com with ESMTPSA id y189sm1010882lfc.9.2019.10.30.15.26.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2019 15:26:12 -0700 (PDT)
Subject: Re: [PATCH -next] gpu: host1x: Fix compile test failure
To: YueHaibing <yuehaibing@huawei.com>, thierry.reding@gmail.com,
 mperttunen@nvidia.com, arnd@arndb.de, seanpaul@chromium.org
References: <20191030135458.27960-1-yuehaibing@huawei.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <283304d6-bf23-8107-29b6-9f3e7dda943c@gmail.com>
Date: Thu, 31 Oct 2019 01:26:11 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191030135458.27960-1-yuehaibing@huawei.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ghyKzMOt9noacqcW8gijvIBX51lIWlQ2FC12YmCxtvQ=;
 b=P8p3TGCy8MV1WlfFblsWQyXzqgtkUuF8eoQE8T02IWdtjfi22N4gyn720vMo//QKEQ
 w5kXkpijc3XFD1OQpXnmtxZqQa0kdFqv7Dm0mm1q4wmGYLrwp3V5PEHOTrv/auteZs19
 fSTD87LuiG0fsjhKpRTC+xcBPKKDoXP9XjuAny8X+1R/aXVir8oBfViVnv01uv94yWcO
 yx8d2JeqK9utaXL+rSBrE01+y1oxUJ2Mm+zK1DEAOmVvr7Vtzw4h0DvtGNa7ETzEbIJZ
 gNcb5+BTIwFA+OsVB2qwv7pqduJv0ZvTxyxvP5G8x9/JB1y9JScpVSrnOtRz2hJzXkD8
 rUWQ==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MzAuMTAuMjAxOSAxNjo1NCwgWXVlSGFpYmluZyDQv9C40YjQtdGCOgo+IElmIElPTU1VX1NVUFBP
UlQgaXMgbm90IHNldCwgYnV0IElPTU1VX0lPVkEgaXMgbSBhbmQKPiBDT01QSUxFX1RFU1QgaXMg
eSwgYnVpbGRpbmcgZmFpbHM6Cj4gCj4gZHJpdmVycy9ncHUvaG9zdDF4L2Rldi5vOiBJbiBmdW5j
dGlvbiBgaG9zdDF4X3JlbW92ZSc6Cj4gZGV2LmM6KC50ZXh0KzB4NjI0KTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgcHV0X2lvdmFfZG9tYWluJwo+IGRldi5jOigudGV4dCsweDYyNCk6IHJlbG9j
YXRpb24gdHJ1bmNhdGVkIHRvIGZpdDogUl9BQVJDSDY0X0NBTEwyNiBhZ2FpbnN0IHVuZGVmaW5l
ZCBzeW1ib2wgYHB1dF9pb3ZhX2RvbWFpbicKPiBkZXYuYzooLnRleHQrMHg2MmMpOiB1bmRlZmlu
ZWQgcmVmZXJlbmNlIHRvIGBpb3ZhX2NhY2hlX3B1dCcKPiBkZXYuYzooLnRleHQrMHg2MmMpOiBy
ZWxvY2F0aW9uIHRydW5jYXRlZCB0byBmaXQ6IFJfQUFSQ0g2NF9DQUxMMjYgYWdhaW5zdCB1bmRl
ZmluZWQgc3ltYm9sIGBpb3ZhX2NhY2hlX3B1dCcKPiAKPiBTZWxlY3QgSU9NTVVfSU9WQSB3aGls
ZSBDT01QSUxFX1RFU1QgaXMgc2V0IHRvIGZpeCB0aGlzLgo+IAo+IFJlcG9ydGVkLWJ5OiBIdWxr
IFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KPiBGaXhlczogNTI0OTlhNmFkMmFlICgiZ3B1OiBo
b3N0MXg6IHNlbGVjdCBJT01NVV9JT1ZBIikKPiBTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5
dWVoYWliaW5nQGh1YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2hvc3QxeC9LY29uZmln
IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvaG9zdDF4L0tjb25maWcgYi9kcml2ZXJzL2dw
dS9ob3N0MXgvS2NvbmZpZwo+IGluZGV4IGNmOTg3YTMuLjM1NDIzMmQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvaG9zdDF4L0tjb25maWcKPiArKysgYi9kcml2ZXJzL2dwdS9ob3N0MXgvS2Nv
bmZpZwo+IEBAIC0yLDcgKzIsNyBAQAo+ICBjb25maWcgVEVHUkFfSE9TVDFYCj4gIAl0cmlzdGF0
ZSAiTlZJRElBIFRlZ3JhIGhvc3QxeCBkcml2ZXIiCj4gIAlkZXBlbmRzIG9uIEFSQ0hfVEVHUkEg
fHwgKEFSTSAmJiBDT01QSUxFX1RFU1QpCj4gLQlzZWxlY3QgSU9NTVVfSU9WQSBpZiBJT01NVV9T
VVBQT1JUCj4gKwlzZWxlY3QgSU9NTVVfSU9WQSBpZiAoSU9NTVVfU1VQUE9SVCB8fCBDT01QSUxF
X1RFU1QpCj4gIAloZWxwCj4gIAkgIERyaXZlciBmb3IgdGhlIE5WSURJQSBUZWdyYSBob3N0MXgg
aGFyZHdhcmUuCj4gIAo+IAoKSXQgc2hvdWxkIGJlIGJldHRlciB0byB1bmNvbmRpdGlvbmFsbHkg
c2VsZWN0IElPTU1VX0lPVkEgaGVyZS4KClRoZSBzYW1lIGNvdWxkIGJlIGRvbmUgZm9yIGRyaXZl
cnMvc3RhZ2luZy9tZWRpYS90ZWdyYS12ZGUvIGFuZApkcml2ZXJzL2dwdS9ob3N0MXgvLCBwbGVh
c2Ugc2VlIFsxXS4KClsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1pb21tdS8yMDE5
MDgyOTE1NDkwMi5HQzE5ODQyQHVsbW8vCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
