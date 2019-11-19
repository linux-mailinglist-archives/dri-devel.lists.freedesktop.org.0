Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8C8103032
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0220B6EA0D;
	Tue, 19 Nov 2019 23:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F19E6E9D1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 16:57:53 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id a17so1532962lfi.13
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:57:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j+gYl8HldvGbyx97hnAX9xUoG7AkMiMS7oU+UeQIp7E=;
 b=sBBhNLR/dnBc1/PCLGavXH9osf/+ijWFJxnZplkG+I1Zm+aU0Ke5YoKukUObWLOH6i
 qnOYQ1H7EZY8IIYZPQ8JaOw1MZWa4myi1/KW1jnqlWQHKeu5R7zzaBg5zGfF/WDwrBkt
 TGd6O4VCaWi7O4vG/Oc4AfUCXoe5kuTZ178TPTZ1EdHCT5UEcbehZO3QdUY2pC7ALwaq
 IJy9pxDqp7yaaixpi127pd6QxjWUmSRf0SyAS5j1Uiaaq2wY0juMoour6BOmO8ZANjzs
 aJPAB8Eu6rnXxOz6aT10o+4p9KblfhWK0s5sQFDdqDoHq2+DwsOrRTAW596YgdphCYLO
 qXzg==
X-Gm-Message-State: APjAAAXX9n+d8ySVBhSucHcBzGELw343xnAQF80Bw2B9yPvxuTM03UUR
 jwl4c5neGqiLsXl0awvprnA=
X-Google-Smtp-Source: APXvYqz8vet4QWY5IUi4C6ihSYs+/14tbC3f6wpa0eTLtn7PYqBbI69ydT5j/A2C2hRcVFQx+8A1eQ==
X-Received: by 2002:ac2:44d4:: with SMTP id d20mr4812970lfm.88.1574182671483; 
 Tue, 19 Nov 2019 08:57:51 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id 3sm10781212lfq.55.2019.11.19.08.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 08:57:51 -0800 (PST)
Subject: Re: [PATCH v1 23/29] memory: tegra124-emc: Register as interconnect
 provider
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-24-digetx@gmail.com>
Message-ID: <4ad5dca2-12c9-8e96-c68c-0dcdb9860fd9@gmail.com>
Date: Tue, 19 Nov 2019 19:57:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191118200247.3567-24-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j+gYl8HldvGbyx97hnAX9xUoG7AkMiMS7oU+UeQIp7E=;
 b=CuLivwxbWs7Wcoly7djIIVs9XgobzAL92vYSDeyg8DXLNM9dqJ87GCy2z05epyY/eH
 k2bniNhos/o7H5rA/XSVuuk7+EmuPuUdUcl7yDpq+goMg3V4cw/kD4sjKcvfqiElIo8j
 SvpUlWocaA52Oa+7Dw0HHiq6SM+UXZmx4VLf0zqE45psgcevhHkOWm49io2COxxv7dAR
 +FNtQfbJj+E6WU+zgrMbvYmmoaB5Qiopf4PEFT6BjQGTc/xDXp1br0Lk8o8uLoo+F4RD
 RZ4JrOOy6YuNJm1HxeO65M8ezAMXMYywgX8F5iEKh07EKN1Bilh1PWDsh8WdnzP5itd0
 R7XQ==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTguMTEuMjAxOSAyMzowMiwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gRU1DIG5vdyBw
cm92aWRlcyBNQyB3aXRoIG1lbW9yeSBiYW5kd2lkdGggdXNpbmcgaW50ZXJjb25uZWN0IEFQSS4K
PiAKPiBTaWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4g
LS0tCj4gIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMTI0LWVtYy5jIHwgMjQgKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMTI0LWVtYy5jIGIvZHJpdmVy
cy9tZW1vcnkvdGVncmEvdGVncmExMjQtZW1jLmMKPiBpbmRleCAyYzczMjYwNjU0YmEuLmM5NDc4
ZGNiZWVjZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTEyNC1lbWMu
Ywo+ICsrKyBiL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMTI0LWVtYy5jCj4gQEAgLTI1LDYg
KzI1LDcgQEAKPiAgI2RlZmluZSBFTUNfRkJJT19DRkc1CQkJCTB4MTA0Cj4gICNkZWZpbmUJRU1D
X0ZCSU9fQ0ZHNV9EUkFNX1RZUEVfTUFTSwkJMHgzCj4gICNkZWZpbmUJRU1DX0ZCSU9fQ0ZHNV9E
UkFNX1RZUEVfU0hJRlQJCTAKPiArI2RlZmluZSBFTUNfRkJJT19DRkc1X0RSQU1fV0lEVEhfWDY0
CQlCSVQoNCkKPiAgCj4gICNkZWZpbmUgRU1DX0lOVFNUQVRVUwkJCQkweDAKPiAgI2RlZmluZSBF
TUNfSU5UU1RBVFVTX0NMS0NIQU5HRV9DT01QTEVURQlCSVQoNCkKPiBAQCAtMTA4MCwxMSArMTA4
MSwyOCBAQCBzdGF0aWMgdm9pZCBlbWNfZGVidWdmc19pbml0KHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IHRlZ3JhX2VtYyAqZW1jKQo+ICAJCWRldl9lcnIoZGV2LCAiZmFpbGVkIHRvIGNyZWF0
ZSBkZWJ1Z2ZzIGVudHJ5XG4iKTsKPiAgfQo+ICAKPiArc3RhdGljIHVuc2lnbmVkIGludCBlbWNf
ZHJhbV9kYXRhX2J1c193aWR0aF9ieXRlcyhzdHJ1Y3QgdGVncmFfZW1jICplbWMpCj4gK3sKPiAr
CXVuc2lnbmVkIGludCBidXNfd2lkdGg7Cj4gKwl1MzIgZW1jX2NmZzsKPiArCj4gKwllbWNfY2Zn
ID0gcmVhZGxfcmVsYXhlZChlbWMtPnJlZ3MgKyBFTUNfRkJJT19DRkc1KTsKPiArCWlmIChlbWNf
Y2ZnICYgRU1DX0ZCSU9fQ0ZHNV9EUkFNX1dJRFRIX1g2NCkKPiArCQlidXNfd2lkdGggPSA2NDsK
PiArCWVsc2UKPiArCQlidXNfd2lkdGggPSAzMjsKCkxvb2tzIGxpa2UgSSBnb3QgYSBiaXQgY29u
ZnVzZWQgd2hpbGUgd2FzIGxvb2tpbmcgYXQgVFJNcyBiZWZvcmUsIHNlZW1zCnRoaXMgd2lkdGgg
aXMgdW5yZWxhdGVkIHRvIHRoZSBFTUMgY2hhbm5lbCBhdCBhbGwuIEknbGwgdHJ5IHRvIHJldmlz
aXQKdGhpcyBhZ2Fpbi4KCj4gKwlkZXZfaW5mbyhlbWMtPmRldiwgIkRSQU0gZGF0YS1idXMgd2lk
dGg6ICV1Yml0XG4iLCBidXNfd2lkdGgpOwo+ICsKPiArCXJldHVybiBidXNfd2lkdGggLyA4Owo+
ICt9Cj4gKwo+ICBzdGF0aWMgaW50IHRlZ3JhX2VtY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+ICB7Cj4gIAlzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICptYzsKPiAgCXN0cnVj
dCBkZXZpY2Vfbm9kZSAqbnA7Cj4gIAlzdHJ1Y3QgdGVncmFfZW1jICplbWM7Cj4gKwl1bnNpZ25l
ZCBpbnQgYnVzX3dpZHRoOwo+ICAJdTMyIHJhbV9jb2RlOwo+ICAJaW50IGVycjsKPiAgCj4gQEAg
LTExNDYsNiArMTE2NCwxMiBAQCBzdGF0aWMgaW50IHRlZ3JhX2VtY19wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQo+ICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX0RFQlVHX0ZTKSkK
PiAgCQllbWNfZGVidWdmc19pbml0KCZwZGV2LT5kZXYsIGVtYyk7Cj4gIAo+ICsJYnVzX3dpZHRo
ID0gZW1jX2RyYW1fZGF0YV9idXNfd2lkdGhfYnl0ZXMoZW1jKTsKPiArCj4gKwllcnIgPSB0ZWdy
YV9pY2NfZW1jX3NldHVwX2ludGVyY29ubmVjdCgmcGRldi0+ZGV2LCBidXNfd2lkdGgpOwo+ICsJ
aWYgKGVycikKPiArCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gaW5pdGlhbGl6ZSBJ
Q0M6ICVkXG4iLCBlcnIpOwo+ICsKPiAgCXJldHVybiAwOwo+ICB9Owo+ICAKPiAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
