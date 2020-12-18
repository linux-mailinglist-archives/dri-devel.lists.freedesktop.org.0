Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4250C2DF518
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE28F6E145;
	Sun, 20 Dec 2020 11:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B4698912D
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 13:51:37 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id o17so5623793lfg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 05:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ud+ydgJ9az3Hiu3dG94tCj+AH/qmY9t585UF2V6T/f4=;
 b=YU3/c4y3sS1EheZWjrflGG0HpXjJJh+/DPVIl2CatwZ1345AQ4Ps9XE9KOttvWkWfB
 peJI/hYVrD79Qiu/52g+nyfaJH2iQHi9fESs9e7PSVrJLQHc07zXPCiP3ITLCpVWAREv
 qwx9cAfmpQTao8nPDvEfblvcaXemydgisPKlrfX9PihSCkXKt7/1dRn16B8ThPctm/CV
 ZH9TO87G8fCVtoY3YnsNGa1q53+i9enUSbke6lKkziiXHDIDgowFL/nbnOhxBRVQBjvP
 JCPfR7HU53ThAtkHaJ4/gZyc3fVHY+CWI8lg+84lqNnatqsSbuTO6NpiZ7ccnulU64Z/
 2C0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ud+ydgJ9az3Hiu3dG94tCj+AH/qmY9t585UF2V6T/f4=;
 b=lLGjvmAl1tqNlFK58U3bsbcDZDo9TQURUfGsFImns1IE5LANz0vrD+r9fzLahezXiO
 iUdjmkgUEOoqtvMt4MXaImaCC40s9zs2VgWdYpmZpxPRUgzQFtS8VQ6AslQNbZuCH5+q
 9Tenq/xSajKtiLyDw1px1a5oDzvg2MXfe8tulEjc3U/g0O4/0TvQzDWG8jvjDeSMqIUR
 zpZiIoMsadnJNz+6d1g6jwgXNw9X36aV2IXWjrT/Z5T/41OMpOKBRKSQ/i2FndGb5M/0
 x8kdsGCjEvIID4I96rw5P72z1RFeFJaS2g1ntQHXuQ7yMCbdXtShNP1EpjvBOrWr9ccu
 o5kA==
X-Gm-Message-State: AOAM533nx6jfwbBPncOAG3RN56xNG/yE/kyPsksFAPF+VR/DvIkH5cF/
 7Kx0YWTfxEUjJBA8sVJ/Hvk=
X-Google-Smtp-Source: ABdhPJwlBZ8Blm2A+JOtuSZuYrjATZyxdK51+2jHdPBCMrrfUZ3Pxpve0dGkaB8ZmDWkCYbAToxNUg==
X-Received: by 2002:a2e:b896:: with SMTP id r22mr1801148ljp.442.1608299495548; 
 Fri, 18 Dec 2020 05:51:35 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id i10sm934975lfd.202.2020.12.18.05.51.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Dec 2020 05:51:34 -0800 (PST)
Subject: Re: [PATCH v2 00/48] Introduce core voltage scaling for NVIDIA
 Tegra20/30 SoCs
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201218071455.vdeozvvnmkjtrejt@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c0976db7-ae66-740c-d95f-501d81c99fa0@gmail.com>
Date: Fri, 18 Dec 2020 16:51:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201218071455.vdeozvvnmkjtrejt@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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
 Viresh Kumar <vireshk@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTguMTIuMjAyMCAxMDoxNCwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTctMTItMjAs
IDIxOjA1LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEludHJvZHVjZSBjb3JlIHZvbHRhZ2Ug
c2NhbGluZyBmb3IgTlZJRElBIFRlZ3JhMjAvMzAgU29Dcywgd2hpY2ggcmVkdWNlcwo+PiBwb3dl
ciBjb25zdW1wdGlvbiBhbmQgaGVhdGluZyBvZiB0aGUgVGVncmEgY2hpcHMuIFRlZ3JhIFNvQyBo
YXMgbXVsdGlwbGUKPj4gaGFyZHdhcmUgdW5pdHMgd2hpY2ggYmVsb25nIHRvIGEgY29yZSBwb3dl
ciBkb21haW4gb2YgdGhlIFNvQyBhbmQgc2hhcmUKPj4gdGhlIGNvcmUgdm9sdGFnZS4gVGhlIHZv
bHRhZ2UgbXVzdCBiZSBzZWxlY3RlZCBpbiBhY2NvcmRhbmNlIHRvIGEgbWluaW11bQo+PiByZXF1
aXJlbWVudCBvZiBldmVyeSBjb3JlIGhhcmR3YXJlIHVuaXQuCj4gCj4gUGxlYXNlIHN1Ym1pdCB0
aGUgT1BQIGNoYW5nZXMgc2VwYXJhdGVseSAoYWxvbmUpLCBpdCB3aWxsIG5ldmVyIGdldAo+IG1l
cmdlZCB0aGlzIHdheS4gU2VuZCBmaXhlcyBhdCB0aGUgdG9wLCBhbnkgZmVhdHVyZXMgeW91IHdh
bnQgbGF0ZXIgaW4KPiB0aGUgc2VyaWVzLiBJdCBpcyBmaW5lIGZvciB5b3UgdG8gYmFzZSB5b3Vy
IHNlcmllcyBvZiBwYXRjaGVzIHdoaWNoCj4gYXJlIHVuZGVyIHJldmlldywgeW91IGp1c3QgbmVl
ZCB0byBtZW50aW9uIHRoYXQgaW4geW91ciBjb3ZlciBsZXR0ZXIKPiBmb3IgeW91ciBwbGF0Zm9y
bSdzIHBhdGNoc2V0Lgo+IAoKQWxyaWdodCwgYWx0aG91Z2ggSSBoYXZlbid0IHByZXRlbmRlZCB0
aGF0IHYyIHBhdGNoZXMgc2hvdWxkIGJlIG1lcmdlZApyaWdodCBhd2F5IHNpbmNlIHRoZXkgYXJl
IGZ1bmRhbWVudGFsbHkgZGlmZmVyZW50IGZyb20gdjEsIGFuZCB0aHVzLCBhbGwKcGF0Y2hlcyBu
ZWVkIHRvIGJlIHJldmlld2VkIGZpcnN0LgoKSWYgdGhlIGN1cnJlbnQgT1BQIGNoYW5nZXMgbG9v
ayBnb29kIHRvIHlvdSwgdGhlbiBwbGVhc2UgZ2l2ZSB5b3VycyByLWIKdG8gdGhlIHBhdGNoZXMu
IFRoYW5rcyBpbiBhZHZhbmNlIQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
