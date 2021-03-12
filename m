Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5083338E8D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 14:17:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E856F61C;
	Fri, 12 Mar 2021 13:17:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E676F61C;
 Fri, 12 Mar 2021 13:17:23 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id k9so45670452lfo.12;
 Fri, 12 Mar 2021 05:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=kKylRMS171DSUAUGLyXWsq2Tz6pdoiZRigFrFZwqxVY=;
 b=eUHZSSaI5vPFgCHKI71eDK0ms124Rbgs1AggoS8af2xSFxsDK5SvDdHRqKZcudOXj/
 P7eWD2DuQ5pSSwttIk03LP1GI7IELva1IQj4teSCKjz3NCQwiCFLuZMBEceMFlJ/Q1xY
 fAI3aAvftZ2OHaAcIFUk7dDlK2lrsGn1EcjsP+1W8S29zE8n11MaBaYGTkBsM9mRoPay
 RgR6eXgSRUoKyXx8TzB+ivVIhA/LkIC/9w9Y0n02pjNGA5d2nv8si4OmOFrXBQWnb8s0
 +cr8J/K96dWe6Y8YAwMIUDn+/X+fQ0+L/LRGlc77yg5sWB3K8cC4YDGz6y4OjHy6cSh0
 Tv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kKylRMS171DSUAUGLyXWsq2Tz6pdoiZRigFrFZwqxVY=;
 b=jRDQQZxln6GBoMpogqgGMPxOfOclrxI4y5WZ3LfzNjaYyQTj6s9FsuKL2s9ZZNpWuQ
 WCBrrIfJbrlVHTq3wd+Wc7QAuLv8QJjZqoxlMSKbhSj3AtOvuHEoFrYXXXRQwxHa2HSH
 CndMpmBseRpd1/FTMoAmFcLNPfhsp5/TiX7OvmzMu2WLDNT96+0gtq+JTY8uFJxzwE0t
 +QWfDXPoqX6S6ePB17a3Nawg3ho6xvZNKgSrrZ0UUkXkSBvF/nJ4mbe18FcqDb4IP8p6
 bOtYbJvsg+SczZn28YB8JXi7U2NQMoS15Lv/r3XE6+c1i+L2edDqyfwjsHAcf6EaY6+n
 vNAA==
X-Gm-Message-State: AOAM530HidRkGYWdEzFPbpz7Sys6amlvwuZRYLXDiCbEQ6RGjcbIZIp5
 FSRMRwDoDoj+StXSvWxzPGY=
X-Google-Smtp-Source: ABdhPJyyXw4QXGPCVy0ERilhNXqz3whUGsc8C9NeIrl8gS+TKEhNS13UCZoBdLhL/YqNG5x1dPt40w==
X-Received: by 2002:ac2:5603:: with SMTP id v3mr5617629lfd.67.1615555042189;
 Fri, 12 Mar 2021 05:17:22 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.googlemail.com with ESMTPSA id k6sm1959405ljb.110.2021.03.12.05.17.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 05:17:21 -0800 (PST)
Subject: Re: [PATCH v2 05/14] opp: Add devres wrapper for
 dev_pm_opp_register_notifier
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20210311192105.14998-1-digetx@gmail.com>
 <20210311192105.14998-6-digetx@gmail.com>
 <20210312052659.uih7ikjdnkc5kl4j@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7c288641-99ad-c938-1e5e-8c1ca19c9ea4@gmail.com>
Date: Fri, 12 Mar 2021 16:17:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20210312052659.uih7ikjdnkc5kl4j@vireshk-i7>
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
 Mark Brown <broonie@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sean Paul <sean@poorly.run>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org,
 Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, freedreno@lists.freedesktop.org,
 Lukasz Luba <lukasz.luba@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTIuMDMuMjAyMSAwODoyNiwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4gT24gMTEtMDMtMjEs
IDIyOjIwLCBEbWl0cnkgT3NpcGVua28gd3JvdGU6Cj4+IEZyb206IFlhbmd0YW8gTGkgPHRpbnku
d2luZHp6QGdtYWlsLmNvbT4KPj4KPj4gQWRkIGRldnJlcyB3cmFwcGVyIGZvciBkZXZfcG1fb3Bw
X3JlZ2lzdGVyX25vdGlmaWVyKCkgdG8gc2ltcGxpZnkgZHJpdmVyCj4+IGNvZGUuCj4+Cj4+IFNp
Z25lZC1vZmYtYnk6IFlhbmd0YW8gTGkgPHRpbnkud2luZHp6QGdtYWlsLmNvbT4KPj4gU2lnbmVk
LW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwuY29tPgo+PiAtLS0KPj4gIGRy
aXZlcnMvb3BwL2NvcmUuYyAgICAgfCAzOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+PiAgaW5jbHVkZS9saW51eC9wbV9vcHAuaCB8ICA2ICsrKysrKwo+PiAgMiBmaWxl
cyBjaGFuZ2VkLCA0NCBpbnNlcnRpb25zKCspCj4gCj4gQXMgSSBzYWlkIGluIHRoZSBwcmV2aW91
cyB2ZXJzaW9uLCBJIGFtIG5vdCBzdXJlIGlmIHdlIG5lZWQgdGhpcyBwYXRjaAo+IGF0IGFsbC4g
VGhpcyBoYXMgb25seSBvbmUgdXNlci4KPiAKCkknbGwgZHJvcCB0aGlzIHBhdGNoIGluIHYzLCB0
aGFua3MuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
