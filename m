Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D98153FEB
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C73C6F9FB;
	Thu,  6 Feb 2020 08:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B346E9D2
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 17:11:35 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k11so3664444wrd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 09:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xcrHDAezSaTXU9W0CiG8B79nhRicq7n5xdAIP7nXKmc=;
 b=IuDQ8sm2ZLcPoza2tVFcOfFt6nFJhGJerML1eDTgjQgcs7cn8iXtizKtqOCERM5pCP
 N73C4kgDl9s+t6CMD5VWfBAj212FEMtyaN0WA5/E8J9Z9D60o6SkpYZGfFGKTXgMHiQg
 0n0Zey6kQBJ2+qSIR1RkAOlPTvYQCxGu3fkqbskDL+SoOZoZimgPwxUcNQxcO2cGqaFg
 sojMh9akGHrC1Kr80JOcc3Bt2hsyvmTA9PEIBkcp58UmK+lmH4TAhvtS+IRJwf+FRARX
 kSVphT6IiRNtQq/W2tUqah+nhhdD81ccj9qvWQ+y6+SVHw8jKmZkgID6LAqjLulYlrSo
 7ArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xcrHDAezSaTXU9W0CiG8B79nhRicq7n5xdAIP7nXKmc=;
 b=lXG7ARFZhYcspKiw+7lMcXj38T+D4u9cZ93JoCIyQ7PDrorPSOF/oEzdqi+xISoZFN
 mkuMl95cNUrHvgEKdo6hn/EmVqiagRIhH1VzPtIGEIhoIUvTpSC3a+whXz/+gdxu5QlR
 3Y9A1U0+rYPSWty5fBtDu4hhDQhCpXyGBVjKskNHpy+h/yNArqxF16UycGhpkjgK4uX6
 CNQcyuDbbphtUCcQ+NXZsEr6TMe2A0/mmtcXcoyx8WFbGvaCBYbTqhoGoDhVt7gnVwKe
 Fp4Kwywh4Vt9QUhEUfl/gXyJHJfLGfdG/Z0ywf0tiOYPlaxsafU2/enu2S7QzbdWILbC
 ZC4g==
X-Gm-Message-State: APjAAAWS24+v3HVJp6nEvwujiORGInA4xxRP+XIZa8JxQhndp/xydfNO
 FO4vN8gdyVq/WHbfj5IZ3dWUskwt
X-Google-Smtp-Source: APXvYqxQIGvcAQBR135Kh2tZ/tyHP6cP9ISDXOJJKhVvMoJ3x4d19nmSKRseWEEmuMOJqwR/5sdBXA==
X-Received: by 2002:a5d:6411:: with SMTP id z17mr31421393wru.57.1580922693067; 
 Wed, 05 Feb 2020 09:11:33 -0800 (PST)
Received: from [192.168.2.145] (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.googlemail.com with ESMTPSA id s139sm222055wme.35.2020.02.05.09.11.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Feb 2020 09:11:32 -0800 (PST)
Subject: Re: [PATCH 1/3] drm/tegra: Relax IOMMU usage criteria on old Tegra
To: Thierry Reding <thierry.reding@gmail.com>
References: <20200204135926.1156340-1-thierry.reding@gmail.com>
 <20200204135926.1156340-2-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <20898e15-5120-c7cb-4234-18dce8c317f3@gmail.com>
Date: Wed, 5 Feb 2020 20:11:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20200204135926.1156340-2-thierry.reding@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDQuMDIuMjAyMCAxNjo1OSwgVGhpZXJyeSBSZWRpbmcg0L/QuNGI0LXRgjoKPiBGcm9tOiBUaGll
cnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IAo+IE9sZGVyIFRlZ3JhIGRldmljZXMg
b25seSBhbGxvdyBhZGRyZXNzaW5nIDMyIGJpdHMgb2YgbWVtb3J5LCBzbyB3aGV0aGVyCj4gb3Ig
bm90IHRoZSBob3N0MXggaXMgYXR0YWNoZWQgdG8gYW4gSU9NTVUgZG9lc24ndCBtYXR0ZXIuIGhv
c3QxeCBJT01NVQo+IGF0dGFjaG1lbnQgaXMgb25seSBuZWVkZWQgb24gZGV2aWNlcyB0aGF0IGNh
biBhZGRyZXNzIG1lbW9yeSBiZXlvbmQgdGhlCj4gMzItYml0IGJvdW5kYXJ5IGFuZCB3aGVyZSB0
aGUgaG9zdDF4IGRvZXNuJ3Qgc3VwcG9ydCB0aGUgd2lkZSBHQVRIRVIKPiBvcGNvZGUgdGhhdCBh
bGxvd3MgaXQgdG8gYWNjZXNzIGJ1ZmZlcnMgYXQgaGlnaGVyIGFkZHJlc3Nlcy4KPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgo+IC0tLQo+ICBk
cml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgfCA0OSArKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzMiBpbnNlcnRpb25zKCspLCAxNyBkZWxl
dGlvbnMoLSkKClRlc3RlZC1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
