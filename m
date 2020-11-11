Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2CA72AEA6D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 08:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B62089EAE;
	Wed, 11 Nov 2020 07:54:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29F5589BBE
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 06:15:05 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id i6so1666781lfd.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 22:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ueu5uW+Gs7n1BlGQ4zVO3Hsje+5ZnemXOi5VWUiWGgY=;
 b=B77ZmpGxWBBTkp1chXDUgCnFrzSt2oMPFfzzELNlHLy/hWt7Bz40l/E7AdVmHlNAe/
 GQiwqC350cm1FN+e4kLUYym16afqIhO6GK/gWnm4E1uE4DtGcjF1ijk4UaEUFYTuqmbV
 oNQ9AEAdbBldaT1bkmctoSbFwT/shQLdatDwkD+6mEdbPFUpRZ2722HOYZ3jznCoT3UB
 uLD4XTTof3/n1eAJdg8kMSxld4srAjxNUUeFJucfeffzi+sfoEw0N5ilzpuJGCsW8OSv
 G48nZOGz8WldSdc00oOfooJ46G2iy78kbk08qlZ/PTGfME8tZfYeX5LJ2c50g0Z+NNk+
 rWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ueu5uW+Gs7n1BlGQ4zVO3Hsje+5ZnemXOi5VWUiWGgY=;
 b=JRExWso/LVLqi+pcFuVGuvQ7S8lC+G3Ns4Z40HCqSHytruuVswYXI7zF6DsM/qfUfq
 OvAh/If2qJO0vFSoNEL9xxkYNfA7/wKf7tePXI6godTtu9o70tHsM5I6OHahfWhazUIK
 aKBvJS9y0Jg+zYvLPb4dD+PUYZOFLVRDwOcvy0drekcz0+vtpHEQ2Ab9XmjKlQLVzRqF
 nxUlbBmsJBUVIZ5+rbwv+IBgr7SCZP53k7EUB9tCMpFBvub2U+0SxYsxc3CWsOIpjq6/
 avqxPY0SUolaCiXrmruJBJbTWsFSKj/fF3SPk9O+SHT2iSpd02vBkrt15rgGvcP7qfG6
 iTFA==
X-Gm-Message-State: AOAM530moMcSgKDrMCLJfvX3FhuaZcbaN5sTQo915+jJQcLtBMu9c4ew
 y4R5Wb/X0uVgAxJNH+Pk10yPozst8fc=
X-Google-Smtp-Source: ABdhPJxJk8T85hwOVfVjS0XWnFK0/rvXThAoaYy5jAyF+4dT/D0sNZH+aAJc7/fNjBpkY1l846JyEQ==
X-Received: by 2002:a05:6512:34d3:: with SMTP id
 w19mr8452924lfr.418.1605075303375; 
 Tue, 10 Nov 2020 22:15:03 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id j19sm118257lja.100.2020.11.10.22.15.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 22:15:02 -0800 (PST)
Subject: Re: [PATCH v8 02/26] memory: tegra20-emc: Use dev_pm_opp_set_clkname()
To: Viresh Kumar <viresh.kumar@linaro.org>
References: <20201111011456.7875-1-digetx@gmail.com>
 <20201111011456.7875-3-digetx@gmail.com>
 <20201111054541.hstqrlvtpwxxbv4m@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dcc85e86-0660-03ce-a4df-d40dbf77e570@gmail.com>
Date: Wed, 11 Nov 2020 09:15:02 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201111054541.hstqrlvtpwxxbv4m@vireshk-i7>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 11 Nov 2020 07:54:43 +0000
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Mikko Perttunen <cyndis@kapsi.fi>,
 dri-devel@lists.freedesktop.org, Nicolas Chauvet <kwizart@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTEuMTEuMjAyMCAwODo0NSwgVmlyZXNoIEt1bWFyINC/0LjRiNC10YI6Cj4+ICtwdXRfcmVnX3Rh
YmxlOgo+PiArCWlmIChyZWdfb3BwX3RhYmxlKQo+IFRoaXMgd29uJ3QgYmUgcmVxdWlyZWQgYWZ0
ZXIgbXkgb3RoZXIgcGF0Y2hzZXQgYW5kIHllYWggaXQgaXMgYQo+IGNsYXNzaWMgY2hpY2tlbiBh
bmQgZWdnIHByb2JsZW0gd2UgaGF2ZSBoZXJlIDopCj4gCj4gTWF5YmUgeW91IGNhbiBmaXggdGhl
bSBzZXBhcmF0ZWx5IGluIDUuMTEgYWZ0ZXIgZXZlcnl0aGluZyBpcyBhcHBsaWVkLgo+IAoKSSBh
bHJlYWR5IHByZXBhcmVkIHBhdGNoIGluIHRoZSAiY29yZSB2b2x0YWdlIHNjYWxpbmciIHNlcmll
cyB0aGF0IHdpbGwKcmVtb3ZlIHRoaXMgY29kZS4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
