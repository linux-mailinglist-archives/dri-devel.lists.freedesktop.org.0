Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA352627E4
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E0F6E9ED;
	Wed,  9 Sep 2020 07:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118366E8CF
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 00:48:00 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r24so1285667ljm.3
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 17:47:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=SMdtemqsHrC7o2SwRp4RF1GGbfg74NwIjMRJECxbRjg=;
 b=A6safOFVJudoa5KZgxHa40b1VjmyEAResenlwBJm8UdX66WMmzPKH8MQLppjRuhXCe
 i246XM1RX9yH7bTB2RoJadAjq6ze/x10FbRqKO9HEKqMNV6ymKTkShdum+B/4AOx/zGx
 8rPK9LJ2zGU+JT+gAB2y+/Mf5k0XxD9TtlmVKuG4NOs0t4TdfgYnrbdX/aj+SkGBRSHZ
 bUzXf16omi9QLz8zy06oPIxIBoJ4Ami4AJ/F329wXRvMEZ2COdkQA7phoNTTkUnZU3IY
 iF7qLxuVjEsqECWmVWl6jz4E6DxlLdvMUnaH3aGvn7QO5Etcdjd7yIzlp7eyaTFFWJIi
 UeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=SMdtemqsHrC7o2SwRp4RF1GGbfg74NwIjMRJECxbRjg=;
 b=bgBnSmji2kGXw94GxCpR3N4ZN/JWY6KT7o3oluaJA+FpXAdKFqgQKt6ihKaQ2GgCy5
 xPnzSA2TCYn79Dpevm1TdGkPud53Tn5B+kI9rirtyQs8UdHkGtOqakcclx4Q55kkGu8v
 CwvEbDLvZDvKfoMUtlQRPE84Kr2wN5AQamBHk7Kt0LLSeVZj/qtjjoXDL86Tdhw1OCJ5
 u4zQ9x4sZDBNMpQsmoyYWQCTurBndkb+KEfEAiLOYKs8ZZXQ9fAJaETgDHqeHZ5E4K23
 9mcGLQUFE+90OQM2ZxaXah61TVv+L9683bTIgsPTUXK4+bRJOtU/bDGlaxRqe4OCd+Lp
 m92A==
X-Gm-Message-State: AOAM5336xdOC5g8Q27TczuQ/iiLZyv6XgMonQzwQ1Wi6nwIiOsLkBNmr
 R/SJjeFfC+3Kfxo0FSRpYSOr1mk41N0=
X-Google-Smtp-Source: ABdhPJwr/efLVkk/+qq6gi9+5qG2YFjdBaSAZj7M+c0wuI8sGQ9/uZzdTrSml9/a/BkOM3fGBtqVvg==
X-Received: by 2002:a2e:8552:: with SMTP id u18mr533748ljj.359.1599612478506; 
 Tue, 08 Sep 2020 17:47:58 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id k10sm312223lja.112.2020.09.08.17.47.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 17:47:57 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <a238707e-942b-2996-5644-71811d4cee72@gmail.com>
Date: Wed, 9 Sep 2020 03:47:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-18-mperttunen@nvidia.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 09 Sep 2020 07:04:23 +0000
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Cj4gK3N0YXRpYyBp
bnQgc3VibWl0X3Byb2Nlc3NfYnVmcyhzdHJ1Y3QgZHJtX2RldmljZSAqZHJtLCBzdHJ1Y3QgZ2F0
aGVyX2JvICpibywKPiArCQkJICAgICAgIHN0cnVjdCB0ZWdyYV9kcm1fam9iX2RhdGEgKmpvYl9k
YXRhLAo+ICsJCQkgICAgICAgc3RydWN0IHRlZ3JhX2RybV9jaGFubmVsX2N0eCAqY3R4LAo+ICsJ
CQkgICAgICAgc3RydWN0IGRybV90ZWdyYV9jaGFubmVsX3N1Ym1pdCAqYXJncywKPiArCQkJICAg
ICAgIHN0cnVjdCB3d19hY3F1aXJlX2N0eCAqYWNxdWlyZV9jdHgpCj4gK3sKPiArCXN0cnVjdCBk
cm1fdGVncmFfc3VibWl0X2J1ZiBfX3VzZXIgKnVzZXJfYnVmc19wdHIgPQo+ICsJCXU2NF90b191
c2VyX3B0cihhcmdzLT5idWZzX3B0cik7CgpJZiBhc3NpZ25tZW50IG1ha2VzIGxpbmUgdG9vIGxv
bmcsIHRoZW4gZmFjdG9yIGl0IG91dC4KCiAgc3RydWN0IGRybV90ZWdyYV9zdWJtaXRfYnVmIF9f
dXNlciAqdXNlcl9idWZzX3B0cjsKCiAgdXNlcl9idWZzX3B0ciA9IHU2NF90b191c2VyX3B0cihh
cmdzLT5idWZzX3B0cik7Cgo+ICsJc3RydWN0IHRlZ3JhX2RybV9tYXBwaW5nICptYXBwaW5nOwo+
ICsJc3RydWN0IGRybV90ZWdyYV9zdWJtaXRfYnVmIGJ1ZjsKPiArCXVuc2lnbmVkIGxvbmcgY29w
eV9lcnI7Cj4gKwlpbnQgZXJyOwo+ICsJdTMyIGk7Cj4gKwo+ICsJam9iX2RhdGEtPnVzZWRfbWFw
cGluZ3MgPQo+ICsJCWtjYWxsb2MoYXJncy0+bnVtX2J1ZnMsIHNpemVvZigqam9iX2RhdGEtPnVz
ZWRfbWFwcGluZ3MpLCBHRlBfS0VSTkVMKTsKClRoZSBjaGVja3BhdGNoIHNob3VsZCBkaXNhbGxv
dyB0aGlzIGNvZGluZyBzdHlsZS4gSSdkIHdyaXRlIGl0IGFzOgoKc2l6ZV90IHNpemU7CgpzaXpl
ID0gc2l6ZW9mKCpqb2JfZGF0YS0+dXNlZF9tYXBwaW5ncyk7CmpvYl9kYXRhLT51c2VkX21hcHBp
bmdzID0ga2NhbGxvYyhhcmdzLT5udW1fYnVmcywgc2l6ZS4uKTsKCj4gKwlpZiAoIWpvYl9kYXRh
LT51c2VkX21hcHBpbmdzKQo+ICsJCXJldHVybiAtRU5PTUVNOwo+ICsKPiArCWZvciAoaSA9IDA7
IGkgPCBhcmdzLT5udW1fYnVmczsgaSsrKSB7Cj4gKwkJY29weV9lcnIgPSBjb3B5X2Zyb21fdXNl
cigmYnVmLCB1c2VyX2J1ZnNfcHRyK2ksIHNpemVvZihidWYpKTsKCldob2xlIGFycmF5IGFsd2F5
cyBzaG91bGQgYmUgY29waWVkIGF0IG9uY2UuIFBsZWFzZSBrZWVwIGluIG1pbmQgdGhhdAplYWNo
IGNvcHlfZnJvbV91c2VyKCkgaGFzIGEgY3B1LXRpbWUgY29zdCwgdGhlcmUgc2hvdWxkIG1heGlt
dW0gdXAgdG8gMgpjb3B5aW5ncyBwZXIgam9iLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
