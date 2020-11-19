Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E08762B9C11
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059E66E828;
	Thu, 19 Nov 2020 20:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF6AE6E507
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 12:07:21 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id o24so5955297ljj.6
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 04:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=XNcQDlSky0473W8VySzMpMuIce1nRSFbAcunyERFzjM=;
 b=BJV/VSOQ3xMoNz/C2XTRHFXlHvh/qldIAfJK0NVTpgWQbjLLMN3qwJLa2d5V7QpmeF
 5q+7sBV/Ru5M+wEFbjLtafbEPwB4yIlLzfdirPbrQbqzbEXX8qcEcTZBtsmoH5LE8PV+
 JE/FsB+p4FKIxKi1rY3paYHIRf5357+xtYzVLZiEexJoyYiZOaC2WdeilQSq4ct5htsm
 IZGBRkwQc8qdtNCOnQuMJCtme/2FwPuKnZ2rUf1sjt/i4UTgH+uGXiGyNS4b+gFYQ6UD
 2cY7FFYkkl8CfmCFjKvKwWtH3Wa/FgxZg/ewFq/F8uhly93waz6nvPcvGwEejLv+Ly2g
 taVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XNcQDlSky0473W8VySzMpMuIce1nRSFbAcunyERFzjM=;
 b=SppP68DLXao1O6Od6LH3QOdAu4xaarOhjL6CR86tLw8Dttc5SyphOu4uQdkudWnMui
 S9IKpx58fVObWG6kyrzzV1E/3gzhvtQFpNSjIbHs5IMctrxYx4fADkV6hIXOe0N8J66L
 9G4AXxn90Ot7wDawYbAJkZ8617jpDvj4kSisax2d8o0xXtQPTdV4e64VaE1gpoZo36dT
 z8lO10oS3CXjt1KEyVa6T5IpwSe92jVb2iL0EF/ciXb2Xa9q1hawS6xYcPm3hKY8Z+B4
 G+M8ZmJjCq46r1JSAPcscGvx+shG2HQXJCLEouSWwxXAJZfYk40sgEJ4Q8wryTrFuZzc
 nysQ==
X-Gm-Message-State: AOAM531r8ldax+y0AXWjBnutJICA/fM7oNCWT8pjqT16cg3MaPfTacbe
 sPSXDr+xWzue7vIVBq4VxsT42sXqiOA=
X-Google-Smtp-Source: ABdhPJzTGHmquQc4BHfAODo4wPFuYfs6q8K9WgflUR9F3k6wl2Eq2xQD6S3z58PAyprBfztKp9Ogcg==
X-Received: by 2002:a2e:9083:: with SMTP id l3mr5729986ljg.118.1605787639748; 
 Thu, 19 Nov 2020 04:07:19 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id e15sm3960412lfn.292.2020.11.19.04.07.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 04:07:18 -0800 (PST)
Subject: Re: [PATCH v9 01/17] memory: tegra30: Support interconnect framework
To: Georgi Djakov <georgi.djakov@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20201115212922.4390-1-digetx@gmail.com>
 <20201115212922.4390-2-digetx@gmail.com>
 <61e777d9-b730-02c6-cedf-cf0aa1a50fb8@linaro.org>
 <7e484678-43cc-e612-1017-73ed580f9840@gmail.com>
 <83a3f33b-3695-2a40-1c2b-5c38d117c1ad@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2c186e6a-444c-c2b9-56fc-1d519ecd4e20@gmail.com>
Date: Thu, 19 Nov 2020 15:07:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <83a3f33b-3695-2a40-1c2b-5c38d117c1ad@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTguMTEuMjAyMCAxODozMCwgR2VvcmdpIERqYWtvdiDQv9C40YjQtdGCOgo+IE9uIDE4LjExLjIw
IDA6MDIsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMTcuMTEuMjAyMCAyMzoyNCwgR2Vvcmdp
IERqYWtvdiDQv9C40YjQtdGCOgo+Pj4gSGkgRG1pdHJ5LAo+Pj4KPj4+IFRoYW5rIHlvdSB3b3Jr
aW5nIG9uIHRoaXMhCj4+Pgo+Pj4gT24gMTUuMTEuMjAgMjM6MjksIERtaXRyeSBPc2lwZW5rbyB3
cm90ZToKPj4+PiBOb3cgSW50ZXJuYWwgYW5kIEV4dGVybmFsIG1lbW9yeSBjb250cm9sbGVycyBh
cmUgbWVtb3J5IGludGVyY29ubmVjdGlvbgo+Pj4+IHByb3ZpZGVycy4gVGhpcyBhbGxvd3MgdXMg
dG8gdXNlIGludGVyY29ubmVjdCBBUEkgZm9yIHR1bmluZyBvZiBtZW1vcnkKPj4+PiBjb25maWd1
cmF0aW9uLiBFTUMgZHJpdmVyIG5vdyBzdXBwb3J0cyBPUFBzIGFuZCBEVkZTLiBNQyBkcml2ZXIg
bm93Cj4+Pj4gc3VwcG9ydHMgdHVuaW5nIG9mIG1lbW9yeSBhcmJpdHJhdGlvbiBsYXRlbmN5LCB3
aGljaCBuZWVkcyB0byBiZSBkb25lCj4+Pj4gZm9yIElTTyBtZW1vcnkgY2xpZW50cywgbGlrZSBh
IERpc3BsYXkgY2xpZW50IGZvciBleGFtcGxlLgo+Pj4+Cj4+Pj4gVGVzdGVkLWJ5OiBQZXRlciBH
ZWlzIDxwZ3dpcGVvdXRAZ21haWwuY29tPgo+Pj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lw
ZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4+PiAtLS0KPj4+PiDCoMKgIGRyaXZlcnMvbWVtb3J5
L3RlZ3JhL0tjb25maWfCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+Pj4gwqDCoCBkcml2ZXJzL21l
bW9yeS90ZWdyYS90ZWdyYTMwLWVtYy5jIHwgMzQ5Cj4+Pj4gKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0KPj4+PiDCoMKgIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMzAuY8KgwqDCoMKg
IHwgMTczICsrKysrKysrKysrKystCj4+Pj4gwqDCoCAzIGZpbGVzIGNoYW5nZWQsIDUwMSBpbnNl
cnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4gWy4uXT4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMzAuYwo+Pj4gYi9kcml2ZXJzL21lbW9yeS90ZWdyYS90
ZWdyYTMwLmMKPj4+PiBpbmRleCBkMDMxNGYyOTYwOGQuLmVhODQ5MDAzMDE0YiAxMDA2NDQKPj4+
PiAtLS0gYS9kcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTMwLmMKPj4+PiArKysgYi9kcml2ZXJz
L21lbW9yeS90ZWdyYS90ZWdyYTMwLmMKPj4+IFsuLl0KPj4+PiArCj4+Pj4gK3N0YXRpYyBpbnQg
dGVncmEzMF9tY19pY2Nfc2V0KHN0cnVjdCBpY2Nfbm9kZSAqc3JjLCBzdHJ1Y3QgaWNjX25vZGUK
Pj4+PiAqZHN0KQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgdGVncmFfbWMgKm1jID0gaWNj
X3Byb3ZpZGVyX3RvX3RlZ3JhX21jKHNyYy0+cHJvdmlkZXIpOwo+Pj4+ICvCoMKgwqAgY29uc3Qg
c3RydWN0IHRlZ3JhX21jX2NsaWVudCAqY2xpZW50ID0gJm1jLT5zb2MtPmNsaWVudHNbc3JjLT5p
ZF07Cj4+Pj4gK8KgwqDCoCB1NjQgcGVha19iYW5kd2lkdGggPSBpY2NfdW5pdHNfdG9fYnBzKHNy
Yy0+cGVha19idyk7Cj4+Pj4gKwo+Pj4+ICvCoMKgwqAgLyoKPj4+PiArwqDCoMKgwqAgKiBTa2lw
IHByZS1pbml0aWFsaXphdGlvbiB0aGF0IGlzIGRvbmUgYnkgaWNjX25vZGVfYWRkKCksIHdoaWNo
Cj4+Pj4gc2V0cwo+Pj4+ICvCoMKgwqDCoCAqIGJhbmR3aWR0aCB0byBtYXhpbXVtIGZvciBhbGwg
Y2xpZW50cyBiZWZvcmUgZHJpdmVycyBhcmUgbG9hZGVkLgo+Pj4+ICvCoMKgwqDCoCAqCj4+Pj4g
K8KgwqDCoMKgICogVGhpcyBkb2Vzbid0IG1ha2Ugc2Vuc2UgZm9yIHVzIGJlY2F1c2Ugd2UgZG9u
J3QgaGF2ZSBkcml2ZXJzCj4+Pj4gZm9yIGFsbAo+Pj4+ICvCoMKgwqDCoCAqIGNsaWVudHMgYW5k
IGl0J3Mgb2theSB0byBrZWVwIGNvbmZpZ3VyYXRpb24gbGVmdCBmcm9tCj4+Pj4gYm9vdGxvYWRl
cgo+Pj4+ICvCoMKgwqDCoCAqIGR1cmluZyBib290LCBhdCBsZWFzdCBmb3IgdG9kYXkuCj4+Pj4g
K8KgwqDCoMKgICovCj4+Pj4gK8KgwqDCoCBpZiAoc3JjID09IGRzdCkKPj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIDA7Cj4+Pgo+Pj4gTml0OiBUaGUgInByb3BlciIgd2F5IHRvIGV4cHJlc3Mg
dGhpcyBzaG91bGQgYmUgdG8gaW1wbGVtZW50IHRoZQo+Pj4gLmdldF9idygpIGNhbGxiYWNrIHRv
IHJldHVybiB6ZXJvIGFzIGluaXRpYWwgYXZlcmFnZS9wZWFrIGJhbmR3aWR0aC4KPj4+IEknbSB3
b25kZXJpbmcgaWYgdGhpcyB3aWxsIHdvcmsgaGVyZT8KPj4+Cj4+PiBUaGUgcmVzdCBsb29rcyBn
b29kIHRvIG1lIQo+Pgo+PiBIZWxsbyBHZW9yZ2ksCj4+Cj4+IFJldHVybmluZyB6ZXJvcyBkb2Vz
bid0IGFsbG93IHVzIHRvIHNraXAgdGhlIGluaXRpYWxpemF0aW9uIHRoYXQgaXMgZG9uZQo+PiBi
eSBwcm92aWRlci0+c2V0KG5vZGUsIG5vZGUpIGluIGljY19ub2RlX2FkZCgpLiBJdCB3aWxsIHJl
Y29uZmlndXJlCj4+IG1lbW9yeSBsYXRlbmN5IGluIGFjY29yZGFuY2UgdG8gYSB6ZXJvIG1lbW9y
eSBiYW5kd2lkdGgsIHdoaWNoIGlzIHdyb25nCj4+IHRvIGRvLgo+Pgo+PiBJdCBhY3R1YWxseSBz
aG91bGQgYmUgbW9yZSBwcmVmZXJyZWQgdG8gcHJlc2V0IGJhbmR3aWR0aCB0byBhIG1heGltdW0K
Pj4gYmVmb3JlIGFsbCBkcml2ZXJzIGFyZSBzeW5jZWQsIGJ1dCB0aGlzIHNob3VsZCBiZSBkb25l
IG9ubHkgb25jZSB3ZSB3aWxsCj4+IHdpcmUgdXAgYWxsIGRyaXZlcnMgdG8gdXNlIElDQyBmcmFt
ZXdvcmsuIEZvciBub3cgaXQncyBzYWZlciB0byBrZWVwIHRoZQo+PiBkZWZhdWx0IGhhcmR3YXJl
IGNvbmZpZ3VyYXRpb24gdW50b3VjaGVkLgo+IAo+IE9rLCB0aGFua3MgZm9yIGNsYXJpZnlpbmch
IElzIHRoZXJlIGEgd2F5IHRvIHJlYWQgdGhpcyBoYXJkd2FyZQo+IGNvbmZpZ3VyYXRpb24gYW5k
IGNvbnZlcnQgaXQgdG8gaW5pdGlhbCBiYW5kd2lkdGg/IFRoYXQncyB0aGUKPiBpZGVhIG9mIHRo
ZSBnZXRfYncoKSBjYWxsYmFjayBhY3R1YWxseS4gSSBhbSBqdXN0IGN1cmlvdXMgYW5kCj4gdHJ5
aW5nIHRvIGdldCBhIGJldHRlciB1bmRlcnN0YW5kaW5nIGhvdyB0aGlzIHdvcmtzIGFuZCBpZiBp
dAo+IHdvdWxkIGJlIHVzZWZ1bCBmb3IgVGVncmEuCgpNQyBkcml2ZXIgY2FuJ3QgZWFzaWx5IHJl
dHJpZXZlIGFuZCBjb252ZXJ0IGluaXRpYWwgYmFuZHdpZHRocyBiZWNhdXNlCnRoZXkgZGVwZW5k
IG9uIGtub3dpbmcgaGFyZHdhcmUgc3RhdGUgdGhhdCBpcyBub3QgYWNjZXNzaWJsZSBieSB0aGUg
TUMKZHJpdmVyLgoKQnV0IGluIGZhY3QgaXQncyB1bm5lY2Vzc2FyeSB0byBrbm93IHRoZSBpbml0
aWFsIGJhbmR3aWR0aCBpbiB0aGUgY2FzZQpvZiB0aGlzIE1DIElDQyBkcml2ZXIgYmVjYXVzZSBp
ZiBjb25maWd1cmF0aW9uIGlzIHJlLXNldCB0byB0aGUgc2FtZQp2YWx1ZSwgdGhlbiB0aGlzIGlz
IGVxdWFsIHRvIGxlYXZpbmcgY29uZmlndXJhdGlvbiB1bmNoYW5nZWQuCgpJdCdzIG9rYXkgdG8g
a2VlcCBtZW1vcnkgbGF0ZW5jeSBjb25maWd1cmF0aW9uIHVuY2hhbmdlZCBpZiBtZW1vcnkgY2xv
Y2sKcmF0ZSBnb2VzIHVwLCB3aGljaCBpcyB3aGF0IGhhcHBlbnMgaGVyZSBkdXJpbmcgaW5pdC4g
UGxlYXNlIG5vdGljZSB0aGF0CkVNQyBJQ0MgZHJpdmVycyAod2hpY2ggY29udHJvbCB0aGUgY2xv
Y2sgcmF0ZSkgZG9uJ3Qgc2tpcCB0aGUgaW5pdGlhbApiYW5kd2lkdGggY2hhbmdlLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
