Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53921209A82
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 09:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683CE6E41D;
	Thu, 25 Jun 2020 07:31:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFF0E6E8EC
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 00:59:30 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d21so2270918lfb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 17:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=U7REP6InW27QF4cjlx544bdQ5rpHtibNJad6s2Fb/qE=;
 b=pJ+GwEm/hITNli8ltpxBHuXzyRogeXvrqAquU8W4QgksanJOmjkeR/2atFJmeJOo/3
 75g45pnn4qQhwCLDdKweqQnvCYqMq7O1swLT2MGWp3JQXRLgu+fTO4D4GJLQ6q9zaZyI
 ugyXjAw44uUYlWcGNQzhJK2Y6kiixs/kSyfO3KAa/zAuhIsmp2+hCGKwO96zS1WmydLY
 KaZJEux+f0t05I9rANLAQffoEJj6JZ6BnAbJuMizRRAJfOvxgiSknR+aW1JqLCJtp832
 hk2sMvwPlshn7h0TXm1VpKs+zboQvesTpjroBqkFqJzys5LXme5We7FmLpwclsvYex7b
 zbUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U7REP6InW27QF4cjlx544bdQ5rpHtibNJad6s2Fb/qE=;
 b=sLmaIJQdlWH8WOGxgeI5o0ckfFzo2cdx6/yih/q0baQrUs/4tXPxLAJC4iUcCpPnK4
 S45SapS9WaxJ4nBCUHqGrRQyWD/zltjZY9p7u0wmzgNWRDK1kv770Z7sCzX0XqVzNoKE
 72RyC/1/e1mT2CecXnN6olDhGXGNCpkizzK5hOYfc2QOW+EH2ApwsZ1n06oFNS+vt6Gn
 zPy2UftPUjIYiCpAFjWgHsQkAhTg5hopFTUpX4fPFt7qGN6ktjTOIypfux1sl082qr5a
 mZ7TfWR+oj/4JrO0/c6yLi8IjJWg51wjINFkRqQPakhjkHss5nD10czuRO3cbBMDS9kk
 yG4g==
X-Gm-Message-State: AOAM531DWA/M2z3fcq4B/+a6cZWYGfDsKOtaMgRszjQl+bSRkxu6oquW
 +h1Cp3m2oY75VVyEqiEv4Y8=
X-Google-Smtp-Source: ABdhPJxQAKxPQtHZm5CnlnMHT9rf3jpNUguoZXXmSvnsJ7hBBKy9RMSBU9a7A9koZAX7TxQO4Ch8dw==
X-Received: by 2002:ac2:44cd:: with SMTP id d13mr16536048lfm.13.1593046769359; 
 Wed, 24 Jun 2020 17:59:29 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id j19sm1773411ljg.28.2020.06.24.17.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jun 2020 17:59:28 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI
From: Dmitry Osipenko <digetx@gmail.com>
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <f85f3fa0-ba18-ddd5-2bac-158dfed9b792@gmail.com>
Message-ID: <c695bb1a-28d3-963f-868c-483005e3dd1d@gmail.com>
Date: Thu, 25 Jun 2020 03:59:27 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <f85f3fa0-ba18-ddd5-2bac-158dfed9b792@gmail.com>
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

MjUuMDYuMjAyMCAwMjoxOCwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Cj4gMjMuMDYuMjAy
MCAxNTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+IHN0cnVjdCBkcm1fdGVncmFf
Y2hhbm5lbF9zdWJtaXQgewo+PiDCoMKgwqDCoMKgwqDCoCBfX3UzMiBjaGFubmVsX2lkOwo+PiDC
oMKgwqDCoMKgwqDCoCBfX3UzMiBmbGFnczsKPj4KPj4gwqDCoMKgwqDCoMKgwqAgLyoqCj4+IMKg
wqDCoMKgwqDCoMKgwqAgKiBbaW5dIFRpbWVvdXQgaW4gbWljcm9zZWNvbmRzIGFmdGVyIHdoaWNo
IHRoZSBrZXJuZWwgbWF5Cj4+IMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAgY29uc2lkZXIgdGhlIGpv
YiB0byBoYXZlIGh1bmcgYW5kIG1heSByZWFwIGl0IGFuZAo+PiDCoMKgwqDCoMKgwqDCoMKgICrC
oMKgIGZhc3QtZm9yd2FyZCBpdHMgc3luY3BvaW50IGluY3JlbWVudHMuCj4+IMKgwqDCoMKgwqDC
oMKgwqAgKgo+PiDCoMKgwqDCoMKgwqDCoMKgICrCoMKgIFRoZSB2YWx1ZSBtYXkgYmUgY2FwcGVk
IGJ5IHRoZSBrZXJuZWwuCj4+IMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gwqDCoMKgwqDCoMKgwqAg
X191MzIgdGltZW91dDsKPj4KPj4gwqDCoMKgwqDCoMKgwqAgX191MzIgbnVtX3N5bmNwdF9pbmNy
czsKPj4gwqDCoMKgwqDCoMKgwqAgX191MzIgbnVtX3JlbG9jYXRpb25zOwo+PiDCoMKgwqDCoMKg
wqDCoCBfX3UzMiBudW1fY29tbWFuZHM7Cj4+Cj4+IMKgwqDCoMKgwqDCoMKgIF9fdTY0IHN5bmNw
dF9pbmNyczsKPj4gwqDCoMKgwqDCoMKgwqAgX191NjQgcmVsb2NhdGlvbnM7Cj4+IMKgwqDCoMKg
wqDCoMKgIF9fdTY0IGNvbW1hbmRzOwo+IAo+IERvIHdlIHJlYWxseSBuZWVkIHRvIHJldGFpbiB0
aGUgbXVsdGktZ2F0aGVyIHN1cHBvcnQ/IFRoZSBjb2RlLWJsb2F0Cj4gKGJvdGggdXNlcnNwYWNl
IGFuZCBrZXJuZWwgZHJpdmVyKSBpcyB2ZXJ5IHNpZ25pZmljYW50IGp1c3QgZm9yCj4gcHJlcGFy
aW5nIGFuZCBwYXRjaGluZyBvZiB0aGUgbXVsdGktYnVmZmVyIGNtZHN0cmVhbXMuCj4gCj4gSWYg
dXNlcnNwYWNlIHJ1bnMgb3V0IG9mIGEgZnJlZSBzcGFjZSB3aXRoaW4gdGhlIHB1c2hidWZmZXIs
IHRoZW4gaXQKPiBzaG91bGQgc2ltcGx5IHJlYWxsb2NhdGUgYSBsYXJnZXIgcHVzaGJ1ZmZlci4K
PiAKPiBJJ20gc3VnZ2VzdGluZyB0aGF0IHdlIHNob3VsZCBoYXZlIGEgc2luZ2xlIGdhdGhlciBw
ZXItam9iLCBhbnkgb2JqZWN0aW9ucz8KPiAKCk9oLCBJIGp1c3QgcmVjYWxsZWQgdGhhdCB0aGUg
bGF0ZXIgSG9zdDF4IHZlcnNpb25zIGRvIG5vdCBhbGxvdyAgdG8Kc3dpdGNoIGNsYXNzIGZyb20g
Z2F0aGVyISBMZXQgbWUgdGhpbmsgYSBiaXQgbW9yZSBhYm91dCBpdC4uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
