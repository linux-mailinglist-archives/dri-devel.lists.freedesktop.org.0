Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFE5211CDA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:25:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EF86EA73;
	Thu,  2 Jul 2020 07:24:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A296E4F1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 23:41:07 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id t9so14733552lfl.5
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 16:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RRbpFTrpv2CAyc73C39i4Eh5fUq8y8ua8EeETi+isng=;
 b=rIOsGHd2+UGL+iszD1JJDQkzBEEDzUF0t4Ww/jguiyg3EmeFGYUlODeIQcGLWkMBU6
 F4c6vdB9WBAxG8nc5C4n2l8rhBxP47vpZ7xH5yBRJlLx1ed0vD5uB+h7jUGmprpZ2Vi6
 eN20HFNMgQfmODS7LwYGJd5KtpGUElA2mAtmWVQACQWUK9B2e7QuYRcr6/RgyuSRvDFh
 L2E/BDeJBHN/0Mt18JmoeStrgbMHA+5aaYWbGSOoHE53KYOOlhavE9GqfyT3SjHgIiOj
 Jhk/q6w18OQxpkxz6LDXO6P7kox7XYZc8KAsr9iZgqUi7+lcR3uWnbt6HzOpJaIZRKBl
 muPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RRbpFTrpv2CAyc73C39i4Eh5fUq8y8ua8EeETi+isng=;
 b=tSGxE1roHq//ELJ1ATG44tJbujMb5GaRgFvqQ1ORRT4IFNMIkwwsGylbGXbetNiWnC
 gED4E5rXFSblRKQGFnGM5Sqs3jJAU7mJXHAtMQyaXqJf9UG91aJ21/hx5XDa6mNXUGO1
 fQxtrmSFrR0rp+f1v7mHaXgLDTw0wZwcLaq8N4HiSPi+8kMrvreWB+EyZ3csBJjPoCAE
 E0auHzLjQn2MTVfMxGlDjxM1XX9JQumjF9Ob5fpnVnWEE0URQvWTDqeAYuO5yPbqGQ5w
 Oa530zdrPVMDvyQyFiTBe8l/EWaXlqvOMSN8FNKvJuL45/Zy87aGQKX0nS9yUjAIp6Zh
 s2QA==
X-Gm-Message-State: AOAM53370JLAZf/D0Bof8cVz2yFn1ZnVNCjLhyeq++H3AG6rgdeDN3a9
 wQ03j/EgsiRLnMxio7Q/ah137gx7vaE=
X-Google-Smtp-Source: ABdhPJz6pai9jEk4qOJM3yHcyoJZJ3X5EJNiH6TMgrwAtCtMNVi1xc0abdH95NFEfjbBLreScuwj3A==
X-Received: by 2002:a19:23cc:: with SMTP id
 j195mr16661019lfj.210.1593646865567; 
 Wed, 01 Jul 2020 16:41:05 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id l5sm2864306lfp.9.2020.07.01.16.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 16:41:04 -0700 (PDT)
Subject: Re: [PATCH v4 27/37] interconnect: Relax requirement in
 of_icc_get_from_provider()
To: Georgi Djakov <georgi.djakov@linaro.org>
References: <20200609131404.17523-1-digetx@gmail.com>
 <20200609131404.17523-28-digetx@gmail.com>
 <3b410ea3-26d3-6f7a-213c-40dbabbde8d1@linaro.org>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <95f476ce-081d-a222-2b98-96e6f8217c30@gmail.com>
Date: Thu, 2 Jul 2020 02:41:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3b410ea3-26d3-6f7a-213c-40dbabbde8d1@linaro.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, linux-tegra@vger.kernel.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMDcuMjAyMCAyMDoxMCwgR2VvcmdpIERqYWtvdiDQv9C40YjQtdGCOgo+IEhpIERtaXRyeSwK
PiAKPiBPbiA2LzkvMjAgMTY6MTMsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gRnJvbTogQXJ0
dXIgxZp3aWdvxYQgPGEuc3dpZ29uQHNhbXN1bmcuY29tPgo+Pgo+PiBUaGlzIHBhdGNoIHJlbGF4
ZXMgdGhlIGNvbmRpdGlvbiBpbiBvZl9pY2NfZ2V0X2Zyb21fcHJvdmlkZXIoKSBzbyB0aGF0IGl0
Cj4+IGlzIG5vIGxvbmdlciByZXF1aXJlZCB0byBzZXQgI2ludGVyY29ubmVjdC1jZWxscyA9IDwx
PiBpbiB0aGUgRFQuIEluIGNhc2UKPj4gb2YgdGhlIGRldmZyZXEgZHJpdmVyIGZvciBleHlub3Mt
YnVzLCAjaW50ZXJjb25uZWN0LWNlbGxzIGlzIGFsd2F5cyB6ZXJvLgo+Pgo+PiBTaWduZWQtb2Zm
LWJ5OiBBcnR1ciDFmndpZ2/FhCA8YS5zd2lnb25Ac2Ftc3VuZy5jb20+Cj4+IFtkaWdldHhAZ21h
aWwuY29tOiBhZGRlZCBjZWxsc19udW0gY2hlY2tpbmcgZm9yIG9mX2ljY194bGF0ZV9vbmVjZWxs
KCldCj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4K
PiAKPiBJIGhhdmUgYWxyZWFkeSBhcHBsaWVkIHRoZSBvcmlnaW5hbCBwYXRjaCBieSBBcnR1ciwg
c28gcGxlYXNlIG1ha2UgdGhlIGNlbGxzX251bQo+IGNoZWNrIGEgc2VwYXJhdGUgcGF0Y2guCgpP
a2F5LCBJJ2xsIHVwZGF0ZSB0aGlzIHBhdGNoISBUaGFuayB5b3UhCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
