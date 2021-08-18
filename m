Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36403EF9FB
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 07:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BA5F6E3AE;
	Wed, 18 Aug 2021 05:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A566E3AE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 05:21:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id w4so1313972ljh.13
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 22:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yOpS1WKSzyXtmkcc56y1iDICg2EoTDsJHsY4fPaSb5w=;
 b=czCBETSSjNQa96HeR8S2cXF9WItzalDZ+Bims31/WwUHmduqBSoEIrz2EHd1Rplnvm
 FFwAvQOnG91Y+0pNG7gcjM8fuOK7PmDvtjcps1eXeHj5mFDM7T8Il2gc/dhcMiEnsq3U
 dYqtv8hjrv5XQwoHcnwTEBGrRK1459O7Zm+K8cjotiTE0HUOwS7EWfdq/k1AdFePe/7T
 qIjtoVkBbmE3Zl1qSkUzqZv9CvHixrI856MdhPDyYrJSZk10aF2YpSr+G4t557R0fLe2
 gENb/8qw1Cif5pMMEHqGyMJt9OlS6t5IEPg7dmTF9mJyzzfy4L6tBS3Gp6x5EtTq9Otk
 Id/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yOpS1WKSzyXtmkcc56y1iDICg2EoTDsJHsY4fPaSb5w=;
 b=Ah1DvlPyOz2l5q44XrAiFAZCRiI/klnXGk7qXiGDpNJL7haWavzP9my02gq6hhOalL
 Bt8IB4Q4zpRYfIlop/nOcQVP+RrS136wrudIAxY7gd/+711G6krbnj1Ut2l+QWTCAlCa
 2FikuU27QkWv193R4e5/66/aLpeml0Y9nrYqUrC7ZWnvgF5vRXxSRdB5Bfzs9acgjqQN
 cU3g369hVycls23/bPN8KxaBTwRHnxc/lM866iRLXYUwyjK8C+RD+q4IdaVHPonvfwhP
 jzXBKg08DGGE7WiSYaELHUDD6cotPZ0eIxRJ9XO1P9/BogF8Qpgo0OVMetJ1xFpH+GYG
 P5LQ==
X-Gm-Message-State: AOAM532A1gGkCzPX17aM5gmIgkrCd11wLmvlHGr7A3HjItQLdX38HJVP
 zeAeqXhldR3TrUYCPY9MoG8=
X-Google-Smtp-Source: ABdhPJz2ztpis7OKP5puANjPipNjZh3C0caocgaMorHlmoNO+0jB7HIjn/fYUFG6yGBcOjPS91/Jnw==
X-Received: by 2002:a2e:8553:: with SMTP id u19mr1498129ljj.158.1629264092744; 
 Tue, 17 Aug 2021 22:21:32 -0700 (PDT)
Received: from [192.168.2.145] (46-138-85-91.dynamic.spd-mgts.ru.
 [46.138.85.91])
 by smtp.googlemail.com with ESMTPSA id d9sm487076ljq.54.2021.08.17.22.21.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Aug 2021 22:21:32 -0700 (PDT)
Subject: Re: [PATCH v8 01/34] opp: Add dev_pm_opp_sync() helper
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Ulf Hansson
 <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Peter De Schrijver
 <pdeschrijver@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Peter Chen <peter.chen@kernel.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Lucas Stach <dev@lynxeye.de>,
 Stefan Agner <stefan@agner.ch>, Adrian Hunter <adrian.hunter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-spi@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-mmc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20210817012754.8710-1-digetx@gmail.com>
 <20210817012754.8710-2-digetx@gmail.com>
 <20210817075515.vyyv7z37e6jcrhsl@vireshk-i7>
 <710261d9-7ae3-5155-c0a2-f8aed2408d0b@gmail.com>
 <20210818035533.ieqkexltfvvf2p4n@vireshk-i7>
 <5b2a80c1-9743-e633-6257-ede94c8a274c@gmail.com>
 <20210818043131.7klajx6drvvkftoc@vireshk-i7>
 <a2a3c41f-c5e4-ee7e-7d48-03af8bac8863@gmail.com>
 <20210818045307.4brb6cafkh3adjth@vireshk-i7>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <080469b3-612b-3a34-86e5-7037a64de2fe@gmail.com>
Date: Wed, 18 Aug 2021 08:21:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818045307.4brb6cafkh3adjth@vireshk-i7>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

18.08.2021 07:53, Viresh Kumar пишет:
> On 18-08-21, 07:37, Dmitry Osipenko wrote:
>> This will set voltage level without having an actively used hardware.
>> Take a 3d driver for example, if you set the rate on probe and
>> rpm-resume will never be called, then the voltage will be set high,
>> while hardware is kept suspended if userspace will never wake it up by
>> executing a 3d job.
> 
> What exactly are we looking to achieve with this stuff ? Cache the
> current performance state with genpd (based on the state bootloader's
> has set) ?

Yes, GENPD will cache the perf state across suspend/resume and initially
cached value is out of sync with h/w.

> Or anything else as well ?

Nothing else. But let me clarify it all again.

Initially the performance state of all GENPDs is 0 for all devices.

The clock rate is preinitialized for all devices to a some default rate
by clk driver, or by bootloader or by assigned-clocks in DT.

When device is rpm-resumed, the resume callback of a device driver
enables the clock.

Before clock is enabled, the voltage needs to be configured in
accordance to the clk rate.

So now we have a GENPD with pstate=0 on a first rpm-resume, which
doesn't match the h/w configuration. Calling dev_pm_opp_sync() sets the
pstate in accordance to the h/w config.

In a previous v7 I proposed to preset the rpm_pstate of GENPD (perf
level that is restored before device is rpm-resumed) from PD's
attach_dev callback, but Ulf didn't like that because it requires to use
and modify GENPD 'private' variables from a PD driver. We decided that
will be better to make device drivers to explicitly sync the perf state,
which I implemented in this v8.
