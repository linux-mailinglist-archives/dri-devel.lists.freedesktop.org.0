Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F122EEEE4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 09:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 899DC6E808;
	Fri,  8 Jan 2021 08:55:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E916E506
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jan 2021 19:39:12 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id h22so17426829lfu.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jan 2021 11:39:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ffFy7U5GHTO2EDTarXBfsvng3yi/U0HlVmDD4XbAyvk=;
 b=Wyed8+zva/LYFJ10gJQ7x+ViNyXTsElCtmMUOpgTb/1YDegkPcwMsRWfb6bnPT+iKb
 yyIaGP48HD/upBYUEQjlmhnaGmrTDy9me1CdAxCQI1Rt9cCh1vfk83W55UpQWTrfx4fq
 on3q+XX+gRqs1lF4J6Dzk0wEr9tXNiH+ySbd07plWndwWUiv4F0ykGda/gBwJEg5vYOK
 ATsgATXXNyU6xMDyYcnyAnQ213ZoX/ZXl6yf3ac43tSt0qdPngmmF29bG1+eUDSwgUw1
 AzFECZcWDk9At66ZrGB8CFVrd2+qabP6np+CVOMLQJhpLToWrA6wWVQzNGJpmAyDhR53
 AsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ffFy7U5GHTO2EDTarXBfsvng3yi/U0HlVmDD4XbAyvk=;
 b=DWVYTfgGCWEzhiQzQdo2a8v/d6xQ31zqFZzpCY9OWHREmegegELivjd9t1SX7kcRo9
 RgRhHa9U+lG3B2n6IIT4DTyXAvrwfddnlJx4lWVsflgJy/CW91iVBQzTZO9OLUSBtGR4
 HuQiTsTQQPM+cfOeW6uIqQi9h32+8lzn4/flLTcxy4Lr3OclicFOEi9YTiQjoU8624E8
 kV+k1nZAB+oBfygOhPrHwkkSSGL/auFSXcaT0sD7lNEoV2WkXjXpTtruQakoYvIFexD5
 RGnknI6pOxQdbVsgGOlB+tnYPUPX9QsTf6S+2+4bWR/luxFXnnyKT0PEZkSCkkOoLI/A
 R9Mg==
X-Gm-Message-State: AOAM533gk4k8/1zg9MpguNYhsoC/cWVK2/fBEbwMft61Sh3m7i9E+yig
 jhyWhsou78+4b3+O/QcFA4A=
X-Google-Smtp-Source: ABdhPJwcjsVwi672lMyB3VRDqyLku+RskEcHu3FcswkJW1KB+hkV/1FIv9p7umOsoz2IRKSWh6yzhA==
X-Received: by 2002:a19:230d:: with SMTP id j13mr148331lfj.378.1610048350619; 
 Thu, 07 Jan 2021 11:39:10 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id q21sm1369032lff.280.2021.01.07.11.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jan 2021 11:39:09 -0800 (PST)
Subject: Re: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20210105171111.GC26301@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <988cf951-ff81-4b48-6baf-b393bd1613d2@gmail.com>
Date: Thu, 7 Jan 2021 22:39:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210105171111.GC26301@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 08 Jan 2021 08:55:35 +0000
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-clk@vger.kernel.org, devel@driverdev.osuosl.org,
 Kevin Hilman <khilman@kernel.org>, Nicolas Chauvet <kwizart@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMDEuMjAyMSAyMDoxMSwgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIFRo
dSwgRGVjIDE3LCAyMDIwIGF0IDA5OjA1OjUwUE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4gSW50cm9kdWNlIGNvcmUgdm9sdGFnZSBzY2FsaW5nIGZvciBOVklESUEgVGVncmEyMC8z
MCBTb0NzLCB3aGljaCByZWR1Y2VzCj4+IHBvd2VyIGNvbnN1bXB0aW9uIGFuZCBoZWF0aW5nIG9m
IHRoZSBUZWdyYSBjaGlwcy4gVGVncmEgU29DIGhhcyBtdWx0aXBsZQo+PiBoYXJkd2FyZSB1bml0
cyB3aGljaCBiZWxvbmcgdG8gYSBjb3JlIHBvd2VyIGRvbWFpbiBvZiB0aGUgU29DIGFuZCBzaGFy
ZQo+PiB0aGUgY29yZSB2b2x0YWdlLiBUaGUgdm9sdGFnZSBtdXN0IGJlIHNlbGVjdGVkIGluIGFj
Y29yZGFuY2UgdG8gYSBtaW5pbXVtCj4+IHJlcXVpcmVtZW50IG9mIGV2ZXJ5IGNvcmUgaGFyZHdh
cmUgdW5pdC4KPj4KPj4gVGhlIG1pbmltdW0gY29yZSB2b2x0YWdlIHJlcXVpcmVtZW50IGRlcGVu
ZHMgb246Cj4+Cj4+ICAgMS4gQ2xvY2sgZW5hYmxlIHN0YXRlIG9mIGEgaGFyZHdhcmUgdW5pdC4K
Pj4gICAyLiBDbG9jayBmcmVxdWVuY3kuCj4+ICAgMy4gVW5pdCdzIGludGVybmFsIGlkbGluZy9h
Y3RpdmUgc3RhdGUuCj4+Cj4+IFRoaXMgc2VyaWVzIGlzIHRlc3RlZCBvbiBBY2VyIEE1MDAgKFQy
MCksIEFDMTAwIChUMjApLCBOZXh1cyA3IChUMzApLAo+PiBPdXlhIChUMzApLCBUSzEgKFQxMjQp
IGFuZCBzb21lIG90aGVycy4gSSBhbHNvIGFkZGVkIHZvbHRhZ2Ugc2NhbGluZyB0bwo+PiB0aGUg
VmVudGFuYSAoVDIwKSBhbmQgQ2FyZGh1IChUMzApIGJvYXJkcyB3aGljaCBhcmUgdGVzdGVkIGJ5
IE5WSURJQSdzIENJCj4+IGZhcm0uIFRlZ3JhMzAgaXMgbm93IGNvdXBsZSBkZWdyZWVzIGNvb2xl
ciBvbiBOZXh1cyA3IGFuZCBzdGF5cyBjb29sIG9uCj4+IE91eWEgKGluc3RlYWQgb2YgYmVjb21p
bmcgYnVybmluZyBob3QpIHdoaWxlIHN5c3RlbSBpcyBpZGxpbmcuIEl0IHNob3VsZAo+PiBiZSBw
b3NzaWJsZSB0byBpbXByb3ZlIHRoaXMgZnVydGhlciBieSBpbXBsZW1lbnRpbmcgYSBtb3JlIGFk
dmFuY2VkIHBvd2VyCj4+IG1hbmFnZW1lbnQgZmVhdHVyZXMgZm9yIHRoZSBrZXJuZWwgZHJpdmVy
cy4KPj4KPj4gVGhlIERWRlMgc3VwcG9ydCBpcyBvcHQtaW4gZm9yIGFsbCBib2FyZHMsIG1lYW5p
bmcgdGhhdCBvbGRlciBEVEJzIHdpbGwKPj4gY29udGludWUgdG8gd29yayBsaWtlIHRoZXkgZGlk
IGl0IGJlZm9yZSB0aGlzIHNlcmllcy4gSXQgc2hvdWxkIGJlIHBvc3NpYmxlCj4+IHRvIGVhc2ls
eSBhZGQgdGhlIGNvcmUgdm9sdGFnZSBzY2FsaW5nIHN1cHBvcnQgZm9yIFRlZ3JhMTE0KyBTb0Nz
IGJhc2VkIG9uCj4+IHRoaXMgZ3JvdW5kaW5nIHdvcmsgbGF0ZXIgb24sIGlmIGFueW9uZSB3aWxs
IHdhbnQgdG8gaW1wbGVtZW50IGl0Lgo+IAo+IFRoZSBzYW1lIGNvbW1lbnQgYXMgZm9yIHlvdXIg
aW50ZXJjb25uZWN0IHdvcms6IGZvciBzZXRzIHRvdWNoaW5nCj4gbXVsdGlwbGUgc3lzdGVtcyBw
bGVhc2UgbWVudGlvbiB0aGUgZGVwZW5kZW5jaWVzIGJldHdlZW4gcGF0Y2hlcyBpbiB0aGUKPiBj
b3ZlciBsZXR0ZXIuIE5vdCBhcyBhIHJlcGx5IHRvIHN1Y2ggcmVtYXJrIGxpa2UgSSBtYWtlIGhl
cmUsIGJ1dCBhcyBhCj4gc2VwYXJhdGUgZW50cnkgaW4gdGhlIGNvdmVyIGxldHRlci4KCkknbGwg
ZGVzY3JpYmUgYWxsIHRoZSBkZXBlbmRlbmNpZXMgaW4gdGhlIG5leHQgcmV2aXNpb24sIHRoYW5r
cy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
