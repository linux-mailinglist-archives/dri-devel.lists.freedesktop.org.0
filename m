Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EC5265C2B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37F896E393;
	Fri, 11 Sep 2020 09:07:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBF66E393
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Sep 2020 09:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=14W5Ud7nOZEUj6jje/j81qaDf7zDwsYZWUKd48Ow0A4=; b=HXFC7QNPFIUxw0fkHnEql3q3O8
 YwIQ4XtwSwDSkicGFFYH2Vk3+uD7ZzuZJWAA8uE8Rax9HqkbkkMw8sJ4L0B+jMyQtSZb4zepSyahP
 ZtzSOqLGNvWRZ/Bab1f497zQul1YZnc3NoqPyLjCGtrhIG+lkuLMZIexqzSIMj55HMWvcSBmim/nr
 jEgae7zWDbHIw+ogVZnwjMgCkUap/cuJa+VqqGTU5I3lP6RfowZ2Lv8r/DePaK2HAS233Z5e/5nSC
 dHNXnlCLcWz/RUhx8BaYClnxwZace5A4DKXAYJOpw7eNiofeGkOKQhWGl8J84pgmdWe+KMKhPDBtG
 +Gu+aBmA==;
Received: from dsl-hkibng22-54faab-65.dhcp.inet.fi ([84.250.171.65]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kGf1j-00049b-Qt; Fri, 11 Sep 2020 12:07:27 +0300
Subject: Re: [RFC PATCH v2 09/17] gpu: host1x: DMA fences and userspace fence
 creation
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-10-mperttunen@nvidia.com>
 <ceaa95f3-51a1-3fc6-2466-053e21506d6d@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <a820c4dc-c433-559a-bf1f-1cdc0e27949a@kapsi.fi>
Date: Fri, 11 Sep 2020 12:07:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ceaa95f3-51a1-3fc6-2466-053e21506d6d@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xMS8yMCAxOjAwIEFNLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4gMDUuMDkuMjAyMCAx
MzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gLi4uCj4+ICAgCj4+ICtzdGF0aWMg
dm9pZCBhY3Rpb25fc2lnbmFsX2ZlbmNlKHN0cnVjdCBob3N0MXhfd2FpdGxpc3QgKndhaXRlcikK
Pj4gK3sKPj4gKwlzdHJ1Y3QgaG9zdDF4X3N5bmNwdF9mZW5jZSAqZiA9IHdhaXRlci0+ZGF0YTsK
Pj4gKwo+PiArCWhvc3QxeF9mZW5jZV9zaWduYWwoZik7Cj4+ICt9Cj4+ICsKPj4gICB0eXBlZGVm
IHZvaWQgKCphY3Rpb25faGFuZGxlcikoc3RydWN0IGhvc3QxeF93YWl0bGlzdCAqd2FpdGVyKTsK
Pj4gICAKPj4gICBzdGF0aWMgY29uc3QgYWN0aW9uX2hhbmRsZXIgYWN0aW9uX2hhbmRsZXJzW0hP
U1QxWF9JTlRSX0FDVElPTl9DT1VOVF0gPSB7Cj4+ICAgCWFjdGlvbl9zdWJtaXRfY29tcGxldGUs
Cj4+ICAgCWFjdGlvbl93YWtldXAsCj4+ICAgCWFjdGlvbl93YWtldXBfaW50ZXJydXB0aWJsZSwK
Pj4gKwlhY3Rpb25fc2lnbmFsX2ZlbmNlLAo+PiAgIH07Cj4gCj4gTXkgZXhwZWN0YXRpb24gaXMg
dGhhdCB3ZSBzaG91bGQgcmVtb3ZlIHRoZSBob3N0MXgtd2FpdGVyIGVudGlyZWx5LiBJdAo+IGNv
bWVzIGZyb20gMjAxMS8yMDEyIGVyYSBvZiB0aGUgaG9zdDF4IGRyaXZlciBhbmQgbm93IGR1cGxp
Y2F0ZXMKPiBmdW5jdGlvbmFsaXR5IHByb3ZpZGVkIGJ5IHRoZSBkbWEtZmVuY2UgYW5kIGRybS1z
Y2hlZHVsZXIuIFBlcmhhcHMgaXQKPiBjb3VsZCBiZSBva2F5IHRvIHJlLXVzZSBleGlzdGluZyBj
b2RlIGZvciB0aGUgc3RhcnRlciwgYnV0IHRoaXMgaXMKPiBzb21ldGhpbmcgdG8ga2VlcCBpbiBt
aW5kIHRoYXQgaXQgbWF5IGJlIGJldHRlciBub3QgdG8gcHV0IG11Y2ggZWZmb3J0Cj4gaW50byB0
aGUgb2xkZXIgY29kZS4KPiAKCkFncmVlZCwgaXQgc2hvdWxkIGJlIGNsZWFuZWQgdXAgYW5kIHBy
b2JhYmx5IHJlcGxhY2VkLiBJIG1hZGUgb25seSAKbWluaW1hbCBjaGFuZ2VzIGhlcmUgdG8gZ2V0
IGFsbCBteSB0ZXN0cyB3b3JraW5nLCBhcyBJIGRpZG4ndCB3YW50IHRvIGRvIAphIGZ1bGwgcmVm
YWN0b3JpbmcgaW4gdGhpcyBwYXRjaCBzZXJpZXMuCgpNaWtrbwpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
