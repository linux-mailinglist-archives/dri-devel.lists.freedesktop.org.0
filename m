Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55904209A81
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4C106E422;
	Thu, 25 Jun 2020 07:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF6C6E09F
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 22:33:38 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 9so4354809ljv.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 15:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=KG/mtrHm+0RJMw8Yne2fGydoF9Khahv7CPZC8cAGmJk=;
 b=PQ940pdtwXI16vAQiMnbXtkU3DDWwoh8QOJobJW0fcqFkudVeHYwFgEgyfFy2Y+EBQ
 t2FZUUKyLVBc0ZMfdSOa4GBQaejbvJjyEO/4dm0AUpl6qXk58WpBDYZhScOMBOp0c2mV
 oeaJKk6HmF+rhF3LA+B+jEbQnzAFsgdyaS9rqKzM1bK+3t23ES4yCoy2rMwCrBtm7Nrx
 1cgtjXllfrklEzkFCCdPh9rcZwix1pBZWhQDMQtqrCWK5je9KSTMdbgS0+ngtXoFUP/Y
 yRqkfTvoZHlfs7m1v7dn3j6qmTQRz+vcDOQelkCq262B/cWV5GeDhKpKg6Z1Fqhdbdt6
 8pHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=KG/mtrHm+0RJMw8Yne2fGydoF9Khahv7CPZC8cAGmJk=;
 b=nGfiR5ujkaOaWoB9h/5Pv6zmlK4Q4+YPAP6/GsMZKeYruQqWNHop7vYSwO6mKHyact
 DToAgwz9LLflPRfF18633+2aMQ6BwSBenOAT2FOm4b/rw0SKgWFLXZ2Xbmaki+73BQMP
 x9FMwvJGQmgGTqH7YuxESAIcA9ZBrDi6fLaQAdmS408lrDmTwx3zV8WxJKRs5b8osw/O
 8k+190zQMdDHN5OMf4wrGiu2UvHx1JiAUS53M/axCnJBKaP+hAVrXTWKUigfQU5dT9HH
 ogruydjrZ0974jhDF62ZhG20i/Ldc4x8e7GyVP8isNeBT+ayvYSluXmdfSL/ebvynn+Q
 wkPw==
X-Gm-Message-State: AOAM530CmeFlQ/22npspuMeQmSUg+SUeWuiHTKEN1MAiEhdZgmGGA1mK
 A/XDGDuybyIUK5PW398rl2I=
X-Google-Smtp-Source: ABdhPJwOvQQdr68T7at/qhl/lY1nDcuRmy9lba8xr/rhBX2NEXtzS8DdzNoFTwT892Lv7brlCDQfAA==
X-Received: by 2002:a2e:b541:: with SMTP id a1mr2747460ljn.4.1593038016740;
 Wed, 24 Jun 2020 15:33:36 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id p15sm4470433ljn.53.2020.06.24.15.33.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 15:33:36 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7cc0d47b-024a-263e-3b63-1d1184b462b3@gmail.com>
Date: Thu, 25 Jun 2020 01:33:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:31:01 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjMuMDYuMjAyMCAxNTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gc3RydWN0IGRy
bV90ZWdyYV9zdWJtaXRfcmVsb2NhdGlvbiB7Cj4gwqDCoMKgwqDCoMKgwqAgLyogW2luXSBJbmRl
eCBvZiBHQVRIRVIgb3IgR0FUSEVSX1VQVFIgY29tbWFuZCBpbiBjb21tYW5kcy4gKi8KPiDCoMKg
wqDCoMKgwqDCoCBfX3UzMiBnYXRoZXJfY29tbWFuZF9pbmRleDsKPiAKPiDCoMKgwqDCoMKgwqDC
oCAvKgo+IMKgwqDCoMKgwqDCoMKgwqAgKiBbaW5dIE1hcHBpbmcgaGFuZGxlIChvYnRhaW5lZCB0
aHJvdWdoIENIQU5ORUxfTUFQKSBvZiB0aGUgbWVtb3J5Cj4gwqDCoMKgwqDCoMKgwqDCoCAqwqDC
oCB0aGUgYWRkcmVzcyBvZiB3aGljaCB3aWxsIGJlIHBhdGNoZWQgaW4uCj4gwqDCoMKgwqDCoMKg
wqDCoCAqLwo+IMKgwqDCoMKgwqDCoMKgIF9fdTMyIG1hcHBpbmdfaWQ7Cj4gCj4gwqDCoMKgwqDC
oMKgwqAgLyoKPiDCoMKgwqDCoMKgwqDCoMKgICogW2luXSBPZmZzZXQgaW4gdGhlIGdhdGhlciB0
aGF0IHdpbGwgYmUgcGF0Y2hlZC4KPiDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDCoMKg
wqAgX191NjQgZ2F0aGVyX29mZnNldDsKPiAKPiDCoMKgwqDCoMKgwqDCoCAvKgo+IMKgwqDCoMKg
wqDCoMKgwqAgKiBbaW5dIE9mZnNldCBpbiB0YXJnZXQgYnVmZmVyIHdob3NlIHBhZGRyL0lPVkEg
d2lsbCBiZSB3cml0dGVuCj4gwqDCoMKgwqDCoMKgwqDCoCAqwqDCoCB0byB0aGUgZ2F0aGVyLgo+
IMKgwqDCoMKgwqDCoMKgwqAgKi8KPiDCoMKgwqDCoMKgwqDCoCBfX3U2NCB0YXJnZXRfb2Zmc2V0
Owo+IAo+IMKgwqDCoMKgwqDCoMKgIC8qCj4gwqDCoMKgwqDCoMKgwqDCoCAqIFtpbl0gTnVtYmVy
IG9mIGJpdHMgdGhlIHJlc3VsdGluZyBhZGRyZXNzIHdpbGwgYmUgbG9naWNhbGx5Cj4gwqDCoMKg
wqDCoMKgwqDCoCAqwqDCoCBzaGlmdGVkIHJpZ2h0IGJlZm9yZSB3cml0aW5nIHRvIGdhdGhlci4K
PiDCoMKgwqDCoMKgwqDCoMKgICovCj4gwqDCoMKgwqDCoMKgwqAgX191MzIgc2hpZnQ7Cj4gCj4g
wqDCoMKgwqDCoMKgwqAgX191MzIgcmVzZXJ2ZWRbMV07Cj4gfTsKCldlIHdpbGwgYWxzbyBuZWVk
IHJlYWQvd3JpdGUgZGlyZWN0aW9uIGZsYWcgaGVyZSBmb3IgdGhlCkRNQS1yZXNlcnZhdGlvbnMg
c2V0IHVwLCBpdCB3aWxsIGJlIHVzZWQgZm9yIHRoZSBpbXBsaWNpdCBCTyBmZW5jaW5nIGJ5CnRo
ZSBqb2IncyBzY2hlZHVsZXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
