Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0802E2ACB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Dec 2020 10:42:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD5BB899D5;
	Fri, 25 Dec 2020 09:42:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0D676E88D
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 20:37:24 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id l11so366039lfg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 12:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wCsb7WW/M2bzd7/pDZtZYPCJvx1YT3sUxGJbbavSmFg=;
 b=ZvZCwqyFAc/Ql/wxh66l/3Pl+CYJdEHVkuisgepgy43WMHQBLq7lqEbSWNFjyq1ZV7
 /Q8eZ//xtNKvGYwTVFKhvCqR6IX4wUEOjUuLVxma61Kdhn6mm7nF89yQA1nn43DX/U/x
 wbXLmPyX4MgPZeHb5ZJ7iOTMePG7hqFxLKBIKHiuOfdyP7qQ3p1EqWbGETRRjCRn0AaJ
 qWkN1PAfvH67YturxexyosOWCqX3ti4sO/mvJRpXPRBV1xoRkXoL/5f6CADo5wxPBb6/
 gqxFM+QiZr7IeIQBHgXM66Oq+WzF9SNBaYYUtdUGbU+Ga1VkUuk5Qfwq4SfZ5OQ40AT8
 Ep3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wCsb7WW/M2bzd7/pDZtZYPCJvx1YT3sUxGJbbavSmFg=;
 b=uV4o711XDx+A0QeLrfthhxWr/RNIHFdmGnf5pQh/x/AopkPpF48+dAWvghu+gN17k5
 xMYWRUgeaPZhvngLIHo1A9rW+7l028yc1a2lt44dOYJnJYRZQSLzmPpGilx88il1Efiw
 +L291u9tRZ0dpc+9oXLJ8JxxNitLB06Kee7zJFOhXz535Np+8g07Ptl3nPokS+030iuJ
 bM5FV58C3vA1FmRw23LWM/XjuZs1hXDf6NCKLE/HsV9uvlD+7iyDiwzmJSDw1cyG24iK
 C21UQrECziyVMyNc17Iv20cCsinykvlFkmjIuqwsUIf1MFUMaHI6eobjyvbziRSpVqnL
 LoCA==
X-Gm-Message-State: AOAM533GkB7UEpHceFgkpPyPLLKXNZ2Q4t11crMFRNjrDdEocNtuT26Y
 RjVmpCHTsaLCQqR37laWigw=
X-Google-Smtp-Source: ABdhPJxGiooPS8lo4Avau8/JweSYhcD8EGyLO2HFPmvlGDoqO2i9U3oI4uzk966QuJ/9xSInUThU1g==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr10919526lfq.232.1608755843340; 
 Wed, 23 Dec 2020 12:37:23 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru.
 [109.252.192.57])
 by smtp.googlemail.com with ESMTPSA id u8sm3649057ljj.1.2020.12.23.12.37.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Dec 2020 12:37:22 -0800 (PST)
Subject: Re: [PATCH v2 28/48] soc/tegra: Introduce core power domain driver
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201217180638.22748-1-digetx@gmail.com>
 <20201217180638.22748-29-digetx@gmail.com>
 <20201222064029.duuzcsj53rt7xzvt@vireshk-i7>
 <c130f78d-3d97-9b26-be77-951fee0d8680@gmail.com>
 <3a5c00e5-2cdd-35ce-2714-d4ffbf9d516a@gmail.com>
 <20201223055715.2n5eba7fohrwpgr5@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <239642ad-d7e9-364e-80d3-1da67625e247@gmail.com>
Date: Wed, 23 Dec 2020 23:37:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201223055715.2n5eba7fohrwpgr5@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 25 Dec 2020 09:42:09 +0000
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

MjMuMTIuMjAyMCAwODo1NywgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMjItMTItMjAs
IDIyOjM5LCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDIyLjEyLjIwMjAgMjI6MjEsIERtaXRy
eSBPc2lwZW5rbyDQv9C40YjQtdGCOgo+Pj4+PiArCWlmIChJU19FUlIob3BwKSkgewo+Pj4+PiAr
CQlkZXZfZXJyKCZnZW5wZC0+ZGV2LCAiZmFpbGVkIHRvIGZpbmQgT1BQIGZvciBsZXZlbCAldTog
JXBlXG4iLAo+Pj4+PiArCQkJbGV2ZWwsIG9wcCk7Cj4+Pj4+ICsJCXJldHVybiBQVFJfRVJSKG9w
cCk7Cj4+Pj4+ICsJfQo+Pj4+PiArCj4+Pj4+ICsJZXJyID0gZGV2X3BtX29wcF9zZXRfdm9sdGFn
ZSgmZ2VucGQtPmRldiwgb3BwKTsKPj4+PiBJSVVDLCB5b3UgaW1wbGVtZW50ZWQgdGhpcyBjYWxs
YmFjayBiZWNhdXNlIHlvdSB3YW50IHRvIHVzZSB0aGUgdm9sdGFnZSB0cmlwbGV0Cj4+Pj4gcHJl
c2VudCBpbiB0aGUgT1BQIHRhYmxlID8KPj4+Pgo+Pj4+IEFuZCBzbyB5b3UgYXJlIHNldHRpbmcg
dGhlIHJlZ3VsYXRvciAoInBvd2VyIikgbGF0ZXIgaW4gdGhpcyBwYXRjaCA/Cj4+PiB5ZXMKPj4+
Cj4+Pj4gSSBhbSBub3QgaW4gZmF2b3Igb2YgaW1wbGVtZW50aW5nIHRoaXMgcm91dGluZSwgYXMg
aXQganVzdCBhZGRzIGEgd3JhcHBlciBhYm92ZQo+Pj4+IHRoZSByZWd1bGF0b3IgQVBJLiBXaGF0
IHlvdSBzaG91bGQgYmUgZG9pbmcgcmF0aGVyIGlzIGdldCB0aGUgcmVndWxhdG9yIGJ5Cj4+Pj4g
eW91cnNlbGYgaGVyZSAoaW5zdGVhZCBvZiBkZXBlbmRpbmcgb24gdGhlIE9QUCBjb3JlKS4gQW5k
IHRoZW4geW91IGNhbiBkbwo+Pj4+IGRldl9wbV9vcHBfZ2V0X3ZvbHRhZ2UoKSBoZXJlIGFuZCBz
ZXQgdGhlIHZvbHRhZ2UgeW91cnNlbGYuIFlvdSBtYXkgd2FudCB0bwo+Pj4+IGltcGxlbWVudCBh
IHZlcnNpb24gc3VwcG9ydGluZyB0cmlwbGV0IGhlcmUgdGhvdWdoIGZvciB0aGUgc2FtZS4KPj4+
Pgo+Pj4+IEFuZCB5b3Ugd29uJ3QgcmVxdWlyZSB0aGUgc3luYyB2ZXJzaW9uIG9mIHRoZSBBUEkg
YXMgd2VsbCB0aGVuLgo+Pj4+Cj4+PiBUaGF0J3Mgd2hhdCBJIGluaXRpYWxseSBkaWQgZm9yIHRo
aXMgZHJpdmVyLiBJIGRvbid0IG1pbmQgdG8gcmV2ZXJ0IGJhY2sKPj4+IHRvIHRoZSBpbml0aWFs
IHZhcmlhbnQgaW4gdjMsIGl0IGFwcGVhcmVkIHRvIG1lIHRoYXQgaXQgd2lsbCBiZSBuaWNlcgo+
Pj4gYW5kIGNsZWFuZXIgdG8gaGF2ZSBPUFAgQVBJIG1hbmFnaW5nIGV2ZXJ5dGhpbmcgaGVyZS4K
Pj4KPj4gSSBmb3Jnb3Qgb25lIGltcG9ydGFudCBkZXRhaWwgKHdoeSB0aGUgaW5pdGlhbCB2YXJp
YW50IHdhc24ndCBnb29kKS4uCj4+IE9QUCBlbnRyaWVzIHRoYXQgaGF2ZSB1bnN1cHBvcnRhYmxl
IHZvbHRhZ2VzIHNob3VsZCBiZSBmaWx0ZXJlZCBvdXQgYW5kCj4+IE9QUCBjb3JlIHBlcmZvcm1z
IHRoZSBmaWx0ZXJpbmcgb25seSBpZiByZWd1bGF0b3IgaXMgYXNzaWduZWQgdG8gdGhlIE9QUAo+
PiB0YWJsZS4KPj4KPj4gSWYgcmVndWxhdG9yIGlzIGFzc2lnbmVkIHRvIHRoZSBPUFAgdGFibGUs
IHRoZW4gd2UgbmVlZCB0byB1c2UgT1BQIEFQSQo+PiBmb3IgZHJpdmluZyB0aGUgcmVndWxhdG9y
LCBoZW5jZSB0aGF0J3Mgd2h5IEkgYWRkZWQKPj4gZGV2X3BtX29wcF9zeW5jX3JlZ3VsYXRvcnMo
KSBhbmQgZGV2X3BtX29wcF9zZXRfdm9sdGFnZSgpLgo+Pgo+PiBQZXJoYXBzIGl0IHNob3VsZCBi
ZSBwb3NzaWJsZSB0byBhZGQgZGV2X3BtX29wcF9nZXRfcmVndWxhdG9yKCkgdGhhdAo+IAo+IFdo
YXQncyB3cm9uZyB3aXRoIGdldHRpbmcgdGhlIHJlZ3VsYXRvciBpbiB0aGUgZHJpdmVyIGFzIHdl
bGwgPyBBcGFydCBmcm9tIHRoZQo+IE9QUCBjb3JlID8KClRoZSB2b2x0YWdlIHN5bmNpbmcgc2hv
dWxkIGJlIGRvbmUgZm9yIGVhY2ggY29uc3VtZXIgcmVndWxhdG9yCmluZGl2aWR1YWxseSBbMV0u
CgpTZWNvbmRseSwgcmVndWxhdG9yIGNvcmUgZG9lc24ndCB3b3JrIHdlbGwgdG9kYXkgaWYgdGhl
IHNhbWUgcmVndWxhdG9yCmlzIHJlcXVlc3RlZCBtb3JlIHRoYW4gb25lIHRpbWUgZm9yIHRoZSBz
YW1lIGRldmljZS4KCj4+IHdpbGwgcmV0dXJuIHRoZSBPUFAgdGFibGUgcmVndWxhdG9yIGluIG9y
ZGVyIHRvIGFsbG93IGRyaXZlciB0byB1c2UgdGhlCj4+IHJlZ3VsYXRvciBkaXJlY3RseS4gQnV0
IEknbSBub3Qgc3VyZSB3aGV0aGVyIHRoaXMgaXMgYSBtdWNoIGJldHRlcgo+PiBvcHRpb24gdGhh
biB0aGUgb3BwX3N5bmNfcmVndWxhdG9ycygpIGFuZCBvcHBfc2V0X3ZvbHRhZ2UoKSBBUElzLgo+
IAo+IHNldF92b2x0YWdlKCkgaXMgc3RpbGwgZmluZSBhcyB0aGVyZSBpcyBzb21lIGRhdGEgdGhh
dCB0aGUgT1BQIGNvcmUgaGFzLCBidXQKPiBzeW5jX3JlZ3VsYXRvcigpIGhhcyBub3RoaW5nIHRv
IGRvIHdpdGggT1BQIGNvcmUuCj4gCj4gQW5kIHRoaXMgbWF5IGxlYWQgdG8gbW9yZSB3cmFwcGVy
IGhlbHBlcnMgaW4gdGhlIE9QUCBjb3JlLCB3aGljaCBJIGFtIGFmcmFpZCBvZi4KPiBBbmQgc28g
ZXZlbiBpZiBpdCBpcyBub3QgdGhlIGJlc3QsIEkgd291bGQgbGlrZSB0aGUgT1BQIGNvcmUgdG8g
cHJvdmlkZSB0aGUgZGF0YQo+IGFuZCBub3QgZ2V0IGludG8gdGhpcy4gT2Zjb3Vyc2UgdGhlcmUg
aXMgYW4gZXhjZXB0aW9uIHRvIHRoaXMsIG9wcF9zZXRfcmF0ZS4KPiAKClRoZSByZWd1bGF0b3Jf
c3luY192b2x0YWdlKCkgc2hvdWxkIGJlIGludm9rZWQgb25seSBpZiB2b2x0YWdlIHdhcwpjaGFu
Z2VkIHByZXZpb3VzbHkgWzFdLgoKVGhlIE9QUCBjb3JlIGFscmVhZHkgaGFzIHRoZSBpbmZvIGFi
b3V0IHdoZXRoZXIgdm9sdGFnZSB3YXMgY2hhbmdlZCBhbmQKaXQgcHJvdmlkZXMgdGhlIG5lY2Vz
c2FyeSBsb2NraW5nIGZvciBib3RoIHNldF92b2x0YWdlKCkgYW5kCnN5bmNfcmVndWxhdG9yKCku
IFBlcmhhcHMgSSdsbCBuZWVkIHRvIGR1cGxpY2F0ZSB0aGF0IGZ1bmN0aW9uYWxpdHkgaW4KdGhl
IFBEIGRyaXZlciwgaW5zdGVhZCBvZiBtYWtpbmcgaXQgYWxsIGdlbmVyaWMgYW5kIHJlLXVzYWJs
ZSBieSBvdGhlcgpkcml2ZXJzLgoKWzFdCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y1LjEwLjIvc291cmNlL2RyaXZlcnMvcmVndWxhdG9yL2NvcmUuYyNMNDEwNwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
