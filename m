Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FAE265CE7
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 11:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E146E9AA;
	Fri, 11 Sep 2020 09:49:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D226E248
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 22:00:03 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id y4so10133685ljk.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 15:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fYYYff61VtAw9Z/3mr6kGU5nAy8/XuUCDtA3jDKDF6s=;
 b=Qh6UC2TfF6yqcwkTzJdqTqdYeKJgt2k3eTyTF/v5LypgubpX2FitxIqxNDnjtNwdBK
 A7puxJ1hQL/cL4GC8vEzn0w/CoPbvVe9Lmq3EGWnkqPp6r0LrTz1MqZqcbV0oDy9B8mS
 JGYFlTENs53wW2tJ1bSyJRGXbPVNOE+kLvfFjbqGkcKTBWMEoeYABDGtNzuY5EVSXHnX
 6z/JYGoQi1DYWo02CrkiCp5uUMt+XFbJtbTEEJRWdegj0oLbPCmIK2Sga/jrWyczQOha
 yrzdouQL0gRelESVGCAlQ0TA3Wv6NexhtmAZeKOMu2z6GuQTj0Gji3tmQ86wYgyOkmeL
 OBkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fYYYff61VtAw9Z/3mr6kGU5nAy8/XuUCDtA3jDKDF6s=;
 b=br3JXY+y25Ilu72MKOiNBZIQHKCdLgFYscC2Rrgm0tHbr7U8F2/6yXcUhsXYXeYt+9
 j+p4z+cqktXOxA/JxhkxV0ZnjHbe1E5KstEa/9MoRFhvqMvq/rTJa4Yzhnxw4VqZkgQn
 xysvY77egKHFXHZUs+8XDsIvKUe7ScavLd/I6tUY2lzHp96mYuHyU6rdm2Hq95UchE0N
 N9FJm7GtkAU/YWhTSn6C69tw34Yu1HnYErSJ7VArBqwMHruf4heeZXBHKGwFr87NBgZw
 EotvO/4o1OEBjfzPXo4eN8ge+L0CPSM9GLnbVcc6ZKVONCfQw8qdsWa37YyeRjE5XsAb
 lPZw==
X-Gm-Message-State: AOAM530CNgkPBrogExTJoCXW2mCCqqzV1eBMWcPXkYN+lE5fw+4xtzpw
 T5fXMM9clwezecqsXPgly1Q=
X-Google-Smtp-Source: ABdhPJz6xQk+4nZLk2kH3arRb5+HFnZwQTyDkOzhdUh5dW23b4O62EMlch4D1GiopDCUpFcMXaGDPg==
X-Received: by 2002:a2e:b00e:: with SMTP id y14mr5277416ljk.427.1599775202308; 
 Thu, 10 Sep 2020 15:00:02 -0700 (PDT)
Received: from [192.168.2.145] (109-252-170-211.dynamic.spd-mgts.ru.
 [109.252.170.211])
 by smtp.googlemail.com with ESMTPSA id v16sm55225ljc.84.2020.09.10.15.00.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Sep 2020 15:00:01 -0700 (PDT)
Subject: Re: [RFC PATCH v2 09/17] gpu: host1x: DMA fences and userspace fence
 creation
To: Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-10-mperttunen@nvidia.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ceaa95f3-51a1-3fc6-2466-053e21506d6d@gmail.com>
Date: Fri, 11 Sep 2020 01:00:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200905103420.3021852-10-mperttunen@nvidia.com>
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

MDUuMDkuMjAyMCAxMzozNCwgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+ICAKPiAr
c3RhdGljIHZvaWQgYWN0aW9uX3NpZ25hbF9mZW5jZShzdHJ1Y3QgaG9zdDF4X3dhaXRsaXN0ICp3
YWl0ZXIpCj4gK3sKPiArCXN0cnVjdCBob3N0MXhfc3luY3B0X2ZlbmNlICpmID0gd2FpdGVyLT5k
YXRhOwo+ICsKPiArCWhvc3QxeF9mZW5jZV9zaWduYWwoZik7Cj4gK30KPiArCj4gIHR5cGVkZWYg
dm9pZCAoKmFjdGlvbl9oYW5kbGVyKShzdHJ1Y3QgaG9zdDF4X3dhaXRsaXN0ICp3YWl0ZXIpOwo+
ICAKPiAgc3RhdGljIGNvbnN0IGFjdGlvbl9oYW5kbGVyIGFjdGlvbl9oYW5kbGVyc1tIT1NUMVhf
SU5UUl9BQ1RJT05fQ09VTlRdID0gewo+ICAJYWN0aW9uX3N1Ym1pdF9jb21wbGV0ZSwKPiAgCWFj
dGlvbl93YWtldXAsCj4gIAlhY3Rpb25fd2FrZXVwX2ludGVycnVwdGlibGUsCj4gKwlhY3Rpb25f
c2lnbmFsX2ZlbmNlLAo+ICB9OwoKTXkgZXhwZWN0YXRpb24gaXMgdGhhdCB3ZSBzaG91bGQgcmVt
b3ZlIHRoZSBob3N0MXgtd2FpdGVyIGVudGlyZWx5LiBJdApjb21lcyBmcm9tIDIwMTEvMjAxMiBl
cmEgb2YgdGhlIGhvc3QxeCBkcml2ZXIgYW5kIG5vdyBkdXBsaWNhdGVzCmZ1bmN0aW9uYWxpdHkg
cHJvdmlkZWQgYnkgdGhlIGRtYS1mZW5jZSBhbmQgZHJtLXNjaGVkdWxlci4gUGVyaGFwcyBpdApj
b3VsZCBiZSBva2F5IHRvIHJlLXVzZSBleGlzdGluZyBjb2RlIGZvciB0aGUgc3RhcnRlciwgYnV0
IHRoaXMgaXMKc29tZXRoaW5nIHRvIGtlZXAgaW4gbWluZCB0aGF0IGl0IG1heSBiZSBiZXR0ZXIg
bm90IHRvIHB1dCBtdWNoIGVmZm9ydAppbnRvIHRoZSBvbGRlciBjb2RlLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
