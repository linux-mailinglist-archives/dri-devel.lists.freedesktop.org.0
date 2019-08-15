Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3518EF4F
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 17:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8546E6E9E8;
	Thu, 15 Aug 2019 15:28:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3F76E9E8;
 Thu, 15 Aug 2019 15:28:14 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id z1so2532481wru.13;
 Thu, 15 Aug 2019 08:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=7ySHx2gCdOcjIme2TB9gfS7z1s8Aq8Y5cCzx0Vx45zg=;
 b=ACpZqPpmR/Y0XP74dMkha49av19mUywFAteJT+b4RkIKYVyTv5GwypZbp8eSvd0+zc
 SdLipF/l5T73WnL78CSxC5UZlRq93AlY327gKfi3nCqpfLecW9DGEEEHGeZHcvOJKRRo
 3qlfxtP0eLTJN3Fz8ITdtW1u5nc3RtHDpy79s0DkgrveYkOyal6tlSwulArT/o9Jq+5H
 se9+F9pILSZDaDF3qLw2Z57Ee9DaLuIiTJIQ59kEquYLU9MfNV7gQbXBmLZKmPQmVgLa
 ZYtVe6YczmeMr2TrOKxabD9bVvM9kWKBjR/I8fFo9WtQ7/9HKmsZJWRRseoe6KOU8C7R
 zFeQ==
X-Gm-Message-State: APjAAAVSl4gi54AOvCKyuzVO41y6MqSyxDKraN2OrKHG941Fn8+6dZdG
 Us9FeXE40f32YyGteg86+UV0AvBf+yofW6r4fmo=
X-Google-Smtp-Source: APXvYqzz6gyHm3vlGI40gdc7o+65StfdjcAW+O4APBp6oMbqSt+4D9jEeAhIx4kDVgAKXYikjXd4w9FwweE+ISkml+E=
X-Received: by 2002:a5d:6b11:: with SMTP id v17mr5926083wrw.323.1565882892937; 
 Thu, 15 Aug 2019 08:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190815051117.24003-1-kai.heng.feng@canonical.com>
 <BN6PR12MB180950AE744B37AAFADC2FEAF7AC0@BN6PR12MB1809.namprd12.prod.outlook.com>
 <8D8229FF-933A-43CF-AE05-52E969E3B942@canonical.com>
In-Reply-To: <8D8229FF-933A-43CF-AE05-52E969E3B942@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Aug 2019 11:28:01 -0400
Message-ID: <CADnq5_MqvH-jUdDUOeBM6zgwYKiv21Wuejw4sR5TwY7bJss_ow@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Apply flags after amdgpu_device_ip_init()
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=7ySHx2gCdOcjIme2TB9gfS7z1s8Aq8Y5cCzx0Vx45zg=;
 b=nFcWA2fwfrW59buy2JNIcCI/eoxVG1XgciG7VLDMD0uY3EsxHmT9sceBoJ1LYNNBcy
 MOfRDhwMJlOsKfHlXui5iquI9x3/r5XUAoAG0D7/t4XmEI2UKU6CHtr1l6OuVzEoI5uP
 UQQ8g7L6TVPfC9u/ubnEjQxTqWyICOciuAmrc0bQYmwEPs3A7cBGOc4nXYUozibOo0cC
 rdXx9aeHFaOtlq6wbPuvHkDSIFV6EaWmjxUyUE0W0QtWkfFHQPsqSFfAc5fbzD5X1mw4
 vzl8B9arUiwphJaJMfAJZ6Og007HiiHK2nN86UTO8ObdkrwvAcGrNAsegt9qB9n/E4Lk
 H++Q==
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
Cc: "anthony.wong@canonical.com" <anthony.wong@canonical.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Huang,
 Ray" <Ray.Huang@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTA6NTkgQU0gS2FpLUhlbmcgRmVuZwo8a2FpLmhlbmcu
ZmVuZ0BjYW5vbmljYWwuY29tPiB3cm90ZToKPgo+IGF0IDIxOjMzLCBEZXVjaGVyLCBBbGV4YW5k
ZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+IHdyb3RlOgo+Cj4gPiBUaGFua3MgZm9yIGZp
bmRpbmcgdGhpcyEgIEkgdGhpbmsgdGhlIGF0dGFjaGVkIHBhdGNoIHNob3VsZCBmaXggdGhlIGlz
c3VlCj4gPiBhbmQgaXQncyBtdWNoIGxlc3MgaW52YXNpdmUuCj4KPiBZZXMgaXQgYWxzbyBmaXgg
dGhlIGlzc3VlLCBwbGVhc2UgYWRkIGJ5IHRlc3RlZC1ieToKPiBUZXN0ZWQtYnk6IEthaS1IZW5n
IEZlbmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4KPgoKVGhhbmtzIQoKPiBJIHRvb2sg
dGhpcyBtb3JlIG9yIGxlc3MgZnV0dXJlIHByb29mIGFwcHJvYWNoIGJlY2F1c2UgSSB0aGluayB0
aGlzIHdvbuKAmXQKPiBiZSB0aGUgbGFzdCBjaGlwIHRoYXQgbmVlZHMgZmlybXdhcmUgaW5mb3Jt
YXRpb24sIHdoaWNoIGlzbuKAmXQgYXZhaWxhYmxlIGluCj4gZWFybHkgaW5pdCwgdG8gZGVjaWRl
cyBpdHMgZmxhZ3MuCj4KPiBZZXMgaXTigJlzIGludHJ1c2l2ZSB0byBjYXJ2ZSBvdXQgYWxsIGZs
YWdzIGZyb20gZWFybHkgaW5pdCBjYWxsYmFja3MsIGJ1dCBJCj4gZG9u4oCZdCB0aGluayBpdOKA
mXMgdGhhdCB1Z2x5LgoKTm90IGEgYmFkIGFwcHJvYWNoLCBidXQgSSdkIHByZWZlciB0byBrZWVw
IHRoZSBwb3dlciBhbmQgY2xvY2sgZ2F0aW5nCmZsYWdzIGluIHRoZSBhc2ljIHNwZWNpZmMgY29k
ZSByYXRoZXIgdGhhbiBpbiB0aGUgY29tbW9uIGNvZGUuCgpBbGV4Cl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
