Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 028B73EF982
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 06:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2846E372;
	Wed, 18 Aug 2021 04:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 876C76E39B
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 04:34:23 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id j1so1804217pjv.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 21:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=eqqpYWePv3bA2FFLn8JZZpHhH3Zi1uHmK7sHrQbWFRw=;
 b=HTtKdG+zPt9q7oo6G+tDPFjywlUf2fIlTsljJrBXemAFCqVrXkLJH2J4prixqFwlWE
 J0unc6IdtxCIWudbX02SO4ATFxlaCA1/SoUQMq5P6D3Yk+OduOvpAgff7we5YXfkgCXL
 xlXEBHCz776bTxOcJUNBOjuFaUsXP9ZzpIxEjcZgNlKhHXQmSXT4WG5V74nVrjqmloLj
 jHkkS9fxFa3uYd/EQoKSWBdLGmIyIORJT1upv4QdPBmxwIAVox5/qef1kPsgzwvpXT4k
 bTjafbU59iMyj4iWu6735iceyC6eQ4HGcIB0qT1Sv4H6XxtMpHDdFpm5Po4IlPj8a0jc
 JKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=eqqpYWePv3bA2FFLn8JZZpHhH3Zi1uHmK7sHrQbWFRw=;
 b=SEvYsZ6LkS84DPc1gx2ydMlDGR0tR2HJT/pcWjnA72z34/s074R7P6Z+amFWWEOmhY
 hrB5v/y7F+vtD9XnhfHkLjBDLDyKFmetCwFXW1oPoGh8VnMmfODK4v720bIpvmxUl5Rb
 SN1lFp+NfhNql/+N9MpMx0nZGRBljgJ3nHSbjXUS/vmyobN9GY/v1bjAjWDVAu93akVf
 byQyipOmfcV/sveHo+BXPgw+Szv2q8zmltPOSyBYOMwL0tkmrgJDy+Wv78SgUzBpaYP3
 eGgTNU4kfQxjfIxLozyGCPcOrn2XYyuR2Cigkvc6O+iKbFHn793jrQidf+c6/59F7rTC
 mQlQ==
X-Gm-Message-State: AOAM532eYEMuQvLaddsIHNAt2MH0DirGdnoX+neyUx/9UD1NJrSWcGZz
 39GEbHh0bC+AoCRX89AW2DbohQ==
X-Google-Smtp-Source: ABdhPJyyJyLRvTMcV2VMadnYuEIWvMA5nKw+OEK9l2guzi40QLIRwlX68yRwxZh/lfXmuYEMO47Zng==
X-Received: by 2002:a17:90b:1983:: with SMTP id
 mv3mr940040pjb.185.1629261263184; 
 Tue, 17 Aug 2021 21:34:23 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id f5sm4152122pfn.134.2021.08.17.21.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 21:34:22 -0700 (PDT)
Date: Wed, 18 Aug 2021 10:04:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Viresh Kumar <vireshk@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Lucas Stach <dev@lynxeye.de>, Stefan Agner <stefan@agner.ch>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
Message-ID: <20210818043421.cxa4gjrzerakmxxm@vireshk-i7>
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <6df0ed60-e497-0af2-09b6-a9d82f502f17@gmail.com>
 <6438bdfb-3e9e-40dd-fa7c-c79f0892e12a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6438bdfb-3e9e-40dd-fa7c-c79f0892e12a@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18-08-21, 07:30, Dmitry Osipenko wrote:
> 18.08.2021 07:29, Dmitry Osipenko пишет:
> >> The first resume initializes the OPP state on sync, all further syncs on
> >> resume are no-ops.
> >>
> > 
> > Notice that we use GENPD here. GENPD core takes care of storing PD's
> > performance state (voltage in case of Tegra) and dropping it to 0 after
> > rpm-suspend, GENPD core also restores the state before rpm-resume.
> 
> By 'here' I mean in this series.

It is still not clear to me why you need to this on resume, and not
probe.

-- 
viresh
