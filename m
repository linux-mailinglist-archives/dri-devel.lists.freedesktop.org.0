Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7062627D0
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 09:04:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B7816E9CD;
	Wed,  9 Sep 2020 07:04:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC27D6E157
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Sep 2020 23:45:48 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id m5so593794lfp.7
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Sep 2020 16:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=nqlCz46v8uEccjihDR7hwRP+AvQ7XUetwVJ3dIAkBHs=;
 b=WEavzin2dbCwe3OR8nfls/ct+e+8t4vqn5qaOhGa+SaF7IhZTJZE0yw3KdwivEcs+D
 URkeQzxSD21GUX6RexWB4Jzh9cM7fjE7VBTZ5rMTYwz6rvH2qTZwvyjOubiORS+tWj6P
 3FRPiHJmAjWgB2LqUAdFJAaAyA4y+iKf+aQL6YF8TpOtLo2gCLirtMykVyJUlD+tyouJ
 kJLcT0lVs+BDjRaSUCF5GbQ3BJfovnBcVrv2w1DyuqUFxFdbydN6NR+hv7PP6tz9pbba
 pHKoRYlC6ekkDfpQdf9GwzOHM4dau6ziHaWAc4XcQ9mVnIN8HvxcDvk7SLQ2TMH6vHTB
 ef7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nqlCz46v8uEccjihDR7hwRP+AvQ7XUetwVJ3dIAkBHs=;
 b=pqNn4R+9TGR+FBSlacBtGRaOTyRRE4Jiqe74YrM0DCpbtlh6N09HIUykuL0sIyd3Ip
 N8FoXC2JzI3OwjiHD7V0VZMiVoEicP7trzO4V63KnxAwarsMvXK269BpP4Azxmxb7IZV
 skMIxf2lD1DRwOH3y/kyC4MKHlsbp8aMjShr92o0kBhXoPueTl+EuFJAiK+pVmHKdt1F
 kZXVWPpCdnKU7i69i8gk2UKlumLxYy+XtRounfU8MGxHDQKC3Z3X1LoATaA3Pv3DxF5k
 hVjLVlvKwEgxWbKvMGYSFKI3Xad6WIilwco/XIEFIU8dXMaGTMuYgqdeuDE1irIIP/qd
 Dkmw==
X-Gm-Message-State: AOAM532SDiaMcUuMUwaV/NYOMeaxKFdntUbg4Yx30hAjWLgqCnC6ghhk
 3ZEQmonpydGx2h1+6vN+cEE=
X-Google-Smtp-Source: ABdhPJxo2Ga1dKmNB9jgq0d28QRcFB87v0Oc/CYACd2OyEX1sAaMhbJT2su4e8iz4Dwz4Kijd0DK/w==
X-Received: by 2002:ac2:4891:: with SMTP id x17mr637981lfc.28.1599608747417;
 Tue, 08 Sep 2020 16:45:47 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id q17sm200279lfd.37.2020.09.08.16.45.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Sep 2020 16:45:46 -0700 (PDT)
Subject: Re: DRM_TEGRA_SUBMIT_BUF_WRITE_RELOC
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-15-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <54aff7f1-86b2-6bd7-1e47-2078edcf94b3@gmail.com>
Date: Wed, 9 Sep 2020 02:45:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-15-mperttunen@nvidia.com>
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

MDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+ICsvKiBT
dWJtaXNzaW9uICovCj4gKwo+ICsvKiogUGF0Y2ggYWRkcmVzcyBvZiB0aGUgc3BlY2lmaWVkIG1h
cHBpbmcgaW4gdGhlIHN1Ym1pdHRlZCBnYXRoZXIuICovCj4gKyNkZWZpbmUgRFJNX1RFR1JBX1NV
Qk1JVF9CVUZfV1JJVEVfUkVMT0MJCSgxPDwwKQoKU2hvdWxkbid0IHRoZSBrZXJuZWwgZHJpdmVy
IGJlIGF3YXJlIGFib3V0IHdoYXQgcmVsb2NhdGlvbnMgbmVlZCB0byBiZQpwYXRjaGVkPyBDb3Vs
ZCB5b3UgcGxlYXNlIGV4cGxhaW4gdGhlIHB1cnBvc2Ugb2YgdGhpcyBmbGFnPwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
