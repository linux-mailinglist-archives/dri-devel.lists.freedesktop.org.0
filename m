Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 321761DF664
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A19716EA4D;
	Sat, 23 May 2020 09:34:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7AA26E9D3
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 13:01:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id e1so10082031wrt.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 06:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9X+6V5jDmeXTe6rS8P4JClAQNJrn6NvnpP1JB3UFEbw=;
 b=YWkUKysrh6+PMjjUTe5ooMNLZS4Sp7v0UQTdOOQNicRmgEf860gCAhKd4iWSHOF72e
 jm3ChkOUgSK4DLya4RvXq8yUfIpCze+gLJDZFCO4LZ3UF/6GkygmGMt2PA714u9D6mxZ
 rWMr4jB3CzL7zvC1iQ67OD0PiS4Qu7V+BO2Suu5KcIIwI72DwK5uQcICLhezjVyMk5Vn
 sIZQAuSUVqZwsHPeppZrpH7ECdE5lXD/W9xgY1CaKVzQYHaQwovjjZBDCk8UtXE0kNyo
 6bgxeerdor9S2W1uLBNNwIUeZ3h5a3GyNaxo0wFD7IkwRsetuaB/AmgtPSqlAIsttUIn
 1xfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9X+6V5jDmeXTe6rS8P4JClAQNJrn6NvnpP1JB3UFEbw=;
 b=PxxxVLI0fATOYtmQKq4PV/R75Uf8jXmv8JBPLBTGP3VRtCMPjPdNOiSyv0a5O8n0hC
 z1cm3tf3WGR896tq6AJuJyoF9MzuWHFad6h4lqxv/8+MJaRfjirwLCdxl8G0KtO7Hc1P
 mTdl1qM+heEbQYfUcFG1MYirLBDagMfTk4D7y5YS0DFOpFDO37c0eDVmrKPlrd3K92mb
 QITYBVWSGRvHKf4FHoIMGIi5v4+0PYXW9uxKJi5rEqOvr0RS5iHGk5qOzy16VAjefouu
 M24r5kUYh+DW8yLXEVZtVk1SZfmK9kFX7DYIashd4isOJlcmOCMuFTzi9YNC2OCOXP6c
 qBpw==
X-Gm-Message-State: AOAM53210E+EqPBCT5HZSaiaSZHEPyaLNNAzypk3NrL7rtuJWb4WsF6h
 bV07iEDSAB9e5IXwiByeNVJegw==
X-Google-Smtp-Source: ABdhPJxJ8KBrYk08oALRCUqYyvoY0fMNZPijmmysUh2NVhGB194Z3PpAkmAZwdK1JrZCQ2rLDVlmOQ==
X-Received: by 2002:a5d:4ed0:: with SMTP id s16mr3605467wrv.166.1590152488310; 
 Fri, 22 May 2020 06:01:28 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a?
 ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
 by smtp.googlemail.com with ESMTPSA id 62sm8518652wrm.1.2020.05.22.06.01.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 06:01:27 -0700 (PDT)
Subject: Re: [PATCH v7 00/15] Add support for devices in the Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200511111912.3001-1-lukasz.luba@arm.com>
 <abff69b6-b033-18e2-f380-ceccb42c6b01@linaro.org>
 <3f6652a5-ad9b-15cb-08a8-160becd3f912@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <ef4b039d-b445-6ef1-8f62-00dab112e37b@linaro.org>
Date: Fri, 22 May 2020 15:01:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3f6652a5-ad9b-15cb-08a8-160becd3f912@arm.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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

T24gMjIvMDUvMjAyMCAxNDo1OCwgTHVrYXN6IEx1YmEgd3JvdGU6CgpbIC4uLiBdCgo+Pj4KPj4+
IFRoZSBwYXRjaCBzZXQgaXMgYmFzZWQgb24gbGludXgtbmV4dCB0YWcgbmV4dC0yMDIwMDUwOC4K
Pj4KPj4gRG8geW91IHRoaW5rIGl0IGlzIHBvc3NpYmxlIHRvIHJlc3BpbiBhZ2FpbnN0IGxpbnV4
LXBtIG5leHQgPwo+IAo+IFllcywgSSB3aWxsIGRvIGl0IGFuZCBzZW5kIHRoZSB2OC4KPiAKPj4K
Pj4gSSB3YW50ZWQgdG8gdHJ5IHRoZSBzZXJpZXMgYnV0IEknbSBnZXR0aW5nIG5vbiB0cml2aWFs
IGNvbmZsaWN0cyB3aXRoCj4+IHRoZSBkZXZmcmVxX2Nvb2xpbmcgY2hhbmdlcwo+Pgo+Pgo+IAo+
IExldCBtZSB0YWtlIGNhcmUgb2YgdGhpcy4KClRoYW5rcyBMdWthc3ogIQotLSAKPGh0dHA6Ly93
d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSCIE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBB
Uk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRwOi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9M
aW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0
ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xpbmFyby1ibG9nLz4gQmxvZwpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
