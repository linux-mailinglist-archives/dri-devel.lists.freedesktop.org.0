Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44460265CDE
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099346E9A6;
	Fri, 11 Sep 2020 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CF2D6E248
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 21:59:17 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r24so10210010ljm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 14:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=P0Za68nuyfi22NrUP0ghwmTHXjnpe+uzTnxMmdI4ak8=;
 b=N+EdAMcEjkQ4+TOlFDUb1m5uXnHnMmR+Ft57lSMvtCUzDQFjt9e/KPpcDUeVpr1gkZ
 CgVhPeuKxFc2q5cUKAsASkfUHoDjxH00M9uo1GUcWEAAAOHpJIzR4aLZiWa7tUXMaogO
 sxLYJiJCe1JK1qL9+VkM6o8LO6gxziOxFC6Mx1lgOjIubo7HDzZ5Ux5p0soPYzoaxD9r
 ZmbhadGURZ02J1rl3Rgu8/aW8sVDWJbgGF9YLO9mAO7QwcfH+akzSRiClk19+TjXGbgr
 DnTXHG3H88jNrUckYzU0toPmLwd6Befx1apqk1uVOn7qccp2TtJD57kJMxbTqY/c7nJ7
 d2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=P0Za68nuyfi22NrUP0ghwmTHXjnpe+uzTnxMmdI4ak8=;
 b=Ggvhe020T11+SOZFj/fEZrm/g8VI/lUc6guJJeHiaEupsLWsVpezxMwlUfWFsr4ETP
 n6nXGA/ricGIJH0+AIA8I1p3o3RbAzJi3hYLuWdpGyCLJj5mXebtIDNQvzibDDPu+W3S
 FLujwlontB35dOwA7yzP+Ma9vk/umCSyedv2dvvwqqC6w2H+2FyitoiDFx6e+Nn+JGzm
 4pjcV4yOBxhto2RFNIfqrG7oLIKYkxpwiTeIg3S6jhGolDrV0G0Piccn1dDfHn+5QQJG
 vP2twxaR0SQfd0Xl/lFvCUm8oXuWEfJ5vMN631VsyVa388WZmk4qA0m1Po/UpGxL/dk2
 IcMQ==
X-Gm-Message-State: AOAM530J0PNjIVENtTjB2cXNebbT2MxV2rrQCQN07Ih2iEnAwVroDTuq
 r3+pkO7EyHwyIybNcpjJNb0=
X-Google-Smtp-Source: ABdhPJzDUM/L8dQLJ/z3JpaVqgpJ3/CigX4aAMEfraLDM5pMbv9KNzqIbcFb5aMAgrsBKGASVurDOw==
X-Received: by 2002:a05:651c:1248:: with SMTP id
 h8mr5973891ljh.225.1599775155681; 
 Thu, 10 Sep 2020 14:59:15 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id g15sm58791ljj.39.2020.09.10.14.59.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 14:59:15 -0700 (PDT)
Subject: Re: [RFC PATCH v2 17/17] WIP: drm/tegra: Implement new UAPI
To: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com,
 airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-18-mperttunen@nvidia.com>
 <a238707e-942b-2996-5644-71811d4cee72@gmail.com>
 <80bfc415-a7b1-829f-3ce0-c81111ed1f19@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <105833f7-b63b-89a9-04b5-4421a087b21a@gmail.com>
Date: Fri, 11 Sep 2020 00:59:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <80bfc415-a7b1-829f-3ce0-c81111ed1f19@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 11 Sep 2020 09:49:36 +0000
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

MDkuMDkuMjAyMCAxMToxOSwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+Pj4gK8Kg
wqDCoCBpZiAoIWpvYl9kYXRhLT51c2VkX21hcHBpbmdzKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiAtRU5PTUVNOwo+Pj4gKwo+Pj4gK8KgwqDCoCBmb3IgKGkgPSAwOyBpIDwgYXJncy0+bnVt
X2J1ZnM7IGkrKykgewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvcHlfZXJyID0gY29weV9mcm9tX3Vz
ZXIoJmJ1ZiwgdXNlcl9idWZzX3B0citpLCBzaXplb2YoYnVmKSk7Cj4+Cj4+IFdob2xlIGFycmF5
IGFsd2F5cyBzaG91bGQgYmUgY29waWVkIGF0IG9uY2UuIFBsZWFzZSBrZWVwIGluIG1pbmQgdGhh
dAo+PiBlYWNoIGNvcHlfZnJvbV91c2VyKCkgaGFzIGEgY3B1LXRpbWUgY29zdCwgdGhlcmUgc2hv
dWxkIG1heGltdW0gdXAgdG8gMgo+PiBjb3B5aW5ncyBwZXIgam9iLgo+Pgo+IAo+IE9LLiBCVFcs
IGRvIHlvdSBoYXZlIHNvbWUgcmVmZXJlbmNlL251bWJlcnMgZm9yIHRoaXMgb3IgaXMgaXQgYmFz
ZWQgb24KPiBncmF0ZS1kcml2ZXIgZXhwZXJpZW5jZT8KCkkgaGFkIG51bWJlcnMgYWJvdXQgMiB5
ZWFycyBhZ28gd2hpbGUgd2FzIHByb2ZpbGluZyBqb2Igc3VibWlzc2lvbgpsYXRlbmN5IHVzaW5n
IGhvc3QxeC10ZXN0cyBhbmQgZm9yIGEgc2ltcGxlIGpvYnMgdGhlcmUgd2FzIGEgdmlzaWJsZQpk
aWZmZXJlbmNlIGNhdXNlZCBieSBlYWNoIGNvcHlfZnJvbV91c2VyKCksIGttYWxsb2MoKSBhbmQg
aGF2aW5nCmZpcmV3YWxsIGZ1bmN0aW9ucyB1bmlubGluZWQuCgpPZiBjb3Vyc2UgaXQgd2Fzbid0
IGNyaXRpY2FsLCBidXQgaXQncyBhbHNvIG5vdCBkaWZmaWN1bHQgdG8gb3B0aW1pemUKc3VjaCB0
aGluZ3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
