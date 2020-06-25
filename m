Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A72209BCF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 11:19:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646506E086;
	Thu, 25 Jun 2020 09:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD20B6E086
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 09:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qsQfkjUFuOZncerGUaB449FVVQUwgpoaY2kW/2W54j8=; b=xHPUZCcUYDVvT9NbqiVB5TRSUP
 psFQuL/KoMRzEt+NJiFlDXxEd9TJ+l2Ot+1NiPoR9zOiHjMbWraxnS2zzzkPRb6aaBmYbiPwJ3bNi
 3GvRPYBZ/+cTFoADEjRqJ3ZvfTXG/YoKJHh0WEMEEPRoyWbNLQCAk0r1XZTlMu60AodSqaRqzEAvy
 p+rm7gR8rRy5pXfdypvXeOL4w6YKQBTdr5/mIZUzAMFNNlDluTH1QV3nDWEBZVGcTlDiTqAwx47Z/
 BvoqBncN6kBgoHvNmdLA1bUwZp7e1LHKvTT4ozvDRk2hK7To5ZwcvIFXPALvHI5HVIkfHI2XNOqMN
 h1NJUWyw==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1joO2q-0001XD-3i; Thu, 25 Jun 2020 12:19:44 +0300
Subject: Re: [RFC] Host1x/TegraDRM UAPI
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <3703cf87-457a-0e71-7693-5644735e438a@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <07886895-225b-6156-9217-e40cd611ccf3@kapsi.fi>
Date: Thu, 25 Jun 2020 12:19:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3703cf87-457a-0e71-7693-5644735e438a@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.250.171.65
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yNS8yMCAyOjIzIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMjMuMDYuMjAyMCAx
NTowOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4+Cj4+IHN0cnVjdCBkcm1fdGVncmFf
Y2hhbm5lbF9zdWJtaXQgewo+PiAgwqDCoMKgwqDCoMKgwqAgX191MzIgY2hhbm5lbF9pZDsKPj4g
IMKgwqDCoMKgwqDCoMKgIF9fdTMyIGZsYWdzOwo+Pgo+PiAgwqDCoMKgwqDCoMKgwqAgLyoqCj4+
ICDCoMKgwqDCoMKgwqDCoMKgICogW2luXSBUaW1lb3V0IGluIG1pY3Jvc2Vjb25kcyBhZnRlciB3
aGljaCB0aGUga2VybmVsIG1heQo+PiAgwqDCoMKgwqDCoMKgwqDCoCAqwqDCoCBjb25zaWRlciB0
aGUgam9iIHRvIGhhdmUgaHVuZyBhbmQgbWF5IHJlYXAgaXQgYW5kCj4+ICDCoMKgwqDCoMKgwqDC
oMKgICrCoMKgIGZhc3QtZm9yd2FyZCBpdHMgc3luY3BvaW50IGluY3JlbWVudHMuCj4+ICDCoMKg
wqDCoMKgwqDCoMKgICoKPj4gIMKgwqDCoMKgwqDCoMKgwqAgKsKgwqAgVGhlIHZhbHVlIG1heSBi
ZSBjYXBwZWQgYnkgdGhlIGtlcm5lbC4KPj4gIMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4gIMKgwqDC
oMKgwqDCoMKgIF9fdTMyIHRpbWVvdXQ7Cj4gCj4gV2hhdCBhYm91dCB0byByZW5hbWUgdGhpcyB0
byB0aW1lb3V0X3VzPyBGb3IgY2xhcml0eS4KPiAKPj4gIMKgwqDCoMKgwqDCoMKgIF9fdTMyIG51
bV9zeW5jcHRfaW5jcnM7Cj4+ICDCoMKgwqDCoMKgwqDCoCBfX3UzMiBudW1fcmVsb2NhdGlvbnM7
Cj4+ICDCoMKgwqDCoMKgwqDCoCBfX3UzMiBudW1fY29tbWFuZHM7Cj4+Cj4+ICDCoMKgwqDCoMKg
wqDCoCBfX3U2NCBzeW5jcHRfaW5jcnM7Cj4+ICDCoMKgwqDCoMKgwqDCoCBfX3U2NCByZWxvY2F0
aW9uczsKPj4gIMKgwqDCoMKgwqDCoMKgIF9fdTY0IGNvbW1hbmRzOwo+IAo+IExldCdzIGFsc28g
YWRkICJfcHRyIiBwb3N0Zml4IHRvIGFsbCB1c3JwdHIgbmFtZXMsIGFnYWluIGZvciBjbGFyaXR5
Lgo+IAo+IEl0J3MgYWx3YXlzIG5pY2UgdG8gaGF2ZSBtZWFuaW5nZnVsIG5hbWVzIDopCj4gCgpZ
ZXAsIGdvb2QgcG9pbnQuIEknbGwgZml4IHRoaXMgZm9yIG5leHQgcmV2aXNpb24gOikKCk1pa2tv
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
