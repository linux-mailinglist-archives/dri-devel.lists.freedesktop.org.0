Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD08F10303B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9480A6EA2F;
	Tue, 19 Nov 2019 23:29:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924836E3A6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 16:57:25 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id q28so3725724lfp.2
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:57:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=53ruBaQSDnrBitdIBpjgYyR4OHZkTHQbljASTrm8H0Y=;
 b=FuPpTTJkODszodGf9Ql8eD/xKb/COj1Ay7ocogwIKqgdTj1t894nNcRgeBKPWBG51+
 QQBr/Yk0uxclnUpiM/QXiS4KGyiEULhcgZltN1dbj+1BBLtNTEzs3i+FceO++1cS15Sm
 /khQgxPI4I5EWmdSE79Xn7qBkdmyYPBgf6C6HDZ4YmPeDAb1FWOY+Y/72gR1Tqf/GZX6
 moshMLTSC2uAoiiy67Z7lYPW5ukGBMsIZlX2pfBmxS1EmWZ1tOT/8y3xF+3s9F7JP4e1
 YClE2fgn2Pe7NA6XfZhlLlplbc+0H/h+nCWfd2TVysdidrlRGuPsRxnQpv0jooIoNARN
 oHFA==
X-Gm-Message-State: APjAAAWydtlH177ShLQAhPFtK25A0/9E2k62uelzH7kTTjhRAt7L5knK
 xEEfWFKgPhdOOe/njdw4/+w=
X-Google-Smtp-Source: APXvYqzZSiDsbH+MyTiWXSb4FyjNHsOgnrf11qIbaSuRVvsJY1pHPQguNgqovNvA+wS/faGG3COv+Q==
X-Received: by 2002:a19:a410:: with SMTP id q16mr4958560lfc.184.1574182644074; 
 Tue, 19 Nov 2019 08:57:24 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id d5sm10202535ljc.51.2019.11.19.08.57.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 08:57:23 -0800 (PST)
Subject: Re: [PATCH v1 02/29] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-3-digetx@gmail.com> <20191119062156.GB2462695@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <bbe612b6-fc07-fb7f-0f13-bca2c0864d73@gmail.com>
Date: Tue, 19 Nov 2019 19:57:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119062156.GB2462695@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=53ruBaQSDnrBitdIBpjgYyR4OHZkTHQbljASTrm8H0Y=;
 b=VMPaO7PmUawdArVnpsmpKxbhWrC0NTg3FABfGEHFT3LHle5b5rmM5crPIrtMeRre2K
 g/bNDLnomL5iL5XfGZyxjnMPge3wlA49Dl+Wb7pBh5Yx6anjdujkIRi+4OYfI2RVSEBk
 6w8vwwpOknSkyqZFMAdXBTSrf7lrJYhiQzu3+mxki+8cchWbt5pG6h4SWWA16Q7SKZcx
 DRtUJz9hL7g3BgocQRAtnfG1CBB5Bxx/XBYrDvCfbHwO3YzoR9182tkUoCWYVAsWEKyh
 Z/LHGGC8BC8NHcII+3FslAKkOFd+O0iA10sgJX3iLybWJXKohzW/fta2BFkz98oyPcUF
 5VBA==
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTkuMTEuMjAxOSAwOToyMSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBNb24sIE5v
diAxOCwgMjAxOSBhdCAxMTowMjoyMFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IEV4dGVybmFsIG1lbW9yeSBjb250cm9sbGVyIGlzIGludGVyY29ubmVjdGVkIHdpdGggbWVtb3J5
IGNvbnRyb2xsZXIgYW5kCj4+IHdpdGggZXh0ZXJuYWwgbWVtb3J5LiBEb2N1bWVudCBuZXcgaW50
ZXJjb25uZWN0IHByb3BlcnR5IHdoaWNoIGRlc2lnbmF0ZXMKPj4gZXh0ZXJuYWwgbWVtb3J5IGNv
bnRyb2xsZXIgYXMgaW50ZXJjb25uZWN0IHByb3ZpZGVyLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBE
bWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+PiAgLi4uL2JpbmRpbmdz
L21lbW9yeS1jb250cm9sbGVycy9udmlkaWEsdGVncmEyMC1lbWMudHh0ICAgICAgICB8IDQgKysr
Kwo+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IERvIHdlIHJlYWxseSB3
YW50IHRvIGRlc2NyaWJlIHRoaXMgcGFydGljdWxhciBjb25uZWN0aW9uPyBJdCdzIHByZXR0eQo+
IHN0YXRpYyBhbmQgdGhlIG9ubHkgcmVhbCBjb25uZWN0aW9uIGhlcmUgaXMgdGhlIEVNQyBmcmVx
dWVuY3ksIHNvIHRoZQo+IHdob2xlIGludGVyY29ubmVjdCBpbmZyYXN0cnVjdHVyZSBzZWVtcyBh
IGJpdCBvdmVya2lsbC4KPiAKPiBTb3VuZHMgdG8gbWUgbGlrZSB3ZSBjb3VsZCBwaWdneWJhY2sg
b24gdG9wIG9mIHRoZSBleGlzdGluZwo+IG52aWRpYSxtZW1vcnktY29udHJvbGxlciBwcm9wZXJ0
eSBvZiB0aGUgRU1DIHRvIG1ha2UgdGhlIGNvbm5lY3Rpb24uCgpVbHRpbWF0ZWx5IGVhY2ggbWVt
b3J5IGNsaWVudCB0YWxrcyB0byBFTUVNIHRocm91Z2ggTUMgYW5kIEVNQywgYWx0aG91Z2gKaXQg
c2hvdWxkIGJlIG9rYXkgdG8gaWdub3JlIHRoZSBFTUVNIGZyb20gYSBkcml2ZXIncyAvIHNvZnR3
YXJlIHBlcnNwZWN0aXZlLgoKW3NuaXBdCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
