Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8831B671D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9AF06EA45;
	Thu, 23 Apr 2020 22:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F3E06E0D1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 17:15:32 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id u16so7373475wmc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 10:15:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Fsz6yPmVodHIAGKUEkvYHzu/ExufdaJ3lV6EfBbjr/M=;
 b=LS7t6pzEmK1UKWLE+ifdRC16uMDswKS7v+2IPC/TfosO7rAl+qZLKWbjscW8fVMt3v
 1ma+2i4218WDyTaV/Nz10zY4H9KwN0u+ZSJbgg+iuqYMRImmBIYJNaO+GRPQWuMQ7nEn
 EIONqnAxXg1Zp2PZZeAdugJxMad9J6bW2gsLRpfAY8WjqySQzErIR3g+hDarox9ZuWqR
 GnpnaUL95V7dBN0xZRAeWhHOTZeyLhRGhJzZ9oKaENvK3QAePz+ztUbyLI1n2HD+wHEF
 e6D2NNwm3CcIPwegKXhdh8ViXwMsS8Mgh0dzwsOBoq4UFCZZn+OwOqe34GGtYiZxNz0D
 Dn2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Fsz6yPmVodHIAGKUEkvYHzu/ExufdaJ3lV6EfBbjr/M=;
 b=dWuU2HRP07Ghu0jaXmwcTYSFwRxNqm6mEIW5qHgQVIU+9UEwbQuBpvvyzVMk2SgPBA
 9at5K/SNE7G9R+C1kPqXqXmFpzii9g16ds5TRJYCh3n21VnBBn/VV48C7wB/uWpsRpWO
 7qc0URSYdscCF/8r1Ng03jg7p4xjJW3kjiFYrUgtgwXCRYI0W50aheuttEuG7S1I78LM
 MBuNDKvi864YU3BFGI0uuEGmp/1Xq9O451hAoIyqJDuzN1VyVUw2VjHUOPRjjj8LcpJj
 lsKf+G1Le9e6yeBx77CcC1IYK/87kJGzk3cp4nrj5Qf3/gucHKRBUkFfOB9/MzhXjrEg
 3CnQ==
X-Gm-Message-State: AGi0PubdKM2cVIHX1AMCU3m3rbPUGvhgnnSxkJ5r+ehxVKBa4NU3JLBD
 LogPBYgxKxiXBzJXl72X+XeYRA==
X-Google-Smtp-Source: APiQypLpzfjeHcKORCtuutm1uyBf7sFOUFW7Mb8uOr8lGTYIICuH1CY1N6lSdxp/QVB17oX17RO+pA==
X-Received: by 2002:a05:600c:2194:: with SMTP id
 e20mr5154639wme.22.1587662130818; 
 Thu, 23 Apr 2020 10:15:30 -0700 (PDT)
Received: from [192.168.43.23] ([37.167.216.250])
 by smtp.googlemail.com with ESMTPSA id a20sm4965935wra.26.2020.04.23.10.15.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 10:15:30 -0700 (PDT)
Subject: Re: [PATCH v6 04/10] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-5-lukasz.luba@arm.com>
 <20200423151250.GB65632@linaro.org>
 <ff1c8cc5-f64d-6156-7d30-97b8426c6f99@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ddf89887-4fa5-f2ca-d62a-9158f7d29db2@linaro.org>
Date: Thu, 23 Apr 2020 19:15:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ff1c8cc5-f64d-6156-7d30-97b8426c6f99@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: nm@ti.com, juri.lelli@redhat.com, peterz@infradead.org,
 viresh.kumar@linaro.org, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, bsegall@google.com,
 alyssa.rosenzweig@collabora.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 agross@kernel.org, b.zolnierkie@samsung.com, steven.price@arm.com,
 cw00.choi@samsung.com, mingo@redhat.com, linux-imx@nxp.com,
 rui.zhang@intel.com, mgorman@suse.de, orjan.eide@arm.com,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 s.hauer@pengutronix.de, rostedt@goodmis.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjMvMDQvMjAyMCAxODo1NywgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gCj4gCj4gT24gNC8yMy8y
MCA0OjEyIFBNLCBEYW5pZWwgTGV6Y2FubyB3cm90ZToKPj4gT24gRnJpLCBBcHIgMTAsIDIwMjAg
YXQgMDk6NDI6MDRBTSArMDEwMCwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4+PiBBZGQgc3VwcG9ydCBm
b3Igb3RoZXIgZGV2aWNlcyB0aGF0IENQVXMuIFRoZSByZWdpc3RyYXRpb24gZnVuY3Rpb24KPj4+
IGRvZXMgbm90IHJlcXVpcmUgYSB2YWxpZCBjcHVtYXNrIHBvaW50ZXIgYW5kIGlzIHJlYWR5IHRv
IGhhbmRsZSBuZXcKPj4+IGRldmljZXMuIFNvbWUgb2YgdGhlIGludGVybmFsIHN0cnVjdHVyZXMg
aGFzIGJlZW4gcmVvcmdhbml6ZWQgaW4KPj4+IG9yZGVyIHRvCj4+PiBrZWVwIGNvbnNpc3RlbnQg
dmlldyAobGlrZSByZW1vdmluZyBwZXJfY3B1IHBkIHBvaW50ZXJzKS4gVG8gdHJhY2sgdXNhZ2UK
Pj4+IG9mIHRoZSBFbmVyZ3kgTW9kZWwgc3RydWN0dXJlcywgdGhleSBhcmUgcHJvdGVjdGVkIHdp
dGgga3JlZi4KPj4KPj4gV2h5IG5vdCBhZGQgdGhlIGVuZXJneSBtb2RlbCBzdHJ1Y3R1cmUgaW4g
dGhlIHN0cnVjdCBkZXZpY2UgZGlyZWN0bHk/Cj4gCj4gRG8geW91IG1lYW4gdGhpcyBzdHJ1Y3R1
cmU/Cj4gaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJjZS9pbmNs
dWRlL2xpbnV4L2RldmljZS5oI0w1MzcKPiAKPiBhbmQgdG8gcHV0IHNvbWV0aGluZyBsaWtlOgo+
IHN0cnVjdCBkZXZpY2Ugewo+IC4uLgo+IMKgwqDCoMKgc3RydWN0IGRldl9wbV9kb21haW7CoMKg
wqAgKnBtX2RvbWFpbjsKPiAjaWZkZWYgQ09ORklHX0VORVJHWV9NT0RFTAo+IMKgwqDCoMKgc3Ry
dWN0IGVtX3BlcmZfZG9tYWluwqDCoMKgICplbV9wZDsKPiAjZW5kaWYKPiAuLi4KPiB9OwoKWWVz
LCBleGFjdGx5LgoKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRw
Oi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0
dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xp
bmFyby1ibG9nLz4gQmxvZwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
