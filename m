Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD35E326CED
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 12:55:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5F66E4AD;
	Sat, 27 Feb 2021 11:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964366E4AB
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 11:19:42 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id m11so12744531lji.10
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 03:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/d5QFUwffS7DjVuIPYL6LkLQZXdrK9GI/3+UWs6cvL4=;
 b=YS42gCZLxNrQOhzB1b5gSk2CnLNxGXwPJGTpnnOEcfVxpdzDysCckGbqra+oX1ory6
 DJVGo0MfF2rljHCdVfD/x40M8Aw0I5B3ejIt9nJN1q0o+bNqbnXE9kb696cUcIHIOpro
 kkVCLC5tA/hA0w4+WrDWyfxbd1oie5smnB+YebqKBwmyPNrEpAtGVSHE1Fr+lSxxqX6i
 UlznB1i5OC7QzGtjlpM57amSXFcybHe72eyZ1F9oLImnHudz09h4Mf0wspVlDzdtBnzy
 TdJCVus5Wsy9A8fXxdyo2rXHPfaVKd56Vue5QylPDI3SLnmXjZNCrTVEYFuo9FNMAs1T
 8d2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/d5QFUwffS7DjVuIPYL6LkLQZXdrK9GI/3+UWs6cvL4=;
 b=LHS3lqNh8cKZ6Ok7c4L9ly5m8cCAMqdhWB5q9+QM3WNygeOhFFfsCAZWghcSoiFTbW
 Qcx5bDw03SCTzBqsQH65bxCf0eqaMqQybmQKub37idNoaTYk8/QumowhvVoS+YOh4vvj
 j6esrFrM5nM/0TqXKDkj34+JvRacZ8fitO6QteLWK5yFjJQijfD/sNmIu4ONKB9lH20J
 gSvdgJGn6HM5IDgY8F+o05t21Mru9VhKBMhP5vC25lwQ8BXQoKFLktRX9BeI6W/c8gYC
 Nat5FIRWMpwEdF5pVa0giWwgnkJPYoElGUmyvT0Nvthali3EBBWhgkIvG22+xB93FhbY
 cGhA==
X-Gm-Message-State: AOAM532isPK437msKEVNRkpfbL1FXy7qjoHWFSuCiCSsi5eZ7z0gUt+o
 UgWr7tvzd5Uz2rYeUH73fiM=
X-Google-Smtp-Source: ABdhPJxa0JcEKkj91kpfBL/1yGNqTXrO1S6EcUGsfY+uAXnLfNf8kiWck9neSM/TiLgHtR+YFpDxWQ==
X-Received: by 2002:a2e:b534:: with SMTP id z20mr4244137ljm.50.1614424780761; 
 Sat, 27 Feb 2021 03:19:40 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id x25sm1710720lfn.180.2021.02.27.03.19.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Feb 2021 03:19:40 -0800 (PST)
Subject: Re: [PATCH v5 00/21] Host1x sync point UAPI should not be used for
 tracking DRM jobs
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
 <2ee12338-bd5a-4b99-f86d-13da0d2a899b@gmail.com>
 <8504c239-d5df-3033-934c-7b3fab52e387@kapsi.fi> <YBLtPv/1mGXwtibX@ulmo>
 <1ff922b2-161d-c8b9-7b08-4454ff7329f8@gmail.com>
 <25248139-5487-a15b-8965-1a29a71eacd7@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6211ee04-ebd6-74d3-cb5b-955b17acff5b@gmail.com>
Date: Sat, 27 Feb 2021 14:19:39 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <25248139-5487-a15b-8965-1a29a71eacd7@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 27 Feb 2021 11:55:21 +0000
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 Mikko Perttunen <mperttunen@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDMuMDIuMjAyMSAxNDoxOCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+PiBJJ2xs
IG5lZWQgbW9yZSB0aW1lIHRvIHRoaW5rIGFib3V0IGl0Lgo+Pgo+IAo+IEhvdyBhYm91dCBzb21l
dGhpbmcgbGlrZSB0aGlzOgo+IAo+IFR1cm4gdGhlIHN5bmNwdF9pbmNyIGZpZWxkIGJhY2sgaW50
byBhbiBhcnJheSBvZiBzdHJ1Y3RzIGxpa2UKPiAKPiAjZGVmaW5lIERSTV9URUdSQV9TVUJNSVRf
U1lOQ1BUX0lOQ1JfUkVQTEFDRV9TWU5DT0JKwqDCoMKgwqDCoMKgwqAgKDE8PDApCj4gI2RlZmlu
ZSBEUk1fVEVHUkFfU1VCTUlUX1NZTkNQVF9JTkNSX1BBVENIX0RZTkFNSUNfU1lOQ1BUwqDCoMKg
ICgxPDwxKQo+IAo+IHN0cnVjdCBkcm1fdGVncmFfc3VibWl0X3N5bmNwdF9pbmNyIHsKPiDCoMKg
wqDCoC8qIGNhbiBiZSBsZWZ0IGFzIHplcm8gaWYgdXNpbmcgZHluYW1pYyBzeW5jcHQgKi8KPiDC
oMKgwqDCoF9fdTMyIHN5bmNwdF9pZDsKPiDCoMKgwqDCoF9fdTMyIGZsYWdzOwo+IAo+IMKgwqDC
oMKgc3RydWN0IHsKPiDCoMKgwqDCoMKgwqDCoCBfX3UzMiBzeW5jb2JqOwo+IMKgwqDCoMKgwqDC
oMKgIF9fdTMyIHZhbHVlOwo+IMKgwqDCoMKgfSBmZW5jZTsKPiAKPiDCoMKgwqDCoC8qIHBhdGNo
IHdvcmQgYXMgc3VjaDoKPiDCoMKgwqDCoMKgwqDCoMKgICogKndvcmQgPSAqd29yZCB8IChzeW5j
cHRfaWQgPDwgc2hpZnQpCj4gwqDCoMKgwqDCoMKgwqDCoCAqLwo+IMKgwqDCoMKgc3RydWN0IHsK
PiDCoMKgwqDCoMKgwqDCoCBfX3UzMiBnYXRoZXJfb2Zmc2V0X3dvcmRzOwo+IMKgwqDCoMKgwqDC
oMKgIF9fdTMyIHNoaWZ0Owo+IMKgwqDCoMKgfSBwYXRjaDsKPiB9Owo+IAo+IFNvIHRoaXMgd2ls
bCB3b3JrIHNpbWlsYXJseSB0byB0aGUgYnVmZmVyIHJlbG9jIHN5c3RlbTsgdGhlIGtlcm5lbAo+
IGRyaXZlciB3aWxsIGFsbG9jYXRlIGEgam9iIHN5bmNwb2ludCBhbmQgcGF0Y2ggaW4gdGhlIHN5
bmNwb2ludCBJRCBpZgo+IHJlcXVlc3RlZCwgYW5kIGFsbG93cyBvdXRwdXR0aW5nIHN5bmNvYmpz
IGZvciBlYWNoIGluY3JlbWVudC4KCkkgaGF2ZW4ndCBnb3QgYW55IGdyZWF0IGlkZWFzIHNvIGZh
ciwgYnV0IGl0IGZlZWxzIHRoYXQgd2lsbCBiZSBlYXNpZXIKYW5kIGNsZWFuZXIgaWYgd2UgY291
bGQgaGF2ZSBzZXBhcmF0ZSBqb2IgcGF0aHMgKGFuZCBqb2IgSU9DVExTKSBiYXNlZApvbiBoYXJk
d2FyZSBnZW5lcmF0aW9uIHNpbmNlIHRoZSB3b3JrbG9hZHMgYSB0b28gZGlmZmVyZW50LiBUaGUg
bmVlZHMgb2YKYSBuZXdlciBoL3cgYXJlIHRvbyBvYnNjdXJlIGZvciBtZSBhbmQgYWJzZW5jZSBv
ZiB1c2Vyc3BhY2UgY29kZSwKZmlybXdhcmUgc291cmNlcyBhbmQgZnVsbCBoL3cgZG9jdW1lbnRh
dGlvbiBkbyBub3QgaGVscC4KClRoZXJlIHN0aWxsIHNob3VsZCBiZSBxdWl0ZSBhIGxvdCB0byBz
aGFyZSwgYnV0IHRoaW5ncyBsaWtlCm1hcHBpbmctdG8tY2hhbm5lbCBhbmQgVk0gc3luYyBwb2lu
dHMgYXJlIHRvbyBmYXIgYXdheSBmcm9tIG9sZGVyIGgvdywKSU1PLiBUaGlzIG1lYW5zIHRoYXQg
Y29kZSBwYXRoIGJlZm9yZSBkcm0tc2NoZWQgYW5kIHBhdGggZm9yIGpvYi10aW1lb3V0CmhhbmRs
aW5nIHNob3VsZCBiZSBzZXBhcmF0ZS4KCk1heWJlIGxhdGVyIG9uIGl0IHdpbGwgYmVjb21lIGNs
ZWFuZXIgdGhhdCB3ZSBhY3R1YWxseSBjb3VsZCB1bmlmeSBpdAphbGwgbmljZWx5LCBidXQgZm9y
IG5vdyBpdCBkb2Vzbid0IGxvb2sgbGlrZSBhIGdvb2QgaWRlYSB0byBtZS4KCk1pa2tvLCBkbyB5
b3UgaGF2ZSBhbnkgb2JqZWN0aW9ucyB0byB0cnlpbmcgb3V0IHZhcmlhbnQgd2l0aCB0aGUKc2Vw
YXJhdGUgcGF0aHM/Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
