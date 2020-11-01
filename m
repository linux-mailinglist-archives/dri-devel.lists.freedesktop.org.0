Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDB02A207B
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 18:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E2C6EB3D;
	Sun,  1 Nov 2020 17:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40E0188065
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 15:49:19 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h6so14174613lfj.3
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 07:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+IMMWwTBpIuU34muTgua4oEKfGJdORV+B0XtK66fJrc=;
 b=CH53aYEYM+ZxNJAYZtHdmiWk27hMZvw57vtMxIUKweWLPnQ1zL8KTxXSLLaQP6pJ6H
 CUeC1l9MqRH+Nno4rcVnD6fZ9Tr/yDkBUk4cu2wdh8Dji0FhT7jXrEc+4pL9X/ptuPD3
 Hb3Sys5CXMsgTzKwZGJouWzFlc41nQfJ6NftUYNSEAqjIPus7ZcGWGTmt0HXysGzbVp6
 aQ+4zxSgXSuvGkWWcGlJhJMNyo1BiZxfp+Ku9L/APZSBgeE61Xkp9p4kL6htxBH2WzZ6
 4R90X1KyAl1/KNdI99Z0ZX1Le9FoJabWU2LXGilSKg8cj1/R8jCESOeHWYofOZLaWOAB
 o3tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+IMMWwTBpIuU34muTgua4oEKfGJdORV+B0XtK66fJrc=;
 b=gAL0Eo5oXrg9YQqfqm0w3TUmMwvzqMjsS49xUuXm5KOxC6jnRPm1Gav6Q1tau0D8fs
 7R2wIhlw5QkDHAqN4AC2YFqWiISrSZYBqflU9PIR9/QzygYvSBUGExdSUpL4SFZicUIX
 4WKhqft0kRlwUqMN9Morjjb8nzm5vPuk7HcjNeef697IjtFPBQ7xxWE3C6ga148xeyHJ
 MVafc23v0TbogwwkEytUjZd8T9QtbHszobMc7mIege1Ag2S4fdKCvEeVof9usoQkitKJ
 bro3uSBNAxwVQ8K2tC2Of16SdAk2n9/E/95aPJ0jJw3zISdXHWe5XUT/NbulX1Y50bRJ
 mxlg==
X-Gm-Message-State: AOAM5314nwU4PHAmAc6ddfbB5pR+C3nkE2SkNF+x/qlFF1/R3Rn4Mcwo
 gVl+L2OLXnY6BZ/phamiQEA=
X-Google-Smtp-Source: ABdhPJyfbmcSEmTMH443D7OLJRec3W7yiy/1SR2NX2guVnd/pVsXQbN96ATE9WOlpP88kx03VxbOzQ==
X-Received: by 2002:a19:414b:: with SMTP id o72mr4634104lfa.23.1604245757706; 
 Sun, 01 Nov 2020 07:49:17 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-177.dynamic.spd-mgts.ru.
 [109.252.193.177])
 by smtp.googlemail.com with ESMTPSA id 196sm1571873lfg.209.2020.11.01.07.49.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Nov 2020 07:49:17 -0800 (PST)
Subject: Re: [PATCH v6 51/52] PM / devfreq: tegra30: Support interconnect and
 OPPs from device-tree
To: cwchoi00@gmail.com
References: <20201025221735.3062-1-digetx@gmail.com>
 <20201025221735.3062-52-digetx@gmail.com>
 <CAGTfZH1PV4r-pD=zTKD71nQb5+UobJKa5mBv-Nb2ZgSubkscjA@mail.gmail.com>
 <2ebd184c-60e8-19e2-9965-19481ced1c70@gmail.com>
 <CAGTfZH0=6R02euOR3JHgA0iLq5++Yvp3Z_wBCEs7bzkfuorEFQ@mail.gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5f5a22b1-4d01-5698-1bca-6bcc66c55e6f@gmail.com>
Date: Sun, 1 Nov 2020 18:49:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGTfZH0=6R02euOR3JHgA0iLq5++Yvp3Z_wBCEs7bzkfuorEFQ@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sun, 01 Nov 2020 17:36:56 +0000
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Linux PM list <linux-pm@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDEuMTEuMjAyMCAxODo0NCwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4+IE9QUCBjb3JlIHdp
bGwgdHJ5IHRvIGdyYWIgdGhlIGNsb2NrIHJlZmVyZW5jZSBmb3IgdGhlIHRhYmxlIGFuZCBpdCBt
YXkKPj4gY2F1c2UgRVBST0JFX0RFRkVSLiBBbHRob3VnaCwgaXQgc2hvdWxkbid0IGhhcHBlbiBo
ZXJlIGJlY2F1c2Ugd2UgaGF2ZQo+PiBkZXZtX2Nsa19nZXQoKSBiZWZvcmUgdGhlIGdldF9vcHBf
dGFibGUoKSwgaGVuY2Ugc2VlbXMgdGhlIGRlZmVycmVkCj4+IHByb2JlIGluZGVlZCBzaG91bGRu
J3QgaGFwcGVuIGluIHRoaXMgY2FzZS4KPiBJdCBpcyBteSBtaXNzaW5nIHBvaW50LiBJZiB0aGVy
ZSwgeW91J3JlIHJpZ2h0Lgo+IENvdWxkIHlvdSBwcm92aWRlIHRoZSBjb2RlIHBvaW50IHRvIGNo
ZWNrIHRoZSBjbG9jayByZWZlcmVuY2Ugb24gdGhlIE9QUCBjb3JlPwoKUGxlYXNlIHNlZSBpdCBo
ZXJlOgoKaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvdjUuMTAtcmMxL3NvdXJjZS9k
cml2ZXJzL29wcC9jb3JlLmMjTDExMDEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
