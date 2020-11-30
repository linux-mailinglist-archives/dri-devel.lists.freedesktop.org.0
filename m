Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F6E2C994D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D9B6E52A;
	Tue,  1 Dec 2020 08:23:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8667F6E80B
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 20:03:49 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id f18so19931016ljg.9
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 12:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vEhR+Du89PZ5uHlmTZPVOeMBpk4ZhmnPvG7++GYzT48=;
 b=nBOB4vH5fDSmMiI/v/KOP5Ztcc6gTG6ASlCRAPZhAb9QgYDhofOwwasWO/d1BRsUkk
 Cnupc2ovJEBaBFe93fntQP+ZixTtvkH5q6FIHboY6BK87SY4WkJ9fFWtR9ZFnw1dj+Sf
 J4ys4VkWRj+fnHA8vvebgnOgB0bML3F69nf786Y/dESEr9E6R9oVuV213MrxeuGCkMDN
 QLcHFPwJgjO9/9+MHinqfxKIJmcmWdFOlYB5/N1bMSPckEB1yIP5Ye/GlqAwp7GiTNPU
 NPUIIzw57SzwVWTkj5WmK1U8g4O1qfaIUQE6qimGPW4DPikyT7bO5mbHN2ckFEAqX2jQ
 DWHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vEhR+Du89PZ5uHlmTZPVOeMBpk4ZhmnPvG7++GYzT48=;
 b=Ph+N2LIn/obgUBBQrj+ZwBBMfypalRHjCapcMxFh4ptCwjZdD81NWUhUecsnj/uXLU
 8Rzb5z4A6SaMPOMJp9fAHDlji6QtbXPNhOELdNrFXqmu9/N0Q10tWFuvQJRhWhuPuPw+
 OhYfaaSzzYjW+EANEdFtldKUZRs1WgpamZE3jVAKGGeDTQ7tNc0J5aFD2/gKu3qMkMoE
 +OQDbexUSkvpjCTuTX4V2knfHJwIIbD9Y4Z2c4PC0ZooGHF2rm7qszK8PNnVwKLQz895
 z3VjtSIGxceLUOU46SFrjR7br3arahl8xUhiqlKaaZjrTGwgu/pF5syNL3lbyold9/Ky
 LVGw==
X-Gm-Message-State: AOAM5312CC03/GGbjAZXl/MoEX+DR3ucwzo+OMOIOZS8Ip2dQHaKzqES
 hguPb6kw27ZWzD2/dfAX+EtmBcUI9fk=
X-Google-Smtp-Source: ABdhPJwUMn+ecDX4H4n6Wk18z6ki+FFE/Gwq+LcNPFp5nQTq6WKmEZqr7eMcBen1vKLu0kYmPs69jA==
X-Received: by 2002:a2e:b386:: with SMTP id f6mr10398273lje.320.1606766627766; 
 Mon, 30 Nov 2020 12:03:47 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id l6sm2606668lfk.150.2020.11.30.12.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 Nov 2020 12:03:46 -0800 (PST)
Subject: Re: [PATCH v10 01/19] dt-bindings: memory: tegra20: emc: Document
 opp-supported-hw property
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Georgi Djakov <georgi.djakov@linaro.org>
References: <20201123002723.28463-1-digetx@gmail.com>
 <20201123002723.28463-2-digetx@gmail.com>
 <46b3bab7-1c2c-2f50-6e41-f411e532357b@linaro.org>
 <20201130182345.GA28450@kozik-lap>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4ff3fe7f-ec17-dd89-3cde-d677b3a92104@gmail.com>
Date: Mon, 30 Nov 2020 23:03:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201130182345.GA28450@kozik-lap>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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
Cc: Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MzAuMTEuMjAyMCAyMToyMywgS3J6eXN6dG9mIEtvemxvd3NraSDQv9C40YjQtdGCOgo+IE9uIE1v
biwgTm92IDMwLCAyMDIwIGF0IDExOjQ4OjE4QU0gKzAyMDAsIEdlb3JnaSBEamFrb3Ygd3JvdGU6
Cj4+IE9uIDIzLjExLjIwIDI6MjcsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4+IERvY3VtZW50
IG9wcC1zdXBwb3J0ZWQtaHcgcHJvcGVydHksIHdoaWNoIGlzIG5vdCBzdHJpY3RseSBuZWNlc3Nh
cnkgdG8KPj4+IGhhdmUgb24gVGVncmEyMCwgYnV0IGl0J3MgdmVyeSBjb252ZW5pZW50IHRvIGhh
dmUgYmVjYXVzZSBhbGwgb3RoZXIgU29DCj4+PiBjb3JlIGRldmljZXMgd2lsbCB1c2UgaGFyZHdh
cmUgdmVyc2lvbmluZywgYW5kIHRodXMsIGl0J3MgZ29vZCB0byBtYWludGFpbgo+Pj4gdGhlIGNv
bnNpc3RlbmN5Lgo+Pgo+PiBIaSBEbWl0cnksCj4+Cj4+IEkgYmVsaWV2ZSBLcnp5c3p0b2YgaXMg
d2FpdGluZyBmb3IgQWNrIG9uIHRoZSBiaW5kaW5nIGJlZm9yZSBtZXJnaW5nCj4+IHRoaXMgcGF0
Y2ggKGFuZCB0aGUgcmVzdCksIGJ1dCB1bmZvcnR1bmF0ZWx5IGl0IHdhcyBub3Qgc2VudCB0byB0
aGUKPj4gRFQgbWFpbGluZyBsaXN0IGZvciByZXZpZXcuCgpHb29kIGNhdGNoLCB0aGFuayB5b3Uu
Cgo+IEluZGVlZCBJIGFtIHN0aWxsIHdhaXRpbmcgZm9yIFJvYidzIGFuZCBUaGllcnJ5J3MgYWNr
cyBmb3IgdGhpcyBhbmQgdGhlCj4gZm9sbG93aW5nIHBhdGNoZXMuICBJdCBoYXMgYmVlbiBqdXN0
IGEgd2VlayBzbyBJJ2xsIGdpdmUgaXQgZmV3IG1vcmUKPiBkYXlzLgoKUm9iIGRvZXNuJ3QgcmV2
aWV3IHBhdGNoZXMgd2hpY2ggYXJlbid0IHNlbnQgdG8gdGhlIERUIE1MLCB3aGljaCBpc24ndApj
YydlZCBpbiB2MTAgYnkgYWNjaWRlbnQuIEknbGwgbWFrZSB2MTEuCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
