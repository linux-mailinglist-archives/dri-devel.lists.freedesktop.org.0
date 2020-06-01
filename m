Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5940A1ECA23
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jun 2020 09:05:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 151576E4DE;
	Wed,  3 Jun 2020 07:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2E3C6E0EA
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 21:44:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id x14so1332380wrp.2
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Jun 2020 14:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qqOi9XVkzEqBE1rgTfwzfPJ8XwX72091Extww43XdB0=;
 b=BLUBXAlsbcW7Id0UV+YkyUmxE0jzUe0/jTCXnNN4S8dLK5/1aj1C/RlHrWFxV1AwyH
 6GbdjWZyiEzX2SGei8S9rFvzqJyLKzA9Iy1wx2DpNKBEIC7EvyM/NTa3QPflZz7Q+ctF
 ymXXXQNdt5EUCszEr9mNqRiaL85A+fJwEzmckf2Kn1c5Kj4vkhgcAvTDk3fbqqPaWI6M
 cirigyYvKk2PguC2yqvcAtCchyS4BOP//JBSjBzcOvPA9eIXC1GzF9l4PAcWwI/C7xU5
 L3laXdnfYY+55kcVzKEzfzrpIagABRawHXTr1HqGHv8f0SlrtfRQGIBxyD8Oa8lGahS5
 e7HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qqOi9XVkzEqBE1rgTfwzfPJ8XwX72091Extww43XdB0=;
 b=MbQTPEDLWv38+PcoZOuypqfIrk3J37VyCu2fSH2HDBTTySu2y4zOF80Zy49+LmhCOe
 82HDNVSGDnfhPwQoj4SK6elRufckarkyu6K85t6OfX5GlE1lHIklWwOCSeeAO83HoR1A
 Es1DFmBUtDA1JxBlzu3PbUolronZ1cwXIGiUfJigxDty/SRxA28TUekLZvtcXhO+dQ46
 NXcCAdkTHsJaKA9FJFne70rD4Y+ruyUmVcfnq1yNBmPcPkp0YhEYKH9BeXm553UCO7+d
 CruuEC5KLFh0nxCxEczWdzpLNHuZTnYjVrUjfOv5miqWxEX39mgfb5Vo/Q1PROgC7yxq
 qeWQ==
X-Gm-Message-State: AOAM533yXKl4u+T+Lr37Hl51gTIvdLEsOIsJlza7OsKQGJrsOlbZ2pO2
 AI+HusH+JyLfQnjwMOvMSlIDWw==
X-Google-Smtp-Source: ABdhPJxAkSTXgDmNloFKRd9lVGwwLE5uAp68LgGpm5gXOB9wVVSaY/AqsZoSHbg0AzWXmkv4CYHlkA==
X-Received: by 2002:a5d:490f:: with SMTP id x15mr23274786wrq.259.1591047871147; 
 Mon, 01 Jun 2020 14:44:31 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:e125:f600:eb3c:705b?
 ([2a01:e34:ed2f:f020:e125:f600:eb3c:705b])
 by smtp.googlemail.com with ESMTPSA id q4sm781499wma.47.2020.06.01.14.44.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Jun 2020 14:44:30 -0700 (PDT)
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200527095854.21714-1-lukasz.luba@arm.com>
 <20200527095854.21714-5-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <d45e5592-8e11-858b-d3a3-2ec9ce1d1f54@linaro.org>
Date: Mon, 1 Jun 2020 23:44:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200527095854.21714-5-lukasz.luba@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 03 Jun 2020 07:04:29 +0000
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
 viresh.kumar@linaro.org, liviu.dudau@arm.com, bjorn.andersson@linaro.org,
 bsegall@google.com, mka@chromium.org, amit.kucheria@verdurent.com,
 lorenzo.pieralisi@arm.com, vincent.guittot@linaro.org, khilman@kernel.org,
 steven.price@arm.com, cw00.choi@samsung.com, mingo@redhat.com, mgorman@suse.de,
 rui.zhang@intel.com, alyssa.rosenzweig@collabora.com, orjan.eide@arm.com,
 b.zolnierkie@samsung.com, s.hauer@pengutronix.de, rostedt@goodmis.org,
 matthias.bgg@gmail.com, Dietmar.Eggemann@arm.com, airlied@linux.ie,
 tomeu.vizoso@collabora.com, qperret@google.com, sboyd@kernel.org,
 rdunlap@infradead.org, rjw@rjwysocki.net, agross@kernel.org,
 kernel@pengutronix.de, sudeep.holla@arm.com, patrick.bellasi@matbug.net,
 shawnguo@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjcvMDUvMjAyMCAxMTo1OCwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gQWRkIHN1cHBvcnQgZm9y
IG90aGVyIGRldmljZXMgdGhhbiBDUFVzLiBUaGUgcmVnaXN0cmF0aW9uIGZ1bmN0aW9uCj4gZG9l
cyBub3QgcmVxdWlyZSBhIHZhbGlkIGNwdW1hc2sgcG9pbnRlciBhbmQgaXMgcmVhZHkgdG8gaGFu
ZGxlIG5ldwo+IGRldmljZXMuIFNvbWUgb2YgdGhlIGludGVybmFsIHN0cnVjdHVyZXMgaGFzIGJl
ZW4gcmVvcmdhbml6ZWQgaW4gb3JkZXIgdG8KPiBrZWVwIGNvbnNpc3RlbnQgdmlldyAobGlrZSBy
ZW1vdmluZyBwZXJfY3B1IHBkIHBvaW50ZXJzKS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMdWthc3og
THViYSA8bHVrYXN6Lmx1YmFAYXJtLmNvbT4KPiAtLS0KClsgLi4uIF0KCj4gIH0KPiAgRVhQT1JU
X1NZTUJPTF9HUEwoZW1fcmVnaXN0ZXJfcGVyZl9kb21haW4pOwo+ICsKPiArLyoqCj4gKyAqIGVt
X2Rldl91bnJlZ2lzdGVyX3BlcmZfZG9tYWluKCkgLSBVbnJlZ2lzdGVyIEVuZXJneSBNb2RlbCAo
RU0pIGZvciBhIGRldmljZQo+ICsgKiBAZGV2CQk6IERldmljZSBmb3Igd2hpY2ggdGhlIEVNIGlz
IHJlZ2lzdGVyZWQKPiArICoKPiArICogVHJ5IHRvIHVucmVnaXN0ZXIgdGhlIEVNIGZvciB0aGUg
c3BlY2lmaWVkIGRldmljZSAoYnV0IG5vdCBhIENQVSkuCj4gKyAqLwo+ICt2b2lkIGVtX2Rldl91
bnJlZ2lzdGVyX3BlcmZfZG9tYWluKHN0cnVjdCBkZXZpY2UgKmRldikKPiArewo+ICsJaWYgKElT
X0VSUl9PUl9OVUxMKGRldikgfHwgIWRldi0+ZW1fcGQpCj4gKwkJcmV0dXJuOwo+ICsKPiArCWlm
IChfaXNfY3B1X2RldmljZShkZXYpKQo+ICsJCXJldHVybjsKPiArCj4gKwltdXRleF9sb2NrKCZl
bV9wZF9tdXRleCk7CgpJcyB0aGUgbXV0ZXggcmVhbGx5IG5lZWRlZD8KCklmIHRoaXMgZnVuY3Rp
b24gaXMgY2FsbGVkIHRoYXQgbWVhbnMgdGhlcmUgaXMgbm8gbW9yZSB1c2VyIG9mIHRoZQplbV9w
ZCwgbm8/Cgo+ICsJZW1fZGVidWdfcmVtb3ZlX3BkKGRldik7Cj4gKwo+ICsJa2ZyZWUoZGV2LT5l
bV9wZC0+dGFibGUpOwo+ICsJa2ZyZWUoZGV2LT5lbV9wZCk7Cj4gKwlkZXYtPmVtX3BkID0gTlVM
TDsKPiArCW11dGV4X3VubG9jaygmZW1fcGRfbXV0ZXgpOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0xf
R1BMKGVtX2Rldl91bnJlZ2lzdGVyX3BlcmZfZG9tYWluKTsKPiAKCgotLSAKPGh0dHA6Ly93d3cu
bGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0g
U29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5h
cm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIg
fAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
