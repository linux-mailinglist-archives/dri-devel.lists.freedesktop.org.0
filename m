Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF59337E7A
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:52:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479526EC03;
	Thu, 11 Mar 2021 19:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A92A6EBFF;
 Thu, 11 Mar 2021 19:52:33 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id u4so3732081ljo.6;
 Thu, 11 Mar 2021 11:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NzktC61WLHyGiWXBjMZlD5s3DKyEhRdHqxU4GfY6M6c=;
 b=aAhQavJLtQkk/nECiXIlx+O/QFcYOij/vUvk4Wb3id8VTVQ0DyGKOupLcfPcnhws9M
 iTylNQCipW5MSqd0wNcpVw4dB3diCb3QY/PKAwT+/BxAHD4yYg+lSPtwGG/DTHT3NehP
 CaoEl5t7uGJD3ud2WDG316ejAt9g9t9FDMn5fpvYV9Ui71GaGzvyAItDW9kJ2gOneKSC
 asVAk7ZuMTAk2n+46AdJFDyaKPMsG4xv/4UfEf6ULxafrkhpkpzYK2+5iVazZOxsor5w
 uTljITefaZioOQJAu4nlANrdsnfQbXc2UvMRBg4l1oavRU/lcVlrzwLCJQ86EbOo4P7r
 Jzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NzktC61WLHyGiWXBjMZlD5s3DKyEhRdHqxU4GfY6M6c=;
 b=YU48KqVslFZe6pYDCo9+aRC0PrsxjKc67ZV6/q9PezGQ21NGLuXxdGsqsVkjQp/bDN
 QZNUdqX9G/ZHzL5OIo621Q/x8f2OPAmL8d+QfdRQbzrq91J9YeTCtq7fU4QXxpOmViLD
 risxBzCWI7mNKbG2YgmoLX6/tMrlNe+rVKNLPL68VIAJ81wE6u+GCfVvU9k7qBBJHP5m
 a/d+3dNJDsTidTH5Txaa80soFTOO7TvK2H4ZeRBIGemcozhJq/rLBM+WPHPbQAujR3Vk
 imyHKlOF6VReau/cMJ5TXXrTXxu+4Yh7egMq/UpWGrz/gGgsX0M9uRhz1+DcNUY3L843
 uHyQ==
X-Gm-Message-State: AOAM533B/31h9eKhdlychcKjJWh0KUy++JybGktRd2bjL/5wUPb0texC
 n5QPkmpMSWjQzgKNqQLC7dY=
X-Google-Smtp-Source: ABdhPJy1BIvKdq3/KI+BkHi/0PnhadIhGpaaLM0alJjY9nXsG8WO7V4czzQ/EgXdXTqTkrhNdbzLPg==
X-Received: by 2002:a05:651c:303:: with SMTP id
 a3mr285703ljp.290.1615492351563; 
 Thu, 11 Mar 2021 11:52:31 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id d14sm1075232lfg.128.2021.03.11.11.52.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Mar 2021 11:52:31 -0800 (PST)
Subject: Re: [PATCH v2 07/14] spi: spi-geni-qcom: Convert to use
 resource-managed OPP API
To: Mark Brown <broonie@kernel.org>
References: <20210311192105.14998-1-digetx@gmail.com>
 <20210311192105.14998-8-digetx@gmail.com>
 <20210311194428.GK4962@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <552bb8fe-cd46-a420-8646-3fbe8975f01d@gmail.com>
Date: Thu, 11 Mar 2021 22:52:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210311194428.GK4962@sirena.org.uk>
Content-Language: en-US
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
Cc: Nishanth Menon <nm@ti.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-spi@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>,
 linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Viresh Kumar <vireshk@kernel.org>, Steven Price <steven.price@arm.com>,
 Andy Gross <agross@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 linux-serial@vger.kernel.org, linux-media@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sean Paul <sean@poorly.run>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, freedreno@lists.freedesktop.org,
 Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMDMuMjAyMSAyMjo0NCwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFRodSwgTWFyIDEx
LCAyMDIxIGF0IDEwOjIwOjU4UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPiAKPj4g
QWNrZWQtYnk6IE1hcmsgYnJvd24gPGJyb29uaWVAa2VybmVsLm9yZz4KPiAKPiBUeXBvIHRoZXJl
Lgo+IAoKR29vZCBjYXRjaCEgQWx0aG91Z2gsIHRoYXQgc2hvdWxkIGJlIGEgcGF0Y2h3b3JrIGZh
dWx0IHNpbmNlIGl0CmF1dG8tYWRkZWQgYWNrcyB3aGVuIEkgZG93bmxvYWRlZCB2MSBwYXRjaGVz
IGFuZCBJIGhhdmVuJ3QgY2hhbmdlZCB0aGVtLgpJJ2xsIGZpeCBpdCBpbiB2MyBvciwgaWYgdGhl
cmUgd29uJ3QgYmUgYW55dGhpbmcgZWxzZSB0byBpbXByb3ZlLCB0aGVuCm1heWJlIFZpcmVzaCBj
b3VsZCBmaXggaXQgdXAgd2hpbGUgYXBwbHlpbmcgcGF0Y2hlcy4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
