Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3941B672F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D336EA50;
	Thu, 23 Apr 2020 22:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E01B6E185
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 10:46:53 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id d17so6252963wrg.11
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=B1TBwFKRribKH6U+f2YHZKct8m6eaNTnkPh6s+3we4I=;
 b=LZH+oOofFZ6HTrIFYsXaoNlGuvZDH5TfmDKrwIVEwXATLJ/gyO7J7sHyrTD+/agh8O
 wWiBCM0FAZhVUMCrQXO7MVYC4rLCk7VA2qyt9dIa3ZKfWghqzp+RuJgis10Fj5K0M5sO
 pglrlJg6UBZe/QVph5+sbzAlxLr83iDJkP8jfFart0ffS4ED2ONJgo/X5zGpe2mTItrI
 D2/MiHPJ0/UjxCcnfxINq0p8TeK/xKrdedYUGtckd19yz7WTCbDj+abPTK1xTbstCekz
 /PV4W/s0wv/F/z6wBMYDWjuOGUjW1Zj5Ma6SnFE3rWo5uuxGnWI5vpdvebrxZVskGRg4
 Iiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B1TBwFKRribKH6U+f2YHZKct8m6eaNTnkPh6s+3we4I=;
 b=E6ywcqIKzEC4LkD/ZcxQGxJkzGpMZOT57VfVfqx+UEgIkgnXIP64g0eoboY5UheN9M
 q5PQOs0ry28/1cbEaKJfWbRldpE/EA6hqhbNZq8vyp5VCkYBF87sOAc8kA37dHaI4Ed5
 ZjlTEEjZJEoktwabmm8VCccKxPOjISvNmNUv0xLbU4yna5iLEsbwLUck2hqa0iSqEQTQ
 y36llaVWLIODpVdpQ+bFVLs4NXtOfMukBFDVViSEGpgHAE05Pri+8vMC28TC/9S4t2kS
 cjlFn6cjElFOElaMW2gWuJJ2V8tr+5VSsDV90/ivLxOGEcA3uKfPCqy6cOKxc7VJtNJG
 ixhw==
X-Gm-Message-State: AGi0PuZSahf15Lp+PEe6mBe4+GlJKvxoi89toMJ3NKys90Eoa2V3cfbP
 9DYRtSkfDvnomFf7yLG1xmhRxQ==
X-Google-Smtp-Source: APiQypKk6XUIzuutA3wLhgUEchycCeMPsBVS0IXvX9Ni7yK3fu/lKAGauoLlCdpwWe5IfJMCbOUR+w==
X-Received: by 2002:a5d:5652:: with SMTP id j18mr4521872wrw.40.1587638812041; 
 Thu, 23 Apr 2020 03:46:52 -0700 (PDT)
Received: from [192.168.43.23] ([37.167.216.250])
 by smtp.googlemail.com with ESMTPSA id 17sm3087293wmo.2.2020.04.23.03.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 03:46:51 -0700 (PDT)
Subject: Re: [PATCH v6 02/10] PM / EM: introduce em_dev_register_perf_domain
 function
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200410084210.24932-1-lukasz.luba@arm.com>
 <20200410084210.24932-3-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <4a1d8d5b-84f2-46b7-00ce-03178d7df72f@linaro.org>
Date: Thu, 23 Apr 2020 12:46:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200410084210.24932-3-lukasz.luba@arm.com>
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

T24gMTAvMDQvMjAyMCAxMDo0MiwgTHVrYXN6IEx1YmEgd3JvdGU6Cj4gQWRkIG5vdyBmdW5jdGlv
biBpbiB0aGUgRW5lcmd5IE1vZGVsIGZyYW1ld29yayB3aGljaCBpcyBnb2luZyB0byBzdXBwb3J0
Cj4gbmV3IGRldmljZXMuIFRoaXMgZnVuY3Rpb24gd2lsbCBoZWxwIGluIHRyYW5zaXRpb24gYW5k
IG1ha2UgaXQgc21vb3RoZXIuCj4gRm9yIG5vdyBpdCBzdGlsbCBjaGVja3MgaWYgdGhlIGNwdW1h
c2sgaXMgYSB2YWxpZCBwb2ludGVyLCB3aGljaCB3aWxsIGJlCj4gcmVtb3ZlZCBsYXRlciB3aGVu
IHRoZSBuZXcgc3RydWN0dXJlcyBhbmQgaW5mcmFzdHJ1Y3R1cmUgd2lsbCBiZSByZWFkeS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBMdWthc3ogTHViYSA8bHVrYXN6Lmx1YmFAYXJtLmNvbT4KPiAtLS0K
CkFja2VkLWJ5OiBEYW5pZWwgTGV6Y2FubyA8ZGFuaWVsLmxlemNhbm9AbGluYXJvLm9yZz4KCgoK
LS0gCjxodHRwOi8vd3d3LmxpbmFyby5vcmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBz
b2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZvbGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9v
ay5jb20vcGFnZXMvTGluYXJvPiBGYWNlYm9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGlu
YXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJs
b2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
