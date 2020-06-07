Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569351F1377
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 09:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6646E47E;
	Mon,  8 Jun 2020 07:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D9356E1F4
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jun 2020 21:48:01 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id 82so9006718lfh.2
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jun 2020 14:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ay8EHASwjhU1bjGhoJPlUWvuPWuHbO/3W1nJ49RR5ag=;
 b=VXUjmROcDERX9tK85WWAf5vfiKHroxFpPZt28aMBYRGZJrksc/ZUrpeM9TsQMSJYhE
 DCITogpNAOT9Fc+Gi+ICLkihzUbwLylqKb/dcK0HtK1cI+ZK0ifujYEBYE3Zm5T0bI7/
 ndXyIvGU5qnUYWG7cgegvpLWugs08MGmrb1n9B+z4fvgrsP1ufvxgTT4i+A52SSOcCFI
 UJcJC7/316SDrGbaTqwo+5Zb5uvFbANULzWL3G0apNvUCEde3IQKRFBLhyodvRGYgU2t
 6PIVdLaYwdOjQR3mMPlA/+QkUOYQbs2wLgcTNhwK37jZoFCfK29uk5xOHFMGZwPwb5QA
 iZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ay8EHASwjhU1bjGhoJPlUWvuPWuHbO/3W1nJ49RR5ag=;
 b=toDfUuNF54OT/4Xh4mRTS06vl+NQ6OAils/4auNYNqtu5PaRZVThD8m8N8Z7gtlaZ0
 +Cskv+rUC0+TsnOd31G4SJ4vzNN2xcNR+CiLqWKSsqMbwdqBSWHzKOLjNarAC2SxjZNN
 0KXgUgz0XMTcsSGKi1LyHaXCJqmtYmWzcvMBllDDyK21abBpoXWHkxSARHdJF1ZgLp81
 wGddgw9ar7FMpppiMKmekCz7zDem/rnnHiD3VW/aRsvm2YqBFxpKnfRWLo5iZylF1qDJ
 CEkSWxeEIluawA9z+LO1D6JmcuXHIMB473zvw9ELGlvAz1xtgjjnKGT/0PHqZwbDsT3i
 QVyw==
X-Gm-Message-State: AOAM53124Bq04Kit88XLsAnQc/qAQW8osdLLXyE1EHA++UAQmDfl+tmu
 AR9pu+iGowYn4eTzerV8eiQ=
X-Google-Smtp-Source: ABdhPJz+DegAGZHDYRJIlKVV0XxJ0lW/Q/FEgvkvROG5VVEspAJPGPKSKwJCvEcs43RZ2CG7mC0kdQ==
X-Received: by 2002:a05:6512:3b6:: with SMTP id
 v22mr10767583lfp.97.1591566479992; 
 Sun, 07 Jun 2020 14:47:59 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id u30sm3325110ljd.94.2020.06.07.14.47.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Jun 2020 14:47:59 -0700 (PDT)
Subject: Re: [PATCH v3 31/39] memory: tegra20-emc: Register as interconnect
 provider
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
References: <20200607185530.18113-1-digetx@gmail.com>
 <20200607185530.18113-32-digetx@gmail.com>
Message-ID: <89b690be-d2fa-a679-5773-d5906a93ffcc@gmail.com>
Date: Mon, 8 Jun 2020 00:47:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200607185530.18113-32-digetx@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Mon, 08 Jun 2020 07:21:26 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDcuMDYuMjAyMCAyMTo1NSwgRG1pdHJ5IE9zaXBlbmtvINC/0LjRiNC10YI6Ci4uLgo+ICsJaWYg
KElTX0VOQUJMRUQoQ09ORklHX0lOVEVSQ09OTkVDVCkpIHsKPiArCQllcnIgPSB0ZWdyYV9lbWNf
aW50ZXJjb25uZWN0X2luaXQoZW1jKTsKPiArCQlpZiAoZXJyKQo+ICsJCQlkZXZfZXJyKCZwZGV2
LT5kZXYsICJmYWlsZWQgdG8gaW5pdGlhbGl6ZSBJQ0M6ICVkXG4iLAo+ICsJCQkJZXJyKTsKPiAr
CX0KCkl0IGp1c3Qgb2NjdXJyZWQgdG8gbWUgdGhhdCBJIGNvbXBsZXRlbHkgZm9yZ290IHRvIHJl
bW92ZSB0aGUKSVNfRU5BQkxFRCgpIGFuZCBjaGFuZ2UgS2NvbmZpZyB0byBwcm9wZXJseSBzZXQg
dXAgdGhlIGJ1aWxkIGRlcGVuZGVuY3kKb24gaW50ZXJjb25uZWN0LiBXaWxsIGNvcnJlY3QgaXQg
aW4gdjQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
