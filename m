Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F972A9157
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:34:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A8F56E1A4;
	Fri,  6 Nov 2020 08:34:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95796ED23
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 13:50:12 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id e27so2388413lfn.7
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 05:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=BGf3d80TYyIHjeoe0Cx5j/BQSsVOIev2ck0Z+AT+MFA=;
 b=e/YUri2q0AwoOKKb1hssOsWev/ladQj20yWBAgFxnUNTYPuKAryxtqcYYrUISJJ2vJ
 a39gIjb9Q6RQodOmBYioJczfUGlxshFy0MIDvx8eciIyRnKwFCz9pYD5SZ5VsLVB0P2d
 Q7kV7TXr6dL2Din/S+YXymcmnfrKHOT7zNHnfoxy0dNlpav+Mzo404f+CVsqX1zbaJ/g
 onGRaUTFnfQBBKoENk8PA1NFM291/PawkHb59+q5reczpOTIyfrOlRcn7TgYflcAwMep
 ThY5zx+sEIT5sFbV4XmKRVPBcNOT3QEfQW5tx/aib/VeQPU8waOAyqnvBsTNdnl/gM+c
 v9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=BGf3d80TYyIHjeoe0Cx5j/BQSsVOIev2ck0Z+AT+MFA=;
 b=UKbdCJFLjl1WxamTx5DzSs7BjgETB7V9r+8qzDvUaQU2TYIQn/mQtWA5n8PcwhxLeK
 HYPmkBgP8XPaJjNmt97N7iNH+cZf6yXBn141fZvgkpoC72UrZ9vSXXLAPwWa96F+Wx7u
 /ce/hAA3LATjgZM5iScC8DBdwO0vXqijob3H0U3EExti+teFnRlWAbd8pyN2c3FJL3MU
 2/WBWfjGrcxf05LQ3rPmfIaIv9c/BUwUfLFC8DQXSlBE4PgODG1wJ/5/m2x6neIbb655
 rWlQ/xz5PTS0i27sBQ0shIkfsAmSRbJN7Bo2j2XfcXdJRbX1LuWrSBZ0r5lw5+l25tHg
 B02g==
X-Gm-Message-State: AOAM532TiDwaDMJArAc5PGMsADxOiUJWS4iQk2ZoNo5FZeN7jZg5BGGc
 JZ7GRtJi1xuFfwjMfcaG4zk=
X-Google-Smtp-Source: ABdhPJx4ilpDj4/kx22rJ8VjlNT5VilKN2NSj8RSq3TaJ+NHg1ZFId48j+Ws8coKg74/KdbqiehQTw==
X-Received: by 2002:a19:8755:: with SMTP id j82mr951404lfd.511.1604584211377; 
 Thu, 05 Nov 2020 05:50:11 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-83.dynamic.spd-mgts.ru.
 [109.252.192.83])
 by smtp.googlemail.com with ESMTPSA id f9sm155946ljg.53.2020.11.05.05.50.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 05:50:10 -0800 (PST)
Subject: Re: [PATCH v7 47/47] PM / devfreq: tegra20: Deprecate in a favor of
 emc-stat based driver
To: Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mikko Perttunen
 <cyndis@kapsi.fi>, Viresh Kumar <vireshk@kernel.org>,
 Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
References: <20201104164923.21238-1-digetx@gmail.com>
 <CGME20201104165117epcas1p1fe44f76f99454bcbbbf8b26882422224@epcas1p1.samsung.com>
 <20201104164923.21238-48-digetx@gmail.com>
 <cdceb3f7-9c58-5d2c-70ab-7947b4cb173e@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <164ea4c7-f770-445a-fe1a-31ddc49068be@gmail.com>
Date: Thu, 5 Nov 2020 16:50:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cdceb3f7-9c58-5d2c-70ab-7947b4cb173e@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 06 Nov 2020 08:34:42 +0000
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMTEuMjAyMCAwNToyNSwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5LAo+
IAo+IFlvdSBuZWVkIHRvIHVwZGF0ZSB0aGUgTUFJTlRBSU5FUlMgZmlsZSBhYm91dCB0ZWdyYTIw
LWRldmZyZXEuYwo+IAo+IDExMzQzIE1FTU9SWSBGUkVRVUVOQ1kgU0NBTElORyBEUklWRVJTIEZP
UiBOVklESUEgVEVHUkEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gMTEzNDQgTTog
ICAgICBEbWl0cnkgT3NpcGVua28gPGRpZ2V0eEBnbWFpbC5jb20+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAKPiAxMTM0NSBMOiAgICAgIGxpbnV4LXBtQHZnZXIua2VybmVs
Lm9yZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+IDEx
MzQ2IEw6ICAgICAgbGludXgtdGVncmFAdmdlci5rZXJuZWwub3JnICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgCj4gMTEzNDcgVDogICAgICBnaXQgZ2l0Oi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NoYW53b28vbGludXguZ2l0ICAg
ICAKPiAxMTM0OCBTOiAgICAgIE1haW50YWluZWQgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIAo+IDExMzQ5IEY6ICAgICAgZHJpdmVy
cy9kZXZmcmVxL3RlZ3JhMjAtZGV2ZnJlcS5jICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgCj4gMTEzNTAgRjogICAgICBkcml2ZXJzL2RldmZyZXEvdGVncmEzMC1kZXZmcmVx
LmMgCj4gCj4gRXhjZXB0IG9mIG1pc3NpbmcgdGhlIHVwZGF0aW5nIG9mIE1BSU5UQUlORVJTLAo+
IEFja2VkLWJ5OiBDaGFud29vIENob2kgPGN3MDAuY2hvaUBzYW1zdW5nLmNvbT4KCkhlbGxvIENo
YW53b28sCgpHb29kIGNhdGNoISBUaGFuayB5b3UhCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbAo=
