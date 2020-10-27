Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1483629CED1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Oct 2020 09:08:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594916EC7A;
	Wed, 28 Oct 2020 08:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7205689503
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 19:24:17 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id a5so3061631ljj.11
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Oct 2020 12:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=teL4BWb/Ty3//gGMcFWg0CBXJ+qn3TO36Ic9xGZcykU=;
 b=LXDwnZLSSzHdk+0NS518g92nqSNo92zjKQB6eO3qPuniQf2f7O3xLfJ3OkwiXb0xzI
 /TbIM/0Hp/SwGeByMcE5EXZJDL5EB8hG2tb/SY1WkahU0aJ52oMgfA1ObZZJ9dP8fB4D
 8v0QS3qMbQ/j6FmS//hcjBm5bbYokHuj4kl7w++OtQrKa9C0z/5P6jt9gjYmT8uufARH
 w30YEyWUOqP+1eMG4G1OZY2v/mJdwAToDE7z9OHzFd2OCY14YvP5peSAjskcluq8PDpo
 m+k5opVMl0bfiDDCnVhVW5Vz4IoBc/RPnio/7abM1vXHZ0wmut3M/DyIQgV310/dspSm
 xmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=teL4BWb/Ty3//gGMcFWg0CBXJ+qn3TO36Ic9xGZcykU=;
 b=UpBHLTGuurLIVlbgGlnU+DGOJj4XzSMpQREEvnBFkLJD5fRiPR2FuVXDOD+fOrbj7o
 ra3LxtT7ch06hxMozE0KhAOWLaBWMI4dy1BV+Em3Co9wPTX94AV8nl+SJMGwobJbvMlh
 7ZEXhf7RUNMH1KJ/Fjv1zTDFewRYyO/dxaE6g/1ale5DjTeZxvOprUaQFhTHI8UJXTmA
 vVuFrB+onncO5B0eld3ASgx+ltDlZTt93yQQ70d8tHTn7D1Mxo5b7RKvuRXhIKX6ZP4Y
 itZSBNEqJUUgwdMp/AUx5DbqmijrSMhWe47JYY9lvUKi+v100yJIVrufCeqUdtuR3N+n
 w+Vw==
X-Gm-Message-State: AOAM530dx33fg1N6+jHvQRcXW+z/mmP+nogptfIyzQQDwCUD7ROpP6IR
 VRuxatMm+1qVQ5YhmdV3T8dlO49N0IE=
X-Google-Smtp-Source: ABdhPJzv2GoyZYU0TkuY3fjjB785+SF5G9Tj2p+DBHVKtHtdt6RjSyJ489SMNygpON3ydMV1RVDEXg==
X-Received: by 2002:a2e:3816:: with SMTP id f22mr1620510lja.214.1603826655898; 
 Tue, 27 Oct 2020 12:24:15 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-186.dynamic.spd-mgts.ru.
 [109.252.193.186])
 by smtp.googlemail.com with ESMTPSA id w139sm267282lff.163.2020.10.27.12.24.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Oct 2020 12:24:15 -0700 (PDT)
Subject: Re: [PATCH v6 28/52] memory: tegra: Add and use
 devm_tegra_get_memory_controller()
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-29-digetx@gmail.com> <20201027094210.GD10762@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a9effe32-3272-7df9-08e5-da293b1854a9@gmail.com>
Date: Tue, 27 Oct 2020 22:24:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201027094210.GD10762@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 28 Oct 2020 08:06:30 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjcuMTAuMjAyMCAxMjo0MiwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIE1v
biwgT2N0IDI2LCAyMDIwIGF0IDAxOjE3OjExQU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gTXVsdGlwbGUgVGVncmEgZHJpdmVycyBuZWVkIHRvIHJldHJpZXZlIE1lbW9yeSBDb250
cm9sbGVyIGFuZCB0aGVyZSBpcwo+PiBkdXBsaWNhdGlvbiBvZiB0aGUgcmV0cmlldmFsIGNvZGUg
YW1vbmcgdGhlIGRyaXZlcnMuIFRoaXMgcGF0Y2ggcmVtb3Zlcwo+PiB0aGUgZHVwbGljYXRpb24g
YW5kIGZpeGVzIHB1dF9kZXZpY2UoKSB3aGljaCB3YXMgbWlzc2VkIGluIHRoZSBkdXBsaWNhdGVk
Cj4+IGNvZGUuCj4+Cj4+IEVNQyBkcml2ZXJzIG5vdyB1c2UgbmV3IGNvbW1vbiBkZXZtX3RlZ3Jh
X2dldF9tZW1vcnlfY29udHJvbGxlcigpIGhlbHBlcgo+PiBpbnN0ZWFkIG9mIG9wZW5jb2Rpbmcg
dGhlIE1DIHJldHJpZXZhbC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxk
aWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL21jLmMgICAg
ICAgICAgICAgICAgfCA0OCArKysrKysrKysrKysrKysrKysrKysrKysKPj4gIGRyaXZlcnMvbWVt
b3J5L3RlZ3JhL3RlZ3JhMTI0LWVtYy5jICAgICAgfCAxOCArKy0tLS0tLS0KPj4gIGRyaXZlcnMv
bWVtb3J5L3RlZ3JhL3RlZ3JhMjEwLWVtYy1jb3JlLmMgfCAzOSArKysrKy0tLS0tLS0tLS0tLS0t
Cj4+ICBkcml2ZXJzL21lbW9yeS90ZWdyYS90ZWdyYTMwLWVtYy5jICAgICAgIHwgMTggKystLS0t
LS0tCj4+ICBpbmNsdWRlL3NvYy90ZWdyYS9tYy5oICAgICAgICAgICAgICAgICAgIHwgMTAgKysr
KysKPj4gIDUgZmlsZXMgY2hhbmdlZCwgNzQgaW5zZXJ0aW9ucygrKSwgNTkgZGVsZXRpb25zKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lbW9yeS90ZWdyYS9tYy5jIGIvZHJpdmVycy9t
ZW1vcnkvdGVncmEvbWMuYwo+PiBpbmRleCBlYzg0MDM1NTdlZDQuLjEyZWEyYzc5MjA1YSAxMDA2
NDQKPj4gLS0tIGEvZHJpdmVycy9tZW1vcnkvdGVncmEvbWMuYwo+PiArKysgYi9kcml2ZXJzL21l
bW9yeS90ZWdyYS9tYy5jCj4+IEBAIC00Miw2ICs0Miw1NCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IG9mX2RldmljZV9pZCB0ZWdyYV9tY19vZl9tYXRjaFtdID0gewo+PiAgfTsKPj4gIE1PRFVMRV9E
RVZJQ0VfVEFCTEUob2YsIHRlZ3JhX21jX29mX21hdGNoKTsKPj4gIAo+PiArc3RhdGljIHZvaWQg
dGVncmFfbWNfZGV2bV9hY3Rpb25fcHV0X2RldmljZSh2b2lkICpkYXRhKQo+PiArewo+PiArCXN0
cnVjdCB0ZWdyYV9tYyAqbWMgPSBkYXRhOwo+PiArCj4+ICsJcHV0X2RldmljZShtYy0+ZGV2KTsK
Pj4gK30KPj4gKwo+PiArLyoqCj4+ICsgKiBkZXZtX3RlZ3JhX2dldF9tZW1vcnlfY29udHJvbGxl
cigpIC0gZ2V0IFRlZ3JhIE1lbW9yeSBDb250cm9sbGVyIGhhbmRsZQo+PiArICogQGRldjogZGV2
aWNlIHBvaW50ZXIgZm9yIHRoZSBjb25zdW1lciBkZXZpY2UKPj4gKyAqCj4+ICsgKiBUaGlzIGZ1
bmN0aW9uIHdpbGwgc2VhcmNoIGZvciB0aGUgTWVtb3J5IENvbnRyb2xsZXIgbm9kZSBpbiBhIGRl
dmljZS10cmVlCj4+ICsgKiBhbmQgcmV0cmlldmUgdGhlIE1lbW9yeSBDb250cm9sbGVyIGhhbmRs
ZS4KPj4gKyAqCj4+ICsgKiBSZXR1cm46IEVSUl9QVFIoKSBvbiBlcnJvciBvciBhIHZhbGlkIHBv
aW50ZXIgdG8gYSBzdHJ1Y3QgdGVncmFfbWMuCj4+ICsgKi8KPj4gK3N0cnVjdCB0ZWdyYV9tYyAq
ZGV2bV90ZWdyYV9nZXRfbWVtb3J5X2NvbnRyb2xsZXIoc3RydWN0IGRldmljZSAqZGV2KQo+IAo+
IFVzdWFsbHkgJ2dldCcgaXMgYSBzdWZmaXggKGZvciBleGFtcGxlIGluIGNsaywgZ3Bpb2QsIGlp
bywgbGVkKSwgc286Cj4gZGV2bV90ZWdyYV9tZW1vcnlfY29udHJvbGxlcl9nZXQoKQoKQWxyaWdo
dCwgSSdsbCByZW5hbWUgaXQgaW4gdjcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
