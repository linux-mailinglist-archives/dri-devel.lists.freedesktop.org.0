Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA4E10302E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5DC6EA11;
	Tue, 19 Nov 2019 23:28:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9C126E9B9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 16:56:11 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id n186so5217460lfd.11
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:56:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=giMwmMYCTfwG4t/m7GcZ9wpvpN8uV7OEh8vHMV0l5S0=;
 b=YSWnLIJeyUGhlgQPuAlyoTKlrC3hO7E6FgOrqN37mA2YC2tw7og5NDX5NHRN3G5AEl
 +fbkPZ54b3H2sOvLLtFhKKHtBVb2kdSSC0AQWdmZKO5J2k8DH+fCmMkf6KO7p+++2k74
 yYhOAXMqSVhbxe+OCg6g+V9TGwSiWc+TS8Gx67WSf/B18B/4VORWLsLUzcj+zdKN1QZL
 jc8a+1cxP5b6GlNaxLSsbHJpPQ5f0vnOAmu+KNPglm0K60nbGN3Dwbh1Wq3J6lXkfbtg
 JJtU/TGQx8Cp0uyD0G6vE4pDYxo0kfaDaWoX72uTL6ckyI239sDM4HOiX9pjwde5kpva
 wKfw==
X-Gm-Message-State: APjAAAUFC5mW7RVmRoWkYHX78NytM5sSa7f4pnm+F//Bnt0JSnLt9bmZ
 g2RVQt82KYaqeDbKS6CMZ/g=
X-Google-Smtp-Source: APXvYqzthkVZ1hMtk0VsW3K9xsqiauD6RdH04NOkFmKx3D6tdSccWVopfg3OX5PNStxfi+4MYkk1mw==
X-Received: by 2002:ac2:5967:: with SMTP id h7mr4671524lfp.119.1574182570172; 
 Tue, 19 Nov 2019 08:56:10 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id y5sm10749907lfg.5.2019.11.19.08.56.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2019 08:56:09 -0800 (PST)
Subject: Re: [PATCH v1 08/29] dt-bindings: interconnect: tegra: Add initial IDs
To: Thierry Reding <thierry.reding@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
 <20191118200247.3567-9-digetx@gmail.com> <20191119062535.GC2462695@ulmo>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8cff3af3-42c7-3312-5f98-cd5eb98b7b7a@gmail.com>
Date: Tue, 19 Nov 2019 19:56:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191119062535.GC2462695@ulmo>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=giMwmMYCTfwG4t/m7GcZ9wpvpN8uV7OEh8vHMV0l5S0=;
 b=rmUv4RO88MDLOtSHN6/ZZBmKiLjFBYSKFwhCyvhX3/1sXT3xESgFLG8mDpW2oWH9Fl
 /MfigHIV5FK4dGGKcQlfHlByQhnj00/6hvQcYo1wWB7dBUD8eHQMeEwxOEoWmnnVKGSc
 nQJSsYZDKVtWGVfuvbXM6B+41ei9mpONcrBi+fugiqwLgu1MUPi8oAKsectEI8YLv/dI
 kAW37irsEiTAX/lnlI1WTqe4rYtLERlsK4V7V4XtpddzJUX+adAdAvABrH3WAwMjq+6k
 hYJw8Ib3vdKZeQ0RAnz05RAoR7kawTZB6A7zVCgmKR+MzDnAxlanLh+6Q//2fwcmgLZ9
 djdQ==
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTkuMTEuMjAxOSAwOToyNSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBPbiBNb24sIE5v
diAxOCwgMjAxOSBhdCAxMTowMjoyNlBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+
IERlZmluZSBpbnRlcmNvbm5lY3QgSURzIGZvciBtZW1vcnkgY29udHJvbGxlciAoTUMpLCBleHRl
cm5hbCBtZW1vcnkKPj4gY29udHJvbGxlciAoRU1DKSwgZXh0ZXJuYWwgbWVtb3J5IChFTUVNKSBh
bmQgbWVtb3J5IGNsaWVudHMgb2YgZGlzcGxheQo+PiBjb250cm9sbGVycyAoREMpLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+Cj4+IC0tLQo+
PiAgaW5jbHVkZS9kdC1iaW5kaW5ncy9pbnRlcmNvbm5lY3QvdGVncmEtaWNjLmggfCAxMSArKysr
KysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2R0LWJpbmRpbmdzL2ludGVyY29ubmVjdC90ZWdyYS1pY2MuaAoK
CkhlbGxvIFRoaWVycnksCgo+IFRoZXJlIHdhcyBhIGJpdCBvZiBkaXNjdXNzaW9uIHJlZ2FyZGlu
ZyB0aGlzIGZvciBhIHJlY2VudCBwYXRjaCB0aGF0IEkKPiB3YXMgd29ya2luZyBvbiwgc2VlOgo+
IAo+IAlodHRwOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eC10ZWdyYS9saXN0
Lz9zZXJpZXM9MTQwMzE4CgpUaGFuayB5b3UgdmVyeSBtdWNoIGZvciB0aGUgbGluay4KCj4gSSdk
IHJhdGhlciBub3QgdXNlIGFuIGFkZGl0aW9uYWwgc2V0IG9mIGRlZmluaXRpb25zIGZvciB0aGlz
LiBUaGUgbWVtb3J5Cj4gY29udHJvbGxlciBhbHJlYWR5IGhhcyBhIHNldCBvZiBuYXRpdmUgSURz
IGZvciBtZW1vcnkgY2xpZW50cyB0aGF0IEkKPiB0aGluayB3ZSBjYW4gcmV1c2UgZm9yIHRoaXMu
CgpJIG1pc3NlZCB0aGF0IGl0J3MgZmluZSB0byBoYXZlIG11bHRpcGxlIElDQyBjb25uZWN0aW9u
cyBkZWZpbmVkCnBlci1wYXRoLCBhdCBxdWljayBnbGFuY2UgbG9va3MgbGlrZSBpbmRlZWQgaXQg
c2hvdWxkIGJlIGZpbmUgdG8gcmUtdXNlCk1DIElEcy4KCj4gSSd2ZSBvbmx5IGFkZGVkIHRoZXNl
IGNsaWVudCBJRHMgZm9yIFRlZ3JhMTk0IGJlY2F1c2UgdGhhdCdzIHdoZXJlIHdlCj4gbmVlZCBp
dCB0byBhY3R1YWxseSBkZXNjcmliZSBhIHNwZWNpZmljIGhhcmR3YXJlIHF1aXJrLCBidXQgSSBj
YW4gY29tZQo+IHVwIHdpdGggdGhlIGVxdWl2YWxlbnQgZm9yIG9sZGVyIGNoaXBzIGFzIHdlbGwu
CgpPbGRlciBUZWdyYSBTb0NzIGhhdmUgaGFyZHdhcmUgdW5pdHMgY29ubmVjdGVkIHRvIE1DIHRo
cm91Z2ggQUhCIGJ1cywKbGlrZSBVU0IgZm9yIGV4YW1wbGUuIFRoZXNlIHVuaXRzIGRvIG5vdCBo
YXZlIE1DIGNsaWVudCBJRHMgYW5kIHRoZXJlIGlzCm5vIE1DIElEIGRlZmluZWQgZm9yIHRoZSBB
SEIgYnVzIGVpdGhlciwgYnV0IHByb2JhYmx5IGl0IHdvbid0IGJlIGEKcHJvYmxlbSB0byBkZWZp
bmUgSURzIGZvciB0aGVtIGlmIHdpbGwgYmUgbmVjZXNzYXJ5LgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
