Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D469482CA4
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 09:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB70489EF7;
	Tue,  6 Aug 2019 07:24:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C23B89F45
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 22:41:16 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id r26so4502178pgl.10
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 15:41:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=GWbcR3xvFDNmBGhYbznH6s7cLBaKp4a0/ddWesxNcF8=;
 b=LQMq0sqPYsa/IfdS9TwdkTXgIIc2kZAQkn60/cyRPXQWLiUjvEkFwW/OLJ2eWCjBe5
 02E6kq5CCYcwHPovC55uqjExwSWnU4sjHPvew0V4WK/tGsj1o9R1QKAinbEzNZ625q3u
 7tD+oxQD2EmO1ewJECsIDZg7kv1kgxcNFDQ/3TRx6JaDg1QEagh1NTkwz5QGcEiMtIUQ
 u5KSF59BFC0G3fIpJ0fhFzEwfKyZn5S+ZqXyw3iQijY8ACHBMZssnI/O+g7GDZW663A4
 RNyq906UACJaEZ0KwhrU2AKfEAXeK4dk/Mczt3EyMTiXSf0bSlpVprIJLLMkrZ562L9q
 mFUw==
X-Gm-Message-State: APjAAAXhKZgKYSydtlDL/icumZIyoC3s7UYtm70/aqkzERi3I0ivpCqq
 yPVaCaO+bq6IDkPz87DqzO5FYA==
X-Google-Smtp-Source: APXvYqzLFSHj9hIrglUjQkYpFeaYOh80cYaOP+fMjZebJjv9jSvgLHClQzlfLnbBTszfX7Ribw6fZg==
X-Received: by 2002:a65:4b8b:: with SMTP id t11mr196402pgq.130.1565044875625; 
 Mon, 05 Aug 2019 15:41:15 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id w22sm90250322pfi.175.2019.08.05.15.41.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Aug 2019 15:41:14 -0700 (PDT)
Date: Mon, 5 Aug 2019 15:41:12 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Subject: Re: [PATCH v4 5/6] soc: qcom: add OCMEM driver
Message-ID: <20190805224112.GA6470@builder>
References: <20190803142026.9647-1-masneyb@onstation.org>
 <20190803142026.9647-6-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190803142026.9647-6-masneyb@onstation.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Mailman-Approved-At: Tue, 06 Aug 2019 07:24:35 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=GWbcR3xvFDNmBGhYbznH6s7cLBaKp4a0/ddWesxNcF8=;
 b=yIptHBFKiXtoJSpxG3bR7btwflHxC+u7tsW/YMVsilyZv3CTs+hJ3/PAxxja3yprwN
 K2/s/xCu4j+TWNoXy/J6zSUNZAocXBZ1mR4kh0psZKMbQ2lX1CQgghFFQBAegs65elzk
 VqLFyHVt/3zuzmKlOHgufofFKYe0yx0kj9YJGhq/pA1qRoo7gdfKltcISoR17nHf+j5i
 hyAkAlGYhIiubvjjO37w2cwMfYzNcTgDzChUGsK7ckYLT8fJCsnIv7HVEYD0C/VHdWS+
 CeTU3VVek8p8cm9q6Px8AcLxRA0Lw7yu7tMcmQFN8wcxAT4VdpzZe70ltRJHwtskyk2b
 tLHw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: mark.rutland@arm.com, freedreno@lists.freedesktop.org, jonathan@marek.ca,
 devicetree@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, agross@kernel.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0IDAzIEF1ZyAwNzoyMCBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3NvYy9xY29tL29jbWVtLmMgYi9kcml2ZXJzL3NvYy9xY29tL29jbWVt
LmMKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uN2MyOGFkMzEw
OGE2Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2RyaXZlcnMvc29jL3Fjb20vb2NtZW0uYwo+IEBA
IC0wLDAgKzEsNDMzIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9u
bHkKWy4uXQo+ICtNT0RVTEVfTElDRU5TRSgiR1BMIik7CgpTaG91bGRuJ3QgdGhpcyBiZSAiR1BM
IHYyIj8KCgpBcGFydCBmcm9tIHRoYXQgSSB0aGluayB0aGlzIGxvb2tzIGdvb2QuClJldmlld2Vk
LWJ5OiBCam9ybiBBbmRlcnNzb24gPGJqb3JuLmFuZGVyc3NvbkBsaW5hcm8ub3JnPgoKQFJvYiwg
d291bGQgeW91IGxpa2UgdG8gdGFrZSB0aGlzIHNlcmllcyB0aHJvdWdoIHlvdXIgdHJlZSBvciB3
b3VsZCB5b3UKbGVuZCBtZSBhbiBBY2sgb24gdGhlIGFkcmVubyBwYXRjaCBhbmQgSSdsbCBhcHBs
eSBpdCB0aHJvdWdoIHRoZSBxY29tCnRyZWU/IEZlZWwgZnJlZSB0byBhZGQgbXkgQWNrZWQtYnkg
dG8gdGhlIHJlbGV2YW50IHBhdGNoZXMsIGlmIG5lZWRlZC4KClJlZ2FyZHMsCkJqb3JuCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
