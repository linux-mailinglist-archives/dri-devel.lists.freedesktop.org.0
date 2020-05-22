Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9AD1DF65B
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA736E3F9;
	Sat, 23 May 2020 09:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464686E9C4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 10:43:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w7so9646522wre.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 03:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VGoYWtdu5N5u5jqWgNJFmyeBLxTDklq5XGRfQf6qY4Q=;
 b=YdeY/dYKbHgnjF5Rfbcb+eEpYTqwDn5A1vVV0JJ5zhynRDstj4c9FpHWPMl+epaBKj
 4+oNruH5nf6kCafoeC8oqKNyZ/Po23OIUoBNbYN9r4/k0SejSAvyGC92UsY58XQLUfsa
 3JjDrFGsY19YdyfPsHQclmg1uXVg+LMh91ZPjSFXVChXGrVWjG0Ui7eJQGqklE6+5kay
 g5Uz20ffaV5DdoIjAToXKulBulbkNzxmwxh2KnSMRG7DYDLx1ioPSUF/Sq5icU69Spbb
 sYt6m5Pg2RyBF7ZlFDkiMCnoSB3EaxfTGXp6TNa8MZWvQOKRiLEeX0kDcZ6ep0ep66E5
 CPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=VGoYWtdu5N5u5jqWgNJFmyeBLxTDklq5XGRfQf6qY4Q=;
 b=GaHNUynB3dC8p2zFfi0BJbtI4GqnouEr0IOKGjvDFMZVI/jzv1C/1odEXA7oI7q9B1
 ZM5QqowBF3L8VvwOrP6n7RdXKZSxc3t9ADctG9JzyHPH5wEtUEEdCZbX2+CxS0N53AnN
 WyhSM7SOJNbyXtjHtBltKi924gOLFM2B/t6BwVkOyHdyaVrcRjIJ0kxVLfBgS0+Wasbr
 QkLDiGSwrHJaiiokdJsRoLnnjehbzQSthqX4tF12yZ7G/uxrmkq0NG3Gq7qUATjB8+VD
 nvmqmWDXLPSLh/LUqCrSyk/xXGObZm8xrHV/vUKpgju9X+1mBKvR/K0cx4dUssFajAYF
 2ggQ==
X-Gm-Message-State: AOAM531mbyClL1cpHEoqZSbr17WxV+XXoUdTm8QAU7PgAtcD8FLGPK13
 8fJZpHQkM3v/V+CYDKYvTbpxKg==
X-Google-Smtp-Source: ABdhPJybiYUfjcoyk6EZQDK4C+UEDo86CQQDAJc9f/khvU4Ce7Ww2hRO343VGYU3st9oV83jeHWEKA==
X-Received: by 2002:a5d:52c6:: with SMTP id r6mr2933510wrv.269.1590144196705; 
 Fri, 22 May 2020 03:43:16 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:a82f:eaec:3c49:875a?
 ([2a01:e34:ed2f:f020:a82f:eaec:3c49:875a])
 by smtp.googlemail.com with ESMTPSA id h1sm9702407wme.42.2020.05.22.03.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 May 2020 03:43:16 -0700 (PDT)
Subject: Re: [PATCH v7 00/15] Add support for devices in the Energy Model
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-imx@nxp.com
References: <20200511111912.3001-1-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <abff69b6-b033-18e2-f380-ceccb42c6b01@linaro.org>
Date: Fri, 22 May 2020 12:43:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200511111912.3001-1-lukasz.luba@arm.com>
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

CkhpIEx1a2FzeiwKCk9uIDExLzA1LzIwMjAgMTM6MTgsIEx1a2FzeiBMdWJhIHdyb3RlOgo+IEhp
IGFsbCwKPiAKPiBUaGlzIHBhdGNoIHNldCBpbnRyb2R1Y2VzIHN1cHBvcnQgZm9yIGRldmljZXMg
aW4gdGhlIEVuZXJneSBNb2RlbCAoRU0pCj4gZnJhbWV3b3JrLiBJdCB3aWxsIHVuaWZ5IHRoZSBw
b3dlciBtb2RlbCBmb3IgdGhlcm1hbCBzdWJzeXN0ZW0uIEl0IHdpbGwKPiBtYWtlIHNpbXBsZXIg
dG8gYWRkIHN1cHBvcnQgZm9yIG5ldyBkZXZpY2VzIHdpbGxpbmcgdG8gdXNlIG1vcmUKPiBhZHZh
bmNlZCBmZWF0dXJlcyAobGlrZSBJbnRlbGxpZ2VudCBQb3dlciBBbGxvY2F0aW9uKS4gTm93IGl0
IHNob3VsZAo+IHJlcXVpcmUgbGVzcyBrbm93bGVkZ2UgYW5kIGVmZm9ydCBmb3IgZHJpdmVyIGRl
dmVsb3BlciB0byBhZGQgZS5nLgo+IEdQVSBkcml2ZXIgd2l0aCBzaW1wbGUgZW5lcmd5IG1vZGVs
LiBBIG1vcmUgc29waGlzdGljYXRlZCBlbmVyZ3kgbW9kZWwKPiBpbiB0aGUgdGhlcm1hbCBmcmFt
ZXdvcmsgaXMgYWxzbyBwb3NzaWJsZSwgZHJpdmVyIG5lZWRzIHRvIHByb3ZpZGUKPiBhIGRlZGlj
YXRlZCBjYWxsYmFjayBmdW5jdGlvbi4gTW9yZSBpbmZvcm1hdGlvbiBjYW4gYmUgZm91bmQgaW4g
dGhlCj4gdXBkYXRlZCBkb2N1bWVudGF0aW9uIGZpbGUuCj4gCj4gRmlyc3QgNyBwYXRjaGVzIGFy
ZSByZWZhY3RvcmluZyBFbmVyZ3kgTW9kZWwgZnJhbWV3b3JrIHRvIGFkZCBzdXBwb3J0Cj4gb2Yg
b3RoZXIgZGV2aWNlcyB0aGF0IENQVXMuIFRoZXkgY2hhbmdlOgo+IC0gbmFtaW5nIGNvbnZlbnRp
b24gZnJvbSAnY2FwYWNpdHknIHRvICdwZXJmb3JtYW5jZScgc3RhdGUsCj4gLSBBUEkgYXJndW1l
bnRzIGFkZGluZyBkZXZpY2UgcG9pbnRlciBhbmQgbm90IHJlbHkgb25seSBvbiBjcHVtYXNrLAo+
IC0gY2hhbmdlIG5hbWluZyB3aGVuICdjcHUnIHdhcyB1c2VkLCBub3cgaXQncyBhICdkZXZpY2Un
Cj4gLSBpbnRlcm5hbCBzdHJ1Y3R1cmUgdG8gbWFpbnRhaW4gcmVnaXN0ZXJlZCBkZXZpY2VzCj4g
LSB1cGRhdGUgdXNlcnMgdG8gdGhlIG5ldyBBUEkKPiBQYXRjaCA4IHVwZGF0ZXMgT1BQIGZyYW1l
d29yayBoZWxwZXIgZnVuY3Rpb24gdG8gYmUgbW9yZSBnZW5lcmljLCBub3QKPiBDUFUgc3BlY2lm
aWMuCj4gUGF0Y2hlcyA5LTE0IGNoYW5nZSBkZXZmcmVxIGNvb2xpbmcsIGRyb3BwaW5nIHBhcnQg
b2Ygb2xkIHBvd2VyIG1vZGVsIGFuZAo+IGFkZGluZyByZWdpc3RyYXRpb24gd2l0aCBFbmVyZ3kg
TW9kZWwgdmlhIGV4cG9ydGVkIEdQTCBmdW5jdGlvbi4KPiBUaGUgbGFzdCBwYXRoIGlzIGEgc2lt
cGxlIGNoYW5nZSBmb3IgUGFuZnJvc3QgR1BVIGRyaXZlci4KPiAKPiBUaGUgcGF0Y2ggc2V0IGlz
IGJhc2VkIG9uIGxpbnV4LW5leHQgdGFnIG5leHQtMjAyMDA1MDguCgpEbyB5b3UgdGhpbmsgaXQg
aXMgcG9zc2libGUgdG8gcmVzcGluIGFnYWluc3QgbGludXgtcG0gbmV4dCA/CgpJIHdhbnRlZCB0
byB0cnkgdGhlIHNlcmllcyBidXQgSSdtIGdldHRpbmcgbm9uIHRyaXZpYWwgY29uZmxpY3RzIHdp
dGgKdGhlIGRldmZyZXFfY29vbGluZyBjaGFuZ2VzCgoKLS0gCjxodHRwOi8vd3d3LmxpbmFyby5v
cmcvPiBMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBmb3IgQVJNIFNvQ3MKCkZv
bGxvdyBMaW5hcm86ICA8aHR0cDovL3d3dy5mYWNlYm9vay5jb20vcGFnZXMvTGluYXJvPiBGYWNl
Ym9vayB8CjxodHRwOi8vdHdpdHRlci5jb20vIyEvbGluYXJvb3JnPiBUd2l0dGVyIHwKPGh0dHA6
Ly93d3cubGluYXJvLm9yZy9saW5hcm8tYmxvZy8+IEJsb2cKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
