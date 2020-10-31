Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F29BD2A2064
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:37:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61B36EB2C;
	Sun,  1 Nov 2020 17:36:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9880C6E3AA
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 19:53:19 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id l2so12275779lfk.0
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 12:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qpW1o+C0PRJ741Jc61rIE1EzSh2oPyJa/Lhh/MjTIEo=;
 b=kCemvOV/aVgs6jzTk5xs0VLzBdyFrvm75owovIK/xkL6tbC05uav9344WusR7z8ETN
 suCnr8DigbChM6vHGGn+ppIjhVtviHN4bAvhea/cXJkagsVr2CxVaF7odhorhnb4Q36B
 BQjYm6NjAl0I3ZEkyhkpo4MYmDrHFMDYkvYCWd9sER/94ftd4VgEuRS46AYN3HdHFO+S
 tqwd1bRl/QJaUMrXp2RZMaBXFtO58oWvlSmrkAm4mVfuuIrzLF3LU9oY2B2u3YHr/FhD
 oWbALHqgegg27LIAs7xx8Zb1oYanYNM0St1C8i32EAUAtm0fDKovMHgoNLH2CZESUMyu
 k7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qpW1o+C0PRJ741Jc61rIE1EzSh2oPyJa/Lhh/MjTIEo=;
 b=Grx+/28Uzxtl8E0ru8/oLYX27mwTYfThMlThBCH9b/W7fZbOMdlSHAx8dmj/vT8cBJ
 dViqvP8WN0myrKylDfzb+jcq35zVk5hXnK7B8BDZuHVP54J6mq8Uggm+fHeoNHYjIsx1
 ehTum8E8ZHQTXtJMuBF5sYrO+5tmRscE+308BahCSwPA0VRtz330wSnKpdubhIvwbRjy
 ZFrBbOm0hzkZaAqu1GtAS3DrygpVV0NG+DeUW66L5mKcB2xz8wkVHr2K5eOURsP/wqAI
 1Jk6v3/lqH8kLRdne4OWpwAfIuemiZI/T05s9d7lfYwsPk04W+H1pHLMJfuAYyhFWrb9
 RqmA==
X-Gm-Message-State: AOAM5318GdRyOF8pyZzcnEmLoC1h0lopuojD1N2Lf1+lO2XN21J++QW5
 EwC6iiV2uryZ3i5qaDJ6ABs=
X-Google-Smtp-Source: ABdhPJx51n5KkA8mPRxesb87WniYbQs0YGofYfpwH6xFE7VSriWHy/j/UxCjN08agE3mbG5oAIkFaw==
X-Received: by 2002:a19:7009:: with SMTP id h9mr3365454lfc.201.1604173997919; 
 Sat, 31 Oct 2020 12:53:17 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru.
 [109.252.193.177])
 by smtp.googlemail.com with ESMTPSA id d16sm926813lfm.55.2020.10.31.12.53.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 31 Oct 2020 12:53:17 -0700 (PDT)
Subject: Re: [PATCH v6 08/52] dt-bindings: memory: tegra20: emc: Document
 mfd-simple compatible and statistics sub-device
To: Rob Herring <robh@kernel.org>
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-9-digetx@gmail.com> <20201027090212.GG4244@kozik-lap>
 <1cce314a-1eab-61c9-099d-54f987b03761@gmail.com>
 <20201027194457.GD140636@kozik-lap>
 <ae06bd70-93f5-abe8-64d9-e5e991cd8ff8@gmail.com>
 <20201028152632.GA4051913@bogus>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a2e7109c-1a31-2b5d-fd1b-b572c654ba82@gmail.com>
Date: Sat, 31 Oct 2020 22:53:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201028152632.GA4051913@bogus>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
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

MjguMTAuMjAyMCAxODoyNiwgUm9iIEhlcnJpbmcg0L/QuNGI0LXRgjoKPiBPbiBUdWUsIE9jdCAy
NywgMjAyMCBhdCAxMToxODozNFBNICswMzAwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IDI3
LjEwLjIwMjAgMjI6NDQsIEtyenlzenRvZiBLb3psb3dza2kg0L/QuNGI0LXRgjoKPj4+IE9uIFR1
ZSwgT2N0IDI3LCAyMDIwIGF0IDEwOjIyOjE5UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90
ZToKPj4+PiAyNy4xMC4yMDIwIDEyOjAyLCBLcnp5c3p0b2YgS296bG93c2tpINC/0LjRiNC10YI6
Cj4+Pj4+PiBAQCAtMzEsMTcgKzMyLDM0IEBAIEV4YW1wbGU6Cj4+Pj4+PiAgCQkuLi4KPj4+Pj4+
ICAJfTsKPj4+Pj4+ICAKPj4+Pj4+ICsJZW1jX2J3X2Rmc19vcHBfdGFibGU6IGVtY19vcHBfdGFi
bGUxIHsKPj4+Pj4gSHlwaGVucyBmb3Igbm9kZSBuYW1lLgo+Pj4+Cj4+Pj4gV2UgYWxyZWFkeSB1
c2UgdW5kZXJzY29yZXMgZm9yIHRoZSBUZWdyYSBDUFUgT1BQIHRhYmxlLgo+Pj4+Cj4+Pj4gaHR0
cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTAtcmMxL3NvdXJjZS9hcmNoL2FybS9i
b290L2R0cy90ZWdyYTIwLWNwdS1vcHAuZHRzaSNMNAo+Pj4+Cj4+Pj4gV2hhdCBtYWtlcyB5b3Ug
dGhpbmsgdGhhdCBoeXBoZW5zIHdpbGwgYmUgYSBiZXR0ZXIgY2hvaWNlPyBJcyBpdCBhCj4+Pj4g
ZG9jdW1lbnRlZCBuYW1pbmcgY29udmVudGlvbj8KPj4+Cj4+PiBVbmZvcnR1bmF0ZWx5IHRoYXQn
cyB0aGUgc291cmNlIG9mIGNvbmZ1c2lvbiBhbHNvIGZvciBtZSBiZWNhdXNlCj4+PiBEZXZpY2V0
cmVlIHNwZWMgbWVudGlvbnMgYm90aCBvZiB0aGVtIChhbmQgZG9lcyBub3Qgc3BlY2lmeSBwcmVm
ZXJlbmNlcykuCj4+Pgo+Pj4gVGhlIGNob2ljZSBvZiBkYXNoZXMvaHlwaGVucyBjb21lcyBub3cg
ZXhwbGljaXRseSBmcm9tIGFsbCBkdHNjaGVtYQo+Pj4gZmlsZXMuICBQcmV2aW91c2x5LCB0aGUg
ZG9jdW1lbnRhdGlvbiB3ZXJlIGVtYWlscyBmcm9tIFJvYi4gOikKPj4KPj4gT2theSwgSSdsbCBj
aGFuZ2UgaXQgaW4gdjcuIFNvIGZhciBJIGhhdmVuJ3Qgc2VlbiB3YXJuaW5ncyBhYm91dCBpdCBm
cm9tCj4+IHRoZSBzY2hlbWEtY2hlY2tlci4KPiAKPiBkdGMgd2l0aCBXPTIgd2lsbCB3YXJuLgo+
IAo+IFRoZSBiaWdnZXIgaXNzdWUgaXMgdGhlIG5hbWUgc2hvdWxkIGJlIGdlbmVyaWMuCgpJbmRl
ZWQsIHRoYW5rcy4gSSdsbCBjb3JyZWN0IHRoZSBuYW1lLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
